<?php
/**
 * Copyright (C)      2021  Rafael San José Tovar   <info@rsanjoseo.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

/**
 * This file loads all the global variables necessary for the operation of Dolibarr.
 *
 * In Alixar it would not be necessary, since they would be attributes of the Globals abstract class
 * from which the rest of the classes descend.
 *
 * @deprecated It's not necessary in Alixar
 */

if (!defined('BASE_FOLDER')) {
    define('BASE_FOLDER', __DIR__);
}

use Alxarafe\Core\Providers\Constants;
use Alxarafe\Core\Providers\RegionalInfo;
use Alxarafe\Core\Providers\Translator;
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Core\Singletons\DebugTool;
use Alxarafe\Core\Singletons\FlashMessages;
use Alxarafe\Core\Singletons\Logger;
use Alxarafe\Core\Singletons\Session;
use Alxarafe\Core\Singletons\TemplateRender;

/**
 * Checks if it is possible to connect to the database, according to the Alixar configuration.
 *
 * @return bool
 */
function testAlixarConnection(): bool
{
    $config = Config::getInstance();
    return $config->loadConfig() && $config->connectToDatabase();
}

/**
 * Create the Alixar config file, necessary to be able to connect to the database.
 * Returns true if it is possible to connect to the database.
 */
function createAlixarConfig($dbType, $dbHost, $dbUser, $dbPass, $dbPort, $dbName = 'dolibarr_test', $dbPrefix = 'llx_', $lang = 'es')
{
    $config = Config::getInstance();

    $config->setVar('templaterender', 'main', 'skin', 'default');
    $config->setVar('database', 'main', 'dbEngineName', $dbType);

    $dolibarrDbVars = [
        'dbUser' => $dbUser,
        'dbPass' => $dbPass,
        'dbName' => $dbName,
        'dbHost' => $dbHost,
        'dbPort' => $dbPort,
        'dbPrefix' => $dbPrefix,
    ];

    foreach ($dolibarrDbVars as $name => $dolibarrVar) {
        $config->setVar('database', 'main', $name, $dolibarrVar);
    }

    $config->setVar('translator', 'main', 'language', $lang);

    $ok = $config->saveConfigFile();

    if (!$ok) {
        return false;
    }

    return testAlixarConnection();
}

function getConnetion($dbType, $dbHost, $dbUser, $dbPass, $dbPort, $dbName = 'dolibarr_test', $dbPrefix = 'llx_', $lang = 'es')
{
    if (!createAlixarConfig($dbType, $dbHost, $dbUser, $dbPass, $dbPort, $dbName, $dbPrefix, $lang)) {
        return null;
    }

    $alxConfig = Config::getInstance();
    $alxConfig->loadConfig();
    $result = $alxConfig->connectToDatabase();
    if (!$result) {
        dump($alxConfig);
        die('Database not found in load_install');
    }
    return $alxConfig->getEngine();
}

/**
 * Create Alixar config from Dolibarr config.
 *
 * @return bool
 */
function createAlixarConfigFromDolibarrConfig(): bool
{
    $configDolibarrFile = constant('BASE_FOLDER') . '/conf/conf.php';
    if (!file_exists($configDolibarrFile)) {
        return false;
    }
    require_once $configDolibarrFile;

    return createAlixarConfig(
        $dolibarr_main_db_type,
        $dolibarr_main_db_host,
        $dolibarr_main_db_user,
        $dolibarr_main_db_pass,
        $dolibarr_main_db_port,
        $dolibarr_main_db_name,
        $dolibarr_main_db_prefix
    );
}

require_once 'vendor/autoload.php';

// Load constants and configuration file, if they are not already loaded.
if (!defined('APP_URI')) {
    Constants::defineConstants();
}

// Instance in correct order all singletons and providers
$alxDebug = DebugTool::getInstance();
$flashMessages = FlashMessages::getInstance();
$regional = RegionalInfo::getInstance();
$logger = Logger::getInstance();
$alxConfig = Config::getInstance();
$render = TemplateRender::getInstance();
$session = Session::getInstance();
$langs = Translator::getInstance();
$debugbar = $alxDebug;
