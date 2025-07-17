<?php
declare(strict_types=1);

namespace App\Controller;

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

    public function index()
    {
        $this->set('title', 'Dentist List');
        // This paginate setting is for the main query
        $this->paginate = [
            'maxLimit' => 10,
        ];
        // The search component is preserved
        $query = $this->Dentist->find('search', search: $this->request->getQueryParams());
        $dentist = $this->paginate($query);
        
        $this->set(compact('dentist'));
    }

    public function view($id = null)
    {
        $this->set('title', 'Dentist Details');
        $dentist = $this->Dentist->get($id, ['contain' => []]);
        $this->set(compact('dentist'));
    }

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
        
        $genderOptions = ['Male' => 'Male', 'Female' => 'Female'];
        $this->set(compact('dentist', 'genderOptions'));
    }

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

        $genderOptions = ['Male' => 'Male', 'Female' => 'Female'];
        $this->set(compact('dentist', 'genderOptions'));
    }

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