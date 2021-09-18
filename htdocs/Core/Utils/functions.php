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

use Alxarafe\Core\Providers\Constants;
use Alxarafe\Core\Singletons\Config;

/**
 * Create a configuration file, from the Dolibarr configuration file
 *
 * @author  Rafael San José Tovar <info@rsanjoseo.com>
 * @version sept. 2021
 *
 * @return bool
 */
function createConfigFromDolibarr(): bool
{
    Constants::defineConstants();
    $config = Config::getInstance();

    $configDolibarrFile = constant('BASE_FOLDER') . '/conf/conf.php';
    if (!file_exists($configDolibarrFile)) {
        return false;
    }
    require_once $configDolibarrFile;

    $config->setVar('templaterender', 'main', 'skin', 'default');
    $config->setVar('database', 'main', 'dbEngineName', 'PdoMySql');

    $dolibarrDbVars = [
        'dbUser' => 'dolibarr_main_db_user',
        'dbPass' => 'dolibarr_main_db_pass',
        'dbName' => 'dolibarr_main_db_name',
        'dbHost' => 'dolibarr_main_db_host',
        'dbPort' => 'dolibarr_main_db_port',
        'dbPrefix' => 'dolibarr_main_db_prefix',
    ];

    foreach ($dolibarrDbVars as $name => $dolibarrVar) {
        if (!empty(${$dolibarrVar})) {
            $config->setVar('database', 'main', $name, ${$dolibarrVar});
        }
    }

    if (!$config->saveConfigFile()) {
        return false;
    }

    return Constants::loadConstants();
}
