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

namespace Alxarafe\Core\Singletons;

use Alxarafe\Core\Base\Singleton;
use Symfony\Component\Yaml\Yaml;

/**
 * All variables and global functions are centralized through the static class Config.
 * The Config class can be instantiated and passed to the class that needs it,
 * sharing the data and methods that are in them.
 *
 * @package Alxarafe\Helpers
 */
class Config extends Singleton
{
    /**
     * Contains the full name of the configuration file or null
     *
     * @var string::null
     */
    private static string $configFilename;

    /**
     * Contains an array with the variables defined in the configuration file.
     * Use setVar to assign or getVar to access the variables of the array.
     *
     * @var array
     */
    private static array $global;

    /**
     * Contains the instance to the database engine (or null)
     *
     * @var Engine
     */
    public Engine $dbEngine;

    /**
     * Contains the instance to the specific SQL engine helper (or null)
     *
     * @var sqlHelper
     */
    private SqlHelper $sqlHelper;

    /**
     * It is a static instance of the Auth class that contains the data of the
     * currently identified user.
     *
     * @var Auth
     */
    private Auth $user;

    /**
     * Contains the user's name or null
     *
     * @var string|null
     */
    private ?string $username;

    private TemplateRender $render;
    private DebugTool $debug;

    public function __construct(string $index = 'main')
    {
        parent::__construct($index);
        $this->username = null;
        //        $this->render = TemplateRender::getInstance();
        //        $this->debug = DebugTool::getInstance();
    }

    /**
     * Initializes the global variable with the configuration, connects with
     * the database and authenticates the user.
     *
     * @return bool
     * @throws DebugBarException
     */
    public function loadConfig(): bool
    {
        if (!isset(self::$global)) {
            self::$global = self::loadConfigurationFile();
        }

        if (isset(self::$global['templaterender']['main']['skin'])) {
            $templatesFolder = BASE_FOLDER . TemplateRender::SKINS_FOLDER;
            $skinFolder = $templatesFolder . '/' . self::$global['templaterender']['main']['skin'];
            if (is_dir($templatesFolder) && !is_dir($skinFolder)) {
                FlashMessages::setError("Skin folder '$skinFolder' does not exists!");
                return false;
            }
            $this->render->setSkin(self::getVar('templaterender', 'main', 'skin'));
        }
        return true;
    }

    /**
     * Returns an array with the configuration defined in the configuration file.
     * If the configuration file does not exist, take us to the application
     * configuration form to create it
     *
     * @return array
     */
    public static function loadConfigurationFile(): array
    {
        $filename = self::getConfigFileName();
        if (isset($filename) && file_exists($filename)) {
            $yaml = file_get_contents($filename);
            if ($yaml) {
                return YAML::parse($yaml);
            }
        }
        return [];
    }

    /**
     * Returns the name of the configuration file. By default, create the config
     * folder and enter the config.yaml file inside it.
     * If you want to use another folder for the configuration, you will have to
     * define it in the constant CONFIGURATION_PATH before invoking this method,
     * this folder must exist.
     *
     * @return string|null
     */
    public static function getConfigFileName(): ?string
    {
        if (isset(self::$configFilename)) {
            return self::$configFilename;
        }
        $filename = constant('CONFIGURATION_PATH') . '/config.yaml';
        if (file_exists($filename) || is_dir(CONFIGURATION_PATH) || mkdir(CONFIGURATION_PATH, 0777, true)) {
            self::$configFilename = $filename;
        }
        return self::$configFilename;
    }

    /**
     * Gets the contents of a variable. If the variable does not exist, return null.
     *
     * @param string $module
     * @param string $section
     * @param string $name
     *
     * @return string|null ?string
     */
    static public function getVar(string $module, string $section, string $name): ?string
    {
        return self::$global[$module][$section][$name] ?? null;
    }

    /**
     * @throws DebugBarException
     */
    public function connectToDatabaseAndAuth(): bool
    {
        if (!$this->connectToDataBase()) {
            FlashMessages::setError('Database Connection error...');
            return false;
        }
        if (!isset($this->user)) {
            $this->user = new Auth();
            $this->username = $this->user->getUser();
            if ($this->username === null) {
                $this->user->login();
            }
        }
        return true;
    }

    /**
     * If $this->dbEngine contain null, create an Engine instance with the
     * database connection and assigns it to $this->dbEngine.
     *
     * @param string $db
     *
     * @return bool
     * @throws DebugBarException
     */
    public function connectToDatabase($db = 'main'): bool
    {
        if (isset($this->dbEngine)) {
            return true;
        }

        $dbEngineName = self::$global['database'][$db]['dbEngineName'] ?? 'PdoMySql';
        $helperName = 'Sql' . substr($dbEngineName, 3);

        $this->debug->addMessage('SQL', "Using '$dbEngineName' engine.");
        $this->debug->addMessage('SQL', "Using '$helperName' SQL helper engine.");

        $sqlEngine = '\\Alxarafe\\Database\\SqlHelpers\\' . $helperName;
        $engine = '\\Alxarafe\\Database\\Engines\\' . $dbEngineName;
        try {
            $this->sqlHelper = new $sqlEngine();
            $this->dbEngine = new $engine([
                'dbUser' => self::$global['database'][$db]['dbUser'],
                'dbPass' => self::$global['database'][$db]['dbPass'],
                'dbName' => self::$global['database'][$db]['dbName'],
                'dbHost' => self::$global['database'][$db]['dbHost'],
                'dbPort' => self::$global['database'][$db]['dbPort'],
            ]);
            return isset($this->dbEngine) && $this->dbEngine->connect() && $this->dbEngine->checkConnection();
        } catch (Exception $e) {
            $this->debug->addException($e);
        }
        return false;
    }

    public function getEngine(): Engine
    {
        return $this->dbEngine;
    }

    public function getSqlHelper(): SqlHelper
    {
        return $this->sqlHelper;
    }

    /**
     * Return true y the config file exists
     *
     * @return bool
     */
    public function configFileExists(): bool
    {
        return (file_exists(self::getConfigFileName()));
    }

    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Set the display settings.
     *
     * @return void
     */
    public function loadViewsConfig()
    {
        dump(debug_backtrace());
        die('loadViewsConfig');
        $this->render->setSkin(self::getVar('templaterender', 'main', 'skin') ?? 'default');
        $this->render->setTemplate(self::getVar('templaterender', 'main', 'skin') ?? 'default');
    }

    /**
     * Stores all the variables in a permanent file so that they can be loaded
     * later with loadConfigFile()
     * Returns true if there is no error when saving the file.
     *
     * @return bool
     */
    public function saveConfigFile(): bool
    {
        $configFile = self::getConfigFileName();
        if (!isset($configFile)) {
            return false;
        }
        return file_put_contents($configFile, YAML::dump(self::$global, 3)) !== false;
    }

    /**
     * Stores a variable.
     *
     * @param string $module
     * @param string $section
     * @param string $name
     * @param string $value
     */
    public function setVar(string $module, string $section, string $name, string $value)
    {
        self::$global[$module][$section][$name] = $value;
    }
}
