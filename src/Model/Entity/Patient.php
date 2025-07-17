<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Patient Entity
 *
 * @property int $patient_id
 * @property string $patient_fullname
 * @property string $patient_ic
 * @property string $patient_gender
 * @property string $patient_phone
 * @property string $patient_email
 * @property string $patient_address_line1
 * @property string $patient_address_line2
 * @property string $poscode
 * @property string $city
 * @property string $state
 * @property string $status
 * @property \Cake\I18n\DateTime $created
 * @property \Cake\I18n\DateTime $modified
 */
class Patient extends Entity
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
        'patient_fullname' => true,
        'patient_ic' => true,
        'patient_gender' => true,
        'patient_phone' => true,
        'patient_email' => true,
        'patient_address_line1' => true,
        'patient_address_line2' => true,
        'poscode' => true,
        'city' => true,
        'state' => true,
        'status' => true,
        'created' => true,
        'modified' => true,
    ];
}
