<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 *
 * Copyright (C) 2002-2007  Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2003       Xavier Dutoit           <doli@sydesy.com>
 * Copyright (C) 2004-2021  Laurent Destailleur     <eldy@users.sourceforge.net>
 * Copyright (C) 2004       Sebastien Di Cintio     <sdicintio@ressource-toi.org>
 * Copyright (C) 2004       Benoit Mortier          <benoit.mortier@opensides.be>
 * Copyright (C) 2005-2021  Regis Houssin           <regis.houssin@inodbox.com>
 * Copyright (C) 2011-2014  Philippe Grand          <philippe.grand@atoo-net.com>
 * Copyright (C) 2008       Matteli
 * Copyright (C) 2011-2016  Juanjo Menent           <jmenent@2byte.es>
 * Copyright (C) 2012       Christophe Battarel     <christophe.battarel@altairis.fr>
 * Copyright (C) 2014-2015  Marcos García           <marcosgdf@gmail.com>
 * Copyright (C) 2015       Raphaël Doursenaud      <rdoursenaud@gpcsolutions.fr>
 * Copyright (C) 2020       Demarest Maxime         <maxime@indelog.fr>
 * Copyright (C) 2020       Charlene Benke          <charlie@patas-monkey.com>
 * Copyright (C) 2021       Frédéric France         <frederic.france@netlogic.fr>
 * Copyright (C) 2021       Alexandre Spangaro      <aspangaro@open-dsi.fr>
 *
 * Adaptation as a class by...
 * Copyright (C) 2021       Rafael San José Tovar   <info@rsanjoseo.com>
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

namespace Alxarafe\Dolibarr\Base;

use Alxarafe\Core\Base\BasicController;
use Alxarafe\Core\Base\View;
use Alxarafe\Core\Providers\Translator;
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Core\Singletons\DebugTool;
use Alxarafe\Dolibarr\Classes\Conf;
use Alxarafe\Dolibarr\Classes\Form;
use Alxarafe\Dolibarr\Classes\HookManager;
use Alxarafe\Dolibarr\Classes\MenuManager;
use Alxarafe\Dolibarr\Classes\Societe;
use Alxarafe\Dolibarr\Libraries\DolibarrBookmarks;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Alxarafe\Dolibarr\Libraries\DolibarrSecurity;

/**
 * Class DolibarrView
 *
 * File that defines environment for Dolibarr GUI pages only (file not required by scripts)
 *
 * This class is an adaptation of the content of Dolibarr's main.inc.php file.
 *
 * @package Alxarafe\Dolibarr\Base
 */
class DolibarrView extends View
{
    public Conf $conf;
    public Translator $langs;
    public string $sessionname;
    public string $forcehttps;
    public $db;
    public ?Societe $mysoc;
    public HookManager $hookmanager;
    public MenuManager $menumanager;

    function __construct(BasicController $controller)
    {
        parent::__construct($controller);

        $this->langs = $controller->langs;
        $this->db = $controller->db;
        $this->user = $controller->user;
        $this->mysoc = $controller->mysoc;
        $this->hookmanager = $controller->hookmanager;
        $this->menumanager = $controller->menumanager;

        $this->conf = DolibarrGlobals::getConf();
        $this->forcehttps = $this->conf->file->main_force_https;

        // Init session. Name of session is specific to Dolibarr instance.
        // Must be done after the include of filefunc.inc.php so global variables of conf file are defined (like $dolibarr_main_instance_unique_id or $this->forcehttps).
        // Note: the function dol_getprefix is defined into functions.lib.php but may have been defined to return a different key to manage another area to protect.
        $prefix = DolibarrFunctions::dol_getprefix('');
        $this->sessionname = 'DOLSESSID_' . $prefix;
        $sessiontimeout = 'DOLSESSTIMEOUT_' . $prefix;
        if (!empty($_COOKIE[$sessiontimeout])) {
            ini_set('session.gc_maxlifetime', $_COOKIE[$sessiontimeout]);
        }

        // This create lock, released by session_write_close() or end of page.
        // We need this lock as long as we read/write $_SESSION ['vars']. We can remove lock when finished.
        if (!defined('NOSESSION')) {
            // @link https://stackoverflow.com/questions/47700336/php-7-2-warning-cannot-change-session-name-when-session-is-active
            session_set_cookie_params(0, '/', null, (empty($this->forcehttps) ? false : true), true); // Add tag secure and httponly on session cookie (same as setting session.cookie_httponly into php.ini). Must be called before the session_start.
            session_name($this->sessionname);
            session_start();
        }
    }

    static function realCharForNumericEntities($matches)
    {
        $newstringnumentity = preg_replace('/;$/', '', $matches[1]);
        //print  ' $newstringnumentity='.$newstringnumentity;

        if (preg_match('/^x/i', $newstringnumentity)) {
            $newstringnumentity = hexdec(preg_replace('/^x/i', '', $newstringnumentity));
        }

        // The numeric value we don't want as entities because they encode ascii char, and why using html entities on ascii except for haking ?
        if (($newstringnumentity >= 65 && $newstringnumentity <= 90) || ($newstringnumentity >= 97 && $newstringnumentity <= 122)) {
            return chr((int) $newstringnumentity);
        }

        return '&#' . $matches[1];    // Value will be unchanged because regex was /&#(  )/
    }

    /**
     * Assign the template.
     */
    function setTemplate(): void
    {
        $this->template = 'dolibarr';
    }

    function printPage(): string
    {
        return $this->main();
    }

    function main()
    {
        // For optional tuning. Enabled if environment variable MAIN_SHOW_TUNING_INFO is defined.
        $micro_start_time = 0;
        if (!empty($_SERVER['MAIN_SHOW_TUNING_INFO'])) {
            [$usec, $sec] = explode(" ", microtime());
            $micro_start_time = ((float) $usec + (float) $sec);
            // Add Xdebug code coverage
            //define('XDEBUGCOVERAGE',1);
            if (defined('XDEBUGCOVERAGE')) {
                xdebug_start_code_coverage();
            }
        }

        // Check consistency of NOREQUIREXXX DEFINES
        if ((defined('NOREQUIREDB') || defined('NOREQUIRETRAN')) && !defined('NOREQUIREMENU')) {
            print 'If define NOREQUIREDB or NOREQUIRETRAN are set, you must also set NOREQUIREMENU or not set them.';
            exit;
        }
        if (defined('NOREQUIREUSER') && !defined('NOREQUIREMENU')) {
            print 'If define NOREQUIREUSER is set, you must also set NOREQUIREMENU or not set it.';
            exit;
        }

        // Sanity check on URL
        if (!empty($_SERVER["PHP_SELF"])) {
            $morevaltochecklikepost = [$_SERVER["PHP_SELF"]];
            $this->analyseVarsForSqlAndScriptsInjection($morevaltochecklikepost, 2);
        }

        // Sanity check on GET parameters
        if (!defined('NOSCANGETFORINJECTION') && !empty($_SERVER["QUERY_STRING"])) {
            // Note: QUERY_STRING is url encoded, but $_GET and $_POST are already decoded
            // Because the analyseVarsForSqlAndScriptsInjection is designed for already url decoded value, we must decode QUERY_STRING
            // Another solution is to provide $_GET as parameter
            $morevaltochecklikeget = [urldecode($_SERVER["QUERY_STRING"])];
            analyseVarsForSqlAndScriptsInjection($morevaltochecklikeget, 1);
        }

        // Sanity check on POST
        if (!defined('NOSCANPOSTFORINJECTION')) {
            analyseVarsForSqlAndScriptsInjection($_POST, 0);
        }

        // This is to make Dolibarr working with Plesk
        if (!empty($_SERVER['DOCUMENT_ROOT']) && substr($_SERVER['DOCUMENT_ROOT'], -6) !== 'htdocs') {
            set_include_path($_SERVER['DOCUMENT_ROOT'] . '/htdocs');
        }

        // Include the conf.php and functions.lib.php. This defined the constants like DOL_DOCUMENT_ROOT, DOL_DATA_ROOT, DOL_URL_ROOT...
        // require_once 'filefunc.php';

        // If there is a POST parameter to tell to save automatically some POST parameters into cookies, we do it.
        // This is used for example by form of boxes to save personalization of some options.
        // DOL_AUTOSET_COOKIE=cookiename:val1,val2 and  cookiename_val1=aaa cookiename_val2=bbb will set cookie_name with value json_encode(array('val1'=> , ))
        if (!empty($_POST["DOL_AUTOSET_COOKIE"])) {
            $tmpautoset = explode(':', $_POST["DOL_AUTOSET_COOKIE"], 2);
            $tmplist = explode(',', $tmpautoset[1]);
            $cookiearrayvalue = [];
            foreach ($tmplist as $tmpkey) {
                $postkey = $tmpautoset[0] . '_' . $tmpkey;
                //var_dump('tmpkey='.$tmpkey.' postkey='.$postkey.' value='.$_POST[$postkey]);
                if (!empty($_POST[$postkey])) {
                    $cookiearrayvalue[$tmpkey] = $_POST[$postkey];
                }
            }
            $cookiename = $tmpautoset[0];
            $cookievalue = json_encode($cookiearrayvalue);
            //var_dump('setcookie cookiename='.$cookiename.' cookievalue='.$cookievalue);
            setcookie($cookiename, empty($cookievalue) ? '' : $cookievalue, empty($cookievalue) ? 0 : (time() + (86400 * 354)), '/', null, (empty($this->forcehttps) ? false : true), true); // keep cookie 1 year and add tag httponly
            if (empty($cookievalue)) {
                unset($_COOKIE[$cookiename]);
            }
        }

        // Set the handler of session
        if (ini_get('session.save_handler') == 'user') {
            die(' Require: core/lib/phpsessionindb.lib.php in DolibarrView.');
            require_once 'core/lib/phpsessionindb.lib.php';
        }

        // Init the 5 global objects, this include will make the 'new Xxx()' and set properties for: $this->conf, $db, $this->langs, $this->user, $this->mysoc
        // require_once 'master.php';

        // If software has been locked. Only login $this->conf->global->MAIN_ONLY_LOGIN_ALLOWED is allowed.
        if (!empty($this->conf->global->MAIN_ONLY_LOGIN_ALLOWED)) { // It's false
            $ok = 0;
            if ((!session_id() || !isset($_SESSION["dol_login"])) && !isset($_POST["username"]) && !empty($_SERVER["GATEWAY_INTERFACE"])) {
                $ok = 1; // We let working pages if not logged and inside a web browser (login form, to allow login by admin)
            } elseif (isset($_POST["username"]) && $_POST["username"] == $this->conf->global->MAIN_ONLY_LOGIN_ALLOWED) {
                $ok = 1; // We let working pages that is a login submission (login submit, to allow login by admin)
            } elseif (defined('NOREQUIREDB')) {
                $ok = 1; // We let working pages that don't need database access (xxx.css.php)
            } elseif (defined('EVEN_IF_ONLY_LOGIN_ALLOWED')) {
                $ok = 1; // We let working pages that ask to work even if only login enabled (logout.php)
            } elseif (session_id() && isset($_SESSION["dol_login"]) && $_SESSION["dol_login"] == $this->conf->global->MAIN_ONLY_LOGIN_ALLOWED) {
                $ok = 1; // We let working if user is allowed admin
            }
            if (!$ok) {
                if (session_id() && isset($_SESSION["dol_login"]) && $_SESSION["dol_login"] != $this->conf->global->MAIN_ONLY_LOGIN_ALLOWED) {
                    print 'Sorry, your application is offline.' . "\n";
                    print 'You are logged with user "' . $_SESSION["dol_login"] . '" and only administrator user "' . $this->conf->global->MAIN_ONLY_LOGIN_ALLOWED . '" is allowed to connect for the moment.' . "\n";
                    $nexturl = DOL_URL_ROOT . '?module=Users&controller=logout';
                    print 'Please try later or <a href="' . $nexturl . '">click here to disconnect and change login user</a>...' . "\n";
                } else {
                    print 'Sorry, your application is offline. Only administrator user "' . $this->conf->global->MAIN_ONLY_LOGIN_ALLOWED . '" is allowed to connect for the moment.' . "\n";
                    $nexturl = DOL_URL_ROOT . '/';
                    print 'Please try later or <a href="' . $nexturl . '">click here to change login user</a>...' . "\n";
                }
                exit;
            }
        }

        // Activate end of page function
        register_shutdown_function('\Alxarafe\Dolibarr\Libraries\DolibarrFunctions::dol_shutdown');

        $debugbar = DebugTool::getInstance();

        // Load debugbar
        /*
        if (!empty($this->conf->debugbar->enabled) && !DolibarrFunctions::GETPOST('dol_use_jmobile') && empty($_SESSION['dol_use_jmobile'])) {
            global $debugbar;
            include_once DOL_DOCUMENT_ROOT . '/debugbar/class/DebugBar.php';
            $debugbar = new DolibarrDebugBar();
            $renderer = $debugbar->getRenderer();
            if (empty($this->conf->global->MAIN_HTML_HEADER)) {
                $this->conf->global->MAIN_HTML_HEADER = '';
            }
            $this->conf->global->MAIN_HTML_HEADER .= $renderer->renderHead();

            $debugbar['time']->startMeasure('pageaftermaster', 'Page generation (after environment init)');
        }
        */
        $debugbar->debugBar['time']->startMeasure('pageaftermaster', 'Page generation (after environment init)');

        // Detection browser
        if (isset($_SERVER["HTTP_USER_AGENT"])) {
            $tmp = DolibarrFunctions::getBrowserInfo($_SERVER["HTTP_USER_AGENT"]);
            $this->conf->browser->name = $tmp['browsername'];
            $this->conf->browser->os = $tmp['browseros'];
            $this->conf->browser->version = $tmp['browserversion'];
            $this->conf->browser->layout = $tmp['layout']; // 'classic', 'phone', 'tablet'
            //var_dump($this->conf->browser);

            if ($this->conf->browser->layout == 'phone') {
                $this->conf->dol_no_mouse_hover = 1;
            }
        }

        // Set global MAIN_OPTIMIZEFORTEXTBROWSER (must be before login part)
        if (DolibarrFunctions::GETPOST('textbrowser', 'int') || (!empty($this->conf->browser->name) && $this->conf->browser->name == 'lynxlinks')) {   // If we must enable text browser
            $this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER = 1;
        }

        // Force HTTPS if required ($this->conf->file->main_force_https is 0/1 or 'https dolibarr root url')
        // $_SERVER["HTTPS"] is 'on' when link is https, otherwise $_SERVER["HTTPS"] is empty or 'off'
        if (!empty($this->conf->file->main_force_https) && (empty($_SERVER["HTTPS"]) || $_SERVER["HTTPS"] != 'on')) {
            $newurl = '';
            if (is_numeric($this->conf->file->main_force_https)) {
                if ($this->conf->file->main_force_https == '1' && !empty($_SERVER["SCRIPT_URI"])) {    // If SCRIPT_URI supported by server
                    if (preg_match('/^http:/i', $_SERVER["SCRIPT_URI"]) && !preg_match('/^https:/i', $_SERVER["SCRIPT_URI"])) {    // If link is http
                        $newurl = preg_replace('/^http:/i', 'https:', $_SERVER["SCRIPT_URI"]);
                    }
                } else {
                    // Check HTTPS environment variable (Apache/mod_ssl only)
                    $newurl = preg_replace('/^http:/i', 'https:', DOL_MAIN_URL_ROOT) . $_SERVER["REQUEST_URI"];
                }
            } else {
                // Check HTTPS environment variable (Apache/mod_ssl only)
                $newurl = $this->conf->file->main_force_https . $_SERVER["REQUEST_URI"];
            }
            // Start redirect
            if ($newurl) {
                header_remove(); // Clean header already set to be sure to remove any header like "Set-Cookie: DOLSESSID_..." from non HTTPS answers
                DolibarrFunctions::dol_syslog("main.inc: dolibarr_main_force_https is on, we make a redirect to " . $newurl);
                header("Location: " . $newurl);
                exit;
            } else {
                DolibarrFunctions::dol_syslog("main.inc: dolibarr_main_force_https is on but we failed to forge new https url so no redirect is done", LOG_WARNING);
            }
        }

        if (!defined('NOLOGIN') && !defined('NOIPCHECK') && !empty($dolibarr_main_restrict_ip)) {
            $listofip = explode(',', $dolibarr_main_restrict_ip);
            $found = false;
            foreach ($listofip as $ip) {
                $ip = trim($ip);
                if ($ip == $_SERVER['REMOTE_ADDR']) {
                    $found = true;
                    break;
                }
            }
            if (!$found) {
                print 'Access refused by IP protection. Your detected IP is ' . $_SERVER['REMOTE_ADDR'];
                exit;
            }
        }

        // Loading of additional presentation includes
        if (!defined('NOREQUIREHTML') || !constant('NOREQUIREHTML')) {
            //            require_once DOL_DOCUMENT_ROOT . '/core/class/html.form.class.php'; // Need 660ko memory (800ko in 2.2)
        }
        if (!defined('NOREQUIREAJAX' || !constant('NOREQUIREAJAX'))) {
            require_once DOL_DOCUMENT_ROOT . '/core/lib/ajax.lib.php'; // Need 22ko memory
        }

        // If install or upgrade process not done or not completely finished, we call the install page.
        if (!empty($this->conf->global->MAIN_NOT_INSTALLED) || !empty($this->conf->global->MAIN_NOT_UPGRADED)) {
            dump($this->conf->global->MAIN_NOT_INSTALLED);
            dump($this->conf->global->MAIN_NOT_UPGRADED);
            DolibarrFunctions::dol_syslog("main.inc: A previous install or upgrade was not complete. Redirect to install page.", LOG_WARNING);
            // header("Location: " . DOL_URL_ROOT . "/install/index.php");
            die("3 Location: " . DOL_URL_ROOT . "/Modules/Install/Controller/Dol_Init.php");
            header("Location: " . DOL_URL_ROOT . "/Modules/Install/Controller/Dol_Init.php");
            exit;
        }

        // If an upgrade process is required, we call the install page.
        if ((!empty($this->conf->global->MAIN_VERSION_LAST_UPGRADE) && ($this->conf->global->MAIN_VERSION_LAST_UPGRADE != DOL_VERSION))
            || (empty($this->conf->global->MAIN_VERSION_LAST_UPGRADE) && !empty($this->conf->global->MAIN_VERSION_LAST_INSTALL) && ($this->conf->global->MAIN_VERSION_LAST_INSTALL != DOL_VERSION))) {
            $versiontocompare = empty($this->conf->global->MAIN_VERSION_LAST_UPGRADE) ? $this->conf->global->MAIN_VERSION_LAST_INSTALL : $this->conf->global->MAIN_VERSION_LAST_UPGRADE;
            require_once DOL_DOCUMENT_ROOT . '/core/lib/admin.lib.php';
            $dolibarrversionlastupgrade = preg_split('/[.-]/', $versiontocompare);
            $dolibarrversionprogram = preg_split('/[.-]/', DOL_VERSION);
            $rescomp = versioncompare($dolibarrversionprogram, $dolibarrversionlastupgrade);
            if ($rescomp > 0) {   // Programs have a version higher than database. We did not add "&& $rescomp < 3" because we want upgrade process for build upgrades
                DolibarrFunctions::dol_syslog("main.inc: database version " . $versiontocompare . " is lower than programs version " . DOL_VERSION . ". Redirect to install page.", LOG_WARNING);
                // header("Location: " . DOL_URL_ROOT . "/install/index.php");
                die("4 Location: " . DOL_URL_ROOT . "/Modules/Install/Controller/Dol_Init.php");
                header("Location: " . DOL_URL_ROOT . "/Modules/Install/Controller/Dol_Init.php");
                exit;
            }
        }

        // Creation of a token against CSRF vulnerabilities
        if (!defined('NOTOKENRENEWAL') && !defined('NOSESSION')) {
            // No token renewal on .css.php, .js.php and .json.php
            if (!preg_match('/\.(css|js|json)\.php$/', $_SERVER["PHP_SELF"])) {
                // Rolling token at each call ($_SESSION['token'] contains token of previous page)
                if (isset($_SESSION['newtoken'])) {
                    $_SESSION['token'] = $_SESSION['newtoken'];
                }

                // Save in $_SESSION['newtoken'] what will be next token. Into forms, we will add param token = $_SESSION['newtoken']
                $token = DolibarrSecurity::dol_hash(uniqid(mt_rand(), false), 'md5'); // Generates a hash of a random number. We don't need a secured hash, just a changing random value.
                $_SESSION['newtoken'] = $token;
                DolibarrFunctions::dol_syslog("NEW TOKEN generated by : " . $_SERVER['PHP_SELF'], LOG_DEBUG);
            }
        }

        //DolibarrFunctions::dol_syslog("aaaa - ".defined('NOCSRFCHECK')." - ".$dolibarr_nocsrfcheck." - ".$this->conf->global->MAIN_SECURITY_CSRF_WITH_TOKEN." - ".$_SERVER['REQUEST_METHOD']." - ".DolibarrFunctions::GETPOST('token', 'alpha'));

        // Check validity of token, only if option MAIN_SECURITY_CSRF_WITH_TOKEN enabled or if constant CSRFCHECK_WITH_TOKEN is set into page
        if ((!defined('NOCSRFCHECK') && empty($dolibarr_nocsrfcheck) && DolibarrFunctions::getDolGlobalInt('MAIN_SECURITY_CSRF_WITH_TOKEN')) || defined('CSRFCHECK_WITH_TOKEN')) {
            // Array of action code where CSRFCHECK with token will be forced (so token must be provided on url request)
            $sensitiveget = false;
            if ((DolibarrFunctions::GETPOSTISSET('massaction') || DolibarrFunctions::GETPOST('action', 'aZ09')) && DolibarrFunctions::getDolGlobalInt('MAIN_SECURITY_CSRF_WITH_TOKEN') == 2) {
                // All GET actions and mass actions are processed as sensitive.
                $sensitiveget = true;
            } else {
                // Only GET actions coded with a &token into url are processed as sensitive.
                $arrayofactiontoforcetokencheck = [
                    'activate', 'add', 'addrights', 'addtimespent',
                    'doprev', 'donext', 'dvprev', 'dvnext',
                    'install',
                    'reopen',
                ];
                if (in_array(DolibarrFunctions::GETPOST('action', 'aZ09'), $arrayofactiontoforcetokencheck)) {
                    $sensitiveget = true;
                }
                if (preg_match('/^(classify|close|confirm|del|disable|enable|remove|set|unset|update)/', DolibarrFunctions::GETPOST('action', 'aZ09'))) {
                    $sensitiveget = true;
                }
            }

            // Check a token is provided for all cases that need a mandatory token
            // (all POST actions + all login, actions and mass actions on pages with CSRFCHECK_WITH_TOKEN set + all sensitive GET actions)
            // TODO: CSRFCHECK_WITH_TOKEN temporarily disabled!
            if (false && $_SERVER['REQUEST_METHOD'] == 'POST' ||
                $sensitiveget ||
                DolibarrFunctions::GETPOSTISSET('massaction') ||
                ((DolibarrFunctions::GETPOSTISSET('actionlogin') || DolibarrFunctions::GETPOSTISSET('action')) && defined('CSRFCHECK_WITH_TOKEN'))
            ) {
                // If token is not provided or empty, error (we are in case it is mandatory)
                $token = DolibarrFunctions::GETPOST('token', 'alpha');
                if (!$token || $token == 'notrequired') {
                    if (DolibarrFunctions::GETPOST('uploadform', 'int')) {
                        DolibarrFunctions::dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . " refused. File size too large.");
                        $this->langs->loadLangs(["errors", "install"]);
                        print $this->langs->trans("ErrorFileSizeTooLarge") . ' ';
                        print $this->langs->trans("ErrorGoBackAndCorrectParameters");
                    } else {
                        if (defined('CSRFCHECK_WITH_TOKEN')) {
                            DolibarrFunctions::dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . " refused by CSRF protection (CSRFCHECK_WITH_TOKEN protection) in main.inc.php. Token not provided.", LOG_WARNING);
                            print "2Access to a page that needs a token (constant CSRFCHECK_WITH_TOKEN is defined) is refused by CSRF protection in main.php. Token not provided.\n";
                        } else {
                            DolibarrFunctions::dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . " refused by CSRF protection (POST method or GET with a sensible value for 'action' parameter) in main.inc.php. Token not provided.", LOG_WARNING);
                            print "Access to this page this way (POST method or GET with a sensible value for 'action' parameter) is refused by CSRF protection in main.inc.php. Token not provided.\n";
                            print "If you access your server behind a proxy using url rewriting and the parameter is provided by caller, you might check that all HTTP header are propagated (or add the line \$dolibarr_nocsrfcheck=1 into your conf.php file or MAIN_SECURITY_CSRF_WITH_TOKEN to 0 into setup).\n";
                        }
                    }
                    die;
                }
            }

            $sessiontokenforthisurl = (empty($_SESSION['token']) ? '' : $_SESSION['token']);
            // TODO Get the sessiontokenforthisurl into the array of session token
            if (DolibarrFunctions::GETPOSTISSET('token') && DolibarrFunctions::GETPOST('token') != 'notrequired' && DolibarrFunctions::GETPOST('token', 'alpha') != $sessiontokenforthisurl) {
                DolibarrFunctions::dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . " refused by CSRF protection (invalid token), so we disable POST and some GET parameters - referer=" . $_SERVER['HTTP_REFERER'] . ", action=" . DolibarrFunctions::GETPOST('action', 'aZ09') . ", _GET|POST['token']=" . DolibarrFunctions::GETPOST('token', 'alpha') . ", _SESSION['token']=" . $_SESSION['token'], LOG_WARNING);
                //print 'Unset POST by CSRF protection in main.inc.php.';	// Do not output anything because this create problems when using the BACK button on browsers.
                DolibarrFunctions::setEventMessage('SecurityTokenHasExpiredSoActionHasBeenCanceledPleaseRetry', null, 'warnings');
                //if ($this->conf->global->MAIN_FEATURES_LEVEL >= 1) DolibarrFunctions::setEventMessage('Unset POST and GET params by CSRF protection in main.inc.php (Token provided was not generated by the previous page).'."<br>\n".'$_SERVER[REQUEST_URI] = '.$_SERVER['REQUEST_URI'].' $_SERVER[REQUEST_METHOD] = '.$_SERVER['REQUEST_METHOD'].' DolibarrFunctions::GETPOST(token) = '.DolibarrFunctions::GETPOST('token', 'alpha').' $_SESSION[token] = '.$_SESSION['token'], null, 'warnings');
                if (isset($_POST['id'])) {
                    $savid = ((int) $_POST['id']);
                }
                unset($_POST);
                //unset($_POST['action']); unset($_POST['massaction']);
                //unset($_POST['confirm']); unset($_POST['confirmmassaction']);
                unset($_GET['confirm']);
                unset($_GET['action']);
                unset($_GET['confirmmassaction']);
                unset($_GET['massaction']);
                if (isset($savid)) {
                    $_POST['id'] = ((int) $savid);
                }
            }
            // Note: There is another CSRF protection into the filefunc.inc.php
        }

        // Disable modules (this must be after session_start and after conf has been loaded)
        if (DolibarrFunctions::GETPOSTISSET('disablemodules')) {
            $_SESSION["disablemodules"] = DolibarrFunctions::GETPOST('disablemodules', 'alpha');
        }

        if (!empty($_SESSION["disablemodules"])) {
            $modulepartkeys = ['css', 'js', 'tabs', 'triggers', 'login', 'substitutions', 'menus', 'theme', 'sms', 'tpl', 'barcode', 'models', 'societe', 'hooks', 'dir', 'syslog', 'tpllinkable', 'contactelement', 'moduleforexternal'];

            $disabled_modules = explode(',', $_SESSION["disablemodules"]);
            foreach ($disabled_modules as $module) {
                if ($module) {
                    if (empty($this->conf->$module)) {
                        $this->conf->$module = new stdClass(); // To avoid warnings
                    }
                    $this->conf->$module->enabled = false;
                    foreach ($modulepartkeys as $modulepartkey) {
                        unset($this->conf->modules_parts[$modulepartkey][$module]);
                    }
                    if ($module == 'fournisseur') {        // Special case
                        $this->conf->supplier_order->enabled = 0;
                        $this->conf->supplier_invoice->enabled = 0;
                    }
                }
            }
        }

        // Set current modulepart
        $modulepart = explode("/", $_SERVER["PHP_SELF"]);
        if (is_array($modulepart) && count($modulepart) > 0) {
            foreach ($this->conf->modules as $module) {
                if (in_array($module, $modulepart)) {
                    $this->conf->modulepart = $module;
                    break;
                }
            }
        }

        DolibarrFunctions::dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . ' - action=' . DolibarrFunctions::GETPOST('action', 'aZ09') . ', massaction=' . DolibarrFunctions::GETPOST('massaction', 'aZ09') . (defined('NOTOKENRENEWAL') ? ' NOTOKENRENEWAL=' . constant('NOTOKENRENEWAL') : ''), LOG_NOTICE);
        //Another call for easy debugg
        //DolibarrFunctions::dol_syslog("Access to ".$_SERVER["PHP_SELF"].' '.$_SERVER["HTTP_REFERER"].' GET='.join(',',array_keys($_GET)).'->'.join(',',$_GET).' POST:'.join(',',array_keys($_POST)).'->'.join(',',$_POST));

        // Load main languages files
        if (!defined('NOREQUIRETRAN')) {
            // Load translation files required by page
            $this->langs->loadLangs(['main', 'dict']);
        }

        // Define some constants used for style of arrays
        $bc = [0 => 'class="impair"', 1 => 'class="pair"'];
        $bcdd = [0 => 'class="drag drop oddeven"', 1 => 'class="drag drop oddeven"'];
        $bcnd = [0 => 'class="nodrag nodrop nohover"', 1 => 'class="nodrag nodrop nohoverpair"']; // Used for tr to add new lines
        $bctag = [0 => 'class="impair tagtr"', 1 => 'class="pair tagtr"'];

        // Define messages variables
        $mesg = '';
        $warning = '';
        $error = 0;
        // deprecated, see DolibarrFunctions::setEventMessage() and DolibarrFunctions::dol_htmloutput_events()
        $mesgs = [];
        $warnings = [];
        $errors = [];

        // Constants used to defined number of lines in textarea
        if (empty($this->conf->browser->firefox)) {
            define('ROWS_1', 1);
            define('ROWS_2', 2);
            define('ROWS_3', 3);
            define('ROWS_4', 4);
            define('ROWS_5', 5);
            define('ROWS_6', 6);
            define('ROWS_7', 7);
            define('ROWS_8', 8);
            define('ROWS_9', 9);
        } else {
            define('ROWS_1', 0);
            define('ROWS_2', 1);
            define('ROWS_3', 2);
            define('ROWS_4', 3);
            define('ROWS_5', 4);
            define('ROWS_6', 5);
            define('ROWS_7', 6);
            define('ROWS_8', 7);
            define('ROWS_9', 8);
        }

        $heightforframes = 50;

        // Init menu manager
        //if (!defined('NOREQUIREMENU')) {
        if (empty($this->user->socid)) {    // If internal user or not defined
            $this->conf->standard_menu = (empty($this->conf->global->MAIN_MENU_STANDARD_FORCED) ? (empty($this->conf->global->MAIN_MENU_STANDARD) ? 'eldy_menu.php' : $this->conf->global->MAIN_MENU_STANDARD) : $this->conf->global->MAIN_MENU_STANDARD_FORCED);
        } else {
            // If external user
            $this->conf->standard_menu = (empty($this->conf->global->MAIN_MENUFRONT_STANDARD_FORCED) ? (empty($this->conf->global->MAIN_MENUFRONT_STANDARD) ? 'eldy_menu.php' : $this->conf->global->MAIN_MENUFRONT_STANDARD) : $this->conf->global->MAIN_MENUFRONT_STANDARD_FORCED);
        }

        // Load the menu manager (only if not already done)
        $file_menu = $this->conf->standard_menu;
        if (DolibarrFunctions::GETPOST('menu', 'alpha')) {
            $file_menu = DolibarrFunctions::GETPOST('menu', 'alpha'); // example: menu=eldy_menu.php
        }
        //        if (!class_exists('MenuManager')) {
        //            $menufound = 0;
        //            $dirmenus = array_merge(["/core/menus/"], (array) $this->conf->modules_parts['menus']);
        //            foreach ($dirmenus as $dirmenu) {
        //                $menufound = DolibarrFunctions::dol_include_once($dirmenu . "standard/" . $file_menu);
        //                if (class_exists('MenuManager')) {
        //                    break;
        //                }
        //            }
        //            if (!class_exists('MenuManager')) {    // If failed to include, we try with standard eldy_menu.php
        //                DolibarrFunctions::dol_syslog("You define a menu manager '" . $file_menu . "' that can not be loaded.", LOG_WARNING);
        //                $file_menu = 'eldy_menu.php';
        //                include_once DOL_DOCUMENT_ROOT . "/core/menus/standard/" . $file_menu;
        //            }
        //        }
        //        $this->menumanager = new MenuManager($db, empty($this->user->socid) ? 0 : 1);
        $this->menumanager->loadMenu();
        return '<EOF>';
    }

    function analyseVarsForSqlAndScriptsInjection(&$var, $type)
    {
        if (is_array($var)) {
            foreach ($var as $key => $value) {    // Warning, $key may also be used for attacks
                if ($this->analyseVarsForSqlAndScriptsInjection($key, $type) && $this->analyseVarsForSqlAndScriptsInjection($value, $type)) {
                    //$var[$key] = $value;	// This is useless
                } else {
                    // Get remote IP: PS: We do not use getRemoteIP(), function is not yet loaded and we need a value that can't be spoofed
                    $ip = (empty($_SERVER['REMOTE_ADDR']) ? 'unknown' : $_SERVER['REMOTE_ADDR']);
                    $errormessage = 'Access refused to ' . $ip . ' by SQL or Script injection protection in main.inc.php - DolibarrFunctions::GETPOST type=' . htmlentities($type) . ' paramkey=' . htmlentities($key) . ' paramvalue=' . htmlentities($value) . ' page=' . htmlentities($_SERVER["REQUEST_URI"]);
                    print $errormessage;
                    // Add entry into error log
                    if (function_exists('error_log')) {
                        error_log($errormessage);
                    }
                    // TODO Add entry into security audit table
                    exit;
                }
            }
            return true;
        } else {
            return ($this->testSqlAndScriptInject($var, $type) <= 0);
        }
    }

    function testSqlAndScriptInject($val, $type)
    {
        // Decode string first because a lot of things are obfuscated by encoding or multiple encoding.
        // So <svg o&#110;load='console.log(&quot;123&quot;)' become <svg onload='console.log(&quot;123&quot;)'
        // So "&colon;&apos;" become ":'" (due to ENT_HTML5)
        // Loop to decode until no more thing to decode.
        //print "before decoding $val\n";
        do {
            $oldval = $val;
            $val = html_entity_decode($val, ENT_QUOTES | ENT_HTML5);
            $val = preg_replace_callback('/&#(x?[0-9][0-9a-f]+)/i', [$this, 'realCharForNumericEntities'], $val);    // Sometimes we have entities without the ; at end so html_entity_decode does not work but entities is still interpreted by browser.
        } while ($oldval != $val);
        //print "after  decoding $val\n";

        // We clean string because some hacks try to obfuscate evil strings by inserting non printable chars. Example: 'java(ascci09)scr(ascii00)ipt' is processed like 'javascript' (whatever is place of evil ascii char)
        // We should use dol_string_nounprintableascii but function is not yet loaded/available
        $val = preg_replace('/[\x00-\x1F\x7F]/u', '', $val); // /u operator makes UTF8 valid characters being ignored so are not included into the replace
        // We clean html comments because some hacks try to obfuscate evil strings by inserting HTML comments. Example: on<!-- -->error=alert(1)
        $val = preg_replace('/<!--[^>]*-->/', '', $val);

        $inj = 0;
        // For SQL Injection (only GET are used to scan for such injection strings)
        if ($type == 1 || $type == 3) {
            $inj += preg_match('/delete\s+from/i', $val);
            $inj += preg_match('/create\s+table/i', $val);
            $inj += preg_match('/insert\s+into/i', $val);
            $inj += preg_match('/select\s+from/i', $val);
            $inj += preg_match('/into\s+(outfile|dumpfile)/i', $val);
            $inj += preg_match('/user\s*\(/i', $val); // avoid to use function user() or mysql_user() that return current database login
            $inj += preg_match('/information_schema/i', $val); // avoid to use request that read information_schema database
            $inj += preg_match('/<svg/i', $val); // <svg can be allowed in POST
            $inj += preg_match('/update.+set.+=/i', $val);
            $inj += preg_match('/union.+select/i', $val);
        }
        if ($type == 3) {
            $inj += preg_match('/select|update|delete|truncate|replace|group\s+by|concat|count|from|union/i', $val);
        }
        if ($type != 2) {    // Not common key strings, so we can check them both on GET and POST
            $inj += preg_match('/updatexml\(/i', $val);
            $inj += preg_match('/(\.\.%2f)+/i', $val);
            $inj += preg_match('/\s@@/', $val);
        }
        // For XSS Injection done by closing textarea to execute content into a textarea field
        $inj += preg_match('/<\/textarea/i', $val);
        // For XSS Injection done by adding javascript with script
        // This is all cases a browser consider text is javascript:
        // When it found '<script', 'javascript:', '<style', 'onload\s=' on body tag, '="&' on a tag size with old browsers
        // All examples on page: http://ha.ckers.org/xss.html#XSScalc
        // More on https://www.owasp.org/index.php/XSS_Filter_Evasion_Cheat_Sheet
        $inj += preg_match('/<audio/i', $val);
        $inj += preg_match('/<embed/i', $val);
        $inj += preg_match('/<iframe/i', $val);
        $inj += preg_match('/<object/i', $val);
        $inj += preg_match('/<script/i', $val);
        $inj += preg_match('/Set\.constructor/i', $val); // ECMA script 6
        if (!defined('NOSTYLECHECK')) {
            $inj += preg_match('/<style/i', $val);
        }
        $inj += preg_match('/base\s+href/si', $val);
        $inj += preg_match('/=data:/si', $val);
        // List of dom events is on https://www.w3schools.com/jsref/dom_obj_event.asp and https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers
        $inj += preg_match('/on(mouse|drag|key|load|touch|pointer|select|transition)([a-z]*)\s*=/i', $val); // onmousexxx can be set on img or any html tag like <img title='...' onmouseover=alert(1)>
        $inj += preg_match('/on(abort|afterprint|animation|auxclick|beforeprint|beforeunload|blur|cancel|canplay|canplaythrough|change|click|close|contextmenu|cuechange|copy|cut)\s*=/i', $val);
        $inj += preg_match('/on(dblclick|drop|durationchange|emptied|ended|error|focus|focusin|focusout|formdata|gotpointercapture|hashchange|input|invalid)\s*=/i', $val);
        $inj += preg_match('/on(lostpointercapture|offline|online|pagehide|pageshow)\s*=/i', $val);
        $inj += preg_match('/on(paste|pause|play|playing|progress|ratechange|reset|resize|scroll|search|seeked|seeking|show|stalled|start|submit|suspend)\s*=/i', $val);
        $inj += preg_match('/on(timeupdate|toggle|unload|volumechange|waiting|wheel)\s*=/i', $val);

        // We refuse html into html because some hacks try to obfuscate evil strings by inserting HTML into HTML. Example: <img on<a>error=alert(1) to bypass test on onerror
        $tmpval = preg_replace('/<[^<]+>/', '', $val);
        // List of dom events is on https://www.w3schools.com/jsref/dom_obj_event.asp and https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers
        $inj += preg_match('/on(mouse|drag|key|load|touch|pointer|select|transition)([a-z]*)\s*=/i', $val); // onmousexxx can be set on img or any html tag like <img title='...' onmouseover=alert(1)>
        $inj += preg_match('/on(abort|afterprint|animation|auxclick|beforeprint|beforeunload|blur|cancel|canplay|canplaythrough|change|click|close|contextmenu|cuechange|copy|cut)\s*=/i', $tmpval);
        $inj += preg_match('/on(dblclick|drop|durationchange|emptied|ended|error|focus|focusin|focusout|formdata|gotpointercapture|hashchange|input|invalid)\s*=/i', $tmpval);
        $inj += preg_match('/on(lostpointercapture|offline|online|pagehide|pageshow)\s*=/i', $tmpval);
        $inj += preg_match('/on(paste|pause|play|playing|progress|ratechange|reset|resize|scroll|search|seeked|seeking|show|stalled|start|submit|suspend)\s*=/i', $tmpval);
        $inj += preg_match('/on(timeupdate|toggle|unload|volumechange|waiting|wheel)\s*=/i', $tmpval);

        //$inj += preg_match('/on[A-Z][a-z]+\*=/', $val);   // To lock event handlers onAbort(), ...
        $inj += preg_match('/&#58;|&#0000058|&#x3A/i', $val); // refused string ':' encoded (no reason to have it encoded) to lock 'javascript:...'

        $inj += preg_match('/javascript\s*:/i', $val);
        $inj += preg_match('/vbscript\s*:/i', $val);
        // For XSS Injection done by adding javascript closing html tags like with onmousemove, etc... (closing a src or href tag with not cleaned param)
        if ($type == 1) {
            $val = str_replace('enclosure="', 'enclosure=X', $val); // We accept enclosure=" for the export/import module
            $inj += preg_match('/"/i', $val); // We refused " in GET parameters value.
        }
        if ($type == 2) {
            $inj += preg_match('/[:;"\'<>\?\(\){}\$%]/', $val); // PHP_SELF is a file system (or url path without parameters). It can contains spaces.
        }

        return $inj;
    }

    function llxHeader($head = '', $title = '', $help_url = '', $target = '', $disablejs = 0, $disablehead = 0, $arrayofjs = '', $arrayofcss = '', $morequerystring = '', $morecssonbody = '', $replacemainareaby = '', $disablenofollow = 0)
    {
        // html header
        $this->top_htmlhead($head, $title, $disablejs, $disablehead, $arrayofjs, $arrayofcss, 0, $disablenofollow);

        $tmpcsstouse = 'sidebar-collapse' . ($morecssonbody ? ' ' . $morecssonbody : '');
        // If theme MD and classic layer, we open the menulayer by default.
        if ($this->conf->theme == 'md' && !in_array($this->conf->browser->layout, ['phone', 'tablet']) && empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
            if ($mainmenu != 'website') {
                $tmpcsstouse = $morecssonbody; // We do not use sidebar-collpase by default to have menuhider open by default.
            }
        }

        if (!empty($this->conf->global->MAIN_OPTIMIZEFORCOLORBLIND)) {
            $tmpcsstouse .= ' colorblind-' . strip_tags($this->conf->global->MAIN_OPTIMIZEFORCOLORBLIND);
        }

        print '<body id="mainbody" class="' . $tmpcsstouse . '">' . "\n";

        // top menu and left menu area
        if (empty($this->conf->dol_hide_topmenu) || DolibarrFunctions::GETPOST('dol_invisible_topmenu', 'int') || !defined('MAIN_HIDE_TOP_MENU') || constant('MAIN_HIDE_TOP_MENU') != 1) {
            $this->top_menu($head, $title, $target, $disablejs, $disablehead, $arrayofjs, $arrayofcss, $morequerystring, $help_url);
        }

        if (empty($this->conf->dol_hide_leftmenu) || constant('MAIN_HIDE_LEFT_MENU') != 1) {
            $this->left_menu('', $help_url, '', '', 1, $title, 1); // $this->menumanager is retrieved with a global $this->menumanager inside this function
        }

        // main area
        if ($replacemainareaby) {
            print $replacemainareaby;
            return;
        }
        $this->main_area($title);
    }

    function top_htmlhead($head, $title = '', $disablejs = 0, $disablehead = 0, $arrayofjs = '', $arrayofcss = '', $disablejmobile = 0, $disablenofollow = 0)
    {
        $this->top_httphead();

        if (empty($this->conf->css)) {
            $this->conf->css = '/theme/eldy/style.css.php'; // If not defined, eldy by default
        }

        print '<!doctype html>' . "\n";

        if (!empty($this->conf->global->MAIN_USE_CACHE_MANIFEST)) {
            print '<html lang="' . substr($this->langs->getDefaultLang(), 0, 2) . '" manifest="' . DOL_URL_ROOT . '/cache.manifest">' . "\n";
        } else {
            print '<html lang="' . substr($this->langs->getDefaultLang(), 0, 2) . '">' . "\n";
        }
        //print '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">'."\n";
        if (empty($disablehead)) {
            if (!is_object($this->hookmanager)) {
                $this->hookmanager = new HookManager($db);
            }
            $this->hookmanager->initHooks(["main"]);

            $ext = 'layout=' . $this->conf->browser->layout . '&amp;version=' . urlencode(DOL_VERSION);

            print "<head>\n";

            if (DolibarrFunctions::GETPOST('dol_basehref', 'alpha')) {
                print '<base href="' . DolibarrFunctions::dol_escape_htmltag(DolibarrFunctions::GETPOST('dol_basehref', 'alpha')) . '">' . "\n";
            }

            // Displays meta
            print '<meta charset="utf-8">' . "\n";
            print '<meta name="robots" content="noindex' . ($disablenofollow ? '' : ',nofollow') . '">' . "\n"; // Do not index
            print '<meta name="viewport" content="width=device-width, initial-scale=1.0">' . "\n"; // Scale for mobile device
            print '<meta name="author" content="Dolibarr Development Team">' . "\n";

            // Favicon
            $favicon = DOL_URL_ROOT . '/theme/dolibarr_256x256_color.png';
            if (!empty($this->mysoc->logo_squarred_mini)) {
                $favicon = DOL_URL_ROOT . '/viewimage.php?cache=1&modulepart=mycompany&file=' . urlencode('logos/thumbs/' . $this->mysoc->logo_squarred_mini);
            }
            if (!empty($this->conf->global->MAIN_FAVICON_URL)) {
                $favicon = $this->conf->global->MAIN_FAVICON_URL;
            }
            if (empty($this->conf->dol_use_jmobile)) {
                print '<link rel="shortcut icon" type="image/x-icon" href="' . $favicon . '"/>' . "\n"; // Not required into an Android webview
            }

            //if (empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) print '<link rel="top" title="'.$this->langs->trans("Home").'" href="'.(DOL_URL_ROOT?DOL_URL_ROOT:'/').'">'."\n";
            //if (empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) print '<link rel="copyright" title="GNU General Public License" href="https://www.gnu.org/copyleft/gpl.html#SEC1">'."\n";
            //if (empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) print '<link rel="author" title="Dolibarr Development Team" href="https://www.dolibarr.org">'."\n";

            // Mobile appli like icon
            $manifest = DOL_URL_ROOT . '/theme/' . $this->conf->theme . '/manifest.json.php';
            if (!empty($manifest)) {
                print '<link rel="manifest" href="' . $manifest . '" />' . "\n";
            }

            if (!empty($this->conf->global->THEME_ELDY_TOPMENU_BACK1)) {
                // TODO: use auto theme color switch
                print '<meta name="theme-color" content="rgb(' . $this->conf->global->THEME_ELDY_TOPMENU_BACK1 . ')">' . "\n";
            }

            // Auto refresh page
            if (DolibarrFunctions::GETPOST('autorefresh', 'int') > 0) {
                print '<meta http-equiv="refresh" content="' . DolibarrFunctions::GETPOST('autorefresh', 'int') . '">';
            }

            // Displays title
            $appli = constant('DOL_APPLICATION_TITLE');
            if (!empty($this->conf->global->MAIN_APPLICATION_TITLE)) {
                $appli = $this->conf->global->MAIN_APPLICATION_TITLE;
            }

            print '<title>';
            $titletoshow = '';
            if ($title && !empty($this->conf->global->MAIN_HTML_TITLE) && preg_match('/noapp/', $this->conf->global->MAIN_HTML_TITLE)) {
                $titletoshow = DolibarrFunctions::dol_htmlentities($title);
            } elseif ($title) {
                $titletoshow = DolibarrFunctions::dol_htmlentities($appli . ' - ' . $title);
            } else {
                $titletoshow = DolibarrFunctions::dol_htmlentities($appli);
            }

            $parameters = ['title' => $titletoshow];
            $result = $this->hookmanager->executeHooks('setHtmlTitle', $parameters); // Note that $action and $object may have been modified by some hooks
            if ($result > 0) {
                $titletoshow = $this->hookmanager->resPrint; // Replace Title to show
            } else {
                $titletoshow .= $this->hookmanager->resPrint; // Concat to Title to show
            }

            print $titletoshow;
            print '</title>';

            print "\n";

            if (DolibarrFunctions::GETPOST('version', 'int')) {
                $ext = 'version=' . DolibarrFunctions::GETPOST('version', 'int'); // usefull to force no cache on css/js
            }

            $themeparam = '?lang=' . $this->langs->defaultlang . '&amp;theme=' . $this->conf->theme . (DolibarrFunctions::GETPOST('optioncss', 'aZ09') ? '&amp;optioncss=' . DolibarrFunctions::GETPOST('optioncss', 'aZ09', 1) : '') . '&amp;userid=' . $this->user->id . '&amp;entity=' . $this->conf->entity;
            $themeparam .= ($ext ? '&amp;' . $ext : '') . '&amp;revision=' . DolibarrFunctions::getDolGlobalInt("MAIN_IHM_PARAMS_REV");
            if (!empty($_SESSION['dol_resetcache'])) {
                $themeparam .= '&amp;dol_resetcache=' . $_SESSION['dol_resetcache'];
            }
            if (DolibarrFunctions::GETPOSTISSET('dol_hide_topmenu')) {
                $themeparam .= '&amp;dol_hide_topmenu=' . DolibarrFunctions::GETPOST('dol_hide_topmenu', 'int');
            }
            if (DolibarrFunctions::GETPOSTISSET('dol_hide_leftmenu')) {
                $themeparam .= '&amp;dol_hide_leftmenu=' . DolibarrFunctions::GETPOST('dol_hide_leftmenu', 'int');
            }
            if (DolibarrFunctions::GETPOSTISSET('dol_optimize_smallscreen')) {
                $themeparam .= '&amp;dol_optimize_smallscreen=' . DolibarrFunctions::GETPOST('dol_optimize_smallscreen', 'int');
            }
            if (DolibarrFunctions::GETPOSTISSET('dol_no_mouse_hover')) {
                $themeparam .= '&amp;dol_no_mouse_hover=' . DolibarrFunctions::GETPOST('dol_no_mouse_hover', 'int');
            }
            if (DolibarrFunctions::GETPOSTISSET('dol_use_jmobile')) {
                $themeparam .= '&amp;dol_use_jmobile=' . DolibarrFunctions::GETPOST('dol_use_jmobile', 'int');
                $this->conf->dol_use_jmobile = DolibarrFunctions::GETPOST('dol_use_jmobile', 'int');
            }
            if (DolibarrFunctions::GETPOSTISSET('THEME_DARKMODEENABLED')) {
                $themeparam .= '&amp;THEME_DARKMODEENABLED=' . DolibarrFunctions::GETPOST('THEME_DARKMODEENABLED', 'int');
            }
            if (DolibarrFunctions::GETPOSTISSET('THEME_SATURATE_RATIO')) {
                $themeparam .= '&amp;THEME_SATURATE_RATIO=' . DolibarrFunctions::GETPOST('THEME_SATURATE_RATIO', 'int');
            }

            if (!empty($this->conf->global->MAIN_ENABLE_FONT_ROBOTO)) {
                print '<link rel="preconnect" href="https://fonts.gstatic.com">' . "\n";
                print '<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@200;300;400;500;600&display=swap" rel="stylesheet">' . "\n";
            }

            if (!defined('DISABLE_JQUERY') && !$disablejs && $this->conf->use_javascript_ajax) {
                print '<!-- Includes CSS for JQuery (Ajax library) -->' . "\n";
                $jquerytheme = 'base';
                if (!empty($this->conf->global->MAIN_USE_JQUERY_THEME)) {
                    $jquerytheme = $this->conf->global->MAIN_USE_JQUERY_THEME;
                }
                if (constant('JS_JQUERY_UI')) {
                    print '<link rel="stylesheet" type="text/css" href="' . JS_JQUERY_UI . 'css/' . $jquerytheme . '/jquery-ui.min.css' . ($ext ? '?' . $ext : '') . '">' . "\n"; // Forced JQuery
                } else {
                    print '<link rel="stylesheet" type="text/css" href="' . DOL_URL_ROOT . '/includes/jquery/css/' . $jquerytheme . '/jquery-ui.css' . ($ext ? '?' . $ext : '') . '">' . "\n"; // JQuery
                }
                if (!defined('DISABLE_JQUERY_JNOTIFY')) {
                    print '<link rel="stylesheet" type="text/css" href="' . DOL_URL_ROOT . '/includes/jquery/plugins/jnotify/jquery.jnotify-alt.min.css' . ($ext ? '?' . $ext : '') . '">' . "\n"; // JNotify
                }
                if (!defined('DISABLE_SELECT2') && (!empty($this->conf->global->MAIN_USE_JQUERY_MULTISELECT) || defined('REQUIRE_JQUERY_MULTISELECT'))) {     // jQuery plugin "mutiselect", "multiple-select", "select2"...
                    $tmpplugin = empty($this->conf->global->MAIN_USE_JQUERY_MULTISELECT) ? constant('REQUIRE_JQUERY_MULTISELECT') : $this->conf->global->MAIN_USE_JQUERY_MULTISELECT;
                    print '<link rel="stylesheet" type="text/css" href="' . DOL_URL_ROOT . '/includes/jquery/plugins/' . $tmpplugin . '/dist/css/' . $tmpplugin . '.css' . ($ext ? '?' . $ext : '') . '">' . "\n";
                }
            }

            if (!defined('DISABLE_FONT_AWSOME')) {
                print '<!-- Includes CSS for font awesome -->' . "\n";
                print '<link rel="stylesheet" type="text/css" href="' . DOL_URL_ROOT . '/theme/common/fontawesome-5/css/all.min.css' . ($ext ? '?' . $ext : '') . '">' . "\n";
                print '<link rel="stylesheet" type="text/css" href="' . DOL_URL_ROOT . '/theme/common/fontawesome-5/css/v4-shims.min.css' . ($ext ? '?' . $ext : '') . '">' . "\n";
            }

            print '<!-- Includes CSS for Dolibarr theme -->' . "\n";
            // Output style sheets (optioncss='print' or ''). Note: $this->conf->css looks like '/theme/eldy/style.css.php'
            $themepath = DolibarrFunctions::dol_buildpath($this->conf->css, 1);
            $themesubdir = '';
            if (!empty($this->conf->modules_parts['theme'])) {    // This slow down
                foreach ($this->conf->modules_parts['theme'] as $reldir) {
                    if (file_exists(DolibarrFunctions::dol_buildpath($reldir . $this->conf->css, 0))) {
                        $themepath = DolibarrFunctions::dol_buildpath($reldir . $this->conf->css, 1);
                        $themesubdir = $reldir;
                        break;
                    }
                }
            }

            //print 'themepath='.$themepath.' themeparam='.$themeparam;exit;
            print '<link rel="stylesheet" type="text/css" href="' . $themepath . $themeparam . '">' . "\n";
            if (!empty($this->conf->global->MAIN_FIX_FLASH_ON_CHROME)) {
                print '<!-- Includes CSS that does not exists as a workaround of flash bug of chrome -->' . "\n" . '<link rel="stylesheet" type="text/css" href="filethatdoesnotexiststosolvechromeflashbug">' . "\n";
            }

            // CSS forced by modules (relative url starting with /)
            if (!empty($this->conf->modules_parts['css'])) {
                $arraycss = (array) $this->conf->modules_parts['css'];
                foreach ($arraycss as $modcss => $filescss) {
                    $filescss = (array) $filescss; // To be sure filecss is an array
                    foreach ($filescss as $cssfile) {
                        if (empty($cssfile)) {
                            DolibarrFunctions::dol_syslog("Warning: module " . $modcss . " declared a css path file into its descriptor that is empty.", LOG_WARNING);
                        }
                        // cssfile is a relative path
                        print '<!-- Includes CSS added by module ' . $modcss . ' -->' . "\n" . '<link rel="stylesheet" type="text/css" href="' . DolibarrFunctions::dol_buildpath($cssfile, 1);
                        // We add params only if page is not static, because some web server setup does not return content type text/css if url has parameters, so browser cache is not used.
                        if (!preg_match('/\.css$/i', $cssfile)) {
                            print $themeparam;
                        }
                        print '">' . "\n";
                    }
                }
            }
            // CSS forced by page in top_htmlhead call (relative url starting with /)
            if (is_array($arrayofcss)) {
                foreach ($arrayofcss as $cssfile) {
                    if (preg_match('/^(http|\/\/)/i', $cssfile)) {
                        $urltofile = $cssfile;
                    } else {
                        $urltofile = DolibarrFunctions::dol_buildpath($cssfile, 1);
                    }
                    print '<!-- Includes CSS added by page -->' . "\n" . '<link rel="stylesheet" type="text/css" title="default" href="' . $urltofile;
                    // We add params only if page is not static, because some web server setup does not return content type text/css if url has parameters and browser cache is not used.
                    if (!preg_match('/\.css$/i', $cssfile)) {
                        print $themeparam;
                    }
                    print '">' . "\n";
                }
            }

            print '<!-- Begin: DEBUG getRenderHeader -->' . "\n";
            print DebugTool::getRenderHeader();
            print '<!-- End: DEBUG getRenderHeader -->' . "\n";

            // Output standard javascript links
            if (!defined('DISABLE_JQUERY') && !$disablejs && !empty($this->conf->use_javascript_ajax)) {
                // JQuery. Must be before other includes
                print '<!-- Includes JS for JQuery -->' . "\n";
                if (defined('JS_JQUERY') && constant('JS_JQUERY')) {
                    print '<script src="' . JS_JQUERY . 'jquery.min.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                } else {
                    print '<script src="' . DOL_URL_ROOT . '/includes/jquery/js/jquery.min.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                }
                /*if (! empty($this->conf->global->MAIN_FEATURES_LEVEL) && ! defined('JS_JQUERY_MIGRATE_DISABLED'))
                {
                    if (defined('JS_JQUERY_MIGRATE') && constant('JS_JQUERY_MIGRATE')) print '<script src="'.JS_JQUERY_MIGRATE.'jquery-migrate.min.js'.($ext?'?'.$ext:'').'"></script>'."\n";
                    else print '<script src="'.DOL_URL_ROOT.'/includes/jquery/js/jquery-migrate.min.js'.($ext?'?'.$ext:'').'"></script>'."\n";
                }*/
                if (defined('JS_JQUERY_UI') && constant('JS_JQUERY_UI')) {
                    print '<script src="' . JS_JQUERY_UI . 'jquery-ui.min.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                } else {
                    print '<script src="' . DOL_URL_ROOT . '/includes/jquery/js/jquery-ui.min.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                }
                if (!defined('DISABLE_JQUERY_TABLEDND')) {
                    print '<script src="' . DOL_URL_ROOT . '/includes/jquery/plugins/tablednd/jquery.tablednd.min.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                }
                // jQuery jnotify
                if (empty($this->conf->global->MAIN_DISABLE_JQUERY_JNOTIFY) && !defined('DISABLE_JQUERY_JNOTIFY')) {
                    print '<script src="' . DOL_URL_ROOT . '/includes/jquery/plugins/jnotify/jquery.jnotify.min.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                }
                // Chart
                if ((empty($this->conf->global->MAIN_JS_GRAPH) || $this->conf->global->MAIN_JS_GRAPH == 'chart') && !defined('DISABLE_JS_GRAPH')) {
                    print '<script src="' . DOL_URL_ROOT . '/includes/nnnick/chartjs/dist/Chart.min.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                }

                // jQuery jeditable for Edit In Place features
                if (!empty($this->conf->global->MAIN_USE_JQUERY_JEDITABLE) && !defined('DISABLE_JQUERY_JEDITABLE')) {
                    print '<!-- JS to manage editInPlace feature -->' . "\n";
                    print '<script src="' . DOL_URL_ROOT . '/includes/jquery/plugins/jeditable/jquery.jeditable.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                    print '<script src="' . DOL_URL_ROOT . '/includes/jquery/plugins/jeditable/jquery.jeditable.ui-datepicker.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                    print '<script src="' . DOL_URL_ROOT . '/includes/jquery/plugins/jeditable/jquery.jeditable.ui-autocomplete.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                    print '<script>' . "\n";
                    print 'var urlSaveInPlace = \'' . DOL_URL_ROOT . '/core/ajax/saveinplace.php\';' . "\n";
                    print 'var urlLoadInPlace = \'' . DOL_URL_ROOT . '/core/ajax/loadinplace.php\';' . "\n";
                    print 'var tooltipInPlace = \'' . $this->langs->transnoentities('ClickToEdit') . '\';' . "\n"; // Added in title attribute of span
                    print 'var placeholderInPlace = \'&nbsp;\';' . "\n"; // If we put another string than $this->langs->trans("ClickToEdit") here, nothing is shown. If we put empty string, there is error, Why ?
                    print 'var cancelInPlace = \'' . $this->langs->trans("Cancel") . '\';' . "\n";
                    print 'var submitInPlace = \'' . $this->langs->trans('Ok') . '\';' . "\n";
                    print 'var indicatorInPlace = \'<img src="' . DOL_URL_ROOT . "/theme/" . $this->conf->theme . "/img/working.gif" . '">\';' . "\n";
                    print 'var withInPlace = 300;'; // width in pixel for default string edit
                    print '</script>' . "\n";
                    print '<script src="' . DOL_URL_ROOT . '/core/js/editinplace.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                    print '<script src="' . DOL_URL_ROOT . '/includes/jquery/plugins/jeditable/jquery.jeditable.ckeditor.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                }
                // jQuery Timepicker
                if (!empty($this->conf->global->MAIN_USE_JQUERY_TIMEPICKER) || defined('REQUIRE_JQUERY_TIMEPICKER')) {
                    print '<script src="' . DOL_URL_ROOT . '/includes/jquery/plugins/timepicker/jquery-ui-timepicker-addon.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                    print '<script src="' . DOL_URL_ROOT . '/core/js/timepicker.js.php?lang=' . $this->langs->defaultlang . ($ext ? '&amp;' . $ext : '') . '"></script>' . "\n";
                }
                if (!defined('DISABLE_SELECT2') && (!empty($this->conf->global->MAIN_USE_JQUERY_MULTISELECT) || defined('REQUIRE_JQUERY_MULTISELECT'))) {
                    // jQuery plugin "mutiselect", "multiple-select", "select2", ...
                    $tmpplugin = empty($this->conf->global->MAIN_USE_JQUERY_MULTISELECT) ? constant('REQUIRE_JQUERY_MULTISELECT') : $this->conf->global->MAIN_USE_JQUERY_MULTISELECT;
                    print '<script src="' . DOL_URL_ROOT . '/includes/jquery/plugins/' . $tmpplugin . '/dist/js/' . $tmpplugin . '.full.min.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n"; // We include full because we need the support of containerCssClass
                }
                if (!defined('DISABLE_MULTISELECT')) {     // jQuery plugin "mutiselect" to select with checkboxes. Can be removed once we have an enhanced search tool
                    print '<script src="' . DOL_URL_ROOT . '/includes/jquery/plugins/multiselect/jquery.multi-select.js' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                }
            }

            if (!$disablejs && !empty($this->conf->use_javascript_ajax)) {
                // CKEditor
                if ((!empty($this->conf->fckeditor->enabled) && (empty($this->conf->global->FCKEDITOR_EDITORNAME) || $this->conf->global->FCKEDITOR_EDITORNAME == 'ckeditor') && !defined('DISABLE_CKEDITOR')) || defined('FORCE_CKEDITOR')) {
                    print '<!-- Includes JS for CKEditor -->' . "\n";
                    $pathckeditor = DOL_URL_ROOT . '/includes/ckeditor/ckeditor/';
                    $jsckeditor = 'ckeditor.js';
                    if (constant('JS_CKEDITOR')) {
                        // To use external ckeditor 4 js lib
                        $pathckeditor = constant('JS_CKEDITOR');
                    }
                    print '<script>';
                    print '/* enable ckeditor by main.inc.php */';
                    print 'var CKEDITOR_BASEPATH = \'' . $pathckeditor . '\';' . "\n";
                    print 'var ckeditorConfig = \'' . DolibarrFunctions::dol_buildpath($themesubdir . '/theme/' . $this->conf->theme . '/ckeditor/config.js' . ($ext ? '?' . $ext : ''), 1) . '\';' . "\n"; // $themesubdir='' in standard usage
                    print 'var ckeditorFilebrowserBrowseUrl = \'' . DOL_URL_ROOT . '/core/filemanagerdol/browser/default/browser.php?Connector=' . DOL_URL_ROOT . '/core/filemanagerdol/connectors/php/connector.php\';' . "\n";
                    print 'var ckeditorFilebrowserImageBrowseUrl = \'' . DOL_URL_ROOT . '/core/filemanagerdol/browser/default/browser.php?Type=Image&Connector=' . DOL_URL_ROOT . '/core/filemanagerdol/connectors/php/connector.php\';' . "\n";
                    print '</script>' . "\n";
                    print '<script src="' . $pathckeditor . $jsckeditor . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                    print '<script>';
                    if (DolibarrFunctions::GETPOST('mode', 'aZ09') == 'Full_inline') {
                        print 'CKEDITOR.disableAutoInline = false;' . "\n";
                    } else {
                        print 'CKEDITOR.disableAutoInline = true;' . "\n";
                    }
                    print '</script>' . "\n";
                }

                // Browser notifications (if NOREQUIREMENU is on, it is mostly a page for popup, so we do not enable notif too. We hide also for public pages).
                if (!defined('NOBROWSERNOTIF') && !defined('NOREQUIREMENU') && !defined('NOLOGIN')) {
                    $enablebrowsernotif = false;
                    if (!empty($this->conf->agenda->enabled) && !empty($this->conf->global->AGENDA_REMINDER_BROWSER)) {
                        $enablebrowsernotif = true;
                    }
                    if ($this->conf->browser->layout == 'phone') {
                        $enablebrowsernotif = false;
                    }
                    if ($enablebrowsernotif) {
                        print '<!-- Includes JS of Dolibarr (browser layout = ' . $this->conf->browser->layout . ')-->' . "\n";
                        print '<script src="' . DOL_URL_ROOT . '/core/js/lib_notification.js.php' . ($ext ? '?' . $ext : '') . '"></script>' . "\n";
                    }
                }

                // Global js function
                print '<!-- Includes JS of Dolibarr -->' . "\n";
                print '<script src="' . DOL_URL_ROOT . '/core/js/lib_head.js.php?lang=' . $this->langs->defaultlang . ($ext ? '&amp;' . $ext : '') . '"></script>' . "\n";

                // JS forced by modules (relative url starting with /)
                if (!empty($this->conf->modules_parts['js'])) {        // $this->conf->modules_parts['js'] is array('module'=>array('file1','file2'))
                    $arrayjs = (array) $this->conf->modules_parts['js'];
                    foreach ($arrayjs as $modjs => $filesjs) {
                        $filesjs = (array) $filesjs; // To be sure filejs is an array
                        foreach ($filesjs as $jsfile) {
                            // jsfile is a relative path
                            print '<!-- Include JS added by module ' . $modjs . '-->' . "\n" . '<script src="' . DolibarrFunctions::dol_buildpath($jsfile, 1) . ((strpos($jsfile, '?') === false) ? '?' : '&amp;') . 'lang=' . $this->langs->defaultlang . '"></script>' . "\n";
                        }
                    }
                }
                // JS forced by page in top_htmlhead (relative url starting with /)
                if (is_array($arrayofjs)) {
                    print '<!-- Includes JS added by page -->' . "\n";
                    foreach ($arrayofjs as $jsfile) {
                        if (preg_match('/^(http|\/\/)/i', $jsfile)) {
                            print '<script src="' . $jsfile . ((strpos($jsfile, '?') === false) ? '?' : '&amp;') . 'lang=' . $this->langs->defaultlang . '"></script>' . "\n";
                        } else {
                            print '<script src="' . DolibarrFunctions::dol_buildpath($jsfile, 1) . ((strpos($jsfile, '?') === false) ? '?' : '&amp;') . 'lang=' . $this->langs->defaultlang . '"></script>' . "\n";
                        }
                    }
                }
            }

            if (!empty($head)) {
                print $head . "\n";
            }
            if (!empty($this->conf->global->MAIN_HTML_HEADER)) {
                print $this->conf->global->MAIN_HTML_HEADER . "\n";
            }

            $parameters = [];
            $result = $this->hookmanager->executeHooks('addHtmlHeader', $parameters); // Note that $action and $object may have been modified by some hooks
            print $this->hookmanager->resPrint; // Replace Title to show

            print "</head>\n\n";
        }

        $this->conf->headerdone = 1; // To tell header was output
    }

    function top_httphead($contenttype = 'text/html', $forcenocache = 0)
    {

        if ($contenttype == 'text/html') {
            header("Content-Type: text/html; charset=" . $this->conf->file->character_set_client);
        } else {
            header("Content-Type: " . $contenttype);
        }

        // Security options
        header("X-Content-Type-Options: nosniff"); // With the nosniff option, if the server says the content is text/html, the browser will render it as text/html (note that most browsers now force this option to on)
        if (!defined('XFRAMEOPTIONS_ALLOWALL')) {
            header("X-Frame-Options: SAMEORIGIN"); // Frames allowed only if on same domain (stop some XSS attacks)
        } else {
            header("X-Frame-Options: ALLOWALL");
        }
        //header("X-XSS-Protection: 1");      		// XSS filtering protection of some browsers (note: use of Content-Security-Policy is more efficient). Disabled as deprecated.
        if (!defined('FORCECSP')) {
            //if (! isset($this->conf->global->MAIN_HTTP_CONTENT_SECURITY_POLICY))
            //{
            //	// A default security policy that keep usage of js external component like ckeditor, stripe, google, working
            //	$contentsecuritypolicy = "font-src *; img-src *; style-src * 'unsafe-inline' 'unsafe-eval'; default-src 'self' *.stripe.com 'unsafe-inline' 'unsafe-eval'; script-src 'self' *.stripe.com 'unsafe-inline' 'unsafe-eval'; frame-src 'self' *.stripe.com; connect-src 'self';";
            //}
            //else
            $contentsecuritypolicy = empty($this->conf->global->MAIN_HTTP_CONTENT_SECURITY_POLICY) ? '' : $this->conf->global->MAIN_HTTP_CONTENT_SECURITY_POLICY;

            if (!is_object($this->hookmanager)) {
                $this->hookmanager = new HookManager($db);
            }
            $this->hookmanager->initHooks(["main"]);

            $parameters = ['contentsecuritypolicy' => $contentsecuritypolicy];
            $result = $this->hookmanager->executeHooks('setContentSecurityPolicy', $parameters); // Note that $action and $object may have been modified by some hooks
            if ($result > 0) {
                $contentsecuritypolicy = $this->hookmanager->resPrint; // Replace CSP
            } else {
                $contentsecuritypolicy .= $this->hookmanager->resPrint; // Concat CSP
            }

            if (!empty($contentsecuritypolicy)) {
                // For example, to restrict 'script', 'object', 'frames' or 'img' to some domains:
                // script-src https://api.google.com https://anotherhost.com; object-src https://youtube.com; frame-src https://youtube.com; img-src: https://static.example.com
                // For example, to restrict everything to one domain, except 'object', ...:
                // default-src https://cdn.example.net; object-src 'none'
                // For example, to restrict everything to itself except img that can be on other servers:
                // default-src 'self'; img-src *;
                // Pre-existing site that uses too much inline code to fix but wants to ensure resources are loaded only over https and disable plugins:
                // default-src http: https: 'unsafe-eval' 'unsafe-inline'; object-src 'none'
                header("Content-Security-Policy: " . $contentsecuritypolicy);
            }
        } elseif (constant('FORCECSP')) {
            header("Content-Security-Policy: " . constant('FORCECSP'));
        }
        if ($forcenocache) {
            header("Cache-Control: no-cache, no-store, must-revalidate, max-age=0");
        }
    }

    function top_menu($head, $title = '', $target = '', $disablejs = 0, $disablehead = 0, $arrayofjs = '', $arrayofcss = '', $morequerystring = '', $helppagename = '')
    {
        //        global $this->user, $this->conf, $this->langs, $db;
        //        global $dolibarr_main_authentication, $dolibarr_main_demo;
        //        global $this->hookmanager, $this->menumanager;

        $searchform = '';
        $bookmarks = '';

        // Instantiate hooks for external modules
        $this->hookmanager->initHooks(['toprightmenu']);

        $toprightmenu = '';

        // For backward compatibility with old modules
        if (empty($this->conf->headerdone)) {
            $disablenofollow = 0;
            top_htmlhead($head, $title, $disablejs, $disablehead, $arrayofjs, $arrayofcss, 0, $disablenofollow);
            print '<body id="mainbody">';
        }

        /*
         * Top menu
         */
        if (!defined('MAIN_HIDE_TOP_MENU') || constant('MAIN_HIDE_TOP_MENU') != 1 || (empty($this->conf->dol_hide_topmenu) || DolibarrFunctions::GETPOST('dol_invisible_topmenu', 'int')) && (!defined('NOREQUIREMENU') || !constant('NOREQUIREMENU'))) {
            if (!isset($form) || !is_object($form)) {
                //                include_once DOL_DOCUMENT_ROOT . '/core/class/html.form.class.php';
                $form = new Form($db);
            }

            print "\n" . '<!-- Start top horizontal -->' . "\n";

            print '<div class="side-nav-vert' . (DolibarrFunctions::GETPOST('dol_invisible_topmenu', 'int') ? ' hidden' : '') . '"><div id="id-top">'; // dol_invisible_topmenu differs from dol_hide_topmenu: dol_invisible_topmenu means we output menu but we make it invisible.

            // Show menu entries
            print '<div id="tmenu_tooltip' . (empty($this->conf->global->MAIN_MENU_INVERT) ? '' : 'invert') . '" class="tmenu">' . "\n";
            $this->menumanager->atarget = $target;
            $this->menumanager->showmenu('top', ['searchform' => $searchform, 'bookmarks' => $bookmarks]); // This contains a \n
            print "</div>\n";

            // Define link to login card
            $appli = constant('DOL_APPLICATION_TITLE');
            if (!empty($this->conf->global->MAIN_APPLICATION_TITLE)) {
                $appli = $this->conf->global->MAIN_APPLICATION_TITLE;
                if (preg_match('/\d\.\d/', $appli)) {
                    if (!preg_match('/' . preg_quote(DOL_VERSION) . '/', $appli)) {
                        $appli .= " (" . DOL_VERSION . ")"; // If new title contains a version that is different than core
                    }
                } else {
                    $appli .= " " . DOL_VERSION;
                }
            } else {
                $appli .= " " . DOL_VERSION;
            }

            if (!empty($this->conf->global->MAIN_FEATURES_LEVEL)) {
                $appli .= "<br>" . $this->langs->trans("LevelOfFeature") . ': ' . $this->conf->global->MAIN_FEATURES_LEVEL;
            }

            $logouttext = '';
            $logouthtmltext = '';
            if (empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
                //$logouthtmltext=$appli.'<br>';
                if ($_SESSION["dol_authmode"] != 'forceuser' && $_SESSION["dol_authmode"] != 'http') {
                    $logouthtmltext .= $this->langs->trans("Logout") . '<br>';

                    $logouttext .= '<a accesskey="l" href="' . DOL_URL_ROOT . '?module=Users&controller=logout">';
                    $logouttext .= DolibarrFunctions::img_picto($this->langs->trans('Logout'), 'sign-out', '', false, 0, 0, '', 'atoplogin');
                    $logouttext .= '</a>';
                } else {
                    $logouthtmltext .= $this->langs->trans("NoLogoutProcessWithAuthMode", $_SESSION["dol_authmode"]);
                    $logouttext .= DolibarrFunctions::img_picto($this->langs->trans('Logout'), 'sign-out', '', false, 0, 0, '', 'atoplogin opacitymedium');
                }
            }

            print '<div class="login_block usedropdown">' . "\n";

            $toprightmenu .= '<div class="login_block_other">';

            // Execute hook printTopRightMenu (hooks should output string like '<div class="login"><a href="">mylink</a></div>')
            $parameters = [];
            $result = $this->hookmanager->executeHooks('printTopRightMenu', $parameters); // Note that $action and $object may have been modified by some hooks
            if (is_numeric($result)) {
                if ($result == 0) {
                    $toprightmenu .= $this->hookmanager->resPrint; // add
                } else {
                    $toprightmenu = $this->hookmanager->resPrint; // replace
                }
            } else {
                $toprightmenu .= $result; // For backward compatibility
            }

            // Link to module builder
            if (!empty($this->conf->modulebuilder->enabled)) {
                $text = '<a href="' . DOL_URL_ROOT . '/modulebuilder/index.php?mainmenu=home&leftmenu=admintools" target="modulebuilder">';
                //$text.= DolibarrFunctions::img_picto(":".$this->langs->trans("ModuleBuilder"), 'printer_top.png', 'class="printer"');
                $text .= '<span class="fa fa-bug atoplogin valignmiddle"></span>';
                $text .= '</a>';
                $toprightmenu .= $form->textwithtooltip('', $this->langs->trans("ModuleBuilder"), 2, 1, $text, 'login_block_elem', 2);
            }

            // Link to print main content area
            if (empty($this->conf->global->MAIN_PRINT_DISABLELINK) && empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER) && $this->conf->browser->layout != 'phone') {
                $qs = DolibarrFunctions::dol_escape_htmltag($_SERVER["QUERY_STRING"]);

                if (isset($_POST) && is_array($_POST)) {
                    foreach ($_POST as $key => $value) {
                        if ($key !== 'action' && $key !== 'password' && !is_array($value)) {
                            $qs .= '&' . $key . '=' . urlencode($value);
                        }
                    }
                }
                $qs .= (($qs && $morequerystring) ? '&' : '') . $morequerystring;
                $text = '<a href="' . DolibarrFunctions::dol_escape_htmltag($_SERVER["PHP_SELF"]) . '?' . $qs . ($qs ? '&' : '') . 'optioncss=print" target="_blank">';
                //$text.= DolibarrFunctions::img_picto(":".$this->langs->trans("PrintContentArea"), 'printer_top.png', 'class="printer"');
                $text .= '<span class="fa fa-print atoplogin valignmiddle"></span>';
                $text .= '</a>';
                $toprightmenu .= $form->textwithtooltip('', $this->langs->trans("PrintContentArea"), 2, 1, $text, 'login_block_elem', 2);
            }

            // Link to Dolibarr wiki pages
            if (empty($this->conf->global->MAIN_HELP_DISABLELINK) && empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
                $this->langs->load("help");

                $helpbaseurl = '';
                $helppage = '';
                $mode = '';
                $helppresent = '';

                if (empty($helppagename)) {
                    $helppagename = 'EN:User_documentation|FR:Documentation_utilisateur|ES:Documentación_usuarios';
                } else {
                    $helppresent = 'helppresent';
                }

                // Get helpbaseurl, helppage and mode from helppagename and langs
                $arrayres = $this->getHelpParamFor($helppagename, $this->langs);
                $helpbaseurl = $arrayres['helpbaseurl'];
                $helppage = $arrayres['helppage'];
                $mode = $arrayres['mode'];

                // Link to help pages
                if ($helpbaseurl && $helppage) {
                    $text = '';
                    $title = $this->langs->trans($mode == 'wiki' ? 'GoToWikiHelpPage' : 'GoToHelpPage') . '...';
                    if ($mode == 'wiki') {
                        $title .= '<br>' . $this->langs->trans("PageWiki") . ' ' . DolibarrFunctions::dol_escape_htmltag('"' . strtr($helppage, '_', ' ') . '"');
                        if ($helppresent) {
                            $title .= ' <span class="opacitymedium">(' . $this->langs->trans("DedicatedPageAvailable") . ')</span>';
                        } else {
                            $title .= ' <span class="opacitymedium">(' . $this->langs->trans("HomePage") . ')</span>';
                        }
                    }
                    $text .= '<a class="help" target="_blank" rel="noopener" href="';
                    if ($mode == 'wiki') {
                        $text .= sprintf($helpbaseurl, urlencode(html_entity_decode($helppage)));
                    } else {
                        $text .= sprintf($helpbaseurl, $helppage);
                    }
                    $text .= '">';
                    $text .= '<span class="fa fa-question-circle atoplogin valignmiddle' . ($helppresent ? ' ' . $helppresent : '') . '"></span>';
                    $text .= '<span class="fa fa-circle helppresentcircle' . ($helppresent ? '' : ' unvisible') . '"></span>';
                    $text .= '</a>';
                    $toprightmenu .= $form->textwithtooltip('', $title, 2, 1, $text, 'login_block_elem', 2);
                }

                // Version
                if (!empty($this->conf->global->MAIN_SHOWDATABASENAMEINHELPPAGESLINK)) {
                    $this->langs->load('admin');
                    $appli .= '<br>' . $this->langs->trans("Database") . ': ' . $db->database_name;
                }
            }

            if (empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
                $text = '<span class="aversion"><span class="hideonsmartphone small">' . DOL_VERSION . '</span></span>';
                $toprightmenu .= $form->textwithtooltip('', $appli, 2, 1, $text, 'login_block_elem', 2);
            }

            // Logout link
            $toprightmenu .= $form->textwithtooltip('', $logouthtmltext, 2, 1, $logouttext, 'login_block_elem logout-btn', 2);

            $toprightmenu .= '</div>'; // end div class="login_block_other"

            // Add login user link
            $toprightmenu .= '<div class="login_block_user">';

            // Login name with photo and tooltip
            $mode = -1;
            $toprightmenu .= '<div class="inline-block nowrap"><div class="inline-block login_block_elem login_block_elem_name" style="padding: 0px;">';

            if (!empty($this->conf->global->MAIN_USE_TOP_MENU_SEARCH_DROPDOWN)) {
                // Add search dropdown
                $toprightmenu .= $this->top_menu_search();
            }

            if (!empty($this->conf->global->MAIN_USE_TOP_MENU_QUICKADD_DROPDOWN)) {
                // Add search dropdown
                $toprightmenu .= $this->top_menu_quickadd();
            }

            // Add bookmark dropdown
            $toprightmenu .= $this->top_menu_bookmark();

            // Add user dropdown
            $toprightmenu .= $this->top_menu_user();

            $toprightmenu .= '</div></div>';

            $toprightmenu .= '</div>' . "\n";

            print $toprightmenu;

            print "</div>\n"; // end div class="login_block"

            print '</div></div>';

            print '<div style="clear: both;"></div>';
            print "<!-- End top horizontal menu -->\n\n";
        }

        if (!defined('MAIN_HIDE_TOP_MENU') || constant('MAIN_HIDE_TOP_MENU') != 1 || (empty($this->conf->dol_hide_leftmenu) && empty($this->conf->dol_use_jmobile))) {
            print '<!-- Begin div id-container --><div id="id-container" class="id-container">';
        }
    }

    function getHelpParamFor($helppagename, $langs)
    {
        $helpbaseurl = '';
        $helppage = '';
        $mode = '';

        if (preg_match('/^http/i', $helppagename)) {
            // If complete URL
            $helpbaseurl = '%s';
            $helppage = $helppagename;
            $mode = 'local';
        } else {
            // If WIKI URL
            $reg = [];
            if (preg_match('/^es/i', $this->langs->defaultlang)) {
                $helpbaseurl = 'http://wiki.dolibarr.org/index.php/%s';
                if (preg_match('/ES:([^|]+)/i', $helppagename, $reg)) {
                    $helppage = $reg[1];
                }
            }
            if (preg_match('/^fr/i', $this->langs->defaultlang)) {
                $helpbaseurl = 'http://wiki.dolibarr.org/index.php/%s';
                if (preg_match('/FR:([^|]+)/i', $helppagename, $reg)) {
                    $helppage = $reg[1];
                }
            }
            if (empty($helppage)) {    // If help page not already found
                $helpbaseurl = 'http://wiki.dolibarr.org/index.php/%s';
                if (preg_match('/EN:([^|]+)/i', $helppagename, $reg)) {
                    $helppage = $reg[1];
                }
            }
            $mode = 'wiki';
        }
        return ['helpbaseurl' => $helpbaseurl, 'helppage' => $helppage, 'mode' => $mode];
    }

    function top_menu_search()
    {
        //        global $this->langs, $this->conf, $db, $this->user, $this->hookmanager;

        $html = '';

        $usedbyinclude = 1;
        $arrayresult = null;
        include DOL_DOCUMENT_ROOT . '/core/ajax/selectsearchbox.php'; // This set $arrayresult

        $defaultAction = '';
        $buttonList = '<div class="dropdown-global-search-button-list" >';
        // Menu with all searchable items
        foreach ($arrayresult as $keyItem => $item) {
            if (empty($defaultAction)) {
                $defaultAction = $item['url'];
            }
            $buttonList .= '<button class="dropdown-item global-search-item" data-target="' . DolibarrFunctions::dol_escape_htmltag($item['url']) . '" >';
            $buttonList .= $item['text'];
            $buttonList .= '</button>';
        }
        $buttonList .= '</div>';

        $searchInput = '<input name="sall" id="top-global-search-input" class="dropdown-search-input" placeholder="' . $this->langs->trans('Search') . '" autocomplete="off" >';

        $dropDownHtml = '<form id="top-menu-action-search" name="actionsearch" method="GET" action="' . $defaultAction . '" >';

        $dropDownHtml .= '
        <!-- search input -->
        <div class="dropdown-header search-dropdown-header">
            ' . $searchInput . '
        </div>
    ';

        $dropDownHtml .= '
        <!-- Menu Body -->
        <div class="dropdown-body search-dropdown-body">
        ' . $buttonList . '
        </div>
        ';

        $dropDownHtml .= '</form>';

        $html .= '<!-- div for Global Search -->
    <div id="topmenu-global-search-dropdown" class="atoplogin dropdown inline-block">
        <a class="dropdown-toggle login-dropdown-a" data-toggle="dropdown" href="#" title="' . $this->langs->trans('Search') . ' (' . $this->langs->trans('SearchMenuShortCut') . ')">
            <i class="fa fa-search" ></i>
        </a>
        <div class="dropdown-menu dropdown-search">
            ' . $dropDownHtml . '
        </div>
    </div>';

        $html .= '
    <!-- Code to show/hide the user drop-down -->
    <script>
    $( document ).ready(function() {

        // prevent submiting form on press ENTER
        $("#top-global-search-input").keydown(function (e) {
            if (e.keyCode == 13) {
                var inputs = $(this).parents("form").eq(0).find(":button");
                if (inputs[inputs.index(this) + 1] != null) {
                    inputs[inputs.index(this) + 1].focus();
                }
                e.preventDefault();
                return false;
            }
        });

        // arrow key nav
        $(document).keydown(function(e) {
			// Get the focused element:
			var $focused = $(":focus");
			if($focused.length && $focused.hasClass("global-search-item")){

           		// UP - move to the previous line
				if (e.keyCode == 38) {
				    e.preventDefault();
					$focused.prev().focus();
				}

				// DOWN - move to the next line
				if (e.keyCode == 40) {
				    e.preventDefault();
					$focused.next().focus();
				}
			}
        });


        // submit form action
        $(".dropdown-global-search-button-list .global-search-item").on("click", function(event) {
            $("#top-menu-action-search").attr("action", $(this).data("target"));
            $("#top-menu-action-search").submit();
        });

        // close drop down
        $(document).on("click", function(event) {
			if (!$(event.target).closest("#topmenu-global-search-dropdown").length) {
				console.log("click close search - we click outside");
                // Hide the menus.
                $("#topmenu-global-search-dropdown").removeClass("open");
            }
        });

        // Open drop down
        $("#topmenu-global-search-dropdown .dropdown-toggle").on("click", function(event) {
			console.log("toggle search dropdown");
            openGlobalSearchDropDown();
        });

        // Key map shortcut
        $(document).keydown(function(e){
              if( e.which === 70 && e.ctrlKey && e.shiftKey ){
                 console.log(\'control + shift + f : trigger open global-search dropdown\');
                 openGlobalSearchDropDown();
              }
        });


        var openGlobalSearchDropDown = function() {
            $("#topmenu-global-search-dropdown").toggleClass("open");
            $("#top-global-search-input").focus();
        }

    });
    </script>
    ';

        return $html;
    }

    function top_menu_quickadd()
    {
        //        global $this->langs, $this->conf, $db, $this->hookmanager, $this->user;
        //        global $this->menumanager;

        $html = '';
        // Define $dropDownQuickAddHtml
        $dropDownQuickAddHtml = '<div class="dropdown-header bookmark-header center">';
        $dropDownQuickAddHtml .= $this->langs->trans('QuickAdd');
        $dropDownQuickAddHtml .= '</div>';

        $dropDownQuickAddHtml .= '<div class="quickadd-body dropdown-body">';
        $dropDownQuickAddHtml .= '<div class="quickadd">';
        if (!empty($this->conf->societe->enabled) && $this->user->rights->societe->creer) {
            $this->langs->load("companies");
            $dropDownQuickAddHtml .= '
                <!-- Thirdparty link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/index.php?module=societes&controller=card&action=create" title="' . $this->langs->trans("MenuNewThirdParty") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_company') . '<br>' . $this->langs->trans("ThirdParty") . '</a>
                </div>
                ';
        }

        if (!empty($this->conf->societe->enabled) && $this->user->rights->societe->contact->creer) {
            $this->langs->load("companies");
            $dropDownQuickAddHtml .= '
                <!-- Contact link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/Modules/Contacts/card.php?action=create" title="' . $this->langs->trans("NewContactAddress") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_contact') . '<br>' . $this->langs->trans("Contact") . '</a>
                </div>
                ';
        }

        if (!empty($this->conf->propal->enabled) && $this->user->rights->propale->creer) {
            $this->langs->load("propal");
            $dropDownQuickAddHtml .= '
                <!-- Propal link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/Modules/Comm/propal/card.php?action=create" title="' . $this->langs->trans("NewPropal") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_propal') . '<br>' . $this->langs->trans("Proposal") . '</a>
                </div>
                ';
        }

        if (!empty($this->conf->commande->enabled) && $this->user->rights->commande->creer) {
            $this->langs->load("orders");
            $dropDownQuickAddHtml .= '
                <!-- Order link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/Modules/Commande/card.php?action=create" title="' . $this->langs->trans("NewOrder") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_order') . '<br>' . $this->langs->trans("Order") . '</a>
                </div>
                ';
        }

        if (!empty($this->conf->facture->enabled) && $this->user->rights->facture->creer) {
            $this->langs->load("bills");
            $dropDownQuickAddHtml .= '
                <!-- Invoice link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/Modules/Compta/facture/card.php?action=create" title="' . $this->langs->trans("NewBill") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_bill') . '<br>' . $this->langs->trans("Bill") . '</a>
                </div>
                ';
        }

        if (!empty($this->conf->contrat->enabled) && $this->user->rights->contrat->creer) {
            $this->langs->load("contracts");
            $dropDownQuickAddHtml .= '
                <!-- Contract link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/Modules/Compta/facture/card.php?action=create" title="' . $this->langs->trans("NewContractSubscription") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_contract') . '<br>' . $this->langs->trans("Contract") . '</a>
                </div>
                ';
        }

        if (!empty($this->conf->supplier_proposal->enabled) && $this->user->rights->supplier_proposal->creer) {
            $this->langs->load("supplier_proposal");
            $dropDownQuickAddHtml .= '
                <!-- Supplier proposal link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/supplier_proposal/card.php?action=create" title="' . $this->langs->trans("NewAskPrice") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_propal') . '<br>' . $this->langs->trans("AskPrice") . '</a>
                </div>
                ';
        }

        if ((!empty($this->conf->fournisseur->enabled) && empty($this->conf->global->MAIN_USE_NEW_SUPPLIERMOD) && $this->user->rights->fournisseur->commande->creer) || (!empty($this->conf->supplier_order->enabled) && $this->user->rights->supplier_order->creer)) {
            $this->langs->load("orders");
            $dropDownQuickAddHtml .= '
                <!-- Supplier order link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/Modules/Fourn/commande/card.php?action=create" title="' . $this->langs->trans("NewSupplierOrderShort") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_order') . '<br>' . $this->langs->trans("SupplierOrder") . '</a>
                </div>
                ';
        }

        if ((!empty($this->conf->fournisseur->enabled) && empty($this->conf->global->MAIN_USE_NEW_SUPPLIERMOD) && $this->user->rights->fournisseur->facture->creer) || (!empty($this->conf->supplier_invoice->enabled) && $this->user->rights->supplier_invoice->creer)) {
            $this->langs->load("bills");
            $dropDownQuickAddHtml .= '
                <!-- Supplier invoice link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/Modules/Fourn/facture/card.php?action=create" title="' . $this->langs->trans("NewBill") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_bill') . '<br>' . $this->langs->trans("SupplierBill") . '</a>
                </div>
                ';
        }

        if (!empty($this->conf->product->enabled) && $this->user->rights->produit->creer) {
            $this->langs->load("products");
            $dropDownQuickAddHtml .= '
                <!-- Product link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/Modules/Products/card.php?action=create&amp;type=0" title="' . $this->langs->trans("NewProduct") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_product') . '<br>' . $this->langs->trans("Product") . '</a>
                </div>
                ';
        }

        if (!empty($this->conf->service->enabled) && $this->user->rights->service->creer) {
            $this->langs->load("products");
            $dropDownQuickAddHtml .= '
                <!-- Service link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/Modules/Products/card.php?action=create&amp;type=1" title="' . $this->langs->trans("NewService") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_service') . '<br>' . $this->langs->trans("Service") . '</a>
                </div>
                ';
        }

        if (!empty($this->conf->expensereport->enabled) && $this->user->rights->expensereport->creer) {
            $this->langs->load("trips");
            $dropDownQuickAddHtml .= '
                <!-- Expense report link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/Modules/ExpenseReports/card.php?action=create&fk_user_author=' . $this->user->id . '" title="' . $this->langs->trans("AddTrip") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_trip') . '<br>' . $this->langs->trans("ExpenseReport") . '</a>
                </div>
                ';
        }

        if (!empty($this->conf->holiday->enabled) && $this->user->rights->holiday->write) {
            $this->langs->load("holiday");
            $dropDownQuickAddHtml .= '
                <!-- Holiday link -->
                <div class="quickaddblock center">
                    <a class="quickadddropdown-icon-link" href="' . DOL_URL_ROOT . '/Modules/Holiday/card.php?action=create&fuserid=' . $this->user->id . '" title="' . $this->langs->trans("AddCP") . '">
                    ' . DolibarrFunctions::img_picto('', 'object_holiday') . '<br>' . $this->langs->trans("Holidays") . '</a>
                </div>
                ';
        }

        // Execute hook printTopRightMenu (hooks should output string like '<div class="login"><a href="">mylink</a></div>')
        $parameters = [];
        $result = $this->hookmanager->executeHooks('printQuickAddBlock', $parameters); // Note that $action and $object may have been modified by some hooks
        if (is_numeric($result)) {
            if ($result == 0) {
                $dropDownQuickAddHtml .= $this->hookmanager->resPrint; // add
            } else {
                $dropDownQuickAddHtml = $this->hookmanager->resPrint; // replace
            }
        } else {
            $dropDownQuickAddHtml .= $result; // For backward compatibility
        }

        $dropDownQuickAddHtml .= '</div>';
        $dropDownQuickAddHtml .= '</div>';

        $html .= '<!-- div for quick add link -->
    <div id="topmenu-quickadd-dropdown" class="atoplogin dropdown inline-block">
        <a class="dropdown-toggle login-dropdown-a" data-toggle="dropdown" href="#" title="' . $this->langs->trans('QuickAdd') . ' (' . $this->langs->trans('QuickAddMenuShortCut') . ')">
            <i class="fa fa-plus-circle" ></i>
        </a>

        <div class="dropdown-menu">
            ' . $dropDownQuickAddHtml . '
        </div>
    </div>';
        $html .= '
        <!-- Code to show/hide the user drop-down -->
        <script>
        $( document ).ready(function() {
            $(document).on("click", function(event) {
                if (!$(event.target).closest("#topmenu-quickadd-dropdown").length) {
                    // Hide the menus.
                    $("#topmenu-quickadd-dropdown").removeClass("open");
                }
            });
            $("#topmenu-quickadd-dropdown .dropdown-toggle").on("click", function(event) {
                openQuickAddDropDown();
            });
            // Key map shortcut
            $(document).keydown(function(e){
                  if( e.which === 76 && e.ctrlKey && e.shiftKey ){
                     console.log(\'control + shift + l : trigger open quick add dropdown\');
                     openQuickAddDropDown();
                  }
            });


            var openQuickAddDropDown = function() {
                event.preventDefault();
                $("#topmenu-quickadd-dropdown").toggleClass("open");
                //$("#top-quickadd-search-input").focus();
            }
        });
        </script>
        ';
        return $html;
    }

    function top_menu_bookmark()
    {
        //        global $this->langs, $this->conf, $db, $this->user;

        $html = '';

        // Define $bookmarks
        if (empty($this->conf->bookmark->enabled) || empty($this->user->rights->bookmark->lire)) {
            return $html;
        }

        if (!defined('JS_JQUERY_DISABLE_DROPDOWN') && !empty($this->conf->use_javascript_ajax)) {        // This may be set by some pages that use different jquery version to avoid errors
            // include_once DOL_DOCUMENT_ROOT . '/Modules/Bookmarks/bookmarks.lib.php';

            $this->langs->load("bookmarks");

            if (!empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
                $html .= '<div id="topmenu-bookmark-dropdown" class="dropdown inline-block">';
                $html .= DolibarrBookmarks::printDropdownBookmarksList();
                $html .= '</div>';
            } else {
                $html .= '<!-- div for bookmark link -->
	        <div id="topmenu-bookmark-dropdown" class="dropdown inline-block">
	            <a class="dropdown-toggle login-dropdown-a" data-toggle="dropdown" href="#" title="' . $this->langs->trans('Bookmarks') . ' (' . $this->langs->trans('BookmarksMenuShortCut') . ')">
	                <i class="fa fa-star" ></i>
	            </a>
	            <div class="dropdown-menu">
	                ' . DolibarrBookmarks::printDropdownBookmarksList() . '
	            </div>
	        </div>';

                $html .= '
	        <!-- Code to show/hide the bookmark drop-down -->
	        <script>
	        $( document ).ready(function() {
	            $(document).on("click", function(event) {
	                if (!$(event.target).closest("#topmenu-bookmark-dropdown").length) {
						//console.log("close bookmark dropdown - we click outside");
	                    // Hide the menus.
	                    $("#topmenu-bookmark-dropdown").removeClass("open");
	                }
	            });

	            $("#topmenu-bookmark-dropdown .dropdown-toggle").on("click", function(event) {
					console.log("toggle bookmark dropdown");
					openBookMarkDropDown();
	            });

	            // Key map shortcut
	            $(document).keydown(function(e){
	                  if( e.which === 77 && e.ctrlKey && e.shiftKey ){
	                     console.log(\'control + shift + m : trigger open bookmark dropdown\');
	                     openBookMarkDropDown();
	                  }
	            });


	            var openBookMarkDropDown = function() {
	                event.preventDefault();
	                $("#topmenu-bookmark-dropdown").toggleClass("open");
	                $("#top-bookmark-search-input").focus();
	            }

	        });
	        </script>
	        ';
            }
        }
        return $html;
    }

    function top_menu_user($hideloginname = 0, $urllogout = '')
    {
        //        global $this->langs, $this->conf, $db, $this->hookmanager, $this->user, $this->mysoc;
        //        global $dolibarr_main_authentication, $dolibarr_main_demo;
        //        global $this->menumanager;

        $this->langs->load('companies');

        $this->userImage = $this->userDropDownImage = '';
        if (!empty($this->user->photo)) {
            $this->userImage = Form::showphoto('userphoto', $this->user, 0, 0, 0, 'photouserphoto userphoto', 'small', 0, 1);
            $this->userDropDownImage = Form::showphoto('userphoto', $this->user, 0, 0, 0, 'dropdown-user-image', 'small', 0, 1);
        } else {
            // Top Menú User
            $_nophoto = 'user_anonymous.png';
            if ($this->user->gender == 'man') {
                $_nophoto = 'user_man.png';
            }
            if ($this->user->gender == 'woman') {
                $_nophoto = 'user_woman.png';
            }
            $nophoto = '/theme/common/' . $_nophoto;

            $this->userImage = '<img class="photo photouserphoto userphoto" alt="No photo" src="' . DOL_URL_ROOT . $nophoto . '">';
            $this->userDropDownImage = '<img class="photo dropdown-user-image" alt="No photo" src="' . DOL_URL_ROOT . $nophoto . '">';
        }

        $dropdownBody = '';
        $dropdownBody .= '<span id="topmenulogincompanyinfo-btn"><i class="fa fa-caret-right"></i> ' . $this->langs->trans("ShowCompanyInfos") . '</span>';
        $dropdownBody .= '<div id="topmenulogincompanyinfo" >';

        if ($this->langs->transcountry("ProfId1", $this->mysoc->country_code) != '-') {
            $dropdownBody .= '<br><b>' . $this->langs->transcountry("ProfId1", $this->mysoc->country_code) . '</b>: <span>' . DolibarrFunctions::showValueWithClipboardCPButton(DolibarrFunctions::getDolGlobalString("MAIN_INFO_SIREN")) . '</span>';
        }
        if ($this->langs->transcountry("ProfId2", $this->mysoc->country_code) != '-') {
            $dropdownBody .= '<br><b>' . $this->langs->transcountry("ProfId2", $this->mysoc->country_code) . '</b>: <span>' . DolibarrFunctions::showValueWithClipboardCPButton(DolibarrFunctions::getDolGlobalString("MAIN_INFO_SIRET")) . '</span>';
        }
        if ($this->langs->transcountry("ProfId3", $this->mysoc->country_code) != '-') {
            $dropdownBody .= '<br><b>' . $this->langs->transcountry("ProfId3", $this->mysoc->country_code) . '</b>: <span>' . DolibarrFunctions::showValueWithClipboardCPButton(DolibarrFunctions::getDolGlobalString("MAIN_INFO_APE")) . '</span>';
        }
        if ($this->langs->transcountry("ProfId4", $this->mysoc->country_code) != '-') {
            $dropdownBody .= '<br><b>' . $this->langs->transcountry("ProfId4", $this->mysoc->country_code) . '</b>: <span>' . DolibarrFunctions::showValueWithClipboardCPButton(DolibarrFunctions::getDolGlobalString("MAIN_INFO_RCS")) . '</span>';
        }
        if ($this->langs->transcountry("ProfId5", $this->mysoc->country_code) != '-') {
            $dropdownBody .= '<br><b>' . $this->langs->transcountry("ProfId5", $this->mysoc->country_code) . '</b>: <span>' . DolibarrFunctions::showValueWithClipboardCPButton(DolibarrFunctions::getDolGlobalString("MAIN_INFO_PROFID5")) . '</span>';
        }
        if ($this->langs->transcountry("ProfId6", $this->mysoc->country_code) != '-') {
            $dropdownBody .= '<br><b>' . $this->langs->transcountry("ProfId6", $this->mysoc->country_code) . '</b>: <span>' . DolibarrFunctions::showValueWithClipboardCPButton(DolibarrFunctions::getDolGlobalString("MAIN_INFO_PROFID6")) . '</span>';
        }
        $dropdownBody .= '<br><b>' . $this->langs->trans("VATIntraShort") . '</b>: <span>' . DolibarrFunctions::showValueWithClipboardCPButton(DolibarrFunctions::getDolGlobalString("MAIN_INFO_TVAINTRA")) . '</span>';

        $dropdownBody .= '</div>';

        $dropdownBody .= '<br>';
        $dropdownBody .= '<span id="topmenuloginmoreinfo-btn"><i class="fa fa-caret-right"></i> ' . $this->langs->trans("ShowMoreInfos") . '</span>';
        $dropdownBody .= '<div id="topmenuloginmoreinfo" >';

        // login infos
        if (!empty($this->user->admin)) {
            $dropdownBody .= '<br><b>' . $this->langs->trans("Administrator") . '</b>: ' . DolibarrFunctions::yn($this->user->admin);
        }
        if (!empty($this->user->socid)) {    // Add thirdparty for external users
            $thirdpartystatic = new Societe($db);
            $thirdpartystatic->fetch($this->user->socid);
            $companylink = ' ' . $thirdpartystatic->getNomUrl(2); // picto only of company
            $company = ' (' . $this->langs->trans("Company") . ': ' . $thirdpartystatic->name . ')';
        }
        $type = ($this->user->socid ? $this->langs->trans("External") . $company : $this->langs->trans("Internal"));
        $dropdownBody .= '<br><b>' . $this->langs->trans("Type") . ':</b> ' . $type;
        $dropdownBody .= '<br><b>' . $this->langs->trans("Status") . '</b>: ' . $this->user->getLibStatut(0);
        $dropdownBody .= '<br>';

        $dropdownBody .= '<br><u>' . $this->langs->trans("Session") . '</u>';
        $dropdownBody .= '<br><b>' . $this->langs->trans("IPAddress") . '</b>: ' . DolibarrFunctions::dol_escape_htmltag($_SERVER["REMOTE_ADDR"]);
        if (!empty($this->conf->global->MAIN_MODULE_MULTICOMPANY)) {
            $dropdownBody .= '<br><b>' . $this->langs->trans("ConnectedOnMultiCompany") . ':</b> ' . $this->conf->entity . ' (user entity ' . $this->user->entity . ')';
        }
        $dropdownBody .= '<br><b>' . $this->langs->trans("AuthenticationMode") . ':</b> ' . $_SESSION["dol_authmode"] . (empty($dolibarr_main_demo) ? '' : ' (demo)');
        $dropdownBody .= '<br><b>' . $this->langs->trans("ConnectedSince") . ':</b> ' . DolibarrFunctions::dol_print_date($this->user->datelastlogin, "dayhour", 'tzuser');
        $dropdownBody .= '<br><b>' . $this->langs->trans("PreviousConnexion") . ':</b> ' . DolibarrFunctions::dol_print_date($this->user->datepreviouslogin, "dayhour", 'tzuser');
        $dropdownBody .= '<br><b>' . $this->langs->trans("CurrentTheme") . ':</b> ' . $this->conf->theme;
        $dropdownBody .= '<br><b>' . $this->langs->trans("CurrentMenuManager") . ':</b> ' . (isset($this->menumanager) ? $this->menumanager->name : 'unknown');
        $langFlag = DolibarrFunctions::picto_from_langcode($this->langs->getDefaultLang());
        $dropdownBody .= '<br><b>' . $this->langs->trans("CurrentUserLanguage") . ':</b> ' . ($langFlag ? $langFlag . ' ' : '') . $this->langs->getDefaultLang();

        $tz = (int) $_SESSION['dol_tz'] + (int) $_SESSION['dol_dst'];
        $dropdownBody .= '<br><b>' . $this->langs->trans("ClientTZ") . ':</b> ' . ($tz ? ($tz >= 0 ? '+' : '') . $tz : '');
        $dropdownBody .= ' (' . $_SESSION['dol_tz_string'] . ')';
        //$dropdownBody .= ' &nbsp; &nbsp; &nbsp; '.$this->langs->trans("DaylingSavingTime").': ';
        //if ($_SESSION['dol_dst'] > 0) $dropdownBody .= DolibarrFunctions::yn(1);
        //else $dropdownBody .= DolibarrFunctions::yn(0);

        $dropdownBody .= '<br><b>' . $this->langs->trans("Browser") . ':</b> ' . $this->conf->browser->name . ($this->conf->browser->version ? ' ' . $this->conf->browser->version : '') . ' (' . DolibarrFunctions::dol_escape_htmltag($_SERVER['HTTP_USER_AGENT']) . ')';
        $dropdownBody .= '<br><b>' . $this->langs->trans("Layout") . ':</b> ' . $this->conf->browser->layout;
        $dropdownBody .= '<br><b>' . $this->langs->trans("Screen") . ':</b> ' . $_SESSION['dol_screenwidth'] . ' x ' . $_SESSION['dol_screenheight'];
        if ($this->conf->browser->layout == 'phone') {
            $dropdownBody .= '<br><b>' . $this->langs->trans("Phone") . ':</b> ' . $this->langs->trans("Yes");
        }
        if (!empty($_SESSION["disablemodules"])) {
            $dropdownBody .= '<br><b>' . $this->langs->trans("DisabledModules") . ':</b> <br>' . join(', ', explode(',', $_SESSION["disablemodules"]));
        }
        $dropdownBody .= '</div>';

        // Execute hook
        $parameters = ['user' => $this->user, 'langs' => $this->langs];
        $result = $this->hookmanager->executeHooks('printTopRightMenuLoginDropdownBody', $parameters); // Note that $action and $object may have been modified by some hooks
        if (is_numeric($result)) {
            if ($result == 0) {
                $dropdownBody .= $this->hookmanager->resPrint; // add
            } else {
                $dropdownBody = $this->hookmanager->resPrint; // replace
            }
        }

        if (empty($urllogout)) {
            $urllogout = DOL_URL_ROOT . '?module=Users&controller=logout';
        }
        $logoutLink = '<a accesskey="l" href="' . $urllogout . '" class="button-top-menu-dropdown" ><i class="fa fa-sign-out-alt"></i> ' . $this->langs->trans("Logout") . '</a>';
        $profilLink = '<a accesskey="l" href="' . DOL_URL_ROOT . '/Modules/Users/card.php?id=' . $this->user->id . '" class="button-top-menu-dropdown" ><i class="fa fa-user"></i>  ' . $this->langs->trans("Card") . '</a>';

        $profilName = $this->user->getFullName($this->langs) . ' (' . $this->user->login . ')';

        if (!empty($this->user->admin)) {
            $profilName = '<i class="far fa-star classfortooltip" title="' . $this->langs->trans("Administrator") . '" ></i> ' . $profilName;
        }

        // Define version to show
        $appli = constant('DOL_APPLICATION_TITLE');
        if (!empty($this->conf->global->MAIN_APPLICATION_TITLE)) {
            $appli = $this->conf->global->MAIN_APPLICATION_TITLE;
            if (preg_match('/\d\.\d/', $appli)) {
                if (!preg_match('/' . preg_quote(DOL_VERSION) . '/', $appli)) {
                    $appli .= " (" . DOL_VERSION . ")"; // If new title contains a version that is different than core
                }
            } else {
                $appli .= " " . DOL_VERSION;
            }
        } else {
            $appli .= " " . DOL_VERSION;
        }

        if (empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
            $btnUser = '<!-- div for user link -->
	    <div id="topmenu-login-dropdown" class="userimg atoplogin dropdown user user-menu inline-block">
	        <a href="' . DOL_URL_ROOT . '/Modules/Users/card.php?id=' . $this->user->id . '" class="dropdown-toggle login-dropdown-a" data-toggle="dropdown">
	            ' . $this->userImage . '<span class="hidden-xs maxwidth200 atoploginusername hideonsmartphone paddingleft">' . DolibarrFunctions::dol_trunc($this->user->firstname ? $this->user->firstname : $this->user->login, 10) . '</span>
	        </a>
	        <div class="dropdown-menu">
	            <!-- User image -->
	            <div class="user-header">
	                ' . $this->userDropDownImage . '
	                <p>
	                    ' . $profilName . '<br>';
            if ($this->user->datelastlogin) {
                $title = $this->langs->trans("ConnectedSince") . ' : ' . DolibarrFunctions::dol_print_date($this->user->datelastlogin, "dayhour", 'tzuser');
                if ($this->user->datepreviouslogin) {
                    $title .= '<br>' . $this->langs->trans("PreviousConnexion") . ' : ' . DolibarrFunctions::dol_print_date($this->user->datepreviouslogin, "dayhour", 'tzuser');
                }
            }
            $btnUser .= '<small class="classfortooltip" title="' . DolibarrFunctions::dol_escape_htmltag($title) . '" ><i class="fa fa-user-clock"></i> ' . DolibarrFunctions::dol_print_date($this->user->datelastlogin, "dayhour", 'tzuser') . '</small><br>';
            if ($this->user->datepreviouslogin) {
                $btnUser .= '<small class="classfortooltip" title="' . DolibarrFunctions::dol_escape_htmltag($title) . '" ><i class="fa fa-user-clock opacitymedium"></i> ' . DolibarrFunctions::dol_print_date($this->user->datepreviouslogin, "dayhour", 'tzuser') . '</small><br>';
            }

            //$btnUser .= '<small class="classfortooltip"><i class="fa fa-cog"></i> '.$this->langs->trans("Version").' '.$appli.'</small>';
            $btnUser .= '
	                </p>
	            </div>

	            <!-- Menu Body -->
	            <div class="user-body">' . $dropdownBody . '</div>

	            <!-- Menu Footer-->
	            <div class="user-footer">
	                <div class="pull-left">
	                    ' . $profilLink . '
	                </div>
	                <div class="pull-right">
	                    ' . $logoutLink . '
	                </div>
	                <div style="clear:both;"></div>
	            </div>

	        </div>
	    </div>';
        } else {
            $btnUser = '<!-- div for user link -->
	    <div id="topmenu-login-dropdown" class="userimg atoplogin dropdown user user-menu  inline-block">
	    	<a href="' . DOL_URL_ROOT . '/Modules/Users/card.php?id=' . $this->user->id . '">
	    	' . $this->userImage . '
	    		<span class="hidden-xs maxwidth200 atoploginusername hideonsmartphone">' . DolibarrFunctions::dol_trunc($this->user->firstname ? $this->user->firstname : $this->user->login, 10) . '</span>
	    		</a>
		</div>';
        }

        if (!defined('JS_JQUERY_DISABLE_DROPDOWN') && !empty($this->conf->use_javascript_ajax)) {    // This may be set by some pages that use different jquery version to avoid errors
            $btnUser .= '
        <!-- Code to show/hide the user drop-down -->
        <script>
        $( document ).ready(function() {
            $(document).on("click", function(event) {
                if (!$(event.target).closest("#topmenu-login-dropdown").length) {
					//console.log("close login dropdown");
					// Hide the menus.
                    $("#topmenu-login-dropdown").removeClass("open");
                }
            });
			';

            if ($this->conf->theme != 'md') {
                $btnUser .= '
	            $("#topmenu-login-dropdown .dropdown-toggle").on("click", function(event) {
					console.log("toggle login dropdown");
					event.preventDefault();
	                $("#topmenu-login-dropdown").toggleClass("open");
	            });

	            $("#topmenulogincompanyinfo-btn").on("click", function() {
	                $("#topmenulogincompanyinfo").slideToggle();
	            });

	            $("#topmenuloginmoreinfo-btn").on("click", function() {
	                $("#topmenuloginmoreinfo").slideToggle();
	            });';
            }

            $btnUser .= '
        });
        </script>
        ';
        }

        return $btnUser;
    }

    function left_menu($menu_array_before, $helppagename = '', $notused = '', $menu_array_after = '', $leftmenuwithoutmainarea = 0, $title = '', $acceptdelayedhtml = 0)
    {
        //        global $this->user, $this->conf, $this->langs, $db, $form;
        //        global $this->hookmanager, $this->menumanager;

        $searchform = '';
        $bookmarks = '';

        if (!empty($menu_array_before)) {
            DolibarrFunctions::dol_syslog("Deprecated parameter menu_array_before was used when calling main::left_menu function. Menu entries of module should now be defined into module descriptor and not provided when calling left_menu.", LOG_WARNING);
        }

        if (!defined('MAIN_HIDE_TOP_MENU') || constant('MAIN_HIDE_TOP_MENU') != 1 || empty($this->conf->dol_hide_leftmenu) && (!defined('NOREQUIREMENU') || !constant('NOREQUIREMENU'))) {
            // Instantiate hooks for external modules
            $this->hookmanager->initHooks(['searchform', 'leftblock']);

            print "\n" . '<!-- Begin side-nav id-left -->' . "\n" . '<div class="side-nav"><div id="id-left">' . "\n";

            if ($this->conf->browser->layout == 'phone') {
                $this->conf->global->MAIN_USE_OLD_SEARCH_FORM = 1; // Select into select2 is awfull on smartphone. TODO Is this still true with select2 v4 ?
            }

            print "\n";

            if (!is_object($form)) {
                $form = new Form($db);
            }
            $selected = -1;
            if (empty($this->conf->global->MAIN_USE_TOP_MENU_SEARCH_DROPDOWN)) {
                $usedbyinclude = 1;
                $arrayresult = null;
                include DOL_DOCUMENT_ROOT . '/core/ajax/selectsearchbox.php'; // This set $arrayresult

                if ($this->conf->use_javascript_ajax && empty($this->conf->global->MAIN_USE_OLD_SEARCH_FORM)) {
                    $searchform .= $form->selectArrayFilter('searchselectcombo', $arrayresult, $selected, '', 1, 0, (empty($this->conf->global->MAIN_SEARCHBOX_CONTENT_LOADED_BEFORE_KEY) ? 1 : 0), 'vmenusearchselectcombo', 1, $this->langs->trans("Search"), 1);
                } else {
                    if (is_array($arrayresult)) {
                        foreach ($arrayresult as $key => $val) {
                            $searchform .= printSearchForm($val['url'], $val['url'], $val['label'], 'maxwidth125', 'sall', $val['shortcut'], 'searchleft' . $key, $val['img']);
                        }
                    }
                }

                // Execute hook printSearchForm
                $parameters = ['searchform' => $searchform];
                $reshook = $this->hookmanager->executeHooks('printSearchForm', $parameters); // Note that $action and $object may have been modified by some hooks
                if (empty($reshook)) {
                    $searchform .= $this->hookmanager->resPrint;
                } else {
                    $searchform = $this->hookmanager->resPrint;
                }

                // Force special value for $searchform
                if (!empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER) || empty($this->conf->use_javascript_ajax)) {
                    $urltosearch = DOL_URL_ROOT . '/core/search_page.php?showtitlebefore=1';
                    $searchform = '<div class="blockvmenuimpair blockvmenusearchphone"><div id="divsearchforms1"><a href="' . $urltosearch . '" accesskey="s" alt="' . DolibarrFunctions::dol_escape_htmltag($this->langs->trans("ShowSearchFields")) . '">' . $this->langs->trans("Search") . '...</a></div></div>';
                } elseif ($this->conf->use_javascript_ajax && !empty($this->conf->global->MAIN_USE_OLD_SEARCH_FORM)) {
                    $searchform = '<div class="blockvmenuimpair blockvmenusearchphone"><div id="divsearchforms1"><a href="#" alt="' . DolibarrFunctions::dol_escape_htmltag($this->langs->trans("ShowSearchFields")) . '">' . $this->langs->trans("Search") . '...</a></div><div id="divsearchforms2" style="display: none">' . $searchform . '</div>';
                    $searchform .= '<script>
            	jQuery(document).ready(function () {
            		jQuery("#divsearchforms1").click(function(){
	                   jQuery("#divsearchforms2").toggle();
	               });
            	});
                </script>' . "\n";
                    $searchform .= '</div>';
                }
            }

            // Left column
            print '<!-- Begin left menu -->' . "\n";

            print '<div class="vmenu"' . (empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER) ? '' : ' title="Left menu"') . '>' . "\n\n";

            // Show left menu with other forms
            $this->menumanager->menu_array = $menu_array_before;
            $this->menumanager->menu_array_after = $menu_array_after;
            $this->menumanager->showmenu('left', ['searchform' => $searchform, 'bookmarks' => $bookmarks]); // output menu_array and menu found in database

            // Dolibarr version + help + bug report link
            print "\n";
            print "<!-- Begin Help Block-->\n";
            print '<div id="blockvmenuhelp" class="blockvmenuhelp">' . "\n";

            // Version
            if (!empty($this->conf->global->MAIN_SHOW_VERSION)) {    // Version is already on help picto and on login page.
                $doliurl = 'https://www.dolibarr.org';
                //local communities
                if (preg_match('/fr/i', $this->langs->defaultlang)) {
                    $doliurl = 'https://www.dolibarr.fr';
                }
                if (preg_match('/es/i', $this->langs->defaultlang)) {
                    $doliurl = 'https://www.dolibarr.es';
                }
                if (preg_match('/de/i', $this->langs->defaultlang)) {
                    $doliurl = 'https://www.dolibarr.de';
                }
                if (preg_match('/it/i', $this->langs->defaultlang)) {
                    $doliurl = 'https://www.dolibarr.it';
                }
                if (preg_match('/gr/i', $this->langs->defaultlang)) {
                    $doliurl = 'https://www.dolibarr.gr';
                }

                $appli = constant('DOL_APPLICATION_TITLE');
                if (!empty($this->conf->global->MAIN_APPLICATION_TITLE)) {
                    $appli = $this->conf->global->MAIN_APPLICATION_TITLE;
                    $doliurl = '';
                    if (preg_match('/\d\.\d/', $appli)) {
                        if (!preg_match('/' . preg_quote(DOL_VERSION) . '/', $appli)) {
                            $appli .= " (" . DOL_VERSION . ")"; // If new title contains a version that is different than core
                        }
                    } else {
                        $appli .= " " . DOL_VERSION;
                    }
                } else {
                    $appli .= " " . DOL_VERSION;
                }
                print '<div id="blockvmenuhelpapp" class="blockvmenuhelp">';
                if ($doliurl) {
                    print '<a class="help" target="_blank" rel="noopener" href="' . $doliurl . '">';
                } else {
                    print '<span class="help">';
                }
                print $appli;
                if ($doliurl) {
                    print '</a>';
                } else {
                    print '</span>';
                }
                print '</div>' . "\n";
            }

            // Link to bugtrack
            if (!empty($this->conf->global->MAIN_BUGTRACK_ENABLELINK)) {
                require_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';

                if ($this->conf->global->MAIN_BUGTRACK_ENABLELINK == 'github') {
                    $bugbaseurl = 'https://github.com/Dolibarr/dolibarr/issues/new?labels=Bug';
                    $bugbaseurl .= '&title=';
                    $bugbaseurl .= urlencode("Bug: ");
                    $bugbaseurl .= '&body=';
                    $bugbaseurl .= urlencode("# Instructions\n");
                    $bugbaseurl .= urlencode("*This is a template to help you report good issues. You may use [Github Markdown](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/) syntax to format your issue report.*\n");
                    $bugbaseurl .= urlencode("*Please:*\n");
                    $bugbaseurl .= urlencode("- *replace the bracket enclosed texts with meaningful information*\n");
                    $bugbaseurl .= urlencode("- *remove any unused sub-section*\n");
                    $bugbaseurl .= urlencode("\n");
                    $bugbaseurl .= urlencode("\n");
                    $bugbaseurl .= urlencode("# Bug\n");
                    $bugbaseurl .= urlencode("[*Short description*]\n");
                    $bugbaseurl .= urlencode("\n");
                    $bugbaseurl .= urlencode("## Environment\n");
                    $bugbaseurl .= urlencode("- **Version**: " . DOL_VERSION . "\n");
                    $bugbaseurl .= urlencode("- **OS**: " . php_uname('s') . "\n");
                    $bugbaseurl .= urlencode("- **Web server**: " . $_SERVER["SERVER_SOFTWARE"] . "\n");
                    $bugbaseurl .= urlencode("- **PHP**: " . php_sapi_name() . ' ' . phpversion() . "\n");
                    $bugbaseurl .= urlencode("- **Database**: " . $db::LABEL . ' ' . $db->getVersion() . "\n");
                    $bugbaseurl .= urlencode("- **URL(s)**: " . $_SERVER["REQUEST_URI"] . "\n");
                    $bugbaseurl .= urlencode("\n");
                    $bugbaseurl .= urlencode("## Expected and actual behavior\n");
                    $bugbaseurl .= urlencode("[*Verbose description*]\n");
                    $bugbaseurl .= urlencode("\n");
                    $bugbaseurl .= urlencode("## Steps to reproduce the behavior\n");
                    $bugbaseurl .= urlencode("[*Verbose description*]\n");
                    $bugbaseurl .= urlencode("\n");
                    $bugbaseurl .= urlencode("## [Attached files](https://help.github.com/articles/issue-attachments) (Screenshots, screencasts, dolibarr.log, debugging informations…)\n");
                    $bugbaseurl .= urlencode("[*Files*]\n");
                    $bugbaseurl .= urlencode("\n");

                    $bugbaseurl .= urlencode("\n");
                    $bugbaseurl .= urlencode("## Report\n");
                } elseif (!empty($this->conf->global->MAIN_BUGTRACK_ENABLELINK)) {
                    $bugbaseurl = $this->conf->global->MAIN_BUGTRACK_ENABLELINK;
                } else {
                    $bugbaseurl = "";
                }

                // Execute hook printBugtrackInfo
                $parameters = ['bugbaseurl' => $bugbaseurl];
                $reshook = $this->hookmanager->executeHooks('printBugtrackInfo', $parameters); // Note that $action and $object may have been modified by some hooks
                if (empty($reshook)) {
                    $bugbaseurl .= $this->hookmanager->resPrint;
                } else {
                    $bugbaseurl = $this->hookmanager->resPrint;
                }

                print '<div id="blockvmenuhelpbugreport" class="blockvmenuhelp">';
                print '<a class="help" target="_blank" rel="noopener" href="' . $bugbaseurl . '">' . $this->langs->trans("FindBug") . '</a>';
                print '</div>';
            }

            print "</div>\n";
            print "<!-- End Help Block-->\n";
            print "\n";

            print "</div>\n";
            print "<!-- End left menu -->\n";
            print "\n";

            // Execute hook printLeftBlock
            $parameters = [];
            $reshook = $this->hookmanager->executeHooks('printLeftBlock', $parameters); // Note that $action and $object may have been modified by some hooks
            print $this->hookmanager->resPrint;

            print '</div></div> <!-- End side-nav id-left -->'; // End div id="side-nav" div id="id-left"
        }

        if (!defined('MAIN_HIDE_TOP_MENU') || constant('MAIN_HIDE_TOP_MENU') != 1) {
            print "\n";
            print '<!-- Begin right area -->' . "\n";

            if (empty($leftmenuwithoutmainarea)) {
                main_area($title);
            }
        }
    }

    function main_area($title = '')
    {
        if (empty($this->conf->dol_hide_leftmenu)) {
            print '<div id="id-right">';
        }

        print "\n";

        print '<!-- Begin div class="fiche" -->' . "\n" . '<div class="fiche">' . "\n";

        if (!empty($this->conf->global->MAIN_ONLY_LOGIN_ALLOWED)) {
            print info_admin($this->langs->trans("WarningYouAreInMaintenanceMode", $this->conf->global->MAIN_ONLY_LOGIN_ALLOWED), 0, 0, 1, 'warning maintenancemode');
        }

        // Permit to add user company information on each printed document by setting SHOW_SOCINFO_ON_PRINT
        if (!empty($this->conf->global->SHOW_SOCINFO_ON_PRINT) && DolibarrFunctions::GETPOST('optioncss', 'aZ09') == 'print' && empty(DolibarrFunctions::GETPOST('disable_show_socinfo_on_print', 'az09'))) {
            $this->hookmanager->initHooks(['main']);
            $parameters = [];
            $reshook = $this->hookmanager->executeHooks('showSocinfoOnPrint', $parameters);
            if (empty($reshook)) {
                print '<!-- Begin show mysoc info header -->' . "\n";
                print '<div id="mysoc-info-header">' . "\n";
                print '<table class="centpercent div-table-responsive">' . "\n";
                print '<tbody>';
                print '<tr><td rowspan="0" class="width20p">';
                if ($this->conf->global->MAIN_SHOW_LOGO && empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER) && !empty($this->conf->global->MAIN_INFO_SOCIETE_LOGO)) {
                    print '<img id="mysoc-info-header-logo" style="max-width:100%" alt="" src="' . DOL_URL_ROOT . '/viewimage.php?cache=1&amp;modulepart=mycompany&amp;file=' . urlencode('logos/' . DolibarrFunctions::dol_escape_htmltag($this->conf->global->MAIN_INFO_SOCIETE_LOGO)) . '">';
                }
                print '</td><td  rowspan="0" class="width50p"></td></tr>' . "\n";
                print '<tr><td class="titre bold">' . DolibarrFunctions::dol_escape_htmltag($this->conf->global->MAIN_INFO_SOCIETE_NOM) . '</td></tr>' . "\n";
                print '<tr><td>' . DolibarrFunctions::dol_escape_htmltag($this->conf->global->MAIN_INFO_SOCIETE_ADDRESS) . '<br>' . DolibarrFunctions::dol_escape_htmltag($this->conf->global->MAIN_INFO_SOCIETE_ZIP) . ' ' . DolibarrFunctions::dol_escape_htmltag($this->conf->global->MAIN_INFO_SOCIETE_TOWN) . '</td></tr>' . "\n";
                if (!empty($this->conf->global->MAIN_INFO_SOCIETE_TEL)) {
                    print '<tr><td style="padding-left: 1em" class="small">' . $this->langs->trans("Phone") . ' : ' . DolibarrFunctions::dol_escape_htmltag($this->conf->global->MAIN_INFO_SOCIETE_TEL) . '</td></tr>';
                }
                if (!empty($this->conf->global->MAIN_INFO_SOCIETE_MAIL)) {
                    print '<tr><td style="padding-left: 1em" class="small">' . $this->langs->trans("Email") . ' : ' . DolibarrFunctions::dol_escape_htmltag($this->conf->global->MAIN_INFO_SOCIETE_MAIL) . '</td></tr>';
                }
                if (!empty($this->conf->global->MAIN_INFO_SOCIETE_WEB)) {
                    print '<tr><td style="padding-left: 1em" class="small">' . $this->langs->trans("Web") . ' : ' . DolibarrFunctions::dol_escape_htmltag($this->conf->global->MAIN_INFO_SOCIETE_WEB) . '</td></tr>';
                }
                print '</tbody>';
                print '</table>' . "\n";
                print '</div>' . "\n";
                print '<!-- End show mysoc info header -->' . "\n";
            }
        }
    }

    function printSearchForm($urlaction, $urlobject, $title, $htmlmorecss, $htmlinputname, $accesskey = '', $prefhtmlinputname = '', $img = '', $showtitlebefore = 0, $autofocus = 0)
    {
        $ret = '';
        $ret .= '<form action="' . $urlaction . '" method="post" class="searchform nowraponall tagtr">';
        $ret .= '<input type="hidden" name="token" value="' . newToken() . '">';
        $ret .= '<input type="hidden" name="mode" value="search">';
        $ret .= '<input type="hidden" name="savelogin" value="' . DolibarrFunctions::dol_escape_htmltag($this->user->login) . '">';
        if ($showtitlebefore) {
            $ret .= '<div class="tagtd left">' . $title . '</div> ';
        }
        $ret .= '<div class="tagtd">';
        $ret .= DolibarrFunctions::img_picto('', $img, '', false, 0, 0, '', 'paddingright width20');
        $ret .= '<input type="text" class="flat ' . $htmlmorecss . '"';
        $ret .= ' style="background-repeat: no-repeat; background-position: 3px;"';
        $ret .= ($accesskey ? ' accesskey="' . $accesskey . '"' : '');
        $ret .= ' placeholder="' . strip_tags($title) . '"';
        $ret .= ($autofocus ? ' autofocus' : '');
        $ret .= ' name="' . $htmlinputname . '" id="' . $prefhtmlinputname . $htmlinputname . '" />';
        $ret .= '<button type="submit" class="button bordertransp" style="padding-top: 4px; padding-bottom: 4px; padding-left: 6px; padding-right: 6px">';
        $ret .= '<span class="fa fa-search"></span>';
        $ret .= '</button>';
        $ret .= '</div>';
        $ret .= "</form>\n";
        return $ret;
    }

    function llxFooter($comment = '', $zone = 'private', $disabledoutputofmessages = 0)
    {
        // global $this->conf, $db, $this->langs, $this->user, $this->mysoc, $object;
        // global $delayedhtmlcontent;
        // global $contextpage, $page, $limit;
        // global $dolibarr_distrib;

        $ext = 'layout=' . $this->conf->browser->layout . '&version=' . urlencode(DOL_VERSION);

        // Global html output events ($mesgs, $errors, $warnings)
        DolibarrFunctions::dol_htmloutput_events($disabledoutputofmessages);

        // Code for search criteria persistence.
        // $this->user->lastsearch_values was set by the DolibarrFunctions::GETPOST when form field search_xxx exists
        if (is_object($this->user) && !empty($this->user->lastsearch_values_tmp) && is_array($this->user->lastsearch_values_tmp)) {
            // Clean and save data
            foreach ($this->user->lastsearch_values_tmp as $key => $val) {
                unset($_SESSION['lastsearch_values_tmp_' . $key]); // Clean array to rebuild it just after
                if (count($val) && empty($_POST['button_removefilter'])) {    // If there is search criteria to save and we did not click on 'Clear filter' button
                    if (empty($val['sortfield'])) {
                        unset($val['sortfield']);
                    }
                    if (empty($val['sortorder'])) {
                        unset($val['sortorder']);
                    }
                    DolibarrFunctions::dol_syslog('Save lastsearch_values_tmp_' . $key . '=' . json_encode($val, 0) . " (systematic recording of last search criterias)");
                    $_SESSION['lastsearch_values_tmp_' . $key] = json_encode($val);
                    unset($_SESSION['lastsearch_values_' . $key]);
                }
            }
        }

        $relativepathstring = $_SERVER["PHP_SELF"];
        // Clean $relativepathstring
        if (constant('DOL_URL_ROOT')) {
            $relativepathstring = preg_replace('/^' . preg_quote(constant('DOL_URL_ROOT'), '/') . '/', '', $relativepathstring);
        }
        $relativepathstring = preg_replace('/^\//', '', $relativepathstring);
        $relativepathstring = preg_replace('/^custom\//', '', $relativepathstring);
        if (preg_match('/list\.php$/', $relativepathstring)) {
            unset($_SESSION['lastsearch_contextpage_tmp_' . $relativepathstring]);
            unset($_SESSION['lastsearch_page_tmp_' . $relativepathstring]);
            unset($_SESSION['lastsearch_limit_tmp_' . $relativepathstring]);

            if (!empty($contextpage)) {
                $_SESSION['lastsearch_contextpage_tmp_' . $relativepathstring] = $contextpage;
            }
            if (!empty($page) && $page > 0) {
                $_SESSION['lastsearch_page_tmp_' . $relativepathstring] = $page;
            }
            if (!empty($limit) && $limit != $this->conf->liste_limit) {
                $_SESSION['lastsearch_limit_tmp_' . $relativepathstring] = $limit;
            }

            unset($_SESSION['lastsearch_contextpage_' . $relativepathstring]);
            unset($_SESSION['lastsearch_page_' . $relativepathstring]);
            unset($_SESSION['lastsearch_limit_' . $relativepathstring]);
        }

        // Core error message
        if (!empty($this->conf->global->MAIN_CORE_ERROR)) {
            // Ajax version
            if ($this->conf->use_javascript_ajax) {
                $title = img_warning() . ' ' . $this->langs->trans('CoreErrorTitle');
                print ajax_dialog($title, $this->langs->trans('CoreErrorMessage'));
            } else {
                // html version
                $msg = img_warning() . ' ' . $this->langs->trans('CoreErrorMessage');
                print '<div class="error">' . $msg . '</div>';
            }
            //define("MAIN_CORE_ERROR",0);      // Constant was defined and we can't change value of a constant
        }

        print "\n\n";

        print '</div> <!-- End div class="fiche" -->' . "\n"; // End div fiche

        if (empty($this->conf->dol_hide_leftmenu)) {
            print '</div> <!-- End div id-right -->' . "\n"; // End div id-right
        }

        if (empty($this->conf->dol_hide_leftmenu) && empty($this->conf->dol_use_jmobile)) {
            print '</div> <!-- End div id-container -->' . "\n"; // End div container
        }

        print "\n";
        if ($comment) {
            print '<!-- ' . $comment . ' -->' . "\n";
        }

        DolibarrFunctions::printCommonFooter($zone);

        if (!empty($delayedhtmlcontent)) {
            print $delayedhtmlcontent;
        }

        if (!empty($this->conf->use_javascript_ajax)) {
            print "\n" . '<!-- Includes JS Footer of Dolibarr -->' . "\n";
            print '<script src="' . DOL_URL_ROOT . '/core/js/lib_foot.js.php?lang=' . $this->langs->defaultlang . ($ext ? '&' . $ext : '') . '"></script>' . "\n";
        }

        // Wrapper to add log when clicking on download or preview
        if (!empty($this->conf->blockedlog->enabled) && is_object($object) && !empty($object->id) && $object->id > 0 && $object->statut > 0) {
            if (in_array($object->element, ['facture'])) {       // Restrict for the moment to element 'facture'
                print "\n<!-- JS CODE TO ENABLE log when making a download or a preview of a document -->\n";
                ?>
                <script>
                    jQuery(document).ready(function () {
                        $('a.documentpreview').click(function () {
                            $.post('<?php echo DOL_URL_ROOT . "/blockedlog/ajax/block-add.php" ?>'
                                , {
                                    id:<?php echo $object->id; ?>
                                    , element: '<?php echo $object->element ?>'
                                    , action: 'DOC_PREVIEW'
                                }
                            );
                        });
                        $('a.documentdownload').click(function () {
                            $.post('<?php echo DOL_URL_ROOT . "/blockedlog/ajax/block-add.php" ?>'
                                , {
                                    id:<?php echo $object->id; ?>
                                    , element: '<?php echo $object->element ?>'
                                    , action: 'DOC_DOWNLOAD'
                                }
                            );
                        });
                    });
                </script>
                <?php
            }
        }

        // A div for the address popup
        print "\n<!-- A div to allow dialog popup -->\n";
        print '<div id="dialogforpopup" style="display: none;"></div>' . "\n";

        // Add code for the asynchronous anonymous first ping (for telemetry)
        // You can use &forceping=1 in parameters to force the ping if the ping was already sent.
        $forceping = DolibarrFunctions::GETPOST('forceping', 'alpha');
        if (($_SERVER["PHP_SELF"] == DOL_URL_ROOT . '/index.php') || $forceping) {
            //print '<!-- instance_unique_id='.$this->conf->file->instance_unique_id.' MAIN_FIRST_PING_OK_ID='.$this->conf->global->MAIN_FIRST_PING_OK_ID.' -->';
            $hash_unique_id = md5('dolibarr' . $this->conf->file->instance_unique_id);
            if (empty($this->conf->global->MAIN_FIRST_PING_OK_DATE)
                || (!empty($this->conf->file->instance_unique_id) && ($hash_unique_id != $this->conf->global->MAIN_FIRST_PING_OK_ID) && ($this->conf->global->MAIN_FIRST_PING_OK_ID != 'disabled'))
                || $forceping) {
                // No ping done if we are into an alpha version
                if (strpos('alpha', DOL_VERSION) > 0 && !$forceping) {
                    print "\n<!-- NO JS CODE TO ENABLE the anonymous Ping. It is an alpha version -->\n";
                } elseif (empty($_COOKIE['DOLINSTALLNOPING_' . $hash_unique_id]) || $forceping) {    // Cookie is set when we uncheck the checkbox in the installation wizard.
                    // MAIN_LAST_PING_KO_DATE
                    // Disable ping if MAIN_LAST_PING_KO_DATE is set and is recent
                    if (!empty($this->conf->global->MAIN_LAST_PING_KO_DATE) && substr($this->conf->global->MAIN_LAST_PING_KO_DATE, 0, 6) == DolibarrFunctions::dol_print_date(dol_now(), '%Y%m') && !$forceping) {
                        print "\n<!-- NO JS CODE TO ENABLE the anonymous Ping. An error already occured this month, we will try later. -->\n";
                    } else {
                        include_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';

                        print "\n" . '<!-- Includes JS for Ping of Dolibarr forceping=' . $forceping . ' MAIN_FIRST_PING_OK_DATE=' . DolibarrFunctions::getDolGlobalString("MAIN_FIRST_PING_OK_DATE") . ' MAIN_FIRST_PING_OK_ID=' . DolibarrFunctions::getDolGlobalString("MAIN_FIRST_PING_OK_ID") . ' MAIN_LAST_PING_KO_DATE=' . DolibarrFunctions::getDolGlobalString("MAIN_LAST_PING_KO_DATE") . ' -->' . "\n";
                        print "\n<!-- JS CODE TO ENABLE the anonymous Ping -->\n";
                        $url_for_ping = (empty($this->conf->global->MAIN_URL_FOR_PING) ? "https://ping.dolibarr.org/" : $this->conf->global->MAIN_URL_FOR_PING);
                        // Try to guess the distrib used
                        $distrib = 'standard';
                        if ($_SERVER["SERVER_ADMIN"] == 'doliwamp@localhost') {
                            $distrib = 'doliwamp';
                        }
                        if (!empty($dolibarr_distrib)) {
                            $distrib = $dolibarr_distrib;
                        }
                        ?>
                        <script>
                            jQuery(document).ready(function (tmp) {
                                $.ajax({
                                    method: "POST",
                                    url: "<?php echo $url_for_ping ?>",
                                    timeout: 500,     // timeout milliseconds
                                    cache: false,
                                    data: {
                                        hash_algo: 'md5',
                                        hash_unique_id: '<?php echo DolibarrFunctions::dol_escape_js($hash_unique_id); ?>',
                                        action: 'dolibarrping',
                                        version: '<?php echo (float) DOL_VERSION; ?>',
                                        entity: '<?php echo (int) $this->conf->entity; ?>',
                                        dbtype: '<?php echo DolibarrFunctions::dol_escape_js($db->type); ?>',
                                        country_code: '<?php echo $this->mysoc->country_code ? DolibarrFunctions::dol_escape_js($this->mysoc->country_code) : 'unknown'; ?>',
                                        php_version: '<?php echo DolibarrFunctions::dol_escape_js(phpversion()); ?>',
                                        os_version: '<?php echo DolibarrFunctions::dol_escape_js(version_os('smr')); ?>',
                                        distrib: '<?php echo $distrib ? DolibarrFunctions::dol_escape_js($distrib) : 'unknown'; ?>',
                                        token: 'notrequired'
                                    },
                                    success: function (data, status, xhr) {   // success callback function (data contains body of response)
                                        console.log("Ping ok");
                                        $.ajax({
                                            method: 'GET',
                                            url: '<?php echo DOL_URL_ROOT . '/core/ajax/pingresult.php'; ?>',
                                            timeout: 500,     // timeout milliseconds
                                            cache: false,
                                            data: {
                                                hash_algo: 'md5',
                                                hash_unique_id: '<?php echo DolibarrFunctions::dol_escape_js($hash_unique_id); ?>',
                                                action: 'firstpingok',
                                                token: 'notrequired'
                                            },	// for update
                                        });
                                    },
                                    error: function (data, status, xhr) {   // error callback function
                                        console.log("Ping ko: " + data);
                                        $.ajax({
                                            method: 'GET',
                                            url: '<?php echo DOL_URL_ROOT . '/core/ajax/pingresult.php'; ?>',
                                            timeout: 500,     // timeout milliseconds
                                            cache: false,
                                            data: {
                                                hash_algo: 'md5',
                                                hash_unique_id: '<?php echo DolibarrFunctions::dol_escape_js($hash_unique_id); ?>',
                                                action: 'firstpingko',
                                                token: 'notrequired'
                                            },
                                        });
                                    }
                                });
                            });
                        </script>
                        <?php
                    }
                } else {
                    $now = dol_now();
                    print "\n<!-- NO JS CODE TO ENABLE the anonymous Ping. It was disabled -->\n";
                    include_once DOL_DOCUMENT_ROOT . '/core/lib/admin.lib.php';
                    dolibarr_set_const($db, 'MAIN_FIRST_PING_OK_DATE', DolibarrFunctions::dol_print_date($now, 'dayhourlog', 'gmt'), 'chaine', 0, '', $this->conf->entity);
                    dolibarr_set_const($db, 'MAIN_FIRST_PING_OK_ID', 'disabled', 'chaine', 0, '', $this->conf->entity);
                }
            }
        }

        print "</body>\n";
        print "</html>\n";
    }
}