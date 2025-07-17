<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Patient $patient
 */
?>

<div class="row text-body-secondary">
    <div class="col-10">
        <h1 class="my-0 page_title">Add Patient</h1>
        <h6 class="sub_title text-body-secondary"><?= $this->request->getAttribute('system_name') ?></h6>
    </div>
    <div class="col-2 text-end">
         <?= $this->Html->link(__('<i class="fa-solid fa-arrow-left"></i> Back'), ['action' => 'index'], ['class' => 'btn btn-outline-primary btn-sm', 'escapeTitle' => false]) ?>
    </div>
</div>
<div class="line mb-4"></div>
<?= $this->Form->create($patient) ?>
<div class="card bg-body-tertiary border-0 shadow mb-4">
    <div class="card-body">
        <fieldset>
            <div class="row">

                <div class="col-md-6">
                    <?php
                    echo $this->Form->control('patient_fullname', ['class' => 'form-control mb-3']);
                    echo $this->Form->control('patient_ic', ['label' => 'IC Number', 'class' => 'form-control mb-3']);
                    echo $this->Form->control('patient_gender', [
                        'options' => ['Male' => 'Male', 'Female' => 'Female'],
                        'empty' => 'Select Gender',
                        'class' => 'form-select mb-3'
                    ]);
                    echo $this->Form->control('patient_phone', ['class' => 'form-control mb-3']);
                    echo $this->Form->control('patient_email', ['class' => 'form-control mb-3']);
                    ?>
                </div>

                <div class="col-md-6">
                    <?php
                        echo $this->Form->control('patient_address_line1', ['class' => 'form-control mb-3']);
                        echo $this->Form->control('patient_address_line2', ['class' => 'form-control mb-3']);
                        echo $this->Form->control('poscode', ['class' => 'form-control mb-3']);
                        echo $this->Form->control('city', ['class' => 'form-control mb-3']);
                        
                        $states = [
                            'Johor' => 'Johor', 'Kedah' => 'Kedah', 'Kelantan' => 'Kelantan', 'Melaka' => 'Melaka', 
                            'Negeri Sembilan' => 'Negeri Sembilan', 'Pahang' => 'Pahang', 'Perak' => 'Perak', 
                            'Perlis' => 'Perlis', 'Pulau Pinang' => 'Pulau Pinang', 'Sabah' => 'Sabah', 
                            'Sarawak' => 'Sarawak', 'Selangor' => 'Selangor', 'Terengganu' => 'Terengganu',
                            'W.P. Kuala Lumpur' => 'W.P. Kuala Lumpur', 'W.P. Labuan' => 'W.P. Labuan', 'W.P. Putrajaya' => 'W.P. Putrajaya'
                        ];
                        echo $this->Form->control('state', [
                            'options' => $states,
                            'empty' => 'Select State',
                            'class' => 'form-select mb-3'
                        ]);

                        // --- NEW STATUS FIELD ---
                        echo $this->Form->control('status', [
                            'options' => ['1' => 'Active', '0' => 'Inactive'],
                            'class' => 'form-select mb-3'
                        ]);
                    ?>
                </div>
            </div>
        </fieldset>
    </div>
</div>

<div class="text-end">
    <?= $this->Form->button(__('Save Patient'), ['class' => 'btn btn-primary']) ?>
    <?= $this->Form->end() ?>
</div>