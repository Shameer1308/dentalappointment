<?php
declare(strict_types=1);

namespace App\Test\TestCase\Model\Table;

use App\Model\Table\PatientTable;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\PatientTable Test Case
 */
class PatientTableTest extends TestCase
{
    /**
     * Test subject
     *
     * @var \App\Model\Table\PatientTable
     */
    protected $Patient;

    /**
     * Fixtures
     *
     * @var array<string>
     */
    protected array $fixtures = [
        'app.Patient',
    ];

    /**
     * setUp method
     *
     * @return void
     */
    protected function setUp(): void
    {
        parent::setUp();
        $config = $this->getTableLocator()->exists('Patient') ? [] : ['className' => PatientTable::class];
        $this->Patient = $this->getTableLocator()->get('Patient', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    protected function tearDown(): void
    {
        unset($this->Patient);

        parent::tearDown();
    }

    /**
     * Test searchManager method
     *
     * @return void
     * @uses \App\Model\Table\PatientTable::searchManager()
     */
    public function testSearchManager(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test validationDefault method
     *
     * @return void
     * @uses \App\Model\Table\PatientTable::validationDefault()
     */
    public function testValidationDefault(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
