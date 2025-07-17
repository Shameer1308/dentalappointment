<?php
declare(strict_types=1);

namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * PatientFixture
 */
class PatientFixture extends TestFixture
{
    /**
     * Table name
     *
     * @var string
     */
    public string $table = 'patient';
    /**
     * Init method
     *
     * @return void
     */
    public function init(): void
    {
        $this->records = [
            [
                'patient_id' => 1,
                'patient_fullname' => 'Lorem ipsum dolor sit amet',
                'patient_ic' => 'Lorem ipsum dolor sit amet',
                'patient_gender' => 'Lorem ip',
                'patient_phone' => 'Lorem ipsum dolor sit amet',
                'patient_email' => 'Lorem ipsum dolor sit amet',
                'patient_address_line1' => 'Lorem ipsum dolor sit amet',
                'patient_address_line2' => 'Lorem ipsum dolor sit amet',
                'poscode' => 'Lorem ip',
                'city' => 'Lorem ipsum dolor sit amet',
                'state' => 'Lorem ipsum dolor sit amet',
                'status' => 'Lorem ipsum dolor sit amet',
                'created' => '2025-07-12 15:58:31',
                'modified' => '2025-07-12 15:58:31',
            ],
        ];
        parent::init();
    }
}
