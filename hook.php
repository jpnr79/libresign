<?php
/*
 -------------------------------------------------------------------------
 LibreSign plugin for GLPI
 Copyright (C) 2021 by the LibreSign Development Team.

 https://github.com/pluginsGLPI/libresign
 -------------------------------------------------------------------------

 LICENSE

 This file is part of LibreSign.

 LibreSign is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 LibreSign is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with LibreSign. If not, see <http://www.gnu.org/licenses/>.
 --------------------------------------------------------------------------
 */

/**
 * Plugin install process
 *
 * @return boolean
 */
function plugin_libresign_install() {
   global $DB;
   include_once(GLPI_ROOT . '/inc/migration.class.php');
   $migration = new Migration(110000);

   $migration->executeMigration('empty-1.0.0.sql');
   $migration->executeMigration();
   return true;
}

/**
 * Plugin uninstall process
 *
 * @return boolean
 */
function plugin_libresign_uninstall() {
   global $DB;
   include_once(GLPI_ROOT . '/inc/migration.class.php');
   $migration = new Migration(110000);

   if ($DB->tableExists("glpi_plugin_libresign_files")) {
      $migration->dropTable('glpi_plugin_libresign_files');
   }
   if ($DB->tableExists('glpi_plugin_libresign_configs')) {
      $migration->dropTable('glpi_plugin_libresign_configs');
   }

   $migration->executeMigration();
   return true;
}
