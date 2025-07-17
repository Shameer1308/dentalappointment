<?php
declare(strict_types=1);

namespace App\Controller;

use AuditStash\Meta\RequestMetadata;
use Cake\Event\EventManager;
use Cake\Routing\Router;

class PatientController extends AppController
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
        $this->set('patient', $this->paginate());
        $this->viewBuilder()->setOption('serialize', 'patient');
    }
	
	public function csv()
	{
		$this->response = $this->response->withDownload('patient.csv');
		$patient = $this->Patient->find();
		$_serialize = 'patient';

		$this->viewBuilder()->setClassName('CsvView.Csv');
		$this->set(compact('patient', '_serialize'));
	}
	
	public function pdfList()
	{
		$this->viewBuilder()->enableAutoLayout(false); 
		$patient = $this->paginate($this->Patient);
		$this->viewBuilder()->setClassName('CakePdf.Pdf');
		$this->viewBuilder()->setOption(
			'pdfConfig',
			[
				'orientation' => 'portrait',
				'download' => true, 
				'filename' => 'patient_List.pdf' 
			]
		);
		$this->set(compact('patient'));
	}
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
    // In PatientController.php

public function index()
{
    $this->set('title', 'Patient List');
    $this->paginate = [
        'maxLimit' => 10,
    ];

    $states = $this->Patient->find('list', [
        'keyField' => 'state',
        'valueField' => 'state'
    ])->distinct(['state'])->toArray();

    $query = $this->Patient->find();

    $searchId = $this->request->getQuery('id');
    $searchName = $this->request->getQuery('name');
    $searchGender = $this->request->getQuery('gender');
    $searchIc = $this->request->getQuery('ic');
    $searchStatus = $this->request->getQuery('status');
    $searchState = $this->request->getQuery('state'); // New line for state

    if (!empty($searchId)) {
        $query->where(['Patient.patient_id' => $searchId]);
    }
    if (!empty($searchName)) {
        $query->where(['Patient.patient_fullname LIKE' => '%' . $searchName . '%']);
    }
    if (!empty($searchGender)) {
        $query->where(['Patient.patient_gender' => $searchGender]);
    }
    if (!empty($searchIc)) {
        $query->where(['Patient.patient_ic LIKE' => '%' . $searchIc . '%']);
    }
    if (!empty($searchStatus) && is_array($searchStatus)) {
        $query->where(['Patient.status IN' => $searchStatus]);
    }
    if (!empty($searchState)) {
        $query->where(['Patient.state' => $searchState]);
    }

    $patient = $this->paginate($query);

    $this->set('total_patient', $this->Patient->find()->count());
    $this->set('total_patient_archived', $this->Patient->find()->where(['status' => 2])->count());
    $this->set('total_patient_active', $this->Patient->find()->where(['status' => 1])->count());
    $this->set('total_patient_disabled', $this->Patient->find()->where(['status' => 0])->count());
    
    $chartQuery = $this->Patient->find();
    $expectedMonths = [];
    for ($i = 11; $i >= 0; $i--) {
        $expectedMonths[] = date('M-Y', strtotime("-$i months"));
    }
    $chartQuery->select([
        'count' => $chartQuery->func()->count('*'),
        'date' => $chartQuery->func()->date_format(['created' => 'identifier', "%b-%Y"]),
        'month' => 'MONTH(created)', 'year' => 'YEAR(created)'
    ])
    ->where(['created >=' => date('Y-m-01', strtotime('-11 months')), 'created <=' => date('Y-m-t')])
    ->groupBy(['year', 'month'])->orderBy(['year' => 'ASC', 'month' => 'ASC']);
    $results = $chartQuery->all()->toArray();
    $totalByMonth = [];
    foreach ($expectedMonths as $expectedMonth) {
        $found = false; $count = 0;
        foreach ($results as $result) {
            if ($expectedMonth === $result->date) {
                $found = true; $count = $result->count; break;
            }
        }
        $totalByMonth[] = ['month' => $expectedMonth, 'count' => $count];
    }
    $this->set(['results' => $totalByMonth, '_serialize' => ['results']]);
    $dataArray = json_decode(json_encode($totalByMonth), true);
    $monthArray = []; $countArray = [];
    foreach ($dataArray as $data) {
        $monthArray[] = $data['month'];
        $countArray[] = $data['count'];
    }

    // Pass all variables, including the new $states list, to the view
    $this->set(compact('patient', 'monthArray', 'countArray', 'states'));
}

    /**
     * View method
     *
     * @param string|null $id Patient id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->set('title', 'Patient Details');
        $patient = $this->Patient->get($id, contain: []);
        $this->set(compact('patient'));

        $this->set(compact('patient'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */

public function add()
{
    $this->set('title', 'New Patient');
    $patient = $this->Patient->newEmptyEntity();
    if ($this->request->is('post')) {
        $patient = $this->Patient->patchEntity($patient, $this->request->getData());

        if ($this->Patient->save($patient)) {
            $this->Flash->success(__('The patient has been saved.'));
            return $this->redirect(['action' => 'index']);
        }
        $this->Flash->error(__('The patient could not be saved. Please, try again.'));
    }
    $this->set(compact('patient'));
}
    /**
     * Edit method
     *
     * @param string|null $id Patient id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->set('title', 'Patient Edit');
		EventManager::instance()->on('AuditStash.beforeLog', function ($event, array $logs) {
			foreach ($logs as $log) {
				$log->setMetaInfo($log->getMetaInfo() + ['a_name' => 'Edit']);
				$log->setMetaInfo($log->getMetaInfo() + ['c_name' => 'Patient']);
				$log->setMetaInfo($log->getMetaInfo() + ['ip' => $this->request->clientIp()]);
				$log->setMetaInfo($log->getMetaInfo() + ['url' => Router::url(null, true)]);
				$log->setMetaInfo($log->getMetaInfo() + ['slug' => $this->Authentication->getIdentity('slug')->getIdentifier('slug')]);
			}
		});
        $patient = $this->Patient->get($id, [
            'contain' => [],
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $patient = $this->Patient->patchEntity($patient, $this->request->getData());
            if ($this->Patient->save($patient)) {
                $this->Flash->success(__('The patient has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The patient could not be saved. Please, try again.'));
        }
        $this->set(compact('patient'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Patient id.
     * @return \Cake\Http\Response|null|void Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
		EventManager::instance()->on('AuditStash.beforeLog', function ($event, array $logs) {
			foreach ($logs as $log) {
				$log->setMetaInfo($log->getMetaInfo() + ['a_name' => 'Delete']);
				$log->setMetaInfo($log->getMetaInfo() + ['c_name' => 'Patient']);
				$log->setMetaInfo($log->getMetaInfo() + ['ip' => $this->request->clientIp()]);
				$log->setMetaInfo($log->getMetaInfo() + ['url' => Router::url(null, true)]);
				$log->setMetaInfo($log->getMetaInfo() + ['slug' => $this->Authentication->getIdentity('slug')->getIdentifier('slug')]);
			}
		});
        $this->request->allowMethod(['post', 'delete']);
        $patient = $this->Patient->get($id);
        if ($this->Patient->delete($patient)) {
            $this->Flash->success(__('The patient has been deleted.'));
        } else {
            $this->Flash->error(__('The patient could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
	public function archived($id = null)
    {
		$this->set('title', 'Patient Edit');
		EventManager::instance()->on('AuditStash.beforeLog', function ($event, array $logs) {
			foreach ($logs as $log) {
				$log->setMetaInfo($log->getMetaInfo() + ['a_name' => 'Archived']);
				$log->setMetaInfo($log->getMetaInfo() + ['c_name' => 'Patient']);
				$log->setMetaInfo($log->getMetaInfo() + ['ip' => $this->request->clientIp()]);
				$log->setMetaInfo($log->getMetaInfo() + ['url' => Router::url(null, true)]);
				$log->setMetaInfo($log->getMetaInfo() + ['slug' => $this->Authentication->getIdentity('slug')->getIdentifier('slug')]);
			}
		});
        $patient = $this->Patient->get($id, [
            'contain' => [],
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $patient = $this->Patient->patchEntity($patient, $this->request->getData());
			$patient->status = 2; //archived
            if ($this->Patient->save($patient)) {
                $this->Flash->success(__('The patient has been archived.'));

				return $this->redirect($this->referer());
            }
            $this->Flash->error(__('The patient could not be archived. Please, try again.'));
        }
        $this->set(compact('patient'));
    }
}
