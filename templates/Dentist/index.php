<?php
/**
 * @var \App\View\AppView $this
 * @var iterable<\App\Model\Entity\Dentist> $dentist
 */

// This is a helper variable to create clean row numbers
$this->Paginator->setTemplates([
    'counterRange' => '{{start}} - {{end}} of {{count}}'
]);
$page = $this->Paginator->current('Dentist');
$limit = $this->Paginator->param('perPage');
$counter = ($page - 1) * $limit + 1;
?>

<!--Header-->
<div class="row text-body-secondary">
    <div class="col-10">
        <h1 class="my-0 page_title"><?= h($title) ?></h1>
    </div>
    <div class="col-2 text-end">
        <?= $this->Html->link(__('Add Dentist'), ['action' => 'add'], ['class' => 'btn btn-primary shadow-sm']) ?>
    </div>
</div>
<div class="line mb-4"></div>
<!--/Header-->

<div class="card rounded-0 mb-3 bg-body-tertiary border-0 shadow-sm">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th><?= __('#') ?></th>
                        <th><?= $this->Paginator->sort('dentist_fullname', 'Fullname') ?></th>
                        <th><?= $this->Paginator->sort('specialization', 'Specialization') ?></th>
                        <th><?= $this->Paginator->sort('dentist_phone', 'Phone') ?></th>
                        <th><?= $this->Paginator->sort('status') ?></th>
                        <th><?= $this->Paginator->sort('created', 'Date Added') ?></th>
                        <th class="actions"><?= __('Actions') ?></th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($dentist as $item): ?>
                    <tr>
                        <td><?= $counter++ ?></td>
                        <td><?= h($item->dentist_fullname) ?></td>
                        <td><?= h($item->specialization) ?></td>
                        <td><?= h($item->dentist_phone) ?></td>
                        <td>
                            <?php if ($item->status === 'active') : ?>
                                <span class="badge bg-success">Active</span>
                            <?php else: ?>
                                <span class="badge bg-danger">Inactive</span>
                            <?php endif; ?>
                        </td>
                        <td><?= h($item->created->format('d-M-Y')) ?></td>
                        <td class="actions">
                            <?= $this->Html->link('<i class="fa-solid fa-eye"></i>', ['action' => 'view', $item->dentist_id], ['class' => 'btn btn-sm btn-outline-primary', 'escape' => false, 'title' => 'View']) ?>
                            <?= $this->Html->link('<i class="fa-solid fa-pen"></i>', ['action' => 'edit', $item->dentist_id], ['class' => 'btn btn-sm btn-outline-warning', 'escape' => false, 'title' => 'Edit']) ?>
                            <?= $this->Form->postLink('<i class="fa-solid fa-trash"></i>', ['action' => 'delete', $item->dentist_id], ['class' => 'btn btn-sm btn-outline-danger', 'escape' => false, 'title' => 'Delete', 'confirm' => __('Are you sure you want to delete dentist: {0}?', $item->dentist_fullname)]) ?>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
        <div class="paginator mt-3">
            <ul class="pagination justify-content-end flex-wrap">
                <?= $this->Paginator->first('<< ' . __('First')) ?>
                <?= $this->Paginator->prev('< ' . __('Previous')) ?>
                <?= $this->Paginator->numbers() ?>
                <?= $this->Paginator->next(__('Next') . ' >') ?>
                <?= $this->Paginator->last(__('Last') . ' >>') ?>
            </ul>
            <p class="text-end small"><?= $this->Paginator->counter('Page {{page}} of {{pages}}, showing {{current}} record(s) out of {{count}} total') ?></p>
        </div>
    </div>
</div>