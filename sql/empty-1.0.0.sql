-- SQL migration for libresign plugin (GLPI 11+)

CREATE TABLE IF NOT EXISTS `glpi_plugin_libresign_files` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `response_date` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `file_uuid` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `glpi_plugin_libresign_configs` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nextcloud_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `default_display_name` varchar(255) DEFAULT NULL,
  `default_filename` varchar(255) DEFAULT NULL,
  `default_request_comment` text DEFAULT NULL,
  `default_accept_comment` text DEFAULT NULL,
  `system_user_id` int(11) NOT NULL DEFAULT 0,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `glpi_plugin_libresign_configs` (`id`, `nextcloud_url`, `username`, `password`, `default_display_name`, `default_filename`, `default_request_comment`, `default_accept_comment`, `system_user_id`, `date_mod`) VALUES
(1, '$DOMAIN/apps/libresign/api/0.1/sign/register', NULL, NULL, 'firstname', 'Accept', 'Validate GLPI Ticket', 'Digitally signed on LibreSign', 0, NULL)
ON DUPLICATE KEY UPDATE id=id;