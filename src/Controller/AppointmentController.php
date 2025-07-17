<?php
declare(strict_types=1);

namespace App\Controller;

class AppointmentController extends AppController
{
    public function index()
    {
        $this->set('title', 'Appointment List');

        // This tells the query to also fetch the data from the
        // Patient and Dentist tables using the relationships we defined.
        $this->paginate = [
            'contain' => ['Patient', 'Dentist'],
            'maxLimit' => 10,
        ];

        $appointment = $this->paginate($this->Appointment);

        $this->set(compact('appointment'));
    }

    public function view($id = null)
    {
        $appointment = $this->Appointment->get($id, [
            'contain' => ['Patient', 'Dentist'],
        ]);
        $this->set(compact('appointment'));
        $this->set('title', 'View Appointment');
    }

    public function add()
    {
        $appointment = $this->Appointment->newEmptyEntity();
        if ($this->request->is('post')) {
            $appointment = $this->Appointment->patchEntity($appointment, $this->request->getData());
            // You may want to set the created_by_user_id here, e.g.:
            // $appointment->created_by_user_id = $this->request->getAttribute('identity')->getIdentifier();

            if ($this->Appointment->save($appointment)) {
                $this->Flash->success(__('The appointment has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The appointment could not be saved. Please, try again.'));
        }
        $patients = $this->Appointment->Patient->find('list');
        $dentists = $this->Appointment->Dentist->find('list');
        $this->set(compact('appointment', 'patients', 'dentists'));
        $this->set('title', 'New Appointment');
    }

    public function edit($id = null)
    {
        $appointment = $this->Appointment->get($id, [
            'contain' => ['Patient', 'Dentist'],
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $appointment = $this->Appointment->patchEntity($appointment, $this->request->getData());
            if ($this->Appointment->save($appointment)) {
                $this->Flash->success(__('The appointment has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The appointment could not be saved. Please, try again.'));
        }
        $patients = $this->Appointment->Patient->find('list');
        $dentists = $this->Appointment->Dentist->find('list');
        $this->set(compact('appointment', 'patients', 'dentists'));
        $this->set('title', 'Edit Appointment');
    }

    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $appointment = $this->Appointment->get($id);
        if ($this->Appointment->delete($appointment)) {
            $this->Flash->success(__('The appointment has been deleted.'));
        } else {
            $this->Flash->error(__('The appointment could not be deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'index']);
    }
}