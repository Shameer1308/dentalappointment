<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Dentist $dentist
 */
?>
<div class="row text-body-secondary">
    <div class="col-10">
        <h1 class="my-0 page_title">New Dentist</h1>
        <h6 class="sub_title text-body-secondary"><?= $this->request->getAttribute('system_name') ?></h6>
    </div>
    <div class="col-2 text-end">
        <?= $this->Html->link(__('<i class="fa-solid fa-arrow-left"></i> Back to List'), ['action' => 'index'], ['class' => 'btn btn-outline-primary btn-sm', 'escapeTitle' => false]) ?>
    </div>
</div>
<div class="line mb-4"></div>
<div class="card bg-body-tertiary border-0 shadow rounded-0">
    <div class="card-body">
        <?= $this->Form->create($dentist) ?>
        <fieldset>
            <legend><?= __('Add Dentist') ?></legend>
            
            <div class="row">
                <div class="col-md-6">
                    <?php
                        echo $this->Form->control('dentist_fullname', [
                            'class' => 'form-control mb-3'
                        ]);
                        echo $this->Form->control('dentist_gender', [
                            'options' => ['Male' => 'Male', 'Female' => 'Female'],
                            'empty' => 'Select Gender',
                            'class' => 'form-select mb-3'
                        ]);
                         echo $this->Form->control('dentist_phone', [
                            'class' => 'form-control mb-3'
                        ]);
                    ?>
                </div>

                <div class="col-md-6">
                    <?php
                        echo $this->Form->control('dentist_email', [
                            'class' => 'form-control mb-3'
                        ]);
                        echo $this->Form->control('status', [
                            'options' => ['1' => 'Active', '0' => 'Inactive'],
                            'class' => 'form-select mb-3'
                        ]);
                    ?>
                </div>
            </div>
        </fieldset>
        
        <div class="text-end">
            <?= $this->Form->button('Reset', ['type' => 'reset', 'class' => 'btn btn-outline-warning']); ?>
            <?= $this->Form->button(__('Submit'),['type' => 'submit', 'class' => 'btn btn-primary']) ?>
        </div>
        <?= $this->Form->end() ?>
    </div>
</div>