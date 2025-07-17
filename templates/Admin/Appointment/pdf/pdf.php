<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Appointment $appointment
 */

$system_name = 'White Pearl Dental Studio';

if (!function_exists('h')) {
    function h($text) {
        return htmlspecialchars((string)$text, ENT_QUOTES, 'UTF-8');
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= h($appointment->patient_fullname) ?> Appointment</title>
    <style>
        /* All complex layout CSS is now gone! */
        body {
            font-family: 'Segoe UI', sans-serif;
            color: #333;
            font-size: 16px;
        }
        .details-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }
        .details-table th,
        .details-table td {
            padding: 10px 12px;
            border: 1px solid #ccc;
            text-align: left;
            vertical-align: top;
        }
        .details-table th {
            width: 30%;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>

    <div style="text-align: center; border-bottom: 2px solid #0066cc; padding-bottom: 10px; margin-bottom: 20px;">
        <h2 style="margin: 0; color: #0066cc;"><?= h($system_name) ?></h2>
        <p style="margin: 0; font-size: 14px;">1, Jalan Bukit Bintang, Kuala Lumpur, Malaysia</p>
        <p style="margin: 0; font-size: 14px;">Phone: +60 123-456-789 | Email: contact@whitepearl.com</p>
    </div>

    <div style="margin: 30px 0 20px; text-align: center; text-decoration: underline; font-weight: bold; font-size: 20px;">
        Appointment Confirmation
    </div>

    <p>Dear <?= h($appointment->patient_fullname) ?>,</p>
    <p>This is to confirm your dental appointment with the following details:</p>

    <table class="details-table">
        <tr>
            <th>Patient Full Name</th>
            <td><?= h($appointment->patient_fullname) ?></td>
        </tr>
        <tr>
            <th>Dentist Assigned</th>
            <td><?= h($appointment->dentist_fullname) ?></td>
        </tr>
        <tr>
            <th>Appointment Date</th>
            <td><?= h($appointment->appointment_date->format('d F Y')) ?></td>
        </tr>
        <tr>
            <th>Appointment Time</th>
            <td><?= h($appointment->appointment_time->format('h:i A')) ?></td>
        </tr>
        <tr>
            <th>Appointment Status</th>
            <td><?= h($appointment->appointment_status) ?></td>
        </tr>
    </table>

    <p style="margin-top: 30px;">Please arrive 10 minutes before your appointment time. If you have any questions or need to reschedule, feel free to contact us.</p>
    <p>Thank you and we look forward to seeing you.</p>

    <div style="margin-top: 50px;">
        <p>Sincerely,</p>
        <p><strong>The Team at <?= h($system_name) ?></strong></p>
    </div>
<br><br><br><br><br><br><br><br><br><br><br><br>
    <div style="font-size: 13px; text-align: center; color: #777; margin-top: 75px;">
        This is a computer-generated document. No signature is required.
    </div>

</body>
</html>