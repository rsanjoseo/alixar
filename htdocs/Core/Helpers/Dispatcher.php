<?php
/**
 * Copyright (C) 2021-2021  Rafael San José Tovar   <info@rsanjoseo.com>
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

namespace Alxarafe\Core\Helpers;

use Alxarafe\Core\Base\Globals;
use DebugBar\DebugBarException;
use Alxarafe\Core\Singletons\Config;

/**
 * Class Dispatcher
 *
 * The dispatcher class is in charge of directing the appropriate controller based on the GET variables
 *
 * @package Alxarafe\Modules\Main\Helpers
 */
class Dispatcher extends Globals
{
    /**
     * Dispatcher constructor.
     */
    public function __construct()
    {
        parent::__construct();

        // $this->config=Config::getInstance();
        $this->getConfiguration();
    }

    /**
     * Load the constants and the configuration file.
     * If the configuration file does not exist, it takes us to the form for its creation.
     *
     * @author  Rafael San José Tovar <info@rsanjoseo.com>
     * @version ago. 2021
     *
     */
    private function getConfiguration()
    {
        // Ésto se ha pasado al Config.
        // $this->defineConstants();

        // First set the display options to be able to show the possible warnings and errors.
        // $this->config->loadViewsConfig();

        // This block, copy the Dolibarr configuration to Alxarafe
        $configFile = $this->config->getConfigFileName();
        if (!file_exists($configFile)) {
            if (!$this->createConfigFromDolibarr()) {
                trigger_error('No Dolibarr configuration found!');
            }
        }
        // $this->config->loadConfig();
    }

    /**
     * Creates the Alxarafe configuration file with the existing data in the Dolibarr one.
     *
     * @author  Rafael San José Tovar <info@rsanjoseo.com>
     * @version ago. 2021
     *
     * @return bool
     */
    private function createConfigFromDolibarr(): bool
    {
        $configDolibarrFile = constant('BASE_FOLDER') . '/conf/conf.php';
        if (!file_exists($configDolibarrFile)) {
            return false;
        }
        require_once $configDolibarrFile;

        $config = Config::getInstance();

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

        return $config->saveConfigFile();
    }

    /**
     * Roll the ball!
     *
     * @author  Rafael San José Tovar <info@rsanjoseo.com>
     * @version ago. 2021
     *
     * @return bool
     * @throws DebugBarException
     */
    public function run(): bool
    {
        $module = ucfirst($_GET[self::MODULE_GET_VAR] ?? self::DEFAULT_MODULE_NAME);
        $controller = ucfirst($_GET[self::CONTROLLER_GET_VAR] ?? self::DEFAULT_CONTROLLER_NAME);
        $this->debug->addMessage('messages', "Dispatcher::process() trying for '$module':'$controller'");
        if ($this->processFolder($module, $controller)) {
            $this->debug->addMessage('messages', "Dispatcher::process(): Ok");
            return true;
        }
        return false;
    }

    /**
     * Try to locate the $call class in $path, and execute the $method.
     * Returns true if it locates the class and the method exists,
     * executing it.
     *
     * @author  Rafael San José Tovar <info@rsanjoseo.com>
     * @version ago. 2021
     *
     * @param string $module
     * @param string $controller
     * @param string $method
     *
     * @return bool
     * @throws DebugBarException
     */
    public function processFolder(string $module, string $controller, string $method = 'main'): bool
    {
        $className = 'Alxarafe\\Modules\\' . $module . '\\Controllers\\' . $controller;
        $filename = constant('BASE_FOLDER') . '/Modules/' . $module . '/Controllers/' . $controller . '.php';

        if (file_exists(constant('BASE_FOLDER') . '/installing.lock')) {
            redirectTo(constant('BASE_URI') . '/Modules/Install/Controllers/Dol_Init.php');
            die();
        }

        $nexo = '?';
        $oldFilename = constant('BASE_FOLDER') . '/Modules/' . $module . '/Controllers/Dol_' . ucfirst($controller) . '.php';
        if (file_exists($oldFilename)) {
            $oldUrl = constant('BASE_URI') . '/Modules/' . $module . '/Controllers/Dol_' . $controller . '.php';
            foreach ($_GET as $get => $value) {
                $oldUrl .= $nexo . $get . '=' . $value;
                $nexo = '&';
            }
            redirectTo($oldUrl);
            die();
        }

        if (file_exists($filename)) {
            $this->debug->addMessage('messages', "$className exists!");
            $controller = new $className();
            $controller->{$method}();
            return true;
        }
        return false;
    }
}
