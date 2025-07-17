<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Dentist Entity
 *
 * @property int $dentist_id
 * @property string $dentist_fullname
 * @property string $dentist_gender
 * @property string $dentist_phone
 * @property string $dentist_email
 * @property string $specialization
 * @property string $status
 * @property \Cake\I18n\DateTime $created
 * @property \Cake\I18n\DateTime $modified
 */
class Dentist extends Entity
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
        'dentist_fullname' => true,
        'dentist_gender' => true,
        'dentist_phone' => true,
        'dentist_email' => true,
        'specialization' => true,
        'status' => true,
        'created' => true,
        'modified' => true,
    ];
}
