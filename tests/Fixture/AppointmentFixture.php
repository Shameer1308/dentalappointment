<?php
declare(strict_types=1);

namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * AppointmentFixture
 */
class AppointmentFixture extends TestFixture
{
    /**
     * Table name
     *
     * @var string
     */
    public string $table = 'appointment';
    /**
     * Init method
     *
     * @return void
     */
    public function init(): void
    {
        $this->records = [
            [
                'appointment_id' => 1,
                'appointment_date' => '2025-07-08',
                'appointment_time' => '16:32:11',
                'appointment_status' => 'Lorem ipsum dolor sit amet',
                'patient_fullname' => 'Lorem ipsum dolor sit amet',
                'dentist_fullname' => 'Lorem ipsum dolor sit amet',
                'status' => 'Lorem ipsum dolor sit amet',
                'created' => '2025-07-08 16:32:11',
                'modified' => '2025-07-08 16:32:11',
            ],
        ];
        parent::init();
    }
}
