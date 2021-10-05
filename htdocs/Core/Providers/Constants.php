<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2020 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Providers;

use Alxarafe\Core\Base\Provider;
use Alxarafe\Core\Helpers\Utils;
use Symfony\Component\Yaml\Yaml;

/**
 * Class RegionalInfo
 *
 * @package Alxarafe\Core\Providers
 */
class Constants extends Provider
{
    /**
     * Dolibar constants
     *
     * Most, if not all, of these constants are to be extinguished. Either they are useless, or their use by
     * double negation makes them confusing.
     */
    const CONSTANTS = [
        'NOREQUIREDB' => '1',                // Do not create database handler $db
        // 'NOREQUIREUSER' => '1',                // Do not load object $user
        'NOREQUIRESOC' => '1',                // Do not load object $mysoc
        'NOREQUIRETRAN' => '1',                // Do not load object $langs
        'NOSCANGETFORINJECTION' => '1',        // Do not check injection attack on GET parameters
        'NOSCANPOSTFORINJECTION' => '1',        // Do not check injection attack on POST parameters
        'NOCSRFCHECK' => '1',                // Do not check CSRF attack (test on referer + on token if option MAIN_SECURITY_CSRF_WITH_TOKEN is on).
        //        'NOTOKENRENEWAL' => '1',                // Do not roll the Anti CSRF token (used if MAIN_SECURITY_CSRF_WITH_TOKEN is on)
        'NOSTYLECHECK' => '1',                // Do not check style html tag into posted data
        'NOREQUIREMENU' => '1',                // If there is no need to load and show top and left menu
        'NOREQUIREHTML' => '1',                // If we don't need to load the html.form.class.php
        'NOREQUIREAJAX' => '1',            // Do not load ajax.lib.php library
        "NOLOGIN", '1',                    // If this page is public (can be called outside logged session). This include the NOIPCHECK too.
        'NOIPCHECK' => '1',                    // Do not check IP defined into conf $dolibarr_main_restrict_ip
        'MAIN_LANG_DEFAULT' => 'auto',                    // Force lang to a particular value
        'MAIN_AUTHENTICATION_MODE' => 'dolibarr',    // Force authentication handler
        'NOREDIRECTBYMAINTOLOGIN' => 0,        // The main.inc.php does not make a redirect if not logged, instead show simple error message
        'FORCECSP' => 'none',                // Disable all Content Security Policies
        'CSRFCHECK_WITH_TOKEN' => '1',        // Force use of CSRF protection with tokens even for GET
        'NOBROWSERNOTIF' => '1',                // Disable browser notification
        'DOL_APPLICATION_TITLE' => 'Dolibarr',    // Change to Alixar?
        'DOL_VERSION' => '15.0.0-alpha',            // Change to 0.0.0-beta?
        'EURO' => '€',                          // It's really necessary?
    ];

    /**
     * Configuration file name.
     *
     * @var string|null
     */
    public static ?string $configFilename;

    /**
     * Constants constructor
     */
    public function __construct()
    {
        parent::__construct();

        self::$configFilename = self::getConfigFileName();
    }

    /**
     * Returns the name of the configuration file. By default, create the config
     * folder and enter the config.yaml file inside it.
     * If you want to use another folder for the configuration, you will have to
     * define it in the constant CONFIGURATION_PATH before invoking this method,
     * this folder must exist.
     *
     * @return ?string
     */
    public static function getConfigFileName(): ?string
    {
        if (isset(self::$configFilename)) {
            return self::$configFilename;
        }
        $filename = constant('CONFIGURATION_PATH') . '/config.yaml';
        if (file_exists($filename) || is_dir(constant('CONFIGURATION_PATH')) || mkdir(constant('CONFIGURATION_PATH'), 0777, true)) {
            self::$configFilename = $filename;
        }
        return self::$configFilename;
    }

    /**
     * Define the constants of the application
     */
    public static function defineConstants()
    {
        define('APP_URI', pathinfo(filter_input(INPUT_SERVER, 'SCRIPT_NAME'), PATHINFO_DIRNAME));

        define('SERVER_NAME', filter_input(INPUT_SERVER, 'SERVER_NAME'));
        define('SERVER_PORT', filter_input(INPUT_SERVER, 'SERVER_PORT'));
        define('APP_PROTOCOL', filter_input(INPUT_SERVER, 'REQUEST_SCHEME'));
        define('SITE_URL', APP_PROTOCOL . '://' . SERVER_NAME);

        // TODO: Dolibarr constants to eliminate...
        $search = 'htdocs';
        $pos = strpos(constant('APP_URI'), $search) + strlen($search);
        $uri = substr(constant('APP_URI'), 0, $pos);
        define('DOL_URL_ROOT', $uri);
        define('VENDOR_URI', DOL_URL_ROOT . '/vendor/');
        define('BASE_URI', SITE_URL . DOL_URL_ROOT);
        // End TODO.

        // If does not exists the Dolibarr constants, may use define directly
        Utils::defineIfNotExists('BASE_URI', SITE_URL . APP_URI);
        Utils::defineIfNotExists('VENDOR_URI', BASE_URI . '/vendor/');

        define('CONFIGURATION_PATH', BASE_FOLDER . '/config');
        define('DEFAULT_STRING_LENGTH', 50);
        define('DEFAULT_INTEGER_SIZE', 10);
        /**
         * Must be defined in main index.php file
         * /
         * ClassUtils::defineIfNotExists('VENDOR_FOLDER', basePath('vendor'));
         * ClassUtils::defineIfNotExists('ALXARAFE_FOLDER', basePath('src' . DIRECTORY_SEPARATOR . 'Alxarafe' . DIRECTORY_SEPARATOR . 'Core'));
         * ClassUtils::defineIfNotExists('VENDOR_URI', baseUrl('vendor'));
         *
         * ClassUtils::defineIfNotExists('CONFIGURATION_PATH', basePath('config'));
         * ClassUtils::defineIfNotExists('DEFAULT_STRING_LENGTH', 50);
         * ClassUtils::defineIfNotExists('DEFAULT_INTEGER_SIZE', 10);
         *
         * ClassUtils::defineIfNotExists('CALL_CONTROLLER', 'call');
         * ClassUtils::defineIfNotExists('METHOD_CONTROLLER', 'method');
         * ClassUtils::defineIfNotExists('DEFAULT_CONTROLLER', ($this->fileExists($this->getFilePath()) ? 'EditConfig' : 'CreateConfig'));
         * ClassUtils::defineIfNotExists('DEFAULT_METHOD', 'index');
         *
         * // Use cache on Core
         * ClassUtils::defineIfNotExists('CORE_CACHE_ENABLED', false);
         *
         * // Default number of rows per page.
         * ClassUtils::defineIfNotExists('DEFAULT_ROWS_PER_PAGE', 25);
         *
         * // Carry Return (retorno de carro) & Line Feed (salto de línea).
         * ClassUtils::defineIfNotExists('CRLF', "\n\t");
         */
    }

    /**
     * Loads the constants defined in the config.yaml file
     *
     * @return bool
     */
    public static function loadConstants(): bool
    {
        self::$configFilename = self::getConfigFileName();
        if (self::$configFilename === null || !file_exists(self::$configFilename)) {
            return false;
        }
        $configFileContent = Yaml::parseFile(self::$configFilename);
        if (empty($configFileContent)) {
            return true;
        }

        if (isset($configFileContent['constants'])) {
            self::defineConstantsFromArray($configFileContent['constants']);
        }

        // Load Dolibarr constants
        foreach (self::CONSTANTS as $name => $value) {
            if (!defined($name)) {
                define($name, $value);
            }
        }
        return true;
    }

    public static function defineConstantsFromArray(array $constants)
    {
        foreach ($constants as $type => $data) {
            foreach ($data as $name => $value) {
                if (!defined($name)) {
                    switch (strtolower($type)) {
                        case 'boolean':
                            define($name, boolval($value));
                            break;
                        case 'integer':
                            define($name, intval($value));
                            break;
                        case 'float':
                        case 'real':
                        case 'numeric':
                            define($name, floatval($value));
                            break;
                        default:
                            define($name, $value);
                    }
                }
            }
        }
    }

    /**
     * Return default values
     *
     * @return array
     */
    public function getDefaultValues(): array
    {
        return [
        ];
    }
}