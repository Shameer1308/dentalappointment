<?php
declare(strict_types=1);

namespace App\Test\TestCase\Controller\Admin;

use App\Controller\Admin\AppointmentController;
use Cake\TestSuite\IntegrationTestTrait;
use Cake\TestSuite\TestCase;

/**
 * App\Controller\Admin\AppointmentController Test Case
 *
 * @uses \App\Controller\Admin\AppointmentController
 */
class AppointmentControllerTest extends TestCase
{
    use IntegrationTestTrait;

    /**
     * Fixtures
     *
     * @var array<string>
     */
    protected array $fixtures = [
        'app.Appointment',
    ];

    /**
     * Test beforeFilter method
     *
     * @return void
     * @uses \App\Controller\Admin\AppointmentController::beforeFilter()
     */
    public function testBeforeFilter(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test json method
     *
     * @return void
     * @uses \App\Controller\Admin\AppointmentController::json()
     */
    public function testJson(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test csv method
     *
     * @return void
     * @uses \App\Controller\Admin\AppointmentController::csv()
     */
    public function testCsv(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test pdfList method
     *
     * @return void
     * @uses \App\Controller\Admin\AppointmentController::pdfList()
     */
    public function testPdfList(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test index method
     *
     * @return void
     * @uses \App\Controller\Admin\AppointmentController::index()
     */
    public function testIndex(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test view method
     *
     * @return void
     * @uses \App\Controller\Admin\AppointmentController::view()
     */
    public function testView(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test add method
     *
     * @return void
     * @uses \App\Controller\Admin\AppointmentController::add()
     */
    public function testAdd(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test edit method
     *
     * @return void
     * @uses \App\Controller\Admin\AppointmentController::edit()
     */
    public function testEdit(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test delete method
     *
     * @return void
     * @uses \App\Controller\Admin\AppointmentController::delete()
     */
    public function testDelete(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test archived method
     *
     * @return void
     * @uses \App\Controller\Admin\AppointmentController::archived()
     */
    public function testArchived(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
