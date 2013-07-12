-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: 127.6.91.130:3306
-- Generation Time: Jul 12, 2013 at 02:53 PM
-- Server version: 5.1.69
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `crmevolvinxdemo`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `employees` int(11) DEFAULT NULL,
  `annual_revenue` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `b_street` varchar(255) DEFAULT NULL,
  `b_city` varchar(255) DEFAULT NULL,
  `b_state` varchar(255) DEFAULT NULL,
  `b_zip` varchar(255) DEFAULT NULL,
  `b_country` varchar(255) DEFAULT NULL,
  `s_street` varchar(255) DEFAULT NULL,
  `s_city` varchar(255) DEFAULT NULL,
  `s_state` varchar(255) DEFAULT NULL,
  `s_zip` varchar(255) DEFAULT NULL,
  `s_country` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `owner` int(11) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unique_id` (`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `m_street` varchar(255) DEFAULT NULL,
  `m_city` varchar(255) DEFAULT NULL,
  `m_state` varchar(255) DEFAULT NULL,
  `m_zip` varchar(255) DEFAULT NULL,
  `m_country` varchar(255) DEFAULT NULL,
  `o_street` varchar(255) DEFAULT NULL,
  `o_city` varchar(255) DEFAULT NULL,
  `o_state` varchar(255) DEFAULT NULL,
  `o_zip` varchar(255) DEFAULT NULL,
  `o_country` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `owner` int(11) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unique_id` (`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE IF NOT EXISTS `leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `company` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `ratting` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `annual_revenue` double DEFAULT NULL,
  `employee_no` int(32) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `unique_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unique_id` (`unique_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `firstname`, `lastname`, `title`, `company`, `status`, `phone`, `email`, `ratting`, `website`, `street`, `city`, `state`, `zip`, `country`, `annual_revenue`, `employee_no`, `lead_source`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `owner`, `unique_id`) VALUES
(2, '', 'lead2', 'Mr.', 'lead2', 'Qualified', '', 'lead2@gmail.com', '', NULL, '', '', '', '', NULL, NULL, NULL, '', '', '2013-07-10 08:43:32', '2013-07-10 02:47:13', NULL, NULL, 1, '9a63ae28aa93ecd0720f0ac70c736504'),
(3, 'John', 'Michale', 'Mr.', 'Ericssion', 'Open', '+198736485', 'john.michale@ericssion.com', 'Warm', NULL, '', 'Brooklyn', 'NY', '11211', NULL, 3, 20, '', '', '2013-07-11 19:37:17', '2013-07-11 23:37:17', NULL, NULL, 3, 'dd12743de2881f8317732cbf9f339a85');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `unique_id` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_email` (`email`),
  UNIQUE KEY `index_members_on_reset_password_token` (`reset_password_token`),
  KEY `unique_id` (`unique_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`, `username`, `unique_id`, `role_id`) VALUES
(1, 'admin@evolvinx.com', '$2a$10$85zbJI.BTR/LErll52rRgePRLKRmtT/RfC811m.ICo2DLpgHFc.oS', NULL, NULL, '2013-07-12 02:07:51', 23, '2013-07-12 14:49:23', '2013-07-12 02:07:51', '203.188.173.175', '64.134.216.9', '2013-07-08 08:05:33', '2013-07-12 14:49:23', 'admin', 'asdgsfdhfjg', 1),
(2, 'recruiter@evolvinx.com', '$2a$10$YYPxH6Gjsik3qjeto.1V4OuMAQAJnRfQn/AhRX27DsAVxnrTWuObq', NULL, NULL, NULL, 2, '2013-07-09 14:27:26', '2013-07-09 13:29:28', '117.18.231.40', '127.0.0.1', '2013-07-08 08:05:33', '2013-07-09 14:27:48', 'recruiter', 'asdgvsfdb', 2),
(3, 'sales@evolvinx.com', '$2a$10$hhC0/e0PWpJoL8mxlfpsweExgtrJZNP1MrrhzM7re5CqNjcWZJQjm', NULL, NULL, '2013-07-12 02:04:49', 8, '2013-07-12 14:01:50', '2013-07-12 02:04:49', '74.64.94.200', '74.64.94.200', '2013-07-08 08:05:33', '2013-07-12 14:01:50', 'sales', 'asdgsfdgbd', 3),
(4, 'marketing@evolvinx.com', '$2a$10$LwkbadgytdNWnYAlvbhpreKxlDOZAWqNUfaz65z9wdnhy6xBk5zGu', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2013-07-11 19:34:50', '2013-07-11 19:34:50', 'marketing', '3f395144c6d6a550e1ebdce7417178d1', 4);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `list_position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `enabled`, `list_position`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, 1, '2013-06-18 12:03:03', '2013-06-18 12:03:03'),
(2, 'Recruiter', 1, 2, '2013-06-18 12:03:03', '2013-06-18 12:03:03'),
(3, 'Sales', 1, 3, '2013-06-18 12:03:03', '2013-06-18 12:03:03'),
(4, 'Marketing', 1, 0, '2013-07-11 19:34:01', '2013-07-11 19:34:01');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20111227161232'),
('20111227162649'),
('20111227164228'),
('20111228052051');
