<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Dolibarr\Base;

use Alxarafe\Core\Providers\Translator;
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Core\Singletons\DebugTool;
use Alxarafe\Core\Utils\ClassUtils;
use Alxarafe\Database\Engine;
use Alxarafe\Dolibarr\Classes\Conf;
use Alxarafe\Dolibarr\Classes\HookManager;
use Alxarafe\Dolibarr\Classes\MenuManager;
use Alxarafe\Dolibarr\Classes\Societe;
use Alxarafe\Dolibarr\Classes\User;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Exception;

/**
 * Class DolibarrGlobals
 *
 * This file replaces master.inc.php
 *
 * The file master.inc.php init the 5 global objects, this include will make the 'new Xxx()' and
 * set properties for: $conf, $db, $langs, $user, $mysoc
 *
 * This class statically instantiates other classes that must be used from different places.
 *
 * @package Alxarafe\Dolibarr\Libraries
 */
class DolibarrGlobals
{
    static public Engine $db;
    static public Translator $langs;
    static public Conf $conf;
    static public $user;
    static public $hookmanager;
    static public $mysoc;
    static public $menumanager;

    public function __construct()
    {
        $shortName = ClassUtils::getShortName($this, static::class);
        $debugTool = DebugTool::getInstance();
        $debugTool->startTimer($shortName, $shortName . ' Constructor');

        self::$db = self::getDb();
        self::$langs = self::getLangs();
        self::$conf = self::getConf();
        self::$user = self::getUser();
        self::$hookmanager = self::getHookManager();
        self::$mysoc = self::getMySoc();
        self::$menumanager = self::getMenuManager();

        $debugTool->stopTimer($shortName, $shortName . ' Constructor');
    }

    /**
     * Returns the database engine instance
     *
     * @return Engine
     */
    static public function getDb(): Engine
    {
        if (isset(self::$db)) {
            return self::$db;
        }

        self::$db = Config::getInstance()->getEngine();
        return self::$db;
    }

    /**
     * Returns the translator instance
     *
     * @return Translator
     */
    static public function getLangs(): Translator
    {
        if (isset(self::$langs)) {
            return self::$langs;
        }

        self::$langs = Translator::getInstance();
        return self::$langs;
    }

    /**
     * Returns the configuration instance
     *
     * @return Conf
     * @throws Exception
     */
    static public function getConf(): Conf
    {
        if (isset(self::$conf)) {
            return self::$conf;
        }

        /**
         * This should be the only point where the configuration file is read.
         * Temporarily, it will also be done to generate the config.yaml in the first installation,
         * although the idea would be in the near future to eliminate conf.php and leave only the
         * yaml.
         */
        define('DOLIBARR_CONFIG_FILENAME', 'conf2.php');
        $confFile = constant('BASE_FOLDER') . '/conf/' . DOLIBARR_CONFIG_FILENAME;
        $result = require_once $confFile;
        if (!$result) {
            die($confFile . ' not found!');
        }

        /**
         * Create self::$conf object
         */
        self::$conf = new Conf();

        // Set properties specific to conf file
        self::$conf->file->main_limit_users = $dolibarr_main_limit_users ?? 0;
        self::$conf->file->mailing_limit_sendbyweb = $dolibarr_mailing_limit_sendbyweb ?? 0;
        self::$conf->file->mailing_limit_sendbycli = $dolibarr_mailing_limit_sendbycli ?? 0;
        self::$conf->file->main_authentication = $dolibarr_main_authentication ?? 'dolibarr'; // Identification mode
        self::$conf->file->main_force_https = $dolibarr_main_force_https ?? true; // Force https
        self::$conf->file->strict_mode = $dolibarr_strict_mode ?? ''; // Force php strict mode (for debug)
        self::$conf->file->instance_unique_id = $dolibarr_main_instance_unique_id ?? $dolibarr_main_cookie_cryptkey ?? ''; // Unique id of instance
        self::$conf->file->dol_document_root = $dolibarr_main_document_root ?? constant('BASE_FOLDER'); // Define array of document root directories ('/home/htdocs')
        self::$conf->file->dol_url_root = $dolibarr_main_url_root ?? constant('BASE_URI'); // Define array of url root path ('' or '/dolibarr')
        self::$conf->file->main_prod = !empty($dolibarr_main_prod);

        define('DOL_DATA_ROOT', (isset($dolibarr_main_data_root) ? $dolibarr_main_data_root : DOL_DOCUMENT_ROOT . '/../documents'));
        define('DOL_MAIN_URL_ROOT', (isset($dolibarr_main_url_root) ? $dolibarr_main_url_root : '')); // URL relative root
        define('DOL_DOCUMENT_ROOT', constant('BASE_FOLDER'));

        if (!empty($vars['dolibarr_main_document_root_alt'])) {
            // dolibarr_main_document_root_alt can contains several directories
            $values = preg_split('/[;,]/', $vars['dolibarr_main_document_root_alt']);
            $i = 0;
            foreach ($values as $value) {
                self::$conf->file->dol_document_root['alt' . ($i++)] = (string) $value;
            }
            $values = preg_split('/[;,]/', $vars['dolibarr_main_url_root_alt']);
            $i = 0;
            foreach ($values as $value) {
                if (preg_match('/^http(s)?:/', $value)) {
                    // Show error message
                    $correct_value = str_replace($vars['dolibarr_main_url_root'], '', $value);
                    print '<b>Error:</b><br>' . "\n";
                    print 'Wrong <b>' . $vars['dolibarr_main_url_root_alt'] . '</b> value in <b>conf.php</b> file.<br>' . "\n";
                    print 'We now use a relative path to ' . $vars['dolibarr_main_url_root'] . ' to build alternate URLs.<br>' . "\n";
                    print 'Value found: ' . $value . '<br>' . "\n";
                    print 'Should be replaced by: ' . $correct_value . '<br>' . "\n";
                    print "Or something like following examples:<br>\n";
                    print "\"/extensions\"<br>\n";
                    print "\"/extensions1,/extensions2,...\"<br>\n";
                    print "\"/../extensions\"<br>\n";
                    print "\"/custom\"<br>\n";
                    exit;
                }
                self::$conf->file->dol_url_root['alt' . ($i++)] = (string) $value;
            }
        }

        // Chargement des includes principaux de librairies communes
        if (!defined('NOREQUIREUSER')) {
            //            require_once DOL_DOCUMENT_ROOT . '/Modules/Users/class/user.class.php'; // Need 500ko memory
        }
        if (!defined('NOREQUIRETRAN')) {
            //            require_once DOL_DOCUMENT_ROOT . '/core/class/translate.class.php';
        }
        if (!defined('NOREQUIRESOC')) {
            //            require_once DOL_DOCUMENT_ROOT . '/Modules/Societes/class/societe.class.php';
        }

        /*
         * Creation objet $langs (must be before all other code)
         */
        if (!defined('NOREQUIRETRAN')) {
            $langs = new Translate('', self::$conf); // Must be after reading conf
        }

        /*
         * Object $db
         */
        /*
        $db = null;
        if (!defined('NOREQUIREDB')) {
            $db = getDoliDBInstance(self::$conf->db->type, self::$conf->db->host, self::$conf->db->user, self::$conf->db->pass, self::$conf->db->name, self::$conf->db->port);

            if ($db->error) {
                // If we were into a website context
                if (!defined('USEDOLIBARREDITOR') && !defined('USEDOLIBARRSERVER') && !empty($_SERVER['SCRIPT_FILENAME']) && (strpos($_SERVER['SCRIPT_FILENAME'], DOL_DATA_ROOT.'/website') === 0)) {
                    $sapi_type = php_sapi_name();
                    if (substr($sapi_type, 0, 3) != 'cgi') {
                        http_response_code(503); // To tel search engine this is a temporary error
                    }
                    print '<div class="center" style="text-align: center; margin: 100px;">';
                    if (is_object($langs)) {
                        $langs->setDefaultLang('auto');
                        $langs->load("website");
                        print $langs->trans("SorryWebsiteIsCurrentlyOffLine");
                    } else {
                        print "SorryWebsiteIsCurrentlyOffLine";
                    }
                    print '</div>';
                    exit;
                }
                dol_print_error($db, "host=".self::$conf->db->host.", port=".self::$conf->db->port.", user=".self::$conf->db->user.", databasename=".self::$conf->db->name.", ".$db->error);
                exit;
            }
        }
        */

        // Now database connexion is known, so we can forget password
        //unset($vars['dolibarr']_main_db_pass); 	// We comment this because this constant is used in a lot of pages
        // unset(self::$conf->db->pass); // This is to avoid password to be shown in memory/swap dump

        /*
         * Load object self::$conf
         * After this, all parameters conf->global->CONSTANTS are loaded
         */

        // By default conf->entity is 1, but we change this if we ask another value.
        if (session_id() && !empty($_SESSION["dol_entity"])) {
            // Entity inside an opened session
            self::$conf->entity = $_SESSION["dol_entity"];
        } elseif (!empty($_ENV["dol_entity"])) {
            // Entity inside a CLI script
            self::$conf->entity = $_ENV["dol_entity"];
        } elseif (DolibarrFunctions::GETPOSTISSET("loginfunction") && DolibarrFunctions::GETPOST("entity", 'int')) {
            // Just after a login page
            self::$conf->entity = DolibarrFunctions::GETPOST("entity", 'int');
        } elseif (defined('DOLENTITY') && is_numeric(constant('DOLENTITY'))) {
            // For public page with MultiCompany module
            self::$conf->entity = constant('DOLENTITY');
        }

        // Sanitize entity
        if (!is_numeric(self::$conf->entity)) {
            self::$conf->entity = 1;
        }

        //print "We work with data into entity instance number '".self::$conf->entity."'";

        // Here we read database (llx_const table) and define self::$conf->global->XXX var.
        self::$conf->setValues();

        if (!defined('MAIN_LABEL_MENTION_NPR')) {
            define('MAIN_LABEL_MENTION_NPR', 'NPR');
        }
        //if (! defined('PCLZIP_TEMPORARY_DIR')) define('PCLZIP_TEMPORARY_DIR', self::$conf->user->dir_temp);

        return self::$conf;
    }

    static function getUser(): ?User
    {
        if (isset(self::$user)) {
            return self::$user;
        }

        if (defined('NOREQUIREUSER')) {
            return null;
        }

        return new User();
    }

    static function getHookManager()
    {
        if (isset(self::$hookmanager)) {
            return self::$hookmanager;
        }

        // Create the global $hookmanager object
        // include_once DOL_DOCUMENT_ROOT . '/core/class/hookmanager.class.php';
        self::$hookmanager = new HookManager();
        return self::$hookmanager;
    }

    static function getMySoc(): ?Societe
    {
        if (isset(self::$mysoc)) {
            return self::$mysoc;
        }
        $requiredb = !defined('NOREQUIREDB') || !constant('NOREQUIREDB');
        $requiresoc = !defined('NOREQUIRESOC') || !constant('NOREQUIRESOC');
        if (!$requiredb || !$requiresoc) {
            return null;
        }

        self::$mysoc = new Societe();
        self::$mysoc->setMysoc(self::$conf);

        // For some countries, we need to invert our address with customer address
        if (self::$mysoc->country_code == 'DE' && !isset($conf->global->MAIN_INVERT_SENDER_RECIPIENT)) {
            self::$conf->global->MAIN_INVERT_SENDER_RECIPIENT = 1;
        }

        return self::$mysoc;
    }

    static function getMenuManager()
    {
        if (isset(self::$menumanager)) {
            return self::$menumanager;
        }

        self::$menumanager = new MenuManager(empty(self::$user->socid) ? 0 : 1);
        return self::$menumanager;
    }

    static function getLang()
    {
        $conf = new Conf();

        $langs = null;
        // Set default language (must be after the setValues setting global $conf->global->MAIN_LANG_DEFAULT. Page main.inc.php will overwrite langs->defaultlang with user value later)
        if (!defined('NOREQUIRETRAN')) {
            $langcode = (DolibarrFunctions::GETPOST('lang', 'aZ09') ? DolibarrFunctions::GETPOST('lang', 'aZ09', 1) : (empty($conf->global->MAIN_LANG_DEFAULT) ? 'auto' : $conf->global->MAIN_LANG_DEFAULT));
            if (defined('MAIN_LANG_DEFAULT')) {    // So a page can force the language whatever is setup and parameters in URL
                $langcode = constant('MAIN_LANG_DEFAULT');
            }
            $langs->setDefaultLang($langcode);
        }

        return $langs;
    }

}
