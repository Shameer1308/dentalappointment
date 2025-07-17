<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Appointment $appointment
 */
?>

<!-- This script block adds the date and time pickers -->
<?php $this->append('scriptBottom'); ?>
<script>
    $(document).ready(function() {
        // Initialize the date picker
        $('#appointment-date').datetimepicker({
            timepicker:false,
            format:'Y-m-d'
        });

        // Initialize the time picker for hours and minutes
        $('#appointment-time').datetimepicker({
            datepicker:false,
            format:'h:i A', // Displays time like "03:30 PM"
            formatTime:'h:i A',
            step: 15 // Sets minute intervals to 15
        });
    });
</script>
<?php $this->end(); ?>
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
            <?= $this->Html->link(__('List Appointment'), ['action' => 'index'], ['class' => 'dropdown-item', 'escapeTitle' => false]) ?>
				</div>
		</div>
    </div>
</div>
<div class="line mb-4"></div>
<!--/Header-->

<div class="card rounded-0 mb-3 bg-body-tertiary border-0 shadow">
    <div class="card-body text-body-secondary">
            <?= $this->Form->create($appointment) ?>
            <fieldset>
                <legend><?= __('Add Appointment') ?></legend>
                
                    <?php echo $this->Form->control('appointment_date'); ?>
                    <?php echo $this->Form->control('appointment_time'); ?>
                    <?php echo $this->Form->control('appointment_status', [
                            'options' => ['Scheduled' => 'Scheduled', 'Cancelled' => 'Cancelled'],
                            'empty' => 'Select Status',
                            'class' => 'form-select mb-3'
                        ]); ?>
                    <?php echo $this->Form->control('patient_fullname'); ?>
                    <?php echo $this->Form->control('dentist_fullname'); ?>
                    <?php echo $this->Form->control('status', [
                            'options' => ['Active' => 'Active', 'Inactive' => 'Inactive'],
                            'empty' => 'Select Status',
                            'class' => 'form-select mb-3'
                        ]); ?>
               
            </fieldset>
				<div class="text-end">
				  <?= $this->Form->button('Reset', ['type' => 'reset', 'class' => 'btn btn-outline-warning']); ?>
				  <?= $this->Form->button(__('Submit'),['type' => 'submit', 'class' => 'btn btn-outline-primary']) ?>
                </div>
        <?= $this->Form->end() ?>
    </div>
</div>