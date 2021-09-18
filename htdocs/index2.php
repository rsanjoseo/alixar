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
 * Base folder for the application (htdocs folder of Alixar/Dolibarr)
 */
const BASE_FOLDER = __DIR__;

/**
 * Folder containing the configuration file
 */
//const CONFIGURATION_PATH = BASE_FOLDER . '/config';

/**
 * GET variable used to indicate the name of the module in which to look for the controller
 */
const MODULE_GET_VAR = 'module';

/**
 * GET variable used to indicate the name of the controller to use
 */
const CONTROLLER_GET_VAR = 'controller';

/**
 * GET variable that contains the name of the module to use, if none is specified
 */
const DEFAULT_MODULE_NAME = 'main';

/**
 * GET variable that contains the name of the controller to use, if none is specified
 */
const DEFAULT_CONTROLLER_NAME = 'init';

$autoload_file = constant('BASE_FOLDER') . '/vendor/autoload.php';
if (!file_exists($autoload_file)) {
    die('<h1>COMPOSER ERROR</h1><p>You need to run: "composer install"</p>');
}

require_once $autoload_file;

if (!file_exists(constant('BASE_FOLDER') . '/config/config.yaml')) {
    if (!file_exists(constant('BASE_FOLDER') . '/conf/conf.php')) {
        // TODO: The "config" controller should by loaded here
        die('Redirect to Config');
    }
    if (!createConfigFromDolibarr()) {
        // TODO: The "Error creating config from Dolibarr" controller should by loaded here
        die('Error creating config from Dolibarr installation');
    }
}

$module = ucfirst($_GET[MODULE_GET_VAR] ?? DEFAULT_MODULE_NAME);
$controller = ucfirst($_GET[CONTROLLER_GET_VAR] ?? DEFAULT_CONTROLLER_NAME);
$method = 'main';

$className = 'Alxarafe\\Modules\\' . $module . '\\Controllers\\' . $controller;
$filename = constant('BASE_FOLDER') . '/Modules/' . $module . '/Controllers/' . $controller . '.php';
if (!file_exists($filename)) {
    // TODO: The "page not found" controller should be loaded here
    die($filename . ' does not exists!');
}
$controller = new $className();
$controller->{$method}();
