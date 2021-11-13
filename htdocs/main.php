<?php
/* Copyright (C) 2002-2007  Rodolphe Quiedeville    <rodolphe@quiedeville.org>
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

use Alxarafe\Dolibarr\Base\DolibarrAuthentication;
use Alxarafe\Dolibarr\Base\DolibarrGlobals;
use Alxarafe\Dolibarr\Base\DolibarrView;
use Alxarafe\Dolibarr\Classes\MainView;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Alxarafe\Dolibarr\Libraries\DolibarrSecurity;
use Alxarafe\Modules\Admin\Controllers\NullController;

/**
 * Load globals vars...
 */
require_once('load.php');

// Functions
/**
 *    \file       htdocs/main.inc.php
 *    \ingroup    core
 *    \brief      File that defines environment for Dolibarr GUI pages only (file not required by scripts)
 */

$nc = new NullController();
$mw = new DolibarrView($nc);

$conf = DolibarrGlobals::getConf();
$langs = DolibarrGlobals::getLangs();

//@ini_set('memory_limit', '128M');	// This may be useless if memory is hard limited by your PHP

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
    $mw->analyseVarsForSqlAndScriptsInjection($morevaltochecklikepost, 2);
}
// Sanity check on GET parameters
if (!defined('NOSCANGETFORINJECTION') && !empty($_SERVER["QUERY_STRING"])) {
    // Note: QUERY_STRING is url encoded, but $_GET and $_POST are already decoded
    // Because the $mw->analyseVarsForSqlAndScriptsInjection is designed for already url decoded value, we must decode QUERY_STRING
    // Another solution is to provide $_GET as parameter
    $morevaltochecklikeget = [urldecode($_SERVER["QUERY_STRING"])];
    $mw->analyseVarsForSqlAndScriptsInjection($morevaltochecklikeget, 1);
}
// Sanity check on POST
if (!defined('NOSCANPOSTFORINJECTION')) {
    $mw->analyseVarsForSqlAndScriptsInjection($_POST, 0);
}

// This is to make Dolibarr working with Plesk
if (!empty($_SERVER['DOCUMENT_ROOT']) && substr($_SERVER['DOCUMENT_ROOT'], -6) !== 'htdocs') {
    set_include_path($_SERVER['DOCUMENT_ROOT'] . '/htdocs');
}

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
    setcookie($cookiename, empty($cookievalue) ? '' : $cookievalue, empty($cookievalue) ? 0 : (time() + (86400 * 354)), '/', null, (empty($dolibarr_main_force_https) ? false : true), true); // keep cookie 1 year and add tag httponly
    if (empty($cookievalue)) {
        unset($_COOKIE[$cookiename]);
    }
}

// Set the handler of session
if (ini_get('session.save_handler') == 'user') {
    require_once 'core/lib/phpsessionindb.lib.php';
}

// Init session. Name of session is specific to Dolibarr instance.
// Must be done after the include of filefunc.inc.php so global variables of conf file are defined (like $dolibarr_main_instance_unique_id or $dolibarr_main_force_https).
// Note: the function dol_getprefix is defined into functions.lib.php but may have been defined to return a different key to manage another area to protect.
$prefix = DolibarrFunctions::dol_getprefix('');
$sessionname = 'DOLSESSID_' . $prefix;
$sessiontimeout = 'DOLSESSTIMEOUT_' . $prefix;
if (!empty($_COOKIE[$sessiontimeout])) {
    ini_set('session.gc_maxlifetime', $_COOKIE[$sessiontimeout]);
}

// This create lock, released by session_write_close() or end of page.
// We need this lock as long as we read/write $_SESSION ['vars']. We can remove lock when finished.
if (!defined('NOSESSION')) {
    session_set_cookie_params(0, '/', null, (empty($dolibarr_main_force_https) ? false : true), true); // Add tag secure and httponly on session cookie (same as setting session.cookie_httponly into php.ini). Must be called before the session_start.
    session_name($sessionname);
    session_start();
}

// Init the 5 global objects, this include will make the 'new Xxx()' and set properties for: $conf, $db, $langs, $user, $mysoc
// require_once 'master.php';

// If software has been locked. Only login $conf->global->MAIN_ONLY_LOGIN_ALLOWED is allowed.
if (!empty($conf->global->MAIN_ONLY_LOGIN_ALLOWED)) { // It's false
    $ok = 0;
    if ((!session_id() || !isset($_SESSION["dol_login"])) && !isset($_POST["username"]) && !empty($_SERVER["GATEWAY_INTERFACE"])) {
        $ok = 1; // We let working pages if not logged and inside a web browser (login form, to allow login by admin)
    } elseif (isset($_POST["username"]) && $_POST["username"] == $conf->global->MAIN_ONLY_LOGIN_ALLOWED) {
        $ok = 1; // We let working pages that is a login submission (login submit, to allow login by admin)
    } elseif (defined('NOREQUIREDB')) {
        $ok = 1; // We let working pages that don't need database access (xxx.css.php)
    } elseif (defined('EVEN_IF_ONLY_LOGIN_ALLOWED')) {
        $ok = 1; // We let working pages that ask to work even if only login enabled (logout.php)
    } elseif (session_id() && isset($_SESSION["dol_login"]) && $_SESSION["dol_login"] == $conf->global->MAIN_ONLY_LOGIN_ALLOWED) {
        $ok = 1; // We let working if user is allowed admin
    }
    if (!$ok) {
        if (session_id() && isset($_SESSION["dol_login"]) && $_SESSION["dol_login"] != $conf->global->MAIN_ONLY_LOGIN_ALLOWED) {
            print 'Sorry, your application is offline.' . "\n";
            print 'You are logged with user "' . $_SESSION["dol_login"] . '" and only administrator user "' . $conf->global->MAIN_ONLY_LOGIN_ALLOWED . '" is allowed to connect for the moment.' . "\n";
            $nexturl = DOL_URL_ROOT . '?module=Users&controller=logout';
            print 'Please try later or <a href="' . $nexturl . '">click here to disconnect and change login user</a>...' . "\n";
        } else {
            print 'Sorry, your application is offline. Only administrator user "' . $conf->global->MAIN_ONLY_LOGIN_ALLOWED . '" is allowed to connect for the moment.' . "\n";
            $nexturl = DOL_URL_ROOT . '/';
            print 'Please try later or <a href="' . $nexturl . '">click here to change login user</a>...' . "\n";
        }
        exit;
    }
}

// Activate end of page function
register_shutdown_function([DolibarrFunctions::class, 'dol_shutdown']);

// Load debugbar
/*
if (!empty($conf->debugbar->enabled) && !DolibarrFunctions::GETPOST('dol_use_jmobile') && empty($_SESSION['dol_use_jmobile'])) {
    global $debugbar;
    include_once DOL_DOCUMENT_ROOT . '/debugbar/class/DebugBar.php';
    $debugbar = new DolibarrDebugBar();
    $renderer = $debugbar->getRenderer();
    if (empty($conf->global->MAIN_HTML_HEADER)) {
        $conf->global->MAIN_HTML_HEADER = '';
    }
    $conf->global->MAIN_HTML_HEADER .= $renderer->renderHead();

    $debugbar['time']->startMeasure('pageaftermaster', 'Page generation (after environment init)');
}
$debugbar->debugBar['time']->startMeasure('pageaftermaster', 'Page generation (after environment init)');
*/

// Detection browser
if (isset($_SERVER["HTTP_USER_AGENT"])) {
    $tmp = DolibarrFunctions::getBrowserInfo($_SERVER["HTTP_USER_AGENT"]);
    $conf->browser->name = $tmp['browsername'];
    $conf->browser->os = $tmp['browseros'];
    $conf->browser->version = $tmp['browserversion'];
    $conf->browser->layout = $tmp['layout']; // 'classic', 'phone', 'tablet'
    //var_dump($conf->browser);

    if ($conf->browser->layout == 'phone') {
        $conf->dol_no_mouse_hover = 1;
    }
}

// Set global MAIN_OPTIMIZEFORTEXTBROWSER (must be before login part)
if (DolibarrFunctions::GETPOST('textbrowser', 'int') || (!empty($conf->browser->name) && $conf->browser->name == 'lynxlinks')) {   // If we must enable text browser
    $conf->global->MAIN_OPTIMIZEFORTEXTBROWSER = 1;
}

// Force HTTPS if required ($conf->file->main_force_https is 0/1 or 'https dolibarr root url')
// $_SERVER["HTTPS"] is 'on' when link is https, otherwise $_SERVER["HTTPS"] is empty or 'off'
if (!empty($conf->file->main_force_https) && (empty($_SERVER["HTTPS"]) || $_SERVER["HTTPS"] != 'on')) {
    $newurl = '';
    if (is_numeric($conf->file->main_force_https)) {
        if ($conf->file->main_force_https == '1' && !empty($_SERVER["SCRIPT_URI"])) {    // If SCRIPT_URI supported by server
            if (preg_match('/^http:/i', $_SERVER["SCRIPT_URI"]) && !preg_match('/^https:/i', $_SERVER["SCRIPT_URI"])) {    // If link is http
                $newurl = preg_replace('/^http:/i', 'https:', $_SERVER["SCRIPT_URI"]);
            }
        } else {
            // Check HTTPS environment variable (Apache/mod_ssl only)
            $newurl = preg_replace('/^http:/i', 'https:', DOL_MAIN_URL_ROOT) . $_SERVER["REQUEST_URI"];
        }
    } else {
        // Check HTTPS environment variable (Apache/mod_ssl only)
        $newurl = $conf->file->main_force_https . $_SERVER["REQUEST_URI"];
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
//if (!defined('NOREQUIREHTML') || !constant('NOREQUIREHTML')) {
//    require_once DOL_DOCUMENT_ROOT . '/core/class/html.form.class.php'; // Need 660ko memory (800ko in 2.2)
//}
//if (!defined('NOREQUIREAJAX' || !constant('NOREQUIREAJAX'))) {
//    require_once DOL_DOCUMENT_ROOT . '/core/lib/ajax.lib.php'; // Need 22ko memory
//}

// If install or upgrade process not done or not completely finished, we call the install page.
if (!empty($conf->global->MAIN_NOT_INSTALLED) || !empty($conf->global->MAIN_NOT_UPGRADED)) {
    dump($conf->global->MAIN_NOT_INSTALLED);
    dump($conf->global->MAIN_NOT_UPGRADED);
    DolibarrFunctions::dol_syslog("main.inc: A previous install or upgrade was not complete. Redirect to install page.", LOG_WARNING);
    // header("Location: " . DOL_URL_ROOT . "/install/index.php");
    die("1 Location: " . DOL_URL_ROOT . "/Modules/Install/Controller/Dol_Init.php");
    header("Location: " . DOL_URL_ROOT . "/Modules/Install/Controller/Dol_Init.php");
    exit;
}

// If an upgrade process is required, we call the install page.
if ((!empty($conf->global->MAIN_VERSION_LAST_UPGRADE) && ($conf->global->MAIN_VERSION_LAST_UPGRADE != DOL_VERSION))
    || (empty($conf->global->MAIN_VERSION_LAST_UPGRADE) && !empty($conf->global->MAIN_VERSION_LAST_INSTALL) && ($conf->global->MAIN_VERSION_LAST_INSTALL != DOL_VERSION))) {
    $versiontocompare = empty($conf->global->MAIN_VERSION_LAST_UPGRADE) ? $conf->global->MAIN_VERSION_LAST_INSTALL : $conf->global->MAIN_VERSION_LAST_UPGRADE;
    require_once DOL_DOCUMENT_ROOT . '/core/lib/admin.lib.php';
    $dolibarrversionlastupgrade = preg_split('/[.-]/', $versiontocompare);
    $dolibarrversionprogram = preg_split('/[.-]/', DOL_VERSION);
    $rescomp = versioncompare($dolibarrversionprogram, $dolibarrversionlastupgrade);
    if ($rescomp > 0) {   // Programs have a version higher than database. We did not add "&& $rescomp < 3" because we want upgrade process for build upgrades
        DolibarrFunctions::dol_syslog("main.inc: database version " . $versiontocompare . " is lower than programs version " . DOL_VERSION . ". Redirect to install page.", LOG_WARNING);
        // header("Location: " . DOL_URL_ROOT . "/install/index.php");
        die("2 Location: " . DOL_URL_ROOT . "/Modules/Install/Controller/Dol_Init.php");
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

//DolibarrFunctions::dol_syslog("aaaa - ".defined('NOCSRFCHECK')." - ".$dolibarr_nocsrfcheck." - ".$conf->global->MAIN_SECURITY_CSRF_WITH_TOKEN." - ".$_SERVER['REQUEST_METHOD']." - ".DolibarrFunctions::GETPOST('token', 'alpha'));

// Check validity of token, only if option MAIN_SECURITY_CSRF_WITH_TOKEN enabled or if constant CSRFCHECK_WITH_TOKEN is set into page
if ((!defined('NOCSRFCHECK') && empty($dolibarr_nocsrfcheck) && getDolGlobalInt('MAIN_SECURITY_CSRF_WITH_TOKEN')) || defined('CSRFCHECK_WITH_TOKEN')) {
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
    if (
        $_SERVER['REQUEST_METHOD'] == 'POST' ||
        $sensitiveget ||
        DolibarrFunctions::GETPOSTISSET('massaction') ||
        ((DolibarrFunctions::GETPOSTISSET('actionlogin') || DolibarrFunctions::GETPOSTISSET('action')) && defined('CSRFCHECK_WITH_TOKEN'))
    ) {
        // If token is not provided or empty, error (we are in case it is mandatory)
        if (!DolibarrFunctions::GETPOST('token', 'alpha') || DolibarrFunctions::GETPOST('token', 'alpha') == 'notrequired') {
            if (DolibarrFunctions::GETPOST('uploadform', 'int')) {
                DolibarrFunctions::dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . " refused. File size too large.");
                $langs->loadLangs(["errors", "install"]);
                print $langs->trans("ErrorFileSizeTooLarge") . ' ';
                print $langs->trans("ErrorGoBackAndCorrectParameters");
            } else {
                if (defined('CSRFCHECK_WITH_TOKEN')) {
                    DolibarrFunctions::dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . " refused by CSRF protection (CSRFCHECK_WITH_TOKEN protection) in main.inc.php. Token not provided.", LOG_WARNING);
                    print "Access to a page that needs a token (constant CSRFCHECK_WITH_TOKEN is defined) is refused by CSRF protection in main.php. Token not provided.\n";
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
    if (false && DolibarrFunctions::GETPOSTISSET('token') && DolibarrFunctions::GETPOST('token') != 'notrequired' && DolibarrFunctions::GETPOST('token', 'alpha') != $sessiontokenforthisurl) {
        DolibarrFunctions::dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . " refused by CSRF protection (invalid token), so we disable POST and some GET parameters - referer=" . $_SERVER['HTTP_REFERER'] . ", action=" . DolibarrFunctions::GETPOST('action', 'aZ09') . ", _GET|POST['token']=" . DolibarrFunctions::GETPOST('token', 'alpha') . ", _SESSION['token']=" . $_SESSION['token'], LOG_WARNING);
        //print 'Unset POST by CSRF protection in main.inc.php.';	// Do not output anything because this create problems when using the BACK button on browsers.
        DolibarrFunctions::setEventMessages('SecurityTokenHasExpiredSoActionHasBeenCanceledPleaseRetry', null, 'warnings');
        //if ($conf->global->MAIN_FEATURES_LEVEL >= 1) DolibarrFunctions::setEventMessages('Unset POST and GET params by CSRF protection in main.inc.php (Token provided was not generated by the previous page).'."<br>\n".'$_SERVER[REQUEST_URI] = '.$_SERVER['REQUEST_URI'].' $_SERVER[REQUEST_METHOD] = '.$_SERVER['REQUEST_METHOD'].' DolibarrFunctions::GETPOST(token) = '.DolibarrFunctions::GETPOST('token', 'alpha').' $_SESSION[token] = '.$_SESSION['token'], null, 'warnings');
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
            if (empty($conf->$module)) {
                $conf->$module = new stdClass(); // To avoid warnings
            }
            $conf->$module->enabled = false;
            foreach ($modulepartkeys as $modulepartkey) {
                unset($conf->modules_parts[$modulepartkey][$module]);
            }
            if ($module == 'fournisseur') {        // Special case
                $conf->supplier_order->enabled = 0;
                $conf->supplier_invoice->enabled = 0;
            }
        }
    }
}

// Set current modulepart
$modulepart = explode("/", $_SERVER["PHP_SELF"]);
if (is_array($modulepart) && count($modulepart) > 0) {
    foreach ($conf->modules as $module) {
        if (in_array($module, $modulepart)) {
            $conf->modulepart = $module;
            break;
        }
    }
}

$auth = new DolibarrAuthentication(new NullController());
if (!$auth->authenticated()) {
    $auth->login();
}

$user = $auth->user;
$langs = $auth->langs;
$hookmanager = $auth->hookmanager;

/*
 * Phase authentication / login
 * /
$login = '';
if (!defined('NOLOGIN')) {
    $x = new Login($conf);
    $user = $x->user;
    //    dump($user);
    //    exit;
}

// Case forcing style from url
if (DolibarrFunctions::GETPOST('theme', 'alpha')) {
    $conf->theme = DolibarrFunctions::GETPOST('theme', 'alpha', 1);
    $conf->css = "/theme/" . $conf->theme . "/style.css.php";
}

// Set javascript option
if (DolibarrFunctions::GETPOST('nojs', 'int')) {  // If javascript was not disabled on URL
    $conf->use_javascript_ajax = 0;
} else {
    if (!empty($user->conf->MAIN_DISABLE_JAVASCRIPT)) {
        $conf->use_javascript_ajax = !$user->conf->MAIN_DISABLE_JAVASCRIPT;
    }
}

// Set MAIN_OPTIMIZEFORTEXTBROWSER for user (must be after login part)
if (empty($conf->global->MAIN_OPTIMIZEFORTEXTBROWSER) && !empty($user->conf->MAIN_OPTIMIZEFORTEXTBROWSER)) {
    $conf->global->MAIN_OPTIMIZEFORTEXTBROWSER = $user->conf->MAIN_OPTIMIZEFORTEXTBROWSER;
}

// set MAIN_OPTIMIZEFORCOLORBLIND for user
$conf->global->MAIN_OPTIMIZEFORCOLORBLIND = empty($user->conf->MAIN_OPTIMIZEFORCOLORBLIND) ? '' : $user->conf->MAIN_OPTIMIZEFORCOLORBLIND;

// Set terminal output option according to conf->browser.
if (DolibarrFunctions::GETPOST('dol_hide_leftmenu', 'int') || !empty($_SESSION['dol_hide_leftmenu'])) {
    $conf->dol_hide_leftmenu = 1;
}
if (DolibarrFunctions::GETPOST('dol_hide_topmenu', 'int') || !empty($_SESSION['dol_hide_topmenu'])) {
    $conf->dol_hide_topmenu = 1;
}
if (DolibarrFunctions::GETPOST('dol_optimize_smallscreen', 'int') || !empty($_SESSION['dol_optimize_smallscreen'])) {
    $conf->dol_optimize_smallscreen = 1;
}
if (DolibarrFunctions::GETPOST('dol_no_mouse_hover', 'int') || !empty($_SESSION['dol_no_mouse_hover'])) {
    $conf->dol_no_mouse_hover = 1;
}
if (DolibarrFunctions::GETPOST('dol_use_jmobile', 'int') || !empty($_SESSION['dol_use_jmobile'])) {
    $conf->dol_use_jmobile = 1;
}
if (!empty($conf->browser->layout) && $conf->browser->layout != 'classic') {
    $conf->dol_no_mouse_hover = 1;
}
if ((!empty($conf->browser->layout) && $conf->browser->layout == 'phone')
    || (!empty($_SESSION['dol_screenwidth']) && $_SESSION['dol_screenwidth'] < 400)
    || (!empty($_SESSION['dol_screenheight']) && $_SESSION['dol_screenheight'] < 400)
) {
    $conf->dol_optimize_smallscreen = 1;
}
// Replace themes bugged with jmobile with eldy
if (!empty($conf->dol_use_jmobile) && in_array($conf->theme, ['bureau2crea', 'cameleo', 'amarok'])) {
    $conf->theme = 'eldy';
    $conf->css = "/theme/" . $conf->theme . "/style.css.php";
}

if (!defined('NOREQUIRETRAN')) {
    if (!DolibarrFunctions::GETPOST('lang', 'aZ09')) {    // If language was not forced on URL
        // If user has chosen its own language
        if (!empty($user->conf->MAIN_LANG_DEFAULT)) {
            // If different than current language
            //print ">>>".$langs->getDefaultLang()."-".$user->conf->MAIN_LANG_DEFAULT;
            if ($langs->getDefaultLang() != $user->conf->MAIN_LANG_DEFAULT) {
                $langs->setDefaultLang($user->conf->MAIN_LANG_DEFAULT);
            }
        }
    }
}

if (!defined('NOLOGIN')) {
    // If the login is not recovered, it is identified with an account that does not exist.
    // Hacking attempt?
    dump($user);
    dump($user->login);
    if (!$user->login) {
        DolibarrSecurity::accessforbidden();
    }

    // Check if user is active
    if ($user->statut < 1) {
        // If not active, we refuse the user
        $langs->load("other");
        DolibarrFunctions::dol_syslog("Authentication KO as login is disabled", LOG_NOTICE);
        DolibarrSecurity::accessforbidden($langs->trans("ErrorLoginDisabled"));
        exit;
    }

    // Load permissions
    $user->getrights();
}

DolibarrFunctions::dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . ' - action=' . DolibarrFunctions::GETPOST('action', 'aZ09') . ', massaction=' . DolibarrFunctions::GETPOST('massaction', 'aZ09') . (defined('NOTOKENRENEWAL') ? ' NOTOKENRENEWAL=' . constant('NOTOKENRENEWAL') : ''), LOG_NOTICE);
//Another call for easy debugg
//DolibarrFunctions::dol_syslog("Access to ".$_SERVER["PHP_SELF"].' '.$_SERVER["HTTP_REFERER"].' GET='.join(',',array_keys($_GET)).'->'.join(',',$_GET).' POST:'.join(',',array_keys($_POST)).'->'.join(',',$_POST));

// Load main languages files
if (!defined('NOREQUIRETRAN')) {
    // Load translation files required by page
    $langs->loadLangs(['main', 'dict']);
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
// deprecated, see DolibarrFunctions::setEventMessages() and dol_htmloutput_events()
$mesgs = [];
$warnings = [];
$errors = [];

// Constants used to defined number of lines in textarea
if (empty($conf->browser->firefox)) {
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
if (empty($user->socid)) {    // If internal user or not defined
    $conf->standard_menu = (empty($conf->global->MAIN_MENU_STANDARD_FORCED) ? (empty($conf->global->MAIN_MENU_STANDARD) ? 'eldy_menu.php' : $conf->global->MAIN_MENU_STANDARD) : $conf->global->MAIN_MENU_STANDARD_FORCED);
} else {
    // If external user
    $conf->standard_menu = (empty($conf->global->MAIN_MENUFRONT_STANDARD_FORCED) ? (empty($conf->global->MAIN_MENUFRONT_STANDARD) ? 'eldy_menu.php' : $conf->global->MAIN_MENUFRONT_STANDARD) : $conf->global->MAIN_MENUFRONT_STANDARD_FORCED);
}

// Load the menu manager (only if not already done)
$file_menu = $conf->standard_menu;
if (DolibarrFunctions::GETPOST('menu', 'alpha')) {
    $file_menu = DolibarrFunctions::GETPOST('menu', 'alpha'); // example: menu=eldy_menu.php
}
if (!class_exists('MenuManager')) {
    $menufound = 0;
    $dirmenus = array_merge(["/core/menus/"], (array) $conf->modules_parts['menus']);
    foreach ($dirmenus as $dirmenu) {
        $menufound = DolibarrFunctions::dol_include_once($dirmenu . "standard/" . $file_menu);
        if (class_exists('MenuManager')) {
            break;
        }
    }
    if (!class_exists('MenuManager')) {    // If failed to include, we try with standard eldy_menu.php
        DolibarrFunctions::dol_syslog("You define a menu manager '" . $file_menu . "' that can not be loaded.", LOG_WARNING);
        $file_menu = 'eldy_menu.php';
        include_once DOL_DOCUMENT_ROOT . "/core/menus/standard/" . $file_menu;
    }
}
$menumanager = new MenuManager($db, empty($user->socid) ? 0 : 1);
$menumanager->loadMenu();
//}

*/