<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Patient $patient
 */
?>
<!--Header-->
<div class="row text-body-secondary">
	<div class="col-10">
		<h1 class="my-0 page_title"><?php echo $title; ?></h1>
		<h6 class="sub_title text-body-secondary"><?php echo $system_name; ?></h6>
	</div>
	<div class="col-2 text-end">
		<div class="dropdown mx-3 mt-2">
			<button class="btn p-0 border-0" type="button" id="orederStatistics" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			<i class="fa-solid fa-bars text-primary"></i>
			</button>
				<div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
							<li><?= $this->Html->link(__('Edit Patient'), ['action' => 'edit', $patient->patient_id], ['class' => 'dropdown-item', 'escapeTitle' => false]) ?></li>
				<li><?= $this->Form->postLink(__('Delete Patient'), ['action' => 'delete', $patient->patient_id], ['confirm' => __('Are you sure you want to delete # {0}?', $patient->patient_id), 'class' => 'dropdown-item', 'escapeTitle' => false]) ?></li>
				<li><hr class="dropdown-divider"></li>
				<li><?= $this->Html->link(__('List Patient'), ['action' => 'index'], ['class' => 'dropdown-item', 'escapeTitle' => false]) ?></li>
				<li><?= $this->Html->link(__('New Patient'), ['action' => 'add'], ['class' => 'dropdown-item', 'escapeTitle' => false]) ?></li>
							</div>
		</div>
    </div>
</div>
<div class="line mb-4"></div>
<!--/Header-->

<div class="row">
	<div class="col-md-9">
		<div class="card rounded-0 mb-3 bg-body-tertiary border-0 shadow">
			<div class="card-body text-body-secondary">
            <h3><?= h($patient->patient_fullname) ?></h3>
    <div class="table-responsive">
        <table class="table">
                <tr>
                    <th><?= __('Patient Fullname') ?></th>
                    <td><?= h($patient->patient_fullname) ?></td>
                </tr>
                <tr>
                    <th><?= __('Patient Ic') ?></th>
                    <td><?= h($patient->patient_ic) ?></td>
                </tr>
                <tr>
                    <th><?= __('Patient Gender') ?></th>
                    <td><?= h($patient->patient_gender) ?></td>
                </tr>
                <tr>
                    <th><?= __('Patient Phone') ?></th>
                    <td><?= h($patient->patient_phone) ?></td>
                </tr>
                <tr>
                    <th><?= __('Patient Email') ?></th>
                    <td><?= h($patient->patient_email) ?></td>
                </tr>
                <tr>
                    <th><?= __('Patient Address Line1') ?></th>
                    <td><?= h($patient->patient_address_line1) ?></td>
                </tr>
                <tr>
                    <th><?= __('Patient Address Line2') ?></th>
                    <td><?= h($patient->patient_address_line2) ?></td>
                </tr>
                <tr>
                    <th><?= __('Poscode') ?></th>
                    <td><?= h($patient->poscode) ?></td>
                </tr>
                <tr>
                    <th><?= __('City') ?></th>
                    <td><?= h($patient->city) ?></td>
                </tr>
                <tr>
                    <th><?= __('State') ?></th>
                    <td><?= h($patient->state) ?></td>
                </tr>
                <tr>
                    <th><?= __('Status') ?></th>
                    <td><?= h($patient->status) ?></td>
                </tr>
                <tr>
                    <th><?= __('Patient Id') ?></th>
                    <td><?= $this->Number->format($patient->patient_id) ?></td>
                </tr>
                <tr>
                    <th><?= __('Created') ?></th>
                    <td><?= h($patient->created) ?></td>
                </tr>
                <tr>
                    <th><?= __('Modified') ?></th>
                    <td><?= h($patient->modified) ?></td>
                </tr>
            </table>
            </div>

			</div>
		</div>
		

            
            


		
	</div>
	<div class="col-md-3">
	  Column
	</div>
</div>




