<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\AppController;

use AuditStash\Meta\RequestMetadata;
use Cake\Event\EventManager;
use Cake\Routing\Router;

/**
 * Dentist Controller
 *
 * @property \App\Model\Table\DentistTable $Dentist
 */
class DentistController extends AppController
{
	public function initialize(): void
	{
		parent::initialize();

		$this->loadComponent('Search.Search', [
			'actions' => ['index'],
		]);
	}
	
	public function beforeFilter(\Cake\Event\EventInterface $event)
	{
		parent::beforeFilter($event);
	}

	/*public function viewClasses(): array
    {
        return [JsonView::class];
		return [JsonView::class, XmlView::class];
    }*/
	
	public function json()
    {
		$this->viewBuilder()->setLayout('json');
        $this->set('dentist', $this->paginate());
        $this->viewBuilder()->setOption('serialize', 'dentist');
    }
	
	public function csv()
	{
		$this->response = $this->response->withDownload('dentist.csv');
		$dentist = $this->Dentist->find();
		$_serialize = 'dentist';

		$this->viewBuilder()->setClassName('CsvView.Csv');
		$this->set(compact('dentist', '_serialize'));
	}
	
	public function pdfList()
	{
		$this->viewBuilder()->enableAutoLayout(false); 
		$dentist = $this->paginate($this->Dentist);
		$this->viewBuilder()->setClassName('CakePdf.Pdf');
		$this->viewBuilder()->setOption(
			'pdfConfig',
			[
				'orientation' => 'portrait',
				'download' => true, 
				'filename' => 'dentist_List.pdf' 
			]
		);
		$this->set(compact('dentist'));
	}
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
   public function index()
{
    $this->set('title', 'Dentist List');
    $this->paginate = [
        'maxLimit' => 10,
    ];

    // --- Correct Manual Search Logic for Dentists ---
    $query = $this->Dentist->find();
    $searchId = $this->request->getQuery('id');
    $searchName = $this->request->getQuery('name');

    if (!empty($searchId)) {
        // Use dentist_id as the primary key
        $query->where(['Dentist.dentist_id' => $searchId]);
    }
    if (!empty($searchName)) {
        $query->where(['Dentist.dentist_fullname LIKE' => '%' . $searchName . '%']);
    }
    
    // The paginator now receives the correctly filtered query
    $dentist = $this->paginate($query);
    
    // Your existing count logic
    $this->set('total_dentist', $this->Dentist->find()->count());
    $this->set('total_dentist_archived', $this->Dentist->find()->where(['status' => 2])->count());
    $this->set('total_dentist_active', $this->Dentist->find()->where(['status' => 1])->count());
    $this->set('total_dentist_disabled', $this->Dentist->find()->where(['status' => 0])->count());
    
    // Your existing chart logic, corrected to prevent overwriting search results
    $chartQuery = $this->Dentist->find();

    $expectedMonths = [];
    for ($i = 11; $i >= 0; $i--) {
        $expectedMonths[] = date('M-Y', strtotime("-$i months"));
    }

    $chartQuery->select([
        'count' => $chartQuery->func()->count('*'),
        'date' => $chartQuery->func()->date_format(['created' => 'identifier', "%b-%Y"]),
        'month' => 'MONTH(created)',
        'year' => 'YEAR(created)'
    ])
        ->where([
            'created >=' => date('Y-m-01', strtotime('-11 months')),
            'created <=' => date('Y-m-t')
        ])
        ->groupBy(['year', 'month'])
        ->orderBy(['year' => 'ASC', 'month' => 'ASC']);

    $results = $chartQuery->all()->toArray();
    $totalByMonth = [];
    foreach ($expectedMonths as $expectedMonth) {
        $found = false;
        $count = 0;
        foreach ($results as $result) {
            if ($expectedMonth === $result->date) {
                $found = true;
                $count = $result->count;
                break;
            }
        }
        $totalByMonth[] = [
            'month' => $expectedMonth,
            'count' => $count
        ];
    }
    $this->set(['results' => $totalByMonth, '_serialize' => ['results']]);

    $dataArray = json_decode(json_encode($totalByMonth), true);
    $monthArray = [];
    $countArray = [];
    foreach ($dataArray as $data) {
        $monthArray[] = $data['month'];
        $countArray[] = $data['count'];
    }

    $this->set(compact('dentist', 'monthArray', 'countArray'));
}

    /**
     * View method
     *
     * @param string|null $id Dentist id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->set('title', 'Dentist Details');
        $dentist = $this->Dentist->get($id, contain: []);
        $this->set(compact('dentist'));

        $this->set(compact('dentist'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->set('title', 'New Dentist');
		EventManager::instance()->on('AuditStash.beforeLog', function ($event, array $logs) {
			foreach ($logs as $log) {
				$log->setMetaInfo($log->getMetaInfo() + ['a_name' => 'Add']);
				$log->setMetaInfo($log->getMetaInfo() + ['c_name' => 'Dentist']);
				$log->setMetaInfo($log->getMetaInfo() + ['ip' => $this->request->clientIp()]);
				$log->setMetaInfo($log->getMetaInfo() + ['url' => Router::url(null, true)]);
				$log->setMetaInfo($log->getMetaInfo() + ['slug' => $this->Authentication->getIdentity('slug')->getIdentifier('slug')]);
			}
		});
        $dentist = $this->Dentist->newEmptyEntity();
        if ($this->request->is('post')) {
            $dentist = $this->Dentist->patchEntity($dentist, $this->request->getData());
            if ($this->Dentist->save($dentist)) {
                $this->Flash->success(__('The dentist has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The dentist could not be saved. Please, try again.'));
        }
        $this->set(compact('dentist'));
    }

    /**
     * Edit method
     *
     * @param string|null $id Dentist id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->set('title', 'Dentist Edit');
		EventManager::instance()->on('AuditStash.beforeLog', function ($event, array $logs) {
			foreach ($logs as $log) {
				$log->setMetaInfo($log->getMetaInfo() + ['a_name' => 'Edit']);
				$log->setMetaInfo($log->getMetaInfo() + ['c_name' => 'Dentist']);
				$log->setMetaInfo($log->getMetaInfo() + ['ip' => $this->request->clientIp()]);
				$log->setMetaInfo($log->getMetaInfo() + ['url' => Router::url(null, true)]);
				$log->setMetaInfo($log->getMetaInfo() + ['slug' => $this->Authentication->getIdentity('slug')->getIdentifier('slug')]);
			}
		});
        $dentist = $this->Dentist->get($id, [
            'contain' => [],
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $dentist = $this->Dentist->patchEntity($dentist, $this->request->getData());
            if ($this->Dentist->save($dentist)) {
                $this->Flash->success(__('The dentist has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The dentist could not be saved. Please, try again.'));
        }
        $this->set(compact('dentist'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Dentist id.
     * @return \Cake\Http\Response|null|void Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
		EventManager::instance()->on('AuditStash.beforeLog', function ($event, array $logs) {
			foreach ($logs as $log) {
				$log->setMetaInfo($log->getMetaInfo() + ['a_name' => 'Delete']);
				$log->setMetaInfo($log->getMetaInfo() + ['c_name' => 'Dentist']);
				$log->setMetaInfo($log->getMetaInfo() + ['ip' => $this->request->clientIp()]);
				$log->setMetaInfo($log->getMetaInfo() + ['url' => Router::url(null, true)]);
				$log->setMetaInfo($log->getMetaInfo() + ['slug' => $this->Authentication->getIdentity('slug')->getIdentifier('slug')]);
			}
		});
        $this->request->allowMethod(['post', 'delete']);
        $dentist = $this->Dentist->get($id);
        if ($this->Dentist->delete($dentist)) {
            $this->Flash->success(__('The dentist has been deleted.'));
        } else {
            $this->Flash->error(__('The dentist could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
	public function archived($id = null)
    {
		$this->set('title', 'Dentist Edit');
		EventManager::instance()->on('AuditStash.beforeLog', function ($event, array $logs) {
			foreach ($logs as $log) {
				$log->setMetaInfo($log->getMetaInfo() + ['a_name' => 'Archived']);
				$log->setMetaInfo($log->getMetaInfo() + ['c_name' => 'Dentist']);
				$log->setMetaInfo($log->getMetaInfo() + ['ip' => $this->request->clientIp()]);
				$log->setMetaInfo($log->getMetaInfo() + ['url' => Router::url(null, true)]);
				$log->setMetaInfo($log->getMetaInfo() + ['slug' => $this->Authentication->getIdentity('slug')->getIdentifier('slug')]);
			}
		});
        $dentist = $this->Dentist->get($id, [
            'contain' => [],
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $dentist = $this->Dentist->patchEntity($dentist, $this->request->getData());
			$dentist->status = 2; //archived
            if ($this->Dentist->save($dentist)) {
                $this->Flash->success(__('The dentist has been archived.'));

				return $this->redirect($this->referer());
            }
            $this->Flash->error(__('The dentist could not be archived. Please, try again.'));
        }
        $this->set(compact('dentist'));
    }
}
