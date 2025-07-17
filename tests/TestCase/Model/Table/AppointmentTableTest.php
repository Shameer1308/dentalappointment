<?php
declare(strict_types=1);

namespace App\Test\TestCase\Model\Table;

use App\Model\Table\AppointmentTable;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\AppointmentTable Test Case
 */
class AppointmentTableTest extends TestCase
{
    /**
     * Test subject
     *
     * @var \App\Model\Table\AppointmentTable
     */
    protected $Appointment;

    /**
     * Fixtures
     *
     * @var array<string>
     */
    protected array $fixtures = [
        'app.Appointment',
    ];

    /**
     * setUp method
     *
     * @return void
     */
    protected function setUp(): void
    {
        parent::setUp();
        $config = $this->getTableLocator()->exists('Appointment') ? [] : ['className' => AppointmentTable::class];
        $this->Appointment = $this->getTableLocator()->get('Appointment', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    protected function tearDown(): void
    {
        unset($this->Appointment);

        parent::tearDown();
    }

    /**
     * Test validationDefault method
     *
     * @return void
     * @uses \App\Model\Table\AppointmentTable::validationDefault()
     */
    public function testValidationDefault(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
