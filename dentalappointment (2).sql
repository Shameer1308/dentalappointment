-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 15, 2025 at 03:29 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dentalappointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `appointment_status` varchar(255) NOT NULL,
  `patient_fullname` varchar(255) NOT NULL,
  `dentist_fullname` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `appointment_date`, `appointment_time`, `appointment_status`, `patient_fullname`, `dentist_fullname`, `status`, `created`, `modified`) VALUES
(6, '2025-07-02', '15:03:24', 'Scheduled', 'Siti', 'Shameer', 'inactive', '2025-07-01 14:03:41', '2025-07-12 18:42:37'),
(7, '2025-07-15', '16:50:50', 'Scheduled', 'Haikal', 'Shameer', 'active', '2025-07-01 14:43:14', '2025-07-01 14:43:14'),
(8, '2025-07-03', '11:30:48', 'Scheduled', 'Nazira', 'Sabrina', 'active', '2025-07-01 14:49:26', '2025-07-12 19:01:35'),
(9, '2025-07-17', '10:50:19', 'Scheduled', 'Messi', 'Al7rc', 'active', '2025-07-12 18:48:31', '2025-07-12 19:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int UNSIGNED NOT NULL,
  `transaction` char(36) NOT NULL,
  `type` varchar(7) NOT NULL,
  `primary_key` int UNSIGNED DEFAULT NULL,
  `source` varchar(255) NOT NULL,
  `parent_source` varchar(255) DEFAULT NULL,
  `original` mediumtext,
  `changed` mediumtext,
  `meta` mediumtext,
  `status` int NOT NULL DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `transaction`, `type`, `primary_key`, `source`, `parent_source`, `original`, `changed`, `meta`, `status`, `slug`, `created`) VALUES
(1, '2c466456-bee6-415f-b075-d22a06a0a80c', 'create', 1, 'dentist', NULL, '[]', '{\"dentist_id\":1,\"dentist_fullname\":\"Siti Nur Nazira\",\"dentist_gender\":\"F\",\"dentist_notel\":\"fsdfsdf\",\"dentist_email\":\"nazira@gmail.com\",\"dentist_specialization\":\"ldsjflkjdf\",\"status\":\"1\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 18:28:07'),
(2, '99684ec1-8da5-4110-b34b-e0cee45ebf41', 'create', 2, 'dentist', NULL, '[]', '{\"dentist_id\":2,\"dentist_fullname\":\"Siti Nur Nazira\",\"dentist_gender\":\"Female\",\"dentist_email\":\"nazira@gmail.com\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 18:50:00'),
(3, '7b8ea454-d6ac-40c4-95fe-f7d15b2550d2', 'delete', 2, 'dentist', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/delete\\/2\",\"slug\":1}', 1, NULL, '2025-06-29 19:02:52'),
(4, '1a66ea02-fa9e-4d44-8713-97f2d5b0f13f', 'create', 3, 'dentist', NULL, '[]', '{\"dentist_id\":3,\"dentist_fullname\":\"Siti Nur Nazira\",\"dentist_gender\":\"Female\",\"dentist_email\":\"nazira@gmail.com\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 19:03:02'),
(5, '8cd48b66-2167-4158-a742-75236d22b71d', 'create', 4, 'dentist', NULL, '[]', '{\"dentist_id\":4,\"dentist_fullname\":\"Shameer Haikal\",\"dentist_gender\":\"Male\",\"dentist_email\":\"shameer@gmail.com\",\"status\":\"inactive\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 19:04:14'),
(6, '751a7386-afd4-4a53-bc5f-4a3c0438dda7', 'delete', 3, 'dentist', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/delete\\/3\",\"slug\":1}', 1, NULL, '2025-06-29 19:19:10'),
(7, 'b1a08d9f-8c46-407a-b881-371b1d306c0f', 'delete', 4, 'dentist', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/delete\\/4\",\"slug\":1}', 1, NULL, '2025-06-29 19:29:56'),
(8, '2c8567a3-b154-4203-86bb-8ef370eccaee', 'create', 5, 'dentist', NULL, '[]', '{\"dentist_id\":5,\"dentist_fullname\":\"Shameer Haikal\",\"dentist_gender\":\"Male\",\"dentist_phone\":\"01136211716\",\"dentist_email\":\"shameer@gmail.com\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 19:31:12'),
(9, '45442e2f-b650-4a13-8d3d-8b31a908371d', 'create', 6, 'dentist', NULL, '[]', '{\"dentist_id\":6,\"dentist_fullname\":\"Siti Nur Nazira\",\"dentist_gender\":\"Female\",\"dentist_phone\":\"01117743425\",\"dentist_email\":\"nazira@gmail.com\",\"status\":\"2\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 19:31:37'),
(10, 'a55efa3f-2f58-4fe9-bc9f-4682e5594d6e', 'create', 7, 'dentist', NULL, '[]', '{\"dentist_id\":7,\"dentist_fullname\":\"Haikal\",\"dentist_gender\":\"Male\",\"dentist_phone\":\"01136211716\",\"dentist_email\":\"haikal@gmail.com\",\"status\":\"1\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 19:31:51'),
(11, '5ee7518f-046f-4b5d-bcf8-4e14dfe80c41', 'create', 1, 'patient', NULL, '[]', '{\"patient_id\":1,\"patient_fullname\":\"Siti\",\"patient_ic\":\"030813080157\",\"patient_gender\":\"F\",\"patient_phone\":\"01136211716\",\"patient_email\":\"siti@gmail.com\",\"patient_address\":\"37, Lorong Kledang Utara 12, Taman Kledang Suria, 31450 Ipoh, Perak\",\"status\":\"1\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 19:44:09'),
(12, 'd94a84d3-a594-495c-82b0-bb287f4501a1', 'create', 2, 'patient', NULL, '[]', '{\"patient_id\":2,\"patient_fullname\":\"Fiqa\",\"patient_ic\":\"030813080157\",\"patient_gender\":\"F\",\"patient_phone\":\"01117743425\",\"patient_email\":\"fiqa@gmail.com\",\"patient_address\":\"37, Lorong Kledang Utara 12, Taman Kledang Suria, 31450 Ipoh, Perak\",\"status\":\"2\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 19:44:48'),
(13, 'f4e09470-ca03-4665-a64a-f9c3a4360c3f', 'delete', 1, 'patient', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/delete\\/1\",\"slug\":1}', 1, NULL, '2025-06-29 19:54:38'),
(14, '52bd7214-84d3-4a77-9aae-7e15ed7cd43b', 'delete', 2, 'patient', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/delete\\/2\",\"slug\":1}', 1, NULL, '2025-06-29 19:54:42'),
(15, '545bacbc-b6ce-4043-b29f-722946797d7e', 'create', 3, 'patient', NULL, '[]', '{\"patient_id\":3,\"patient_fullname\":\"Siti\",\"patient_ic\":\"030813080157\",\"patient_gender\":\"Female\",\"patient_phone\":\"01117743425\",\"patient_email\":\"siti@gmail.com\",\"patient_address_line1\":\"37, Lorong Kledang Utara 12\",\"patient_address_line2\":\"Taman Kledang Suria\",\"poscode\":\"31450\",\"city\":\"Ipoh\",\"state\":\"Perak\",\"status\":\"1\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 19:55:41'),
(16, '06706942-fe17-4fc6-af4b-4de0281a0203', 'create', 4, 'patient', NULL, '[]', '{\"patient_id\":4,\"patient_fullname\":\"Siti\",\"patient_ic\":\"030813080157\",\"patient_gender\":\"Female\",\"patient_phone\":\"01117743425\",\"patient_email\":\"siti@gmail.com\",\"patient_address_line1\":\"37, Lorong Kledang Utara 12\",\"patient_address_line2\":\"Taman Kledang Suria\",\"poscode\":\"31450\",\"city\":\"Ipoh\",\"state\":\"Perak\",\"status\":\"1\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 20:01:27'),
(17, '94477bf5-3f9d-43c7-b086-45a80ead1b59', 'create', 5, 'patient', NULL, '[]', '{\"patient_id\":5,\"patient_fullname\":\"Fiqa\",\"patient_ic\":\"030813080157\",\"patient_gender\":\"Female\",\"patient_phone\":\"01136211716\",\"patient_email\":\"fiqa@gmail.com\",\"patient_address_line1\":\"37, Lorong Kledang Utara 12\",\"patient_address_line2\":\"Taman Kledang Suria\",\"poscode\":\"31450\",\"city\":\"Puncak Perdana\",\"state\":\"Selangor\",\"status\":\"2\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 20:02:32'),
(18, '3de01ed0-1f78-427b-a0e9-b90fed6a014d', 'create', 6, 'patient', NULL, '[]', '{\"patient_id\":6,\"patient_fullname\":\"Monyom\",\"patient_ic\":\"010505010052\",\"patient_gender\":\"Male\",\"patient_phone\":\"01136211716\",\"patient_email\":\"monyom@gmail.com\",\"patient_address_line1\":\"16, Jalan Beringin 9\",\"patient_address_line2\":\"Taman Desaru Utama\",\"poscode\":\"81930\",\"city\":\"Bandar Penawar\",\"state\":\"Johor\",\"status\":\"1\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 20:04:31'),
(19, 'efd4bc1c-5398-44c4-aa69-4efaba8334fa', 'update', 5, 'dentist', NULL, '{\"specialization\":\"\"}', '{\"specialization\":\"Operation\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/edit\\/5\",\"slug\":1}', 1, NULL, '2025-06-29 20:09:20'),
(20, 'bd1eed05-b884-4635-a372-0bb0b62ae766', 'update', 6, 'dentist', NULL, '{\"specialization\":\"\"}', '{\"specialization\":\"Doggy\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/dentist\\/edit\\/6\",\"slug\":1}', 1, NULL, '2025-06-29 20:09:57'),
(21, 'c40b43c9-f0ba-4904-817e-8d9415c1548b', 'create', 1, 'appointment', NULL, '[]', '{\"appointment_id\":1,\"appointment_date\":\"2025-07-01\",\"appointment_time\":\"10:00:00\",\"appointment_status\":\"cascsdc\",\"patient_fullname\":\"Monyom\",\"dentist_fullname\":\"Shameer Haikal\",\"status\":\"1\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/appointment\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 20:35:37'),
(22, '288eab9e-d9a6-42af-ab7c-5545fe740e2d', 'create', 2, 'appointment', NULL, '[]', '{\"appointment_id\":2,\"appointment_date\":\"2025-07-08\",\"appointment_time\":\"20:36:33\",\"appointment_status\":\"Scheduled\",\"patient_fullname\":\"Siti\",\"dentist_fullname\":\"Siti Nur Nazira\",\"status\":\"1\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/appointment\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 20:37:07'),
(23, 'b1388387-f29b-4eb3-b423-3b883251a9f9', 'delete', 1, 'appointment', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/delete\\/1\",\"slug\":1}', 1, NULL, '2025-06-29 22:41:02'),
(24, '553fa991-cb19-4399-899b-f0243489e800', 'create', 3, 'appointment', NULL, '[]', '{\"appointment_id\":3,\"appointment_date\":\"2025-06-30\",\"appointment_time\":\"13:13:37\",\"appointment_status\":\"Scheduled\",\"patient_fullname\":\"Siti\",\"dentist_fullname\":\"Haikal\",\"status\":\"1\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/add\",\"slug\":1}', 1, NULL, '2025-06-29 23:11:53'),
(25, '5e08eeb5-8f50-40ff-b426-23ccb092b336', 'delete', 6, 'patient', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/delete\\/6\",\"slug\":1}', 1, NULL, '2025-06-30 00:52:56'),
(26, '5bcda2ab-ec2b-4cb9-8f76-0da5a0945cde', 'delete', 5, 'patient', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/delete\\/5\",\"slug\":1}', 1, NULL, '2025-06-30 00:52:58'),
(27, 'ec39018a-d93d-4843-ad1d-762660e06ce2', 'create', 4, 'appointment', NULL, '[]', '{\"appointment_id\":4,\"appointment_date\":\"2025-07-02\",\"appointment_time\":\"16:40:32\",\"appointment_status\":\"Scheduled\",\"patient_fullname\":\"Fiqa\",\"dentist_fullname\":\"Shameer Haikal\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/add\",\"slug\":1}', 1, NULL, '2025-06-30 14:36:47'),
(28, '7156f6e1-fca9-4cb5-be2b-548a4ec0bf19', 'delete', 3, 'appointment', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/delete\\/3\",\"slug\":1}', 1, NULL, '2025-06-30 22:55:34'),
(29, '020b04b2-bb94-4c1c-a37d-3c544319adf4', 'delete', 7, 'dentist', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/delete\\/7\",\"slug\":1}', 1, NULL, '2025-06-30 22:56:14'),
(30, '1a86211a-964f-4a06-ab6a-d616242f3bad', 'create', 7, 'patient', NULL, '[]', '{\"patient_id\":7,\"patient_fullname\":\"Shameer\",\"patient_ic\":\"030813080157\",\"patient_gender\":\"Female\",\"patient_phone\":\"01136211716\",\"patient_email\":\"shameer@gmail.com\",\"patient_address_line1\":\"Universiti Teknologi MARA Kampus Puncak Perdana,\",\"patient_address_line2\":\"Jln Pulau Angsa AU10\\/A,\",\"poscode\":\"40150\",\"city\":\"Puncak Perdana\",\"state\":\"Selangor\",\"status\":\"1\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/add\",\"slug\":1}', 1, NULL, '2025-06-30 23:05:56'),
(31, 'fae8e7c7-51d3-4352-9ddd-d956e5f8dc23', 'update', 7, 'patient', NULL, '{\"patient_gender\":\"Female\"}', '{\"patient_gender\":\"Male\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/edit\\/7\",\"slug\":1}', 1, NULL, '2025-06-30 23:06:12'),
(32, 'f0f1891b-183f-4b77-a288-e9d2d1d5e446', 'delete', 7, 'patient', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/delete\\/7\",\"slug\":1}', 1, NULL, '2025-06-30 23:14:19'),
(33, '41f95844-3958-4803-816b-de1a0557ae89', 'delete', 4, 'appointment', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/delete\\/4\",\"slug\":1}', 1, NULL, '2025-07-01 13:51:53'),
(34, 'a0e16597-0ed6-4d0b-8090-e51cd0a34c33', 'delete', 2, 'appointment', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/delete\\/2\",\"slug\":1}', 1, NULL, '2025-07-01 13:51:56'),
(35, '38b63824-c1b9-4e0a-92ac-f2ebd81ed21a', 'delete', 5, 'dentist', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/delete\\/5\",\"slug\":1}', 1, NULL, '2025-07-01 13:52:02'),
(36, '6bf2b5fb-3cf0-4976-a10a-5c266c433d68', 'create', 5, 'appointment', NULL, '[]', '{\"appointment_id\":5,\"appointment_date\":\"2025-07-01\",\"appointment_time\":\"14:54:09\",\"appointment_status\":\"Cancelled\",\"patient_fullname\":\"Fiqa\",\"dentist_fullname\":\"Shameer\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/add\",\"slug\":1}', 1, NULL, '2025-07-01 13:54:24'),
(37, 'dd4467e3-fde4-46b6-8427-77f080ca639b', 'update', 5, 'appointment', NULL, '{\"status\":\"active\"}', '{\"status\":\"inactive\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/edit\\/5\",\"slug\":1}', 1, NULL, '2025-07-01 13:56:06'),
(38, 'b1f06f4e-8ad3-49a1-b64a-191343d919dd', 'create', 8, 'dentist', NULL, '[]', '{\"dentist_id\":8,\"dentist_fullname\":\"Shameer\",\"dentist_gender\":\"Male\",\"dentist_phone\":\"01136211716\",\"dentist_email\":\"shameer@gmail.com\",\"specialization\":\"Orthodontics\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-07-01 14:02:49'),
(39, '5c752a7d-47f0-454e-9e41-643049d0d96a', 'delete', 8, 'dentist', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/delete\\/8\",\"slug\":1}', 1, NULL, '2025-07-01 14:03:01'),
(40, '85928948-b5ce-42b0-86f4-87a90e8e6faa', 'delete', 5, 'appointment', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/delete\\/5\",\"slug\":1}', 1, NULL, '2025-07-01 14:03:07'),
(41, 'a6e1cc34-b661-4de0-90f0-bfdda0c72085', 'create', 6, 'appointment', NULL, '[]', '{\"appointment_id\":6,\"appointment_date\":\"2025-07-02\",\"appointment_time\":\"15:03:24\",\"appointment_status\":\"Scheduled\",\"patient_fullname\":\"Siti\",\"dentist_fullname\":\"Shameer\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/add\",\"slug\":1}', 1, NULL, '2025-07-01 14:03:41'),
(42, '56ac6b12-a89f-4eef-9236-4685d4752713', 'create', 9, 'dentist', NULL, '[]', '{\"dentist_id\":9,\"dentist_fullname\":\"Shameer\",\"dentist_gender\":\"Male\",\"dentist_phone\":\"01136211716\",\"dentist_email\":\"shameer@gmail.com\",\"specialization\":\"Orthodontics\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-07-01 14:06:13'),
(43, 'ed44f8ba-0833-4d6f-9dbe-28e4700acfc4', 'create', 2, 'users', NULL, '[]', '{\"id\":2,\"fullname\":\"Shameer\",\"password\":\"$2y$10$FXAxz.wZedzn9uK0ITck6.szFO9ELEMRLw4gkVRzcMe55DR.i5z5K\",\"email\":\"shameerhaikal@gmail.com\",\"slug\":\"Shameer\"}', '[]', 1, NULL, '2025-07-01 14:26:23'),
(44, 'cddf745e-d734-4710-a905-1b93a0c08cc2', 'create', 8, 'patient', NULL, '[]', '{\"patient_id\":8,\"patient_fullname\":\"Haikal\",\"patient_ic\":\"030813080157\",\"patient_gender\":\"Male\",\"patient_phone\":\"01136211716\",\"patient_email\":\"Haikal@gmail.com\",\"patient_address_line1\":\"No 13, Jalan Suria 5, \",\"patient_address_line2\":\"Taman Anggerik , Menglembu\",\"poscode\":\"41522\",\"city\":\"Ipoh\",\"state\":\"Perak\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/add\",\"slug\":1}', 1, NULL, '2025-07-01 14:42:11'),
(45, '6cb889a0-43eb-4516-ab0e-dc19907ed2b3', 'create', 7, 'appointment', NULL, '[]', '{\"appointment_id\":7,\"appointment_date\":\"2025-07-15\",\"appointment_time\":\"16:50:50\",\"appointment_status\":\"Scheduled\",\"patient_fullname\":\"Haikal\",\"dentist_fullname\":\"Shameer\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/add\",\"slug\":1}', 1, NULL, '2025-07-01 14:43:14'),
(46, 'a8042fb7-bde6-4a57-a072-3a87b2da155b', 'create', 10, 'dentist', NULL, '[]', '{\"dentist_id\":10,\"dentist_fullname\":\"Ali\",\"dentist_gender\":\"Male\",\"dentist_phone\":\"0136936564\",\"dentist_email\":\"Ali01@gmail.com\",\"specialization\":\"Endodontic\",\"status\":\"inactive\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-07-01 14:45:04'),
(47, 'b514b84e-794f-46d6-9b4d-75fbf67e49ae', 'create', 11, 'dentist', NULL, '[]', '{\"dentist_id\":11,\"dentist_fullname\":\"Sabrina\",\"dentist_gender\":\"Female\",\"dentist_phone\":\"0111234564\",\"dentist_email\":\"Sabrina@gmail.com\",\"specialization\":\"Periodontics\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-07-01 14:46:08'),
(48, '57e38088-645b-4a31-b692-c7e5989647a1', 'create', 9, 'patient', NULL, '[]', '{\"patient_id\":9,\"patient_fullname\":\"Nazira\",\"patient_ic\":\"010505010062\",\"patient_gender\":\"Female\",\"patient_phone\":\"012369854\",\"patient_email\":\"Nazira@gmail.com\",\"patient_address_line1\":\"No 1, Jalan Beringin 7, \",\"patient_address_line2\":\"Taman Desaru Utama\",\"poscode\":\"81930\",\"city\":\"Bandar Penawar\",\"state\":\"Johor\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/add\",\"slug\":1}', 1, NULL, '2025-07-01 14:48:26'),
(49, '36a19f44-9c91-4cea-9e00-abfd373c0d0b', 'create', 8, 'appointment', NULL, '[]', '{\"appointment_id\":8,\"appointment_date\":\"2025-07-03\",\"appointment_time\":\"11:30:48\",\"appointment_status\":\"Cancelled\",\"patient_fullname\":\"Nazira\",\"dentist_fullname\":\"Sabrina\",\"status\":\"inactive\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/add\",\"slug\":1}', 1, NULL, '2025-07-01 14:49:26'),
(50, '7ac4308c-d40f-4d72-8cd2-1e140b2b6ba0', 'create', 3, 'users', NULL, '[]', '{\"id\":3,\"fullname\":\"users\",\"password\":\"$2y$10$u9IDn9kyK9BnCnxIgEULfuIrF9GpXF1ccscbIkqkVz8nGaNnwuh\\/u\",\"email\":\"users@localhost.com\",\"slug\":\"users\"}', '[]', 1, NULL, '2025-07-01 14:51:18'),
(51, 'bb377594-f338-4f23-a10f-0dea61d13d86', 'update', 3, 'users', NULL, '{\"status\":\"0\"}', '{\"status\":1}', '[]', 1, NULL, '2025-07-01 14:51:36'),
(52, '058aeb24-5376-453c-89bc-678fc1b7838e', 'create', 10, 'patient', NULL, '[]', '{\"patient_id\":10,\"patient_fullname\":\"Ronaldo\",\"patient_ic\":\"123456121234\",\"patient_gender\":\"Male\",\"patient_phone\":\"01136211716\",\"patient_email\":\"ronaldo@gmail.com\",\"patient_address_line1\":\"Universiti Teknologi MARA Kampus Puncak Perdana,\",\"patient_address_line2\":\" Jln Pulau Angsa AU10\\/A, \",\"poscode\":\"40150\",\"city\":\"Puncak Perdana\",\"state\":\"Selangor\",\"status\":\"Active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/add\",\"slug\":1}', 1, NULL, '2025-07-08 15:37:27'),
(53, 'c0c4eacb-770f-4ac4-8e2c-896bbe4d10f3', 'update', 4, 'patient', NULL, '{\"status\":\"active\"}', '{\"status\":\"Inactive\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/edit\\/4\",\"slug\":1}', 1, NULL, '2025-07-08 15:38:04'),
(54, '5ade8837-fdad-4396-b6bd-06475ff8473a', 'create', 11, 'patient', NULL, '[]', '{\"patient_id\":11,\"patient_fullname\":\"Messi\",\"patient_ic\":\"123456121234\",\"patient_gender\":\"Male\",\"patient_phone\":\"01111111111\",\"patient_email\":\"messi@gmail.com\",\"patient_address_line1\":\"Universiti Teknologi MARA Kampus Puncak Perdana,\",\"patient_address_line2\":\" Jln Pulau Angsa AU10\\/A, \",\"poscode\":\"12345\",\"city\":\"Argentina\",\"state\":\"Sabah\",\"status\":\"active\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/add\",\"slug\":1}', 1, NULL, '2025-07-12 16:49:30'),
(55, 'cf0ab403-982f-45d2-bc39-cb4db48dba43', 'create', 12, 'patient', NULL, '[]', '{\"patient_id\":12,\"patient_fullname\":\"Shameer\",\"patient_ic\":\"030813080157\",\"patient_gender\":\"Male\",\"patient_phone\":\"01117743425\",\"patient_email\":\"ronaldo@gmail.com\",\"patient_address_line1\":\"Universiti Teknologi MARA Kampus Puncak Perdana, \",\"patient_address_line2\":\" Jln Pulau Angsa AU10\\/A,\",\"poscode\":\"84665\",\"city\":\"Puncak Perdana\",\"state\":\"Perlis\",\"status\":1}', '[]', 1, NULL, '2025-07-12 16:56:35'),
(56, 'a0078ef7-3aab-43ee-a253-d8c684575b9c', 'update', 11, 'patient', NULL, '{\"patient_gender\":\"Male\"}', '{\"patient_gender\":\"Female\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/edit\\/11\",\"slug\":1}', 1, NULL, '2025-07-12 16:57:07'),
(57, '365769db-4f7a-4346-a1eb-33c7a23bad62', 'delete', 11, 'patient', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/delete\\/11\",\"slug\":1}', 1, NULL, '2025-07-12 16:57:12'),
(58, 'b5ab12ee-f911-42dd-bc4d-f4e0f57a6b5c', 'delete', 12, 'patient', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/delete\\/12\",\"slug\":1}', 1, NULL, '2025-07-12 16:57:19'),
(59, '3bd1c16d-6033-4416-8ffa-a5e9492c83b2', 'create', 12, 'dentist', NULL, '[]', '{\"dentist_id\":12,\"dentist_fullname\":\"Naz\",\"dentist_gender\":\"Female\",\"dentist_phone\":\"465465465651\",\"dentist_email\":\"naz@gmail.com\",\"status\":\"0\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-07-12 17:37:22'),
(60, '8710cb22-1c6f-47d2-a823-c83bd957fdcd', 'create', 13, 'dentist', NULL, '[]', '{\"dentist_id\":13,\"dentist_fullname\":\"Sabrina\",\"dentist_gender\":\"Male\",\"dentist_phone\":\"01117743425\",\"dentist_email\":\"haikal@gmail.com\",\"status\":\"0\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-07-12 17:37:42'),
(61, '69f57234-24db-4486-8cd0-fa71199df7f7', 'create', 14, 'dentist', NULL, '[]', '{\"dentist_id\":14,\"dentist_fullname\":\"Sabrina\",\"dentist_gender\":\"Male\",\"dentist_phone\":\"01117743425\",\"dentist_email\":\"haikal@gmail.com\",\"status\":\"0\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-07-12 17:38:31'),
(62, '08984a9b-36e3-48d4-96d4-2aa741087179', 'update', 12, 'dentist', NULL, '{\"status\":\"\"}', '{\"status\":\"active\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/edit\\/12\",\"slug\":1}', 1, NULL, '2025-07-12 17:41:40'),
(63, '24b86ded-593b-498e-9ed1-309162a546ea', 'update', 10, 'dentist', NULL, '{\"status\":\"inactive\"}', '{\"status\":\"active\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/edit\\/10\",\"slug\":1}', 1, NULL, '2025-07-12 17:41:49'),
(64, 'c45d8a1f-9664-48a4-b6b9-764d1b08c8b1', 'update', 10, 'dentist', NULL, '{\"status\":\"active\"}', '{\"status\":\"inactive\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/edit\\/10\",\"slug\":1}', 1, NULL, '2025-07-12 17:41:58'),
(65, '369fc9da-e798-409e-82cf-757527491905', 'create', 15, 'dentist', NULL, '[]', '{\"dentist_id\":15,\"dentist_fullname\":\"Al7rc\",\"dentist_gender\":\"Male\",\"dentist_phone\":\"01117743425\",\"dentist_email\":\"haikal@gmail.com\",\"status\":\"1\"}', '{\"a_name\":\"Add\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/add\",\"slug\":1}', 1, NULL, '2025-07-12 17:42:29'),
(66, '6a62027a-7334-4f75-b052-3a81aa44ebfc', 'update', 9, 'dentist', NULL, '{\"status\":\"active\"}', '{\"status\":\"0\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Dentist\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/dentist\\/edit\\/9\",\"slug\":1}', 1, NULL, '2025-07-12 17:44:08'),
(67, '05e246ca-1ab6-4a21-8799-0e57b291460c', 'create', 13, 'patient', NULL, '[]', '{\"patient_id\":13,\"patient_fullname\":\"Messi\",\"patient_ic\":\"010505010062\",\"patient_gender\":\"Male\",\"patient_phone\":\"01117743425\",\"patient_email\":\"siti@gmail.com\",\"patient_address_line1\":\"Universiti Teknologi MARA Kampus Puncak Perdana, Jln Pulau Angsa AU10\\/A, 40150 Shah Alam, Selangor\",\"patient_address_line2\":\"Jln Pulau Angsa AU10\\/A,\",\"poscode\":\"31450\",\"city\":\"Puncak Perdana\",\"state\":\"W.P. Putrajaya\",\"status\":1}', '[]', 1, NULL, '2025-07-12 17:50:22'),
(68, '25e23ebc-3e73-46b6-83b6-f54b03b21a55', 'update', 4, 'patient', NULL, '{\"status\":\"inactive\"}', '{\"status\":\"0\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/edit\\/4\",\"slug\":1}', 1, NULL, '2025-07-12 17:51:20'),
(69, '191293a5-fef3-4444-a632-75c7c63a3892', 'update', 13, 'patient', NULL, '{\"status\":\"active\"}', '{\"status\":\"0\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/edit\\/13\",\"slug\":1}', 1, NULL, '2025-07-12 17:51:26'),
(70, '9cb89c47-4671-460c-937a-7635a5b9f15e', 'delete', 13, 'patient', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Patient\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/patient\\/delete\\/13\",\"slug\":1}', 1, NULL, '2025-07-12 17:53:08'),
(71, 'f3ae10aa-c0ee-4e86-90bf-1dc5b681aeb8', 'update', 6, 'appointment', NULL, '{\"status\":\"active\"}', '{\"status\":\"inactive\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/edit\\/6\",\"slug\":1}', 1, NULL, '2025-07-12 18:42:37'),
(72, '050bbc47-204d-435a-9b31-ba39fe06847b', 'create', 9, 'appointment', NULL, '[]', '{\"appointment_id\":9,\"appointment_date\":\"2025-07-17\",\"appointment_time\":\"10:50:19\",\"appointment_status\":\"Cancelled\",\"patient_fullname\":\"Messi\",\"dentist_fullname\":\"Al7rc\",\"status\":\"inactive\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/add\",\"slug\":1}', 1, NULL, '2025-07-12 18:48:31'),
(73, '2c072712-2679-4f5c-943d-227a07e12de5', 'update', 8, 'appointment', NULL, '{\"appointment_status\":\"Cancelled\",\"status\":\"inactive\"}', '{\"appointment_status\":\"Scheduled\",\"status\":\"Active\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/edit\\/8\",\"slug\":1}', 1, NULL, '2025-07-12 19:01:35'),
(74, '35c90a1e-edc2-4e18-a586-de174f5a5654', 'update', 9, 'appointment', NULL, '{\"appointment_status\":\"Cancelled\",\"status\":\"inactive\"}', '{\"appointment_status\":\"Scheduled\",\"status\":\"Active\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointment\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/dentalappointment\\/admin\\/appointment\\/edit\\/9\",\"slug\":1}', 1, NULL, '2025-07-12 19:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `ticket` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `note_admin` text,
  `ip` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `is_replied` tinyint(1) NOT NULL,
  `respond_date_time` datetime DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dentist`
--

CREATE TABLE `dentist` (
  `dentist_id` int NOT NULL,
  `dentist_fullname` varchar(255) NOT NULL,
  `dentist_gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dentist_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dentist_email` varchar(255) NOT NULL,
  `specialization` varchar(30) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dentist`
--

INSERT INTO `dentist` (`dentist_id`, `dentist_fullname`, `dentist_gender`, `dentist_phone`, `dentist_email`, `specialization`, `status`, `created`, `modified`) VALUES
(9, 'Shameer', 'Male', '01136211716', 'shameer@gmail.com', 'Orthodontics', '', '2025-07-01 14:06:13', '2025-07-12 17:44:08'),
(10, 'Ali', 'Male', '0136936564', 'Ali01@gmail.com', 'Endodontic', 'inactive', '2025-07-01 14:45:03', '2025-07-12 17:41:58'),
(11, 'Sabrina', 'Female', '0111234564', 'Sabrina@gmail.com', 'Periodontics', 'active', '2025-07-01 14:46:08', '2025-07-01 14:46:08'),
(12, 'Naz', 'Female', '465465465651', 'naz@gmail.com', '', 'active', '2025-07-12 17:37:22', '2025-07-12 17:41:40'),
(13, 'Sabrina', 'Male', '01117743425', 'haikal@gmail.com', '', '', '2025-07-12 17:37:42', '2025-07-12 17:37:42'),
(14, 'Sabrina', 'Male', '01117743425', 'haikal@gmail.com', '', '', '2025-07-12 17:38:31', '2025-07-12 17:38:31'),
(15, 'Al7rc', 'Male', '01117743425', 'haikal@gmail.com', '', 'active', '2025-07-12 17:42:29', '2025-07-12 17:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int NOT NULL,
  `category` varchar(100) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `category`, `question`, `answer`, `slug`, `status`, `created`, `modified`) VALUES
(1, 'General', 'General Questions 1', 'General Answer 1', 'General-Questions-1', 1, '2022-11-13 15:41:26', '2022-11-13 16:31:14'),
(2, 'Account', 'Account Questions 1', 'Account Answer 1', 'Account-Questions-1', 1, '2022-11-13 15:43:15', '2022-11-13 15:43:15'),
(3, 'Other', 'Other Questions 1', 'Other Answer 1', 'Other-Questions-1', 1, '2022-11-13 15:43:34', '2022-11-13 15:43:34'),
(6, 'General', 'General Questions 2', 'General Answer 2', 'General-Questions-2', 0, '2022-11-13 16:54:25', '2024-06-25 13:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `lft` int DEFAULT NULL,
  `rght` int DEFAULT NULL,
  `level` int DEFAULT '0',
  `icon` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `auth` tinyint(1) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `divider_before` tinyint(1) DEFAULT '0',
  `parent_separator` tinyint(1) DEFAULT NULL,
  `division` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `lft`, `rght`, `level`, `icon`, `controller`, `action`, `target`, `name`, `url`, `prefix`, `auth`, `admin`, `active`, `disabled`, `divider_before`, `parent_separator`, `division`) VALUES
(1, NULL, 1, 2, 0, '<i class=\"fa-solid fa-code\"></i>', 'Dashboards', 'Index', NULL, 'Dashboard', '', '', 1, 0, 1, 0, 0, 0, 0),
(2, NULL, 3, 4, 0, '<i class=\"fa-regular fa-circle-question\"></i>', 'Faqs', '', NULL, 'FAQs', '', '', 0, 0, 1, 0, 0, NULL, 0),
(3, NULL, 5, 6, 0, '<i class=\"fa-regular fa-message\"></i>', 'Contacts', 'Add', NULL, 'Contact Us', '', '', 0, 0, 1, NULL, 0, NULL, 0),
(4, NULL, 7, 14, 0, '<i class=\"fa-solid fa-circle-info\"></i>', 'Pages', 'manual', NULL, 'Documentation', '', '', 0, 0, 1, 0, 0, 1, 0),
(5, NULL, 15, 16, 0, '', '', '', NULL, 'Administrator', '', NULL, 0, 1, 1, NULL, 0, NULL, 1),
(6, NULL, 17, 18, 0, '<i class=\"fa-solid fa-gear\"></i>', 'Settings', 'Update', 'recrud', 'System Configuration', '', 'Admin', 1, 1, 1, NULL, 0, 0, 0),
(7, NULL, 19, 20, 0, '<i class=\"fa-solid fa-users-viewfinder\"></i>', 'Users', 'Index', NULL, 'User Management', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(8, NULL, 21, 22, 0, '<i class=\"fa-solid fa-bars\"></i>', 'Menus', 'Index', NULL, 'Menu Management', '', 'Admin', 1, 1, 1, NULL, 0, 0, 0),
(9, NULL, 23, 24, 0, '<i class=\"menu-icon fa-solid fa-list-check\"></i>', 'Todos', 'Index', NULL, 'Todo List', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(10, NULL, 25, 26, 0, '<i class=\"fa-regular fa-message\"></i>', 'Contacts', 'Index', NULL, 'Contact', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(11, NULL, 27, 28, 0, '<i class=\"menu-icon fa-solid fa-timeline\"></i>', 'AuditLogs', 'Index', NULL, 'Audit Trail', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(12, NULL, 29, 30, 0, '<i class=\"menu-icon fa-regular fa-circle-question\"></i>', 'Faqs', 'Index', NULL, 'FAQs', '', 'Admin', 1, 1, 1, NULL, 0, 0, 0),
(13, 4, 10, 11, 1, '<i class=\"fa-solid fa-code\"></i>', '', '', NULL, 'Code The Pixel', 'https://codethepixel.com/', '', 0, 0, 1, NULL, 0, 0, 0),
(14, 4, 8, 9, 1, '<i class=\"fa-regular fa-file-code\"></i>', 'Pages', 'manual', NULL, 'User Manual', '', '', 0, 0, 1, NULL, 0, 0, 0),
(15, 4, 12, 13, 1, '<i class=\"fa-brands fa-github\"></i>', '', '', NULL, 'Re-CRUD Github', 'https://github.com/Asyraf-wa/recrud', '', 0, 0, 1, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int NOT NULL,
  `patient_fullname` varchar(255) NOT NULL,
  `patient_ic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `patient_gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `patient_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `patient_email` varchar(50) NOT NULL,
  `patient_address_line1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `patient_address_line2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `poscode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `patient_fullname`, `patient_ic`, `patient_gender`, `patient_phone`, `patient_email`, `patient_address_line1`, `patient_address_line2`, `poscode`, `city`, `state`, `status`, `created`, `modified`) VALUES
(4, 'Siti', '030813080157', 'Female', '01117743425', 'siti@gmail.com', '37, Lorong Kledang Utara 12', 'Taman Kledang Suria', '31450', 'Ipoh', 'Perak', '', '2025-06-29 20:01:27', '2025-07-12 17:51:20'),
(8, 'Haikal', '030813080157', 'Male', '01136211716', 'Haikal@gmail.com', 'No 13, Jalan Suria 5, ', 'Taman Anggerik , Menglembu', '41522', 'Ipoh', 'Perak', 'active', '2025-07-01 14:42:11', '2025-07-01 14:42:11'),
(9, 'Nazira', '010505010062', 'Female', '012369854', 'Nazira@gmail.com', 'No 1, Jalan Beringin 7, ', 'Taman Desaru Utama', '81930', 'Bandar Penawar', 'Johor', 'active', '2025-07-01 14:48:26', '2025-07-01 14:48:26'),
(10, 'Ronaldo', '123456121234', 'Male', '01136211716', 'ronaldo@gmail.com', 'Universiti Teknologi MARA Kampus Puncak Perdana,', ' Jln Pulau Angsa AU10/A, ', '40150', 'Puncak Perdana', 'Selangor', 'active', '2025-07-08 15:37:27', '2025-07-08 15:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20241029053753, 'Initial', '2025-06-28 14:14:48', '2025-06-28 14:14:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` char(36) NOT NULL,
  `system_name` varchar(255) NOT NULL,
  `system_abbr` varchar(255) NOT NULL,
  `system_slogan` varchar(255) NOT NULL,
  `organization_name` varchar(255) NOT NULL,
  `domain_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `notification_email` varchar(50) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_subject` varchar(255) NOT NULL,
  `meta_copyright` varchar(255) NOT NULL,
  `meta_desc` varchar(255) NOT NULL,
  `timezone` varchar(100) NOT NULL,
  `author` varchar(255) NOT NULL,
  `site_status` tinyint(1) NOT NULL,
  `user_reg` tinyint(1) NOT NULL,
  `config_2` tinyint(1) NOT NULL,
  `config_3` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL,
  `private_key_from_recaptcha` varchar(255) DEFAULT NULL,
  `public_key_from_recaptcha` varchar(255) DEFAULT NULL,
  `banned_username` text,
  `telegram_bot_token` varchar(255) DEFAULT NULL,
  `telegram_chatid` varchar(255) DEFAULT NULL,
  `hcaptcha_sitekey` varchar(255) DEFAULT NULL,
  `hcaptcha_secretkey` varchar(255) DEFAULT NULL,
  `notification` text NOT NULL,
  `notification_status` tinyint(1) NOT NULL,
  `notification_date` date DEFAULT NULL,
  `ribbon_title` varchar(20) NOT NULL,
  `ribbon_link` varchar(255) NOT NULL,
  `ribbon_status` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `system_name`, `system_abbr`, `system_slogan`, `organization_name`, `domain_name`, `email`, `notification_email`, `meta_title`, `meta_keyword`, `meta_subject`, `meta_copyright`, `meta_desc`, `timezone`, `author`, `site_status`, `user_reg`, `config_2`, `config_3`, `version`, `private_key_from_recaptcha`, `public_key_from_recaptcha`, `banned_username`, `telegram_bot_token`, `telegram_chatid`, `hcaptcha_sitekey`, `hcaptcha_secretkey`, `notification`, `notification_status`, `notification_date`, `ribbon_title`, `ribbon_link`, `ribbon_status`, `created`, `modified`) VALUES
('recrud', 'Dental Appointment System', 'White Pearl ', 'Code The Experiences', 'Code The Pixel Inc.', 'codethepixel.com', 'noreply@codethepixel.com', 'noreply@codethepixel.com', 'Re-CRUD', 'Re-CRUD, CakePHP, Learning, CRUD', 'Re-CRUD', 'Re-CRUD', 'Re-CRUD', 'Asia/Kuala_Lumpur', 'Re-CRUD', 0, 0, 0, 0, '1.1', '', '', NULL, '', '', '', '', '<p><strong>Server maintenance</strong> is scheduled to be executed on Jan 1, 2023, from 1.00 am to 4.00 am. An intermittent connection is expected during the server maintenance period.</p>', 0, '2022-11-07', 'Code The Pixel', 'https://codethepixel.com', 0, '2020-04-08 20:56:04', '2025-06-30 23:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `urgency` varchar(255) NOT NULL COMMENT 'high, medium, low',
  `task` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `note` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending' COMMENT 'Pending, In Progress, Completed, Canceled',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `user_id`, `urgency`, `task`, `description`, `note`, `status`, `created`, `modified`) VALUES
('a02daac9-27e3-49ea-8090-927e60f9e255', '1', 'High', 'task 4 desc', '<p>task 4 desc</p>', '<p>task 4 desc</p>', 'In Progress', '2024-05-31 13:48:26', '2024-05-31 13:48:31'),
('a8618f9e-a3f7-4e7a-8a3f-05a5323cd5af', '1', 'High', 'task 1', '<p>task 1 desc</p>', '<p>task 1 desc</p>', 'Completed', '2024-05-31 13:45:22', '2024-05-31 13:45:40'),
('c892f026-c6f8-4353-82c2-75f49c0f5d6b', '1', 'Medium', 'Task 3 - Develop the To Do Task and render in Dashboard', '<p>task 3 desc</p>', '<p>task 3 desc</p>', 'Pending', '2024-05-31 13:48:06', '2024-05-31 13:48:06'),
('eda46e51-555a-4309-a28b-d0835bf4f4b2', '1', 'Low', 'task 2', '<p>task 2 desc</p>', '<p>task 2 desc</p>', 'Canceled', '2024-05-31 13:46:12', '2024-05-31 13:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `user_group_id` int DEFAULT '3',
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `avatar_dir` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_created_at` datetime NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0' COMMENT '	is_active',
  `is_email_verified` int NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `created_by` int DEFAULT NULL COMMENT 'user_id',
  `modified_by` int DEFAULT NULL COMMENT 'user_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_group_id`, `fullname`, `password`, `email`, `avatar`, `avatar_dir`, `token`, `token_created_at`, `status`, `is_email_verified`, `last_login`, `ip_address`, `slug`, `created`, `modified`, `created_by`, `modified_by`) VALUES
(1, 1, 'Administrator', '$2y$10$OrUKHzNQUic6dFqSuG9QBeDzMbbwPz1BQXKgBKPcQyMTNdv3Z22xe', 'admin@localhost.com', '', '', NULL, '2024-07-10 20:30:04', '1', 1, '2025-07-12 15:29:33', '::1', 'Administrator', '2022-10-26 02:54:19', '2024-07-08 21:08:15', NULL, NULL),
(2, 3, 'Shameer', '$2y$10$FXAxz.wZedzn9uK0ITck6.szFO9ELEMRLw4gkVRzcMe55DR.i5z5K', 'shameerhaikal@gmail.com', NULL, NULL, NULL, '0000-00-00 00:00:00', '0', 0, '2025-07-01 14:26:52', '::1', 'Shameer', '2025-07-01 14:26:23', '2025-07-01 14:26:23', NULL, NULL),
(3, 3, 'users', '$2y$10$u9IDn9kyK9BnCnxIgEULfuIrF9GpXF1ccscbIkqkVz8nGaNnwuh/u', 'users@localhost.com', NULL, NULL, NULL, '0000-00-00 00:00:00', '1', 0, '2025-07-01 14:52:20', '::1', 'users', '2025-07-01 14:51:18', '2025-07-01 14:51:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `name`, `description`, `created`, `modified`) VALUES
(1, 'Admin', 'Admninistrator', '2021-01-23 13:21:29', '2021-01-23 13:21:29'),
(2, 'Mod', 'Moderator', '2021-01-23 13:21:29', '2021-01-23 13:21:29'),
(3, 'User', 'Normal User', '2021-01-23 13:21:29', '2021-01-23 13:21:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `useragent` varchar(256) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`id`, `user_id`, `action`, `useragent`, `os`, `ip`, `host`, `referrer`, `status`, `created`, `modified`) VALUES
(1, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-06-29 16:57:19', '2025-06-29 16:57:19'),
(2, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-06-29 16:57:19', '2025-06-29 16:57:19'),
(3, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-06-30 13:49:17', '2025-06-30 13:49:17'),
(4, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-06-30 18:55:14', '2025-06-30 18:55:14'),
(5, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-06-30 19:03:10', '2025-06-30 19:03:10'),
(6, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-07-01 13:50:55', '2025-07-01 13:50:55'),
(7, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', 'http://localhost/dentalappointment/admin/users', 1, '2025-07-01 14:26:41', '2025-07-01 14:26:41'),
(8, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-07-01 14:26:52', '2025-07-01 14:26:52'),
(9, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', 'http://localhost/dentalappointment/dashboard', 1, '2025-07-01 14:27:05', '2025-07-01 14:27:05'),
(10, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-07-01 14:27:15', '2025-07-01 14:27:15'),
(11, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', 'http://localhost/dentalappointment/admin/users/profile/users', 1, '2025-07-01 14:52:09', '2025-07-01 14:52:09'),
(12, 3, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-07-01 14:52:20', '2025-07-01 14:52:20'),
(13, 3, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', 'http://localhost/dentalappointment/dashboard', 1, '2025-07-01 14:52:33', '2025-07-01 14:52:33'),
(14, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-07-01 14:52:41', '2025-07-01 14:52:41'),
(15, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-07-08 13:46:19', '2025-07-08 13:46:19'),
(16, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-07-09 23:03:19', '2025-07-09 23:03:19'),
(17, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-07-12 13:49:01', '2025-07-12 13:49:01'),
(18, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', 'http://localhost/dentalappointment/admin/appointment/view/6', 1, '2025-07-12 15:29:21', '2025-07-12 15:29:21'),
(19, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'build 22631 (Windows 11)', '::1', 'LAPTOP-P0JU30VV', NULL, 1, '2025-07-12 15:29:33', '2025-07-12 15:29:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction` (`transaction`),
  ADD KEY `type` (`type`),
  ADD KEY `primary_key` (`primary_key`),
  ADD KEY `source` (`source`),
  ADD KEY `parent_source` (`parent_source`),
  ADD KEY `created` (`created`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dentist`
--
ALTER TABLE `dentist`
  ADD PRIMARY KEY (`dentist_id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lft` (`lft`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dentist`
--
ALTER TABLE `dentist`
  MODIFY `dentist_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
