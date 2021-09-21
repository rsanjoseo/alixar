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

const BASE_FOLDER = __DIR__;

use Alxarafe\Core\Controllers\EditConfig;
use Alxarafe\Core\Controllers\Install;
use Alxarafe\Core\Providers\Constants;
use Alxarafe\Core\Providers\RegionalInfo;
use Alxarafe\Core\Providers\Translator;
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Core\Singletons\DebugTool;
use Alxarafe\Core\Singletons\FlashMessages;
use Alxarafe\Core\Singletons\Logger;
use Alxarafe\Core\Singletons\Session;
use Alxarafe\Core\Singletons\TemplateRender;

require_once 'vendor/autoload.php';

// Load constants and configuration file, if they are not already loaded.
if (!defined('APP_URI')) {
    Constants::defineConstants();
    $hasConfig = Constants::loadConstants();
    if (!$hasConfig) {
        if ($_GET['module'] === 'install') {
            $install = new Install();
            $install->main();
            die();
        }
        $data = new EditConfig();
        $data->main();
        die();
    }
}

// Instance in correct order all singletons and providers
$alxDebug = DebugTool::getInstance();
$flashMessages = FlashMessages::getInstance();
$regional = RegionalInfo::getInstance();
$logger = Logger::getInstance();
$alxConfig = Config::getInstance();
$render = TemplateRender::getInstance();
$session = Session::getInstance();
$translator = Translator::getInstance();
