<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 *
 * Copyright (C) 2009-2015 Regis Houssin       <regis.houssin@inodbox.com>
 * Copyright (C) 2011-2021 Laurent Destailleur <eldy@users.sourceforge.net>
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

namespace Alxarafe\Dolibarr\Tpl;

use Alxarafe\Core\Providers\Translator;
use Alxarafe\Dolibarr\Classes\HookManager;
use Alxarafe\Dolibarr\Classes\MainView;
use Alxarafe\Dolibarr\Libraries\DolibarrDate;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions2;
use Alxarafe\Dolibarr\Libraries\DolibarrSecurity2;

/**
 * Class Login
 *
 * Login for use in old structure Controllers/DolibarrFunctions::dol_*.php
 *
 * @package Alxarafe\Dolibarr\Tpl
 */
class Login extends MainView
{
    public function __construct($conf)
    {
        parent::__construct();
        $this->login();
        $this->login2($conf);
    }

    public function login()
    {
        // $authmode lists the different method of identification to be tested in order of preference.
        // Example: 'http', 'dolibarr', 'ldap', 'http,forceuser', '...'

        $hookmanager = new HookManager();

        if (defined('MAIN_AUTHENTICATION_MODE')) {
            $dolibarr_main_authentication = constant('MAIN_AUTHENTICATION_MODE');
        } else {
            // Authentication mode
            if (empty($dolibarr_main_authentication)) {
                $dolibarr_main_authentication = 'http,dolibarr';
            }
            // Authentication mode: forceuser
            if ($dolibarr_main_authentication == 'forceuser' && empty($dolibarr_auto_user)) {
                $dolibarr_auto_user = 'auto';
            }
        }
        // Set authmode
        $authmode = explode(',', $dolibarr_main_authentication);

        // No authentication mode
        if (!count($authmode)) {
            $langs->load('main');
            DolibarrFunctions::dol_print_error('', $langs->trans("ErrorConfigParameterNotDefined", 'dolibarr_main_authentication'));
            exit;
        }

        // If login request was already post, we retrieve login from the session
        // Call module if not realized that his request.
        // At the end of this phase, the variable $login is defined.
        $resultFetchUser = '';
        $test = true;
        if (!isset($_SESSION["dol_login"])) {
            // It is not already authenticated and it requests the login / password
            // include_once DOL_DOCUMENT_ROOT . '/core/lib/security2.lib.php';

            $dol_dst_observed = DolibarrFunctions::GETPOST("dst_observed", 'int', 3);
            $dol_dst_first = DolibarrFunctions::GETPOST("dst_first", 'int', 3);
            $dol_dst_second = DolibarrFunctions::GETPOST("dst_second", 'int', 3);
            $dol_screenwidth = DolibarrFunctions::GETPOST("screenwidth", 'int', 3);
            $dol_screenheight = DolibarrFunctions::GETPOST("screenheight", 'int', 3);
            $dol_hide_topmenu = DolibarrFunctions::GETPOST('DolibarrFunctions::dol_hide_topmenu', 'int', 3);
            $dol_hide_leftmenu = DolibarrFunctions::GETPOST('DolibarrFunctions::dol_hide_leftmenu', 'int', 3);
            $dol_optimize_smallscreen = DolibarrFunctions::GETPOST('DolibarrFunctions::dol_optimize_smallscreen', 'int', 3);
            $dol_no_mouse_hover = DolibarrFunctions::GETPOST('DolibarrFunctions::dol_no_mouse_hover', 'int', 3);
            $dol_use_jmobile = DolibarrFunctions::GETPOST('DolibarrFunctions::dol_use_jmobile', 'int', 3); // 0=default, 1=to say we use app from a webview app, 2=to say we use app from a webview app and keep ajax
            //DolibarrFunctions::dol_syslog("POST key=".join(array_keys($_POST),',').' value='.join($_POST,','));

            // If in demo mode, we check we go to home page through the public/demo/index.php page
            if (!empty($dolibarr_main_demo) && $_SERVER['PHP_SELF'] == DOL_URL_ROOT . '/index.php') {  // We ask index page
                if (empty($_SERVER['HTTP_REFERER']) || !preg_match('/public/', $_SERVER['HTTP_REFERER'])) {
                    DolibarrFunctions::dol_syslog("Call index page from another url than demo page (call is done from page " . $_SERVER['HTTP_REFERER'] . ")");
                    $url = '';
                    $url .= ($url ? '&' : '') . ($dol_hide_topmenu ? 'DolibarrFunctions::dol_hide_topmenu=' . $dol_hide_topmenu : '');
                    $url .= ($url ? '&' : '') . ($dol_hide_leftmenu ? 'DolibarrFunctions::dol_hide_leftmenu=' . $dol_hide_leftmenu : '');
                    $url .= ($url ? '&' : '') . ($dol_optimize_smallscreen ? 'DolibarrFunctions::dol_optimize_smallscreen=' . $dol_optimize_smallscreen : '');
                    $url .= ($url ? '&' : '') . ($dol_no_mouse_hover ? 'DolibarrFunctions::dol_no_mouse_hover=' . $dol_no_mouse_hover : '');
                    $url .= ($url ? '&' : '') . ($dol_use_jmobile ? 'DolibarrFunctions::dol_use_jmobile=' . $dol_use_jmobile : '');
                    $url = DOL_URL_ROOT . '/public/demo/index.php' . ($url ? '?' . $url : '');
                    header("Location: " . $url);
                    exit;
                }
            }

            // Hooks for security access
            $action = '';
            $hookmanager->initHooks(['login']);
            $parameters = [];
            $reshook = $hookmanager->executeHooks('beforeLoginAuthentication', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
            if ($reshook < 0) {
                $test = false;
                $error++;
            }

            // Verification security graphic code
            if ($test && DolibarrFunctions::GETPOST("username", "alpha", 2) && !empty($conf->global->MAIN_SECURITY_ENABLECAPTCHA) && !isset($_SESSION['DolibarrFunctions::dol_bypass_antispam'])) {
                $sessionkey = 'DolibarrFunctions::dol_antispam_value';
                $ok = (array_key_exists($sessionkey, $_SESSION) === true && (strtolower($_SESSION[$sessionkey]) === strtolower(DolibarrFunctions::GETPOST('code', 'none'))));

                // Check code
                if (!$ok) {
                    DolibarrFunctions::dol_syslog('Bad value for code, connexion refused');
                    // Load translation files required by page
                    $langs->loadLangs(['main', 'errors']);

                    $_SESSION["dol_loginmesg"] = $langs->transnoentitiesnoconv("ErrorBadValueForCode");
                    $test = false;

                    // Call trigger for the "security events" log
                    $this->user->trigger_mesg = 'ErrorBadValueForCode - login=' . DolibarrFunctions::GETPOST("username", "alpha", 2);

                    // Call trigger
                    $result = $this->user->call_trigger('USER_LOGIN_FAILED', $this->user);
                    if ($result < 0) {
                        $error++;
                    }
                    // End call triggers

                    // Hooks on failed login
                    $action = '';
                    $hookmanager->initHooks(['login']);
                    $parameters = ['DolibarrFunctions::dol_authmode' => $authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
                    $reshook = $hookmanager->executeHooks('afterLoginFailed', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
                    if ($reshook < 0) {
                        $error++;
                    }
                    // Note: exit is done later
                }
            }

            $allowedmethodtopostusername = 2;
            if (defined('MAIN_AUTHENTICATION_POST_METHOD')) {
                $allowedmethodtopostusername = constant('MAIN_AUTHENTICATION_POST_METHOD');
            }
            $this->usertotest = (!empty($_COOKIE['login_dolibarr']) ? preg_replace('/[^a-zA-Z0-9_\-]/', '', $_COOKIE['login_dolibarr']) : DolibarrFunctions::GETPOST("username", "alpha", $allowedmethodtopostusername));
            $passwordtotest = DolibarrFunctions::GETPOST('password', 'none', $allowedmethodtopostusername);
            $entitytotest = (DolibarrFunctions::GETPOST('entity', 'int') ? DolibarrFunctions::GETPOST('entity', 'int') : (!empty($conf->entity) ? $conf->entity : 1));

            // Define if we received data to test the login.
            $goontestloop = false;
            if (isset($_SERVER["REMOTE_USER"]) && in_array('http', $authmode)) {
                $goontestloop = true;
            }
            if ($dolibarr_main_authentication == 'forceuser' && !empty($dolibarr_auto_user)) {
                $goontestloop = true;
            }
            if (DolibarrFunctions::GETPOST("username", "alpha", $allowedmethodtopostusername) || !empty($_COOKIE['login_dolibarr']) || DolibarrFunctions::GETPOST('openid_mode', 'alpha', 1)) {
                $goontestloop = true;
            }

            if (!is_object($langs)) { // This can occurs when calling page with NOREQUIRETRAN defined, however we need langs for error messages.
                //include_once DOL_DOCUMENT_ROOT . '/core/class/translate.class.php';
                //$langs = new Translate("", $conf);
                $langs = Translator::getInstance();
                $langcode = (DolibarrFunctions::GETPOST('lang', 'aZ09', 1) ? DolibarrFunctions::GETPOST('lang', 'aZ09', 1) : (empty($conf->global->MAIN_LANG_DEFAULT) ? 'auto' : $conf->global->MAIN_LANG_DEFAULT));
                if (defined('MAIN_LANG_DEFAULT')) {
                    $langcode = constant('MAIN_LANG_DEFAULT');
                }
                $langs->setDefaultLang($langcode);
            }

            // Validation of login/pass/entity
            // If ok, the variable login will be returned
            // If error, we will put error message in session under the name dol_loginmesg
            if ($test && $goontestloop && (DolibarrFunctions::GETPOST('actionlogin', 'aZ09') == 'login' || $dolibarr_main_authentication != 'dolibarr')) {
                $login = DolibarrSecurity2::checkLoginPassEntity($this->usertotest, $passwordtotest, $entitytotest, $authmode);
                if ($login === '--bad-login-validity--') {
                    $login = '';
                }

                if ($login) {
                    $dol_authmode = $conf->authmode; // This properties is defined only when logged, to say what mode was successfully used
                    $dol_tz = $_POST["tz"];
                    $dol_tz_string = $_POST["tz_string"];
                    $dol_tz_string = preg_replace('/\s*\(.+\)$/', '', $dol_tz_string);
                    $dol_tz_string = preg_replace('/,/', '/', $dol_tz_string);
                    $dol_tz_string = preg_replace('/\s/', '_', $dol_tz_string);
                    $dol_dst = 0;
                    // Keep $_POST here. Do not use DolibarrFunctions::GETPOSTISSET
                    if (isset($_POST["dst_first"]) && isset($_POST["dst_second"])) {
                        // include_once DOL_DOCUMENT_ROOT . '/core/lib/date.lib.php';
                        $datenow = DolibarrFunctions::dol_now();
                        $datefirst = DolibarrDate::dol_stringtotime($_POST["dst_first"]);
                        $datesecond = DolibarrDate::dol_stringtotime($_POST["dst_second"]);
                        if ($datenow >= $datefirst && $datenow < $datesecond) {
                            $dol_dst = 1;
                        }
                    }
                    //print $datefirst.'-'.$datesecond.'-'.$datenow.'-'.$dol_tz.'-'.$dol_tzstring.'-'.$dol_dst; exit;
                }

                if (!$login) {
                    DolibarrFunctions::dol_syslog('Bad password, connexion refused', LOG_DEBUG);
                    // Load translation files required by page
                    $langs->loadLangs(['main', 'errors']);

                    // Bad password. No authmode has found a good password.
                    // We set a generic message if not defined inside function checkLoginPassEntity or subfunctions
                    if (empty($_SESSION["dol_loginmesg"])) {
                        $_SESSION["dol_loginmesg"] = $langs->transnoentitiesnoconv("ErrorBadLoginPassword");
                    }

                    // Call trigger for the "security events" log
                    $this->user->trigger_mesg = $langs->trans("ErrorBadLoginPassword") . ' - login=' . DolibarrFunctions::GETPOST("username", "alpha", 2);

                    // Call trigger
                    $result = $this->user->call_trigger('USER_LOGIN_FAILED', $this->user);
                    if ($result < 0) {
                        $error++;
                    }
                    // End call triggers

                    // Hooks on failed login
                    $action = '';
                    $hookmanager->initHooks(['login']);
                    $parameters = ['DolibarrFunctions::dol_authmode' => $dol_authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
                    $reshook = $hookmanager->executeHooks('afterLoginFailed', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
                    if ($reshook < 0) {
                        $error++;
                    }
                    // Note: exit is done in next chapter
                }
            }

            // End test login / passwords
            if (!$login || (in_array('ldap', $authmode) && empty($passwordtotest))) {    // With LDAP we refused empty password because some LDAP are "opened" for anonymous access so connexion is a success.
                // No data to test login, so we show the login page.
                DolibarrFunctions::dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . " - action=" . DolibarrFunctions::GETPOST('action', 'aZ09') . " - actionlogin=" . DolibarrFunctions::GETPOST('actionlogin', 'aZ09') . " - showing the login form and exit", LOG_INFO);
                if (defined('NOREDIRECTBYMAINTOLOGIN')) {
                    return 'ERROR_NOT_LOGGED';
                } else {
                    if ($_SERVER["HTTP_USER_AGENT"] == 'securitytest') {
                        http_response_code(401); // It makes easier to understand if session was broken during security tests
                    }
                    dol_loginfunction($langs, $conf, (!empty($mysoc) ? $mysoc : ''));
                }
                exit;
            }

            dump($this->user);
            $resultFetchUser = $this->user->fetch('', $login, '', 1, ($entitytotest > 0 ? $entitytotest : -1)); // login was retrieved previously when checking password.
            if ($resultFetchUser <= 0) {
                DolibarrFunctions::dol_syslog('User not found, connexion refused');
                session_destroy();
                session_set_cookie_params(0, '/', null, (empty($dolibarr_main_force_https) ? false : true), true); // Add tag secure and httponly on session cookie
                session_name($sessionname);
                session_start();

                if ($resultFetchUser == 0) {
                    // Load translation files required by page
                    $langs->loadLangs(['main', 'errors']);

                    $_SESSION["dol_loginmesg"] = $langs->transnoentitiesnoconv("ErrorCantLoadUserFromDolibarrDatabase", $login);

                    $this->user->trigger_mesg = 'ErrorCantLoadUserFromDolibarrDatabase - login=' . $login;
                }
                if ($resultFetchUser < 0) {
                    $_SESSION["dol_loginmesg"] = $this->user->error;

                    $this->user->trigger_mesg = $this->user->error;
                }

                // Call trigger
                $result = $this->user->call_trigger('USER_LOGIN_FAILED', $this->user);
                if ($result < 0) {
                    $error++;
                }
                // End call triggers

                // Hooks on failed login
                $action = '';
                $hookmanager->initHooks(['login']);
                $parameters = ['DolibarrFunctions::dol_authmode' => $dol_authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
                $reshook = $hookmanager->executeHooks('afterLoginFailed', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
                if ($reshook < 0) {
                    $error++;
                }

                $paramsurl = [];
                if (DolibarrFunctions::GETPOST('textbrowser', 'int')) {
                    $paramsurl[] = 'textbrowser=' . DolibarrFunctions::GETPOST('textbrowser', 'int');
                }
                if (DolibarrFunctions::GETPOST('nojs', 'int')) {
                    $paramsurl[] = 'nojs=' . DolibarrFunctions::GETPOST('nojs', 'int');
                }
                if (DolibarrFunctions::GETPOST('lang', 'aZ09')) {
                    $paramsurl[] = 'lang=' . DolibarrFunctions::GETPOST('lang', 'aZ09');
                }
                header('Location: ' . DOL_URL_ROOT . '/index.php' . (count($paramsurl) ? '?' . implode('&', $paramsurl) : ''));
                exit;
            } else {
                // User is loaded, we may need to change language for him according to its choice
                if (!empty($this->user->conf->MAIN_LANG_DEFAULT)) {
                    $langs->setDefaultLang($this->user->conf->MAIN_LANG_DEFAULT);
                }
            }
        } else {
            // We are already into an authenticated session
            $login = $_SESSION["dol_login"];
            $entity = isset($_SESSION["DolibarrFunctions::dol_entity"]) ? $_SESSION["DolibarrFunctions::dol_entity"] : 0;
            DolibarrFunctions::dol_syslog("- This is an already logged session. _SESSION['dol_login']=" . $login . " _SESSION['DolibarrFunctions::dol_entity']=" . $entity, LOG_DEBUG);

            $resultFetchUser = $this->user->fetch('', $login, '', 1, ($entity > 0 ? $entity : -1));
            if ($resultFetchUser <= 0) {
                // Account has been removed after login
                DolibarrFunctions::dol_syslog("Can't load user even if session logged. _SESSION['dol_login']=" . $login, LOG_WARNING);
                session_destroy();
                session_set_cookie_params(0, '/', null, (empty($dolibarr_main_force_https) ? false : true), true); // Add tag secure and httponly on session cookie
                session_name($sessionname);
                session_start();

                if ($resultFetchUser == 0) {
                    // Load translation files required by page
                    $langs->loadLangs(['main', 'errors']);

                    $_SESSION["dol_loginmesg"] = $langs->transnoentitiesnoconv("ErrorCantLoadUserFromDolibarrDatabase", $login);

                    $this->user->trigger_mesg = 'ErrorCantLoadUserFromDolibarrDatabase - login=' . $login;
                }
                if ($resultFetchUser < 0) {
                    $_SESSION["dol_loginmesg"] = $this->user->error;

                    $this->user->trigger_mesg = $this->user->error;
                }

                // Call trigger
                $result = $this->user->call_trigger('USER_LOGIN_FAILED', $this->user);
                if ($result < 0) {
                    $error++;
                }
                // End call triggers

                // Hooks on failed login
                $action = '';
                $hookmanager->initHooks(['login']);
                $parameters = ['DolibarrFunctions::dol_authmode' => $dol_authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
                $reshook = $hookmanager->executeHooks('afterLoginFailed', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
                if ($reshook < 0) {
                    $error++;
                }

                $paramsurl = [];
                if (DolibarrFunctions::GETPOST('textbrowser', 'int')) {
                    $paramsurl[] = 'textbrowser=' . DolibarrFunctions::GETPOST('textbrowser', 'int');
                }
                if (DolibarrFunctions::GETPOST('nojs', 'int')) {
                    $paramsurl[] = 'nojs=' . DolibarrFunctions::GETPOST('nojs', 'int');
                }
                if (DolibarrFunctions::GETPOST('lang', 'aZ09')) {
                    $paramsurl[] = 'lang=' . DolibarrFunctions::GETPOST('lang', 'aZ09');
                }
                header('Location: ' . DOL_URL_ROOT . '/index.php' . (count($paramsurl) ? '?' . implode('&', $paramsurl) : ''));
                exit;
            } else {
                // Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
                $hookmanager->initHooks(['main']);

                // Code for search criteria persistence.
                if (!empty($_GET['save_lastsearch_values'])) {    // We must use $_GET here
                    $relativepathstring = preg_replace('/\?.*$/', '', $_SERVER["HTTP_REFERER"]);
                    $relativepathstring = preg_replace('/^https?:\/\/[^\/]*/', '', $relativepathstring); // Get full path except host server
                    // Clean $relativepathstring
                    if (constant('DOL_URL_ROOT')) {
                        $relativepathstring = preg_replace('/^' . preg_quote(constant('DOL_URL_ROOT'), '/') . '/', '', $relativepathstring);
                    }
                    $relativepathstring = preg_replace('/^\//', '', $relativepathstring);
                    $relativepathstring = preg_replace('/^custom\//', '', $relativepathstring);
                    //var_dump($relativepathstring);

                    // We click on a link that leave a page we have to save search criteria, contextpage, limit and page. We save them from tmp to no tmp
                    if (!empty($_SESSION['lastsearch_values_tmp_' . $relativepathstring])) {
                        $_SESSION['lastsearch_values_' . $relativepathstring] = $_SESSION['lastsearch_values_tmp_' . $relativepathstring];
                        unset($_SESSION['lastsearch_values_tmp_' . $relativepathstring]);
                    }
                    if (!empty($_SESSION['lastsearch_contextpage_tmp_' . $relativepathstring])) {
                        $_SESSION['lastsearch_contextpage_' . $relativepathstring] = $_SESSION['lastsearch_contextpage_tmp_' . $relativepathstring];
                        unset($_SESSION['lastsearch_contextpage_tmp_' . $relativepathstring]);
                    }
                    if (!empty($_SESSION['lastsearch_page_tmp_' . $relativepathstring]) && $_SESSION['lastsearch_page_tmp_' . $relativepathstring] > 0) {
                        $_SESSION['lastsearch_page_' . $relativepathstring] = $_SESSION['lastsearch_page_tmp_' . $relativepathstring];
                        unset($_SESSION['lastsearch_page_tmp_' . $relativepathstring]);
                    }
                    if (!empty($_SESSION['lastsearch_limit_tmp_' . $relativepathstring]) && $_SESSION['lastsearch_limit_tmp_' . $relativepathstring] != $conf->liste_limit) {
                        $_SESSION['lastsearch_limit_' . $relativepathstring] = $_SESSION['lastsearch_limit_tmp_' . $relativepathstring];
                        unset($_SESSION['lastsearch_limit_tmp_' . $relativepathstring]);
                    }
                }

                $action = '';
                $reshook = $hookmanager->executeHooks('updateSession', [], $this->user, $action);
                if ($reshook < 0) {
                    setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
                }
            }
        }

        // Is it a new session that has started ?
        // If we are here, this means authentication was successfull.
        if (!isset($_SESSION["dol_login"])) {
            // New session for this login has started.
            $error = 0;

            // Store value into session (values always stored)
            $_SESSION["dol_login"] = $this->user->login;
            $_SESSION["DolibarrFunctions::dol_authmode"] = isset($dol_authmode) ? $dol_authmode : '';
            $_SESSION["DolibarrFunctions::dol_tz"] = isset($dol_tz) ? $dol_tz : '';
            $_SESSION["DolibarrFunctions::dol_tz_string"] = isset($dol_tz_string) ? $dol_tz_string : '';
            $_SESSION["DolibarrFunctions::dol_dst"] = isset($dol_dst) ? $dol_dst : '';
            $_SESSION["DolibarrFunctions::dol_dst_observed"] = isset($dol_dst_observed) ? $dol_dst_observed : '';
            $_SESSION["DolibarrFunctions::dol_dst_first"] = isset($dol_dst_first) ? $dol_dst_first : '';
            $_SESSION["DolibarrFunctions::dol_dst_second"] = isset($dol_dst_second) ? $dol_dst_second : '';
            $_SESSION["DolibarrFunctions::dol_screenwidth"] = isset($dol_screenwidth) ? $dol_screenwidth : '';
            $_SESSION["DolibarrFunctions::dol_screenheight"] = isset($dol_screenheight) ? $dol_screenheight : '';
            $_SESSION["DolibarrFunctions::dol_company"] = DolibarrFunctions::getDolGlobalString("MAIN_INFO_SOCIETE_NOM");
            $_SESSION["DolibarrFunctions::dol_entity"] = $conf->entity;
            // Store value into session (values stored only if defined)
            if (!empty($dol_hide_topmenu)) {
                $_SESSION['DolibarrFunctions::dol_hide_topmenu'] = $dol_hide_topmenu;
            }
            if (!empty($dol_hide_leftmenu)) {
                $_SESSION['DolibarrFunctions::dol_hide_leftmenu'] = $dol_hide_leftmenu;
            }
            if (!empty($dol_optimize_smallscreen)) {
                $_SESSION['DolibarrFunctions::dol_optimize_smallscreen'] = $dol_optimize_smallscreen;
            }
            if (!empty($dol_no_mouse_hover)) {
                $_SESSION['DolibarrFunctions::dol_no_mouse_hover'] = $dol_no_mouse_hover;
            }
            if (!empty($dol_use_jmobile)) {
                $_SESSION['DolibarrFunctions::dol_use_jmobile'] = $dol_use_jmobile;
            }

            DolibarrFunctions::dol_syslog("This is a new started user session. _SESSION['dol_login']=" . $_SESSION["dol_login"] . " Session id=" . session_id());

            $this->db->begin();

            $this->user->update_last_login_date();

            $loginfo = 'TZ=' . $_SESSION["DolibarrFunctions::dol_tz"] . ';TZString=' . $_SESSION["DolibarrFunctions::dol_tz_string"] . ';Screen=' . $_SESSION["DolibarrFunctions::dol_screenwidth"] . 'x' . $_SESSION["DolibarrFunctions::dol_screenheight"];

            // Call triggers for the "security events" log
            $this->user->trigger_mesg = $loginfo;

            // Call trigger
            $result = $this->user->call_trigger('USER_LOGIN', $this->user);
            if ($result < 0) {
                $error++;
            }
            // End call triggers

            // Hooks on successfull login
            $action = '';
            $hookmanager->initHooks(['login']);
            $parameters = ['DolibarrFunctions::dol_authmode' => $dol_authmode, 'dol_loginfo' => $loginfo];
            $reshook = $hookmanager->executeHooks('afterLogin', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
            if ($reshook < 0) {
                $error++;
            }

            if ($error) {
                $this->db->rollback();
                session_destroy();
                DolibarrFunctions::dol_print_error($this->db, 'Error in some triggers USER_LOGIN or in some hooks afterLogin');
                exit;
            } else {
                $this->db->commit();
            }

            // Change landing page if defined.
            $landingpage = (empty($this->user->conf->MAIN_LANDING_PAGE) ? (empty($conf->global->MAIN_LANDING_PAGE) ? '' : $conf->global->MAIN_LANDING_PAGE) : $this->user->conf->MAIN_LANDING_PAGE);
            if (!empty($landingpage)) {    // Example: /index.php
                $newpath = DolibarrFunctions::dol_buildpath($landingpage, 1);
                if ($_SERVER["PHP_SELF"] != $newpath) {   // not already on landing page (avoid infinite loop)
                    header('Location: ' . $newpath);
                    exit;
                }
            }
        }

        // If user admin, we force the rights-based modules
        if ($this->user->admin) {
            $this->user->rights->user->user->lire = 1;
            $this->user->rights->user->user->creer = 1;
            $this->user->rights->user->user->password = 1;
            $this->user->rights->user->user->supprimer = 1;
            $this->user->rights->user->self->creer = 1;
            $this->user->rights->user->self->password = 1;

            //Required if advanced permissions are used with MAIN_USE_ADVANCED_PERMS
            if (!empty($conf->global->MAIN_USE_ADVANCED_PERMS)) {
                if (empty($this->user->rights->user->user_advance)) {
                    $this->user->rights->user->user_advance = new stdClass(); // To avoid warnings
                }
                if (empty($this->user->rights->user->self_advance)) {
                    $this->user->rights->user->self_advance = new stdClass(); // To avoid warnings
                }
                if (empty($this->user->rights->user->group_advance)) {
                    $this->user->rights->user->group_advance = new stdClass(); // To avoid warnings
                }

                $this->user->rights->user->user_advance->readperms = 1;
                $this->user->rights->user->user_advance->write = 1;
                $this->user->rights->user->self_advance->readperms = 1;
                $this->user->rights->user->self_advance->writeperms = 1;
                $this->user->rights->user->group_advance->read = 1;
                $this->user->rights->user->group_advance->readperms = 1;
                $this->user->rights->user->group_advance->write = 1;
                $this->user->rights->user->group_advance->delete = 1;
            }
        }

        /*
         * Overwrite some configs globals (try to avoid this and have code to use instead $this->user->conf->xxx)
         */

        // Set liste_limit
        if (isset($this->user->conf->MAIN_SIZE_LISTE_LIMIT)) {
            $conf->liste_limit = $this->user->conf->MAIN_SIZE_LISTE_LIMIT; // Can be 0
        }
        if (isset($this->user->conf->PRODUIT_LIMIT_SIZE)) {
            $conf->product->limit_size = $this->user->conf->PRODUIT_LIMIT_SIZE; // Can be 0
        }

        // Replace conf->css by personalized value if theme not forced
        if (empty($conf->global->MAIN_FORCETHEME) && !empty($this->user->conf->MAIN_THEME)) {
            $conf->theme = $this->user->conf->MAIN_THEME;
            $conf->css = "/theme/" . $conf->theme . "/style.css.php";
        }
    }

    public function login2($conf)
    {

        // Need global variable $urllogo, $title and $titletruedolibarrversion to be defined by caller (like dol_loginfunction in security2.lib.php)
        // Caller can also set 	$morelogincontent = array(['options']=>array('js'=>..., 'table'=>...);

        if (!defined('NOBROWSERNOTIF')) {
            define('NOBROWSERNOTIF', 1);
        }

        // Protection to avoid direct call of template
        if (empty($conf) || !is_object($conf)) {
            print "Error, template page can't be called as URL";
            exit;
        }

        // require_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';

        header('Cache-Control: Public, must-revalidate');
        header("Content-type: text/html; charset=" . $conf->file->character_set_client);

        if (DolibarrFunctions::GETPOST('DolibarrFunctions::dol_hide_topmenu')) {
            $conf->dol_hide_topmenu = 1;
        }
        if (DolibarrFunctions::GETPOST('DolibarrFunctions::dol_hide_leftmenu')) {
            $conf->dol_hide_leftmenu = 1;
        }
        if (DolibarrFunctions::GETPOST('DolibarrFunctions::dol_optimize_smallscreen')) {
            $conf->dol_optimize_smallscreen = 1;
        }
        if (DolibarrFunctions::GETPOST('DolibarrFunctions::dol_no_mouse_hover')) {
            $conf->dol_no_mouse_hover = 1;
        }
        if (DolibarrFunctions::GETPOST('DolibarrFunctions::dol_use_jmobile')) {
            $conf->dol_use_jmobile = 1;
        }

        // If we force to use jmobile, then we reenable javascript
        if (!empty($conf->dol_use_jmobile)) {
            $conf->use_javascript_ajax = 1;
        }

        $php_self = DolibarrFunctions::dol_escape_htmltag($_SERVER['PHP_SELF']);
        $php_self .= DolibarrFunctions::dol_escape_htmltag($_SERVER["QUERY_STRING"]) ? '?' . DolibarrFunctions::dol_escape_htmltag($_SERVER["QUERY_STRING"]) : '';
        if (!preg_match('/mainmenu=/', $php_self)) {
            $php_self .= (preg_match('/\?/', $php_self) ? '&' : '?') . 'mainmenu=home';
        }

        // Javascript code on logon page only to detect user tz, dst_observed, dst_first, dst_second
        $arrayofjs = [
            '/includes/jstz/jstz.min.js' . (empty($conf->dol_use_jmobile) ? '' : '?version=' . urlencode(DolibarrFunctions::dol_VERSION)),
            '/core/js/dst.js' . (empty($conf->dol_use_jmobile) ? '' : '?version=' . urlencode(DolibarrFunctions::dol_VERSION)),
        ];

        // We display application title instead Login term
        if (!empty($conf->global->MAIN_APPLICATION_TITLE)) {
            $titleofloginpage = $conf->global->MAIN_APPLICATION_TITLE;
        } else {
            $titleofloginpage = $this->langs->trans('Login');
        }
        $titleofloginpage .= ' @ ' . $titletruedolibarrversion; // $titletruedolibarrversion is defined by dol_loginfunction in security2.lib.php. We must keep the @, some tools use it to know it is login page and find true dolibarr version.

        $disablenofollow = 1;
        if (!preg_match('/' . constant('DOL_APPLICATION_TITLE') . '/', $title)) {
            $disablenofollow = 0;
        }
        if (!empty($conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
            $disablenofollow = 0;
        }

        print $this->top_htmlhead('', $titleofloginpage, 0, 0, $arrayofjs, [], 0, $disablenofollow);

        $colorbackhmenu1 = '60,70,100'; // topmenu
        if (!isset($conf->global->THEME_ELDY_TOPMENU_BACK1)) {
            $conf->global->THEME_ELDY_TOPMENU_BACK1 = $colorbackhmenu1;
        }
        $colorbackhmenu1 = empty($this->user->conf->THEME_ELDY_ENABLE_PERSONALIZED) ? (empty($conf->global->THEME_ELDY_TOPMENU_BACK1) ? $colorbackhmenu1 : $conf->global->THEME_ELDY_TOPMENU_BACK1) : (empty($this->user->conf->THEME_ELDY_TOPMENU_BACK1) ? $colorbackhmenu1 : $this->user->conf->THEME_ELDY_TOPMENU_BACK1);
        $colorbackhmenu1 = join(',', DolibarrFunctions2::colorStringToArray($colorbackhmenu1)); // Normalize value to 'x,y,z'

        print "<!-- BEGIN PHP TEMPLATE LOGIN.TPL.PHP -->\n";

        if (!empty($conf->global->ADD_UNSPLASH_LOGIN_BACKGROUND)) {
            // For example $conf->global->ADD_UNSPLASH_LOGIN_BACKGROUND = 'https://source.unsplash.com/random'
            print '
<body class="body bodylogin"
      style="background-image: url(' . DolibarrFunctions::dol_escape_htmltag($conf->global->ADD_UNSPLASH_LOGIN_BACKGROUND) . '); background-repeat: no-repeat; background-position: center center; background-attachment: fixed; background-size: cover; background-color: #ffffff;">
';
        } else {
            print '
<body class="body bodylogin"' . empty($conf->global->MAIN_LOGIN_BACKGROUND) ? '' : ' style="background-size: cover; background-position: center center; background-attachment: fixed; background-repeat: no-repeat; background-image: url(\'' . DOL_URL_ROOT . '/viewimage.php?cache=1&noalt=1&modulepart=mycompany&file=logos/' . urlencode($conf->global->MAIN_LOGIN_BACKGROUND) . '\')"' . '>
';
        }

        if (empty($conf->dol_use_jmobile)) {
            print '<script>
        $(document).ready(function () {
            /* Set focus on correct field */';
            if ($focus_element) {
                print '$(' . $focus_element . ').focus();';
            }        // Warning to use this only on visible element
            print '});
    </script>';
        }

        print '<div class="login_center center"' . (empty($conf->global->MAIN_LOGIN_BACKGROUND) ? ' style="background-size: cover; background-position: center center; background-attachment: fixed; background-repeat: no-repeat; background-image: linear-gradient(rgb(' . $colorbackhmenu1 . ',0.3), rgb(240,240,240));"' : '') .
            '<div class="login_vertical_align">

        <form id="login" name="login" method="post" action="' . $php_self . '">
            <input type="hidden" name="token" value="' . DolibarrFunctions::newToken() . '"/>
            <input type="hidden" name="actionlogin" value="login">
            <input type="hidden" name="loginfunction" value="loginfunction"/>
            <!-- Add fields to send local user information -->
            <input type="hidden" name="tz" id="tz" value=""/>
            <input type="hidden" name="tz_string" id="tz_string" value=""/>
            <input type="hidden" name="dst_observed" id="dst_observed" value=""/>
            <input type="hidden" name="dst_first" id="dst_first" value=""/>
            <input type="hidden" name="dst_second" id="dst_second" value=""/>
            <input type="hidden" name="screenwidth" id="screenwidth" value=""/>
            <input type="hidden" name="screenheight" id="screenheight" value=""/>
            <input type="hidden" name="DolibarrFunctions::dol_hide_topmenu" id="DolibarrFunctions::dol_hide_topmenu"
                   value="' . $dol_hide_topmenu . '"/>
            <input type="hidden" name="DolibarrFunctions::dol_hide_leftmenu" id="DolibarrFunctions::dol_hide_leftmenu"
                   value="' . $dol_hide_leftmenu . '"/>
            <input type="hidden" name="DolibarrFunctions::dol_optimize_smallscreen" id="DolibarrFunctions::dol_optimize_smallscreen"
                   value="' . $dol_optimize_smallscreen . '"/>
            <input type="hidden" name="DolibarrFunctions::dol_no_mouse_hover" id="DolibarrFunctions::dol_no_mouse_hover"
                   value="' . $dol_no_mouse_hover . '"/>
            <input type="hidden" name="DolibarrFunctions::dol_use_jmobile" id="DolibarrFunctions::dol_use_jmobile" value="' . $dol_use_jmobile . '"/>


            <!-- Title with version -->
            <div class="login_table_title center" title="' . DolibarrFunctions::dol_escape_htmltag($title) . '">';
        if ($disablenofollow) {
            echo '<a class="login_table_title" href="https://www.dolibarr.org" target="_blank">';
        }
        echo DolibarrFunctions::dol_escape_htmltag($title);
        if ($disablenofollow) {
            echo '</a>';
        }
        print '</div>


            <div class="login_table">

                <div id="login_line1">

                    <div id="login_left">
                        <img alt="" src="' . $urllogo . '" id="img_logo"/>
                    </div>

                    <br>

                    <div id="login_right">

                        <div class="tagtable left centpercent" title="' . $this->langs->trans("EnterLoginDetail") . '">

                            <!-- Login -->
                            <div class="trinputlogin">
                                <div class="tagtd nowraponall center valignmiddle tdinputlogin">';
        if (!empty($conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
            print '<label for="username"
                                                 class="hidden">' . $this->langs->trans("Login") . '</label>';
        }
        print'<!-- <span class="span-icon-user">-->
                                    <span class="fa fa-user"></span>
                                    <input type="text" id="username" maxlength="255"
                                           placeholder="' . $this->langs->trans("Login") . '" name="username"
                                           class="flat input-icon-user minwidth150"
                                           value="' . DolibarrFunctions::dol_escape_htmltag($login) . '" tabindex="1"
                                           autofocus="autofocus"/>
                                </div>
                            </div>

                            <!-- Password -->
                            <div class="trinputlogin">
                                <div class="tagtd nowraponall center valignmiddle tdinputlogin">';
        if (!empty($conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
            print '<label for="password"
                                                 class="hidden">' . $this->langs->trans("Password") . '</label>';
        }
        print'
                                    <!--<span class="span-icon-password">-->
                                    <span class="fa fa-key"></span>
                                    <input type="password" id="password" maxlength="128"
                                           placeholder="' . $this->langs->trans("Password") . '" name="password"
                                           class="flat input-icon-password minwidth150"
                                           value="' . DolibarrFunctions::dol_escape_htmltag($password) . '" tabindex="2"
                                           autocomplete="' . (empty($conf->global->MAIN_LOGIN_ENABLE_PASSWORD_AUTOCOMPLETE) ? 'off' : 'on') . '"/>
                                </div>
                            </div>';

        if (!empty($captcha)) {
            // Add a variable param to force not using cache (jmobile)
            $php_self = preg_replace('/[&\?]time=(\d+)/', '', $php_self); // Remove param time
            if (preg_match('/\?/', $php_self)) {
                $php_self .= '&time=' . DolibarrFunctions::dol_print_date(DolibarrFunctions::dol_now(), 'dayhourlog');
            } else {
                $php_self .= '?time=' . DolibarrFunctions::dol_print_date(DolibarrFunctions::dol_now(), 'dayhourlog');
            }
            // TODO: provide accessible captcha variants

            print'<!-- Captcha -->
                                <div class="trinputlogin">
                                    <div class="tagtd none valignmiddle tdinputlogin nowrap">

                                        <span class="fa fa-unlock"></span>
                                        <span class="span-icon-security inline-block">
	<input id="securitycode" placeholder="' . $this->langs->trans("SecurityCode") . '"
           class="flat input-icon-security width125" type="text" maxlength="5" name="code" tabindex="3"
           autocomplete="off"/>
	</span>
                                        <span class="nowrap inline-block">
	<img class="inline-block valignmiddle" src="' . DOL_URL_ROOT . '/core/antispamimage.php" border="0" width="80"
         height="32" id="img_securitycode"/>
	<a class="inline-block valignmiddle" href="' . $php_self . '" tabindex="4"
       data-role="button">' . $captcha_refresh . '</a>
	</span>

                                    </div>
                                </div>';
        }

        if (!empty($morelogincontent)) {
            if (is_array($morelogincontent)) {
                foreach ($morelogincontent as $format => $option) {
                    if ($format == 'table') {
                        echo '<!-- Option by hook -->';
                        echo $option;
                    }
                }
            } else {
                echo '<!-- Option by hook -->';
                echo $morelogincontent;
            }
        }

        print '
                        </div>

                    </div> <!-- end div login_right -->

                </div> <!-- end div login_line1 -->


                <div id="login_line2" style="clear: both">

                    <!-- Button Connection -->
                    <br>
                    <div id="login-submit-wrapper">
                        <input type="submit" class="button"
                               value="&nbsp; ' . $this->langs->trans('Connection') . ' &nbsp;" tabindex="5"/>
                    </div>';
        if ($forgetpasslink || $helpcenterlink) {
            $moreparam = '';
            if ($dol_hide_topmenu) {
                $moreparam .= (strpos($moreparam, '?') === false ? '?' : '&') . 'DolibarrFunctions::dol_hide_topmenu=' . $dol_hide_topmenu;
            }
            if ($dol_hide_leftmenu) {
                $moreparam .= (strpos($moreparam, '?') === false ? '?' : '&') . 'DolibarrFunctions::dol_hide_leftmenu=' . $dol_hide_leftmenu;
            }
            if ($dol_no_mouse_hover) {
                $moreparam .= (strpos($moreparam, '?') === false ? '?' : '&') . 'DolibarrFunctions::dol_no_mouse_hover=' . $dol_no_mouse_hover;
            }
            if ($dol_use_jmobile) {
                $moreparam .= (strpos($moreparam, '?') === false ? '?' : '&') . 'DolibarrFunctions::dol_use_jmobile=' . $dol_use_jmobile;
            }

            echo '<br>';
            echo '<div class="center" style="margin-top: 5px;">';
            if ($forgetpasslink) {
                $url = DOL_URL_ROOT . '/Modules/Users/passwordforgotten.php' . $moreparam;
                if (!empty($conf->global->MAIN_PASSWORD_FORGOTLINK)) {
                    $url = $conf->global->MAIN_PASSWORD_FORGOTLINK;
                }
                echo '<a class="alogin" href="' . DolibarrFunctions::dol_escape_htmltag($url) . '">';
                echo $this->langs->trans('PasswordForgotten');
                echo '</a>';
            }

            if ($forgetpasslink && $helpcenterlink) {
                echo '&nbsp;-&nbsp;';
            }

            if ($helpcenterlink) {
                $url = DOL_URL_ROOT . '/support/index.php' . $moreparam;
                if (!empty($conf->global->MAIN_HELPCENTER_LINKTOUSE)) {
                    $url = $conf->global->MAIN_HELPCENTER_LINKTOUSE;
                }
                echo '<a class="alogin" href="' . DolibarrFunctions::dol_escape_htmltag($url) . '" target="_blank">';
                echo $this->langs->trans('NeedHelpCenter');
                echo '</a>';
            }
            echo '</div>';
        }

        if (isset($conf->file->main_authentication) && preg_match('/openid/', $conf->file->main_authentication)) {
            $this->langs->load("users");

            //if (! empty($conf->global->MAIN_OPENIDURL_PERUSER)) $url=
            echo '<br>';
            echo '<div class="center" style="margin-top: 4px;">';

            $url = $conf->global->MAIN_AUTHENTICATION_OPENID_URL;
            if (!empty($url)) {
                print '<a class="alogin" href="' . $url . '">' . $this->langs->trans("LoginUsingOpenID") . '</a>';
            } else {
                $this->langs->load("errors");
                print '<font class="warning">' . $this->langs->trans("ErrorOpenIDSetupNotComplete", 'MAIN_AUTHENTICATION_OPENID_URL') . '</font>';
            }

            echo '</div>';
        }

        print '

                </div> <!-- end login line 2 -->

            </div> <!-- end login table -->


        </form>';

        // Show error message if defined
        if (!empty($_SESSION['dol_loginmesg'])) {
            print'
            <div class="center login_main_message">
                <div class="error">
                    ' . DolibarrFunctions::dol_escape_htmltag($_SESSION['dol_loginmesg']) . '
                </div>
            </div>';
        }

        // Add commit strip
        if (!empty($conf->global->MAIN_EASTER_EGG_COMMITSTRIP)) {
            // include_once DOL_DOCUMENT_ROOT . '/core/lib/geturl.lib.php';
            if (substr($this->langs->defaultlang, 0, 2) == 'fr') {
                $resgetcommitstrip = getURLContent("https://www.commitstrip.com/fr/feed/");
            } else {
                $resgetcommitstrip = getURLContent("https://www.commitstrip.com/en/feed/");
            }
            if ($resgetcommitstrip && $resgetcommitstrip['http_code'] == '200') {
                $xml = simplexml_load_string($resgetcommitstrip['content']);
                $little = $xml->channel->item[0]->children('content', true);
                print preg_replace('/width="650" height="658"/', '', $little->encoded);
            }
        }

        if ($main_home) {
            print '<div class="center login_main_home paddingtopbottom ' . (empty($conf->global->MAIN_LOGIN_BACKGROUND) ? '' : ' backgroundsemitransparent boxshadow') . '"
                 style="max-width: 70%">
                ' . $main_home . '</div><br>';
        }

        print'
        <!-- authentication mode = ' . $main_authentication . ' -->
        <!-- cookie name used for this session = ' . $session_name . ' -->
        <!-- urlfrom in this session = ' . (isset($_SESSION["urlfrom"]) ? $_SESSION["urlfrom"] : '') . ' -->

        <!-- Common footer is not used for login page, this is same than footer but inside login tpl -->';

        if (!empty($conf->global->MAIN_HTML_FOOTER)) {
            print $conf->global->MAIN_HTML_FOOTER;
        }

        if (!empty($morelogincontent) && is_array($morelogincontent)) {
            foreach ($morelogincontent as $format => $option) {
                if ($format == 'js') {
                    echo "\n" . '<!-- Javascript by hook -->';
                    echo $option . "\n";
                }
            }
        } elseif (!empty($moreloginextracontent)) {
            echo '<!-- Javascript by hook -->';
            echo $moreloginextracontent;
        }

        // Google Analytics
        // TODO Add a hook here
        if (!empty($conf->google->enabled) && !empty($conf->global->MAIN_GOOGLE_AN_ID)) {
            $tmptagarray = explode(',', $conf->global->MAIN_GOOGLE_AN_ID);
            foreach ($tmptagarray as $tmptag) {
                print "\n";
                print "<!-- JS CODE TO ENABLE for google analtics tag -->\n";
                print "
					<!-- Global site tag (gtag.js) - Google Analytics -->
					<script async src=\"https://www.googletagmanager.com/gtag/js?id=" . trim($tmptag) . "\"></script>
					<script>
					window.dataLayer = window.dataLayer || [];
					function gtag(){dataLayer.push(arguments);}
					gtag('js', new Date());

					gtag('config', '" . trim($tmptag) . "');
					</script>";
                print "\n";
            }
        }

        // TODO Replace this with a hook
        // Google Adsense (need Google module)
        if (!empty($conf->google->enabled) && !empty($conf->global->MAIN_GOOGLE_AD_CLIENT) && !empty($conf->global->MAIN_GOOGLE_AD_SLOT)) {
            if (empty($conf->dol_use_jmobile)) {
                print '
                <div class="center"><br>
                    <script><!--
                        google_ad_client = "' . $conf->global->MAIN_GOOGLE_AD_CLIENT . '";
                        google_ad_slot = "' . $conf->global->MAIN_GOOGLE_AD_SLOT . '";
                        google_ad_width = ' . $conf->global->MAIN_GOOGLE_AD_WIDTH . ';
                        google_ad_height = ' . $conf->global->MAIN_GOOGLE_AD_HEIGHT . ';
                        //-->
                    </script>
                    <script src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
                </div>';
            }
        }
        print'
    </div>
</div><!-- end of center -->


</body>
</html>
<!-- END PHP TEMPLATE -->
';
    }
}
