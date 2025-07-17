<?php
declare(strict_types=1);

namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * DentistFixture
 */
class DentistFixture extends TestFixture
{
    /**
     * Table name
     *
     * @var string
     */
    public string $table = 'dentist';
    /**
     * Init method
     *
     * @return void
     */
    public function init(): void
    {
        $this->records = [
            [
                'dentist_id' => 1,
                'dentist_fullname' => 'Lorem ipsum dolor sit amet',
                'dentist_gender' => 'Lorem ip',
                'dentist_phone' => 'Lorem ipsum dolor sit amet',
                'dentist_email' => 'Lorem ipsum dolor sit amet',
                'specialization' => 'Lorem ipsum dolor sit amet',
                'status' => 'Lorem ipsum dolor sit amet',
                'created' => '2025-07-12 17:12:32',
                'modified' => '2025-07-12 17:12:32',
            ],
        ];
        parent::init();
    }
}
