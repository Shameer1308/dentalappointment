<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Dentist $dentist
 * @var array $genderOptions
 */
?>
<div class="row text-body-secondary">
    <div class="col-10">
        <h1 class="my-0 page_title"><?= h($title) ?></h1>
    </div>
</div>
<div class="line mb-4"></div>

<div class="card rounded-0 mb-3 bg-body-tertiary border-0 shadow-sm">
    <div class="card-body">
        <?= $this->Form->create($dentist) ?>
        <fieldset>
            <legend><?= __('Add Dentist') ?></legend>
            <?php
                echo $this->Form->control('dentist_fullname');
                echo $this->Form->control('dentist_gender', [
                    'options' => $genderOptions,
                    'empty' => 'Select Gender...'
                ]);
                echo $this->Form->control('dentist_phone');
                echo $this->Form->control('dentist_email');
                echo $this->Form->control('dentist_specialization');
                echo $this->Form->control('status', [
                    'options' => ['active' => 'Active', 'inactive' => 'Inactive']
                ]);
            ?>
        </fieldset>
        <div class="text-end mt-3">
            <?= $this->Html->link(__('Cancel'), ['action' => 'index'], ['class' => 'btn btn-outline-secondary']) ?>
            <?= $this->Form->button(__('Submit'),['type' => 'submit', 'class' => 'btn btn-primary']) ?>
        </div>
        <?= $this->Form->end() ?>
    </div>
</div>