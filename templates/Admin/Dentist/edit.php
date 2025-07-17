<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Dentist $dentist
 */
?>
<!--Header-->
<div class="row text-body-secondary">
    <div class="col-10">
        <h1 class="my-0 page_title">Edit Dentist: <?= h($dentist->dentist_fullname) ?></h1>
        <h6 class="sub_title text-body-secondary"><?= $this->request->getAttribute('system_name') ?></h6>
    </div>
    <div class="col-2 text-end">
        <div class="dropdown mx-3 mt-2">
            <button class="btn p-0 border-0" type="button" id="orederStatistics" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-bars text-primary"></i>
            </button>
            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                <li>
                    <?= $this->Form->postLink(
                        __('<i class="fa-regular fa-trash-can"></i> Delete'),
                        ['action' => 'delete', $dentist->dentist_id],
                        ['confirm' => __('Are you sure you want to delete # {0}?', $dentist->dentist_id), 'class' => 'dropdown-item', 'escapeTitle' => false]
                    ) ?>
                </li>
                <li>
                    <?= $this->Html->link(__('<i class="fa-solid fa-list"></i> List Dentists'), ['action' => 'index'], ['class' => 'dropdown-item', 'escapeTitle' => false]) ?>
                </li>
            </div>
        </div>
    </div>
</div>
<div class="line mb-4"></div>
<!--/Header-->

<div class="card bg-body-tertiary border-0 shadow rounded-0">
    <div class="card-body">
        <?= $this->Form->create($dentist) ?>
        <fieldset>
            <legend><?= __('Edit Dentist Details') ?></legend>
            
            <div class="row">
                <div class="col-md-6">
                    <?php
                        echo $this->Form->control('dentist_fullname', [
                            'class' => 'form-control mb-3'
                        ]);
                        echo $this->Form->control('dentist_gender', [
                            'options' => ['Male' => 'Male', 'Female' => 'Female'],
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
            <?= $this->Html->link(__('Cancel'), ['action' => 'index'], ['class' => 'btn btn-outline-secondary']) ?>
            <?= $this->Form->button(__('Save Changes'),['type' => 'submit', 'class' => 'btn btn-primary']) ?>
        </div>
        <?= $this->Form->end() ?>
    </div>
</div>