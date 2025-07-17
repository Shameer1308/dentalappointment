<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Appointment Entity
 *
 * @property int $appointment_id
 * @property \Cake\I18n\Date $appointment_date
 * @property \Cake\I18n\Time $appointment_time
 * @property string $appointment_status
 * @property string $patient_fullname
 * @property string $dentist_fullname
 * @property string $status
 * @property \Cake\I18n\DateTime $created
 * @property \Cake\I18n\DateTime $modified
 */
class Appointment extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array<string, bool>
     */
    protected array $_accessible = [
        'appointment_date' => true,
        'appointment_time' => true,
        'appointment_status' => true,
        'patient_fullname' => true,
        'dentist_fullname' => true,
        'status' => true,
        'created' => true,
        'modified' => true,
    ];
}
