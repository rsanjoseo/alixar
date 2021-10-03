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
 * This file performs the initial loading of data at installation.
 * It has been used for testing without having to reload the forms and delete the database each time.
 *
 * @deprecated It's not necessary in Alixar
 */

if (!defined('BASE_FOLDER')) {
    define('BASE_FOLDER', __DIR__);
}

// Define DOL_DOCUMENT_ROOT and ADODB_PATH used for install/upgrade process
if (!defined('DOL_DOCUMENT_ROOT')) {
    define('DOL_DOCUMENT_ROOT', BASE_FOLDER);
}

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
require_once 'load.php';
include_once DOL_DOCUMENT_ROOT . '/Modules/Install/inc.php';

include 'Modules/Install/Views/step2_load_data.php';