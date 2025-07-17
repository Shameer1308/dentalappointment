<?php
declare(strict_types=1);

namespace App\Test\TestCase\Controller;

use App\Controller\PatientController;
use Cake\TestSuite\IntegrationTestTrait;
use Cake\TestSuite\TestCase;

/**
 * App\Controller\PatientController Test Case
 *
 * @uses \App\Controller\PatientController
 */
class PatientControllerTest extends TestCase
{
    use IntegrationTestTrait;

    /**
     * Fixtures
     *
     * @var array<string>
     */
    protected array $fixtures = [
        'app.Patient',
    ];

    /**
     * Test beforeFilter method
     *
     * @return void
     * @uses \App\Controller\PatientController::beforeFilter()
     */
    public function testBeforeFilter(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test json method
     *
     * @return void
     * @uses \App\Controller\PatientController::json()
     */
    public function testJson(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test csv method
     *
     * @return void
     * @uses \App\Controller\PatientController::csv()
     */
    public function testCsv(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test pdfList method
     *
     * @return void
     * @uses \App\Controller\PatientController::pdfList()
     */
    public function testPdfList(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test index method
     *
     * @return void
     * @uses \App\Controller\PatientController::index()
     */
    public function testIndex(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test view method
     *
     * @return void
     * @uses \App\Controller\PatientController::view()
     */
    public function testView(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test add method
     *
     * @return void
     * @uses \App\Controller\PatientController::add()
     */
    public function testAdd(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test edit method
     *
     * @return void
     * @uses \App\Controller\PatientController::edit()
     */
    public function testEdit(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test delete method
     *
     * @return void
     * @uses \App\Controller\PatientController::delete()
     */
    public function testDelete(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test archived method
     *
     * @return void
     * @uses \App\Controller\PatientController::archived()
     */
    public function testArchived(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
