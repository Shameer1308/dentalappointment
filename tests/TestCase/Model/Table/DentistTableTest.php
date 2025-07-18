<?php
declare(strict_types=1);

namespace App\Test\TestCase\Model\Table;

use App\Model\Table\DentistTable;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\DentistTable Test Case
 */
class DentistTableTest extends TestCase
{
    /**
     * Test subject
     *
     * @var \App\Model\Table\DentistTable
     */
    protected $Dentist;

    /**
     * Fixtures
     *
     * @var array<string>
     */
    protected array $fixtures = [
        'app.Dentist',
    ];

    /**
     * setUp method
     *
     * @return void
     */
    protected function setUp(): void
    {
        parent::setUp();
        $config = $this->getTableLocator()->exists('Dentist') ? [] : ['className' => DentistTable::class];
        $this->Dentist = $this->getTableLocator()->get('Dentist', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    protected function tearDown(): void
    {
        unset($this->Dentist);

        parent::tearDown();
    }

    /**
     * Test validationDefault method
     *
     * @return void
     * @uses \App\Model\Table\DentistTable::validationDefault()
     */
    public function testValidationDefault(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
