<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 *
 * Copyright (C) 2002-2007 Rodolphe Quiedeville <rodolphe@quiedeville.org>
 * Copyright (C) 2003      Xavier Dutoit        <doli@sydesy.com>
 * Copyright (C) 2004-2017 Laurent Destailleur  <eldy@users.sourceforge.net>
 * Copyright (C) 2004      Sebastien Di Cintio  <sdicintio@ressource-toi.org>
 * Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
 * Copyright (C) 2005-2011 Regis Houssin        <regis.houssin@inodbox.com>
 * Copyright (C) 2005       Simon Tosser         <simon@kornog-computing.com>
 * Copyright (C) 2006       Andre Cianfarani     <andre.cianfarani@acdeveloppement.net>
 * Copyright (C) 2010      Juanjo Menent        <jmenent@2byte.es>
 * Copyright (C) 2015      Bahfir Abbes         <bafbes@gmail.com>
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

use Alxarafe\Dolibarr\Libraries\DolibarrDate;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Alxarafe\Dolibarr\Libraries\DolibarrSecurity;
use Alxarafe\Dolibarr\Libraries\DolibarrSecurity2;
use Exception;

class DolibarrAuthentication
{
    protected $controller;
    protected $hookmanager;
    protected $conf;
    protected $langs;
    protected $db;

    protected $authmode;
    protected $user;
    protected $login;
    protected $password;
    /**
     * @var mixed
     */
    private $dolibarr_main_authentication;
    private int $error;

    public function __construct($controller)
    {
        $this->controller = $controller;

        $this->hookmanager = DolibarrGlobals::getHookManager();
        $this->conf = DolibarrGlobals::getConf();
        $this->langs = DolibarrGlobals::getLangs();
        $this->db = DolibarrGlobals::getDb();
        $this->user = DolibarrGlobals::getUser();

        $this->login = $_POST['username'];
        $this->password = $_POST['password'];

        $conf = $this->user->conf->file;
        /**
         * $conf=$this->user->conf->file;
         * Using dump($conf)
         *
         * "character_set_client": "UTF-8"
         * "main_limit_users": 0
         * "mailing_limit_sendbyweb": 0
         * "mailing_limit_sendbycli": 0
         * "main_authentication": ""
         * "main_force_https": ""
         * "strict_mode": ""
         * "instance_unique_id": ""
         * "dol_document_root": array:2 [▼
         *      "main" => "/srv/http/alixar/htdocs"
         *      "alt0" => "/srv/http/alixar/htdocs/custom"
         * "dol_url_root": array:2 [▼
         *      "main" => "/alixar/htdocs"
         *      "alt0" => "/custom"
         */
        $this->dolibarr_main_authentication = $conf->main_authentication;
        /**
         * Using $conf = DolibarrConfig::getInstance()->getVars();
         * dump($conf)
         *
         * "conffiletoshowshort" => "conf.php"
         * "conffile" => "/srv/http/alixar/htdocs/conf/conf.php"
         * "conffiletoshow" => "htdocs/conf/conf.php"
         * "dolibarr_main_data_root" => "/srv/http/alixar/documents"
         * "dolibarr_main_url_root" => "https://localhost80/alixar/htdocs/Modules/Install"
         * "dolibarr_main_url_root_alt" => "/custom"
         * "dolibarr_main_document_root" => "/srv/http/alixar/htdocs"
         * "dolibarr_main_document_root_alt" => "/srv/http/alixar/htdocs/custom"
         * "dolibarr_main_db_port" => "3306"
         * "dolibarr_main_db_type" => "PdoMySql"
         * "dolibarr_main_db_prefix" => "llx_"
         * "dolibarr_main_db_pass" => "LesLuthiers"
         * "dolibarr_main_db_encrypted_pass" => null
         * "dolibarr_main_db_character_set" => "utf8"
         * "dolibarr_main_db_collation" => "utf8_unicode_ci"
         * "dolibarr_main_db_encryption" => 0
         * "dolibarr_main_db_cryptkey" => ""
         * "dolibarr_main_limit_users" => 0
         * "dolibarr_mailing_limit_sendbyweb" => 0
         * "dolibarr_mailing_limit_sendbycli" => 0
         * "dolibarr_strict_mode" => 0
         */
    }

    function authenticated(): bool
    {
        return false;
    }

    function login()
    {
        /*
         * Phase authentication / login
         */
        if (!defined('NOLOGIN')) {
            $this->authentication();
        }

        // Case forcing style from url
        if (DolibarrFunctions::GETPOST('theme', 'alpha')) {
            $this->conf->theme = DolibarrFunctions::GETPOST('theme', 'alpha', 1);
            $this->conf->css = "/theme/" . $this->conf->theme . "/style.css.php";
        }

        // Set javascript option
        if (DolibarrFunctions::GETPOST('nojs', 'int')) {  // If javascript was not disabled on URL
            $this->conf->use_javascript_ajax = 0;
        } else {
            if (!empty($this->user->conf->MAIN_DISABLE_JAVASCRIPT)) {
                $this->conf->use_javascript_ajax = !$this->user->conf->MAIN_DISABLE_JAVASCRIPT;
            }
        }

        // Set MAIN_OPTIMIZEFORTEXTBROWSER for user (must be after login part)
        if (empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER) && !empty($this->user->conf->MAIN_OPTIMIZEFORTEXTBROWSER)) {
            $this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER = $this->user->conf->MAIN_OPTIMIZEFORTEXTBROWSER;
        }

        // set MAIN_OPTIMIZEFORCOLORBLIND for user
        $this->conf->global->MAIN_OPTIMIZEFORCOLORBLIND = empty($this->user->conf->MAIN_OPTIMIZEFORCOLORBLIND) ? '' : $this->user->conf->MAIN_OPTIMIZEFORCOLORBLIND;

        // Set terminal output option according to conf->browser.
        if (DolibarrFunctions::GETPOST('dol_hide_leftmenu', 'int') || !empty($_SESSION['dol_hide_leftmenu'])) {
            $this->conf->dol_hide_leftmenu = 1;
        }
        if (DolibarrFunctions::GETPOST('dol_hide_topmenu', 'int') || !empty($_SESSION['dol_hide_topmenu'])) {
            $this->conf->dol_hide_topmenu = 1;
        }
        if (DolibarrFunctions::GETPOST('dol_optimize_smallscreen', 'int') || !empty($_SESSION['dol_optimize_smallscreen'])) {
            $this->conf->dol_optimize_smallscreen = 1;
        }
        if (DolibarrFunctions::GETPOST('dol_no_mouse_hover', 'int') || !empty($_SESSION['dol_no_mouse_hover'])) {
            $this->conf->dol_no_mouse_hover = 1;
        }
        if (DolibarrFunctions::GETPOST('dol_use_jmobile', 'int') || !empty($_SESSION['dol_use_jmobile'])) {
            $this->conf->dol_use_jmobile = 1;
        }
        if (!empty($this->conf->browser->layout) && $this->conf->browser->layout != 'classic') {
            $this->conf->dol_no_mouse_hover = 1;
        }
        if ((!empty($this->conf->browser->layout) && $this->conf->browser->layout == 'phone')
            || (!empty($_SESSION['dol_screenwidth']) && $_SESSION['dol_screenwidth'] < 400)
            || (!empty($_SESSION['dol_screenheight']) && $_SESSION['dol_screenheight'] < 400)
        ) {
            $this->conf->dol_optimize_smallscreen = 1;
        }
        // Replace themes bugged with jmobile with eldy
        if (!empty($this->conf->dol_use_jmobile) && in_array($this->conf->theme, ['bureau2crea', 'cameleo', 'amarok'])) {
            $this->conf->theme = 'eldy';
            $this->conf->css = "/theme/" . $this->conf->theme . "/style.css.php";
        }

        if (!defined('NOREQUIRETRAN')) {
            if (!DolibarrFunctions::GETPOST('lang', 'aZ09')) {    // If language was not forced on URL
                // If user has chosen its own language
                if (!empty($this->user->conf->MAIN_LANG_DEFAULT)) {
                    // If different than current language
                    //print ">>>".$this->langs->getDefaultLang()."-".$this->user->conf->MAIN_LANG_DEFAULT;
                    if ($this->langs->getDefaultLang() != $this->user->conf->MAIN_LANG_DEFAULT) {
                        $this->langs->setDefaultLang($this->user->conf->MAIN_LANG_DEFAULT);
                    }
                }
            }
        }

        if (!defined('NOLOGIN')) {
            // If the login is not recovered, it is identified with an account that does not exist.
            // Hacking attempt?
            if (!$this->user->login) {
                DolibarrSecurity::accessforbidden();
            }

            // Check if user is active
            if ($this->user->statut < 1) {
                // If not active, we refuse the user
                $this->langs->load("other");
                DolibarrFunctions::dol_syslog("Authentication KO as login is disabled", LOG_NOTICE);
                DolibarrSecurity::accessforbidden($this->langs->trans("ErrorLoginDisabled"));
                exit;
            }

            // Load permissions
            $this->user->getrights();
        }
    }

    public function authentication()
    {
        if (defined('MAIN_AUTHENTICATION_MODE')) {
            $this->dolibarr_main_authentication = constant('MAIN_AUTHENTICATION_MODE');
        } else {
            // Authentication mode
            if (empty($this->dolibarr_main_authentication)) {
                $this->dolibarr_main_authentication = 'http,dolibarr';
            }
            // Authentication mode: forceuser
            if ($this->dolibarr_main_authentication == 'forceuser' && empty($dolibarr_auto_user)) {
                $dolibarr_auto_user = 'auto';
            }
        }

        // Set authmode
        $this->authmode = explode(',', $this->dolibarr_main_authentication);

        // No authentication mode
        if (!count($this->authmode)) {
            //    $this->langs->load('main');
            DolibarrFunctions::dol_print_error('', $this->langs->trans("ErrorConfigParameterNotDefined", 'dolibarr_main_authentication'));
            exit;
        }

        // If login request was already post, we retrieve login from the session
        // Call module if not realized that his request.
        // At the end of this phase, the variable $this->login is defined.
        $resultFetchUser = '';
        $test = true;

        if (!isset($_SESSION["dol_login"])) {   // dol_login must contain the user login request
            $this->request_login();
        } else {
            // We are already into an authenticated session
            $this->login = $_SESSION["dol_login"];
            $entity = isset($_SESSION["dol_entity"]) ? $_SESSION["dol_entity"] : 0;
            DolibarrFunctions::dol_syslog("- This is an already logged session. _SESSION['dol_login']=" . $this->login . " _SESSION['dol_entity']=" . $entity, LOG_DEBUG);

            $resultFetchUser = $this->user->fetch('', $this->login, '', 1, ($entity > 0 ? $entity : -1));
            if ($resultFetchUser <= 0) {
                // Account has been removed after login
                DolibarrFunctions::dol_syslog("Can't load user even if session logged. _SESSION['dol_login']=" . $this->login, LOG_WARNING);
                session_destroy();
                session_set_cookie_params(0, '/', null, (empty($this->forcehttps) ? false : true), true); // Add tag secure and httponly on session cookie
                session_name($this->sessionname);
                session_start();

                if ($resultFetchUser == 0) {
                    // Load translation files required by page
                    $this->langs->loadLangs(['main', 'errors']);

                    $_SESSION["dol_loginmesg"] = $this->langs->transnoentitiesnoconv("ErrorCantLoadUserFromDolibarrDatabase", $this->login);

                    $this->user->trigger_mesg = 'ErrorCantLoadUserFromDolibarrDatabase - login=' . $this->login;
                }
                if ($resultFetchUser < 0) {
                    $_SESSION["dol_loginmesg"] = $this->user->error;

                    $this->user->trigger_mesg = $this->user->error;
                }

                // Call trigger
                $result = $this->user->call_trigger('USER_LOGIN_FAILED', $this->user);
                if ($result < 0) {
                    $this->error++;
                }
                // End call triggers

                // Hooks on failed login
                $action = '';
                $this->hookmanager->initHooks(['login']);
                $parameters = ['dol_authmode' => $dol_authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
                $reshook = $this->hookmanager->executeHooks('afterLoginFailed', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
                if ($reshook < 0) {
                    $this->error++;
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
                // The user has been located and it's active

                // Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
                $this->hookmanager->initHooks(['main']);

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
                    if (!empty($_SESSION['lastsearch_limit_tmp_' . $relativepathstring]) && $_SESSION['lastsearch_limit_tmp_' . $relativepathstring] != $this->conf->liste_limit) {
                        $_SESSION['lastsearch_limit_' . $relativepathstring] = $_SESSION['lastsearch_limit_tmp_' . $relativepathstring];
                        unset($_SESSION['lastsearch_limit_tmp_' . $relativepathstring]);
                    }
                }

                $action = '';
                $reshook = $this->hookmanager->executeHooks('updateSession', [], $this->user, $action);
                if ($reshook < 0) {
                    DolibarrFunctions::setEventMessage($this->hookmanager->error, $this->hookmanager->errors, 'errors');
                }
            }
        }

        // Is it a new session that has started ?
        // If we are here, this means authentication was successfull.
        if (!isset($_SESSION["dol_login"])) {
            // New session for this login has started.
            $this->error = 0;

            // Store value into session (values always stored)
            $_SESSION["dol_login"] = $this->user->login;
            $_SESSION["dol_authmode"] = isset($dol_authmode) ? $dol_authmode : '';
            $_SESSION["dol_tz"] = isset($dol_tz) ? $dol_tz : '';
            $_SESSION["dol_tz_string"] = isset($dol_tz_string) ? $dol_tz_string : '';
            $_SESSION["dol_dst"] = isset($dol_dst) ? $dol_dst : '';
            $_SESSION["dol_dst_observed"] = isset($dol_dst_observed) ? $dol_dst_observed : '';
            $_SESSION["dol_dst_first"] = isset($dol_dst_first) ? $dol_dst_first : '';
            $_SESSION["dol_dst_second"] = isset($dol_dst_second) ? $dol_dst_second : '';
            $_SESSION["dol_screenwidth"] = isset($dol_screenwidth) ? $dol_screenwidth : '';
            $_SESSION["dol_screenheight"] = isset($dol_screenheight) ? $dol_screenheight : '';
            $_SESSION["dol_company"] = DolibarrFunctions::getDolGlobalString("MAIN_INFO_SOCIETE_NOM");
            $_SESSION["dol_entity"] = $this->conf->entity;
            // Store value into session (values stored only if defined)
            if (!empty($dol_hide_topmenu)) {
                $_SESSION['dol_hide_topmenu'] = $dol_hide_topmenu;
            }
            if (!empty($dol_hide_leftmenu)) {
                $_SESSION['dol_hide_leftmenu'] = $dol_hide_leftmenu;
            }
            if (!empty($dol_optimize_smallscreen)) {
                $_SESSION['dol_optimize_smallscreen'] = $dol_optimize_smallscreen;
            }
            if (!empty($dol_no_mouse_hover)) {
                $_SESSION['dol_no_mouse_hover'] = $dol_no_mouse_hover;
            }
            if (!empty($dol_use_jmobile)) {
                $_SESSION['dol_use_jmobile'] = $dol_use_jmobile;
            }

            DolibarrFunctions::dol_syslog("This is a new started user session. _SESSION['dol_login']=" . $_SESSION["dol_login"] . " Session id=" . session_id());

            $this->db->beginTransaction();

            $this->user->update_last_login_date();

            $this->loginfo = 'TZ=' . $_SESSION["dol_tz"] . ';TZString=' . $_SESSION["dol_tz_string"] . ';Screen=' . $_SESSION["dol_screenwidth"] . 'x' . $_SESSION["dol_screenheight"];

            // Call triggers for the "security events" log
            $this->user->trigger_mesg = $this->loginfo;

            // Call trigger
            $result = $this->user->call_trigger('USER_LOGIN', $this->user);
            dump($result);
            if ($result < 0) {
                $this->error++;
            }
            // End call triggers

            // Hooks on successfull login
            $action = '';
            $this->hookmanager->initHooks(['login']);
            $parameters = ['dol_authmode' => $dol_authmode, 'dol_loginfo' => $this->loginfo];
            $reshook = $this->hookmanager->executeHooks('afterLogin', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
            if ($reshook < 0) {
                $this->error++;
            }

            if ($this->error) {
                $this->db->rollbackTransactions();
                session_destroy();
                DolibarrFunctions::dol_print_error($db, 'Error in some triggers USER_LOGIN or in some hooks afterLogin');
                exit;
            } else {
                $this->db->commit();
            }

            // Change landing page if defined.
            $landingpage = (empty($this->user->conf->MAIN_LANDING_PAGE) ? (empty($this->conf->global->MAIN_LANDING_PAGE) ? '' : $this->conf->global->MAIN_LANDING_PAGE) : $this->user->conf->MAIN_LANDING_PAGE);
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
            if (!empty($this->conf->global->MAIN_USE_ADVANCED_PERMS)) {
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
            $this->conf->liste_limit = $this->user->conf->MAIN_SIZE_LISTE_LIMIT; // Can be 0
        }
        if (isset($this->user->conf->PRODUIT_LIMIT_SIZE)) {
            $this->conf->product->limit_size = $this->user->conf->PRODUIT_LIMIT_SIZE; // Can be 0
        }

        // Replace conf->css by personalized value if theme not forced
        if (empty($this->conf->global->MAIN_FORCETHEME) && !empty($this->user->conf->MAIN_THEME)) {
            $this->conf->theme = $this->user->conf->MAIN_THEME;
            $this->conf->css = "/theme/" . $this->conf->theme . "/style.css.php";
        }
    }

    /**
     * It is not already authenticated and it requests the login / password
     *
     * @author  Rafael San José Tovar <rafael.sanjose@x-netdigital.com>
     * @version oct. 2021
     *
     * @return string|void
     * @throws Exception
     */
    public function request_login()
    {
        // include_once DOL_DOCUMENT_ROOT . '/core/lib/security2.lib.php';

        $dol_dst_observed = DolibarrFunctions::GETPOST("dst_observed", 'int', 3);
        $dol_dst_first = DolibarrFunctions::GETPOST("dst_first", 'int', 3);
        $dol_dst_second = DolibarrFunctions::GETPOST("dst_second", 'int', 3);
        $dol_screenwidth = DolibarrFunctions::GETPOST("screenwidth", 'int', 3);
        $dol_screenheight = DolibarrFunctions::GETPOST("screenheight", 'int', 3);
        $dol_hide_topmenu = DolibarrFunctions::GETPOST('dol_hide_topmenu', 'int', 3);
        $dol_hide_leftmenu = DolibarrFunctions::GETPOST('dol_hide_leftmenu', 'int', 3);
        $dol_optimize_smallscreen = DolibarrFunctions::GETPOST('dol_optimize_smallscreen', 'int', 3);
        $dol_no_mouse_hover = DolibarrFunctions::GETPOST('dol_no_mouse_hover', 'int', 3);
        $dol_use_jmobile = DolibarrFunctions::GETPOST('dol_use_jmobile', 'int', 3); // 0=default, 1=to say we use app from a webview app, 2=to say we use app from a webview app and keep ajax
        //DolibarrFunctions::dol_syslog("POST key=".join(array_keys($_POST),',').' value='.join($_POST,','));

        // If in demo mode, we check we go to home page through the public/demo/index.php page
        if (!empty($dolibarr_main_demo) && $_SERVER['PHP_SELF'] == DOL_URL_ROOT . '/index.php') {  // We ask index page
            if (empty($_SERVER['HTTP_REFERER']) || !preg_match('/public/', $_SERVER['HTTP_REFERER'])) {
                DolibarrFunctions::dol_syslog("Call index page from another url than demo page (call is done from page " . $_SERVER['HTTP_REFERER'] . ")");
                $url = '';
                $url .= ($url ? '&' : '') . ($dol_hide_topmenu ? 'dol_hide_topmenu=' . $dol_hide_topmenu : '');
                $url .= ($url ? '&' : '') . ($dol_hide_leftmenu ? 'dol_hide_leftmenu=' . $dol_hide_leftmenu : '');
                $url .= ($url ? '&' : '') . ($dol_optimize_smallscreen ? 'dol_optimize_smallscreen=' . $dol_optimize_smallscreen : '');
                $url .= ($url ? '&' : '') . ($dol_no_mouse_hover ? 'dol_no_mouse_hover=' . $dol_no_mouse_hover : '');
                $url .= ($url ? '&' : '') . ($dol_use_jmobile ? 'dol_use_jmobile=' . $dol_use_jmobile : '');
                $url = DOL_URL_ROOT . '/public/demo/index.php' . ($url ? '?' . $url : '');
                header("Location: " . $url);
                exit;
            }
        }

        // Hooks for security access
        $action = '';
        $this->hookmanager->initHooks(['login']);
        $parameters = [];
        $test = true;
        $reshook = $this->hookmanager->executeHooks('beforeLoginAuthentication', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
        if ($reshook < 0) {
            $test = false;
            $this->error++;
        }

        // Verification security graphic code (using a CAPTCHA)
        if ($test && DolibarrFunctions::GETPOST("username", "alpha", 2) && !empty($this->conf->global->MAIN_SECURITY_ENABLECAPTCHA) && !isset($_SESSION['dol_bypass_antispam'])) {
            $sessionkey = 'dol_antispam_value';
            $ok = (array_key_exists($sessionkey, $_SESSION) === true && (strtolower($_SESSION[$sessionkey]) === strtolower(DolibarrFunctions::GETPOST('code', 'none'))));

            // Check code
            if (!$ok) {
                DolibarrFunctions::dol_syslog('Bad value for code, connexion refused');
                // Load translation files required by page
                $this->langs->loadLangs(['main', 'errors']);

                $_SESSION["dol_loginmesg"] = $this->langs->transnoentitiesnoconv("ErrorBadValueForCode");
                $test = false;

                // Call trigger for the "security events" log
                $this->user->trigger_mesg = 'ErrorBadValueForCode - login=' . DolibarrFunctions::GETPOST("username", "alpha", 2);

                // Call trigger
                $result = $this->user->call_trigger('USER_LOGIN_FAILED', $this->user);
                if ($result < 0) {
                    $this->error++;
                }
                // End call triggers

                // Hooks on failed login
                $action = '';
                $this->hookmanager->initHooks(['login']);
                $parameters = ['dol_authmode' => $this->authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
                $reshook = $this->hookmanager->executeHooks('afterLoginFailed', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
                if ($reshook < 0) {
                    $this->error++;
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
        $entitytotest = (DolibarrFunctions::GETPOST('entity', 'int') ? DolibarrFunctions::GETPOST('entity', 'int') : (!empty($this->conf->entity) ? $this->conf->entity : 1));

        // Define if we received data to test the login.
        $goontestloop = false;
        if (isset($_SERVER["REMOTE_USER"]) && in_array('http', $this->authmode)) {
            $goontestloop = true;
        }
        if ($this->dolibarr_main_authentication == 'forceuser' && !empty($dolibarr_auto_user)) {
            $goontestloop = true;
        }
        if (DolibarrFunctions::GETPOST("username", "alpha", $allowedmethodtopostusername) || !empty($_COOKIE['login_dolibarr']) || DolibarrFunctions::GETPOST('openid_mode', 'alpha', 1)) {
            $goontestloop = true;
        }

        /*
        if (!is_object($this->langs)) { // This can occurs when calling page with NOREQUIRETRAN defined, however we need langs for error messages.
            include_once DOL_DOCUMENT_ROOT . '/core/class/translate.class.php';
            $this->langs = new Translate("", $this->conf);
            $langcode =  (DolibarrFunctions::GETPOST('lang', 'aZ09', 1) ? DolibarrFunctions::GETPOST('lang', 'aZ09', 1) : (empty($this->conf->global->MAIN_LANG_DEFAULT) ? 'auto' : $this->conf->global->MAIN_LANG_DEFAULT));
            if (defined('MAIN_LANG_DEFAULT')) {
                $langcode = constant('MAIN_LANG_DEFAULT');
            }
            $this->langs->setDefaultLang($langcode);
        }
        */

        // Validation of login/pass/entity
        // If ok, the variable login will be returned
        // If error, we will put error message in session under the name dol_loginmesg
        if ($test && $goontestloop && (DolibarrFunctions::GETPOST('actionlogin', 'aZ09') == 'login' || $this->dolibarr_main_authentication != 'dolibarr')) {
            die('check');
            $this->login = DolibarrSecurity2::checkLoginPassEntity($this->usertotest, $passwordtotest, $entitytotest, $this->authmode);
            if ($this->login === '--bad-login-validity--') {
                $this->login = '';
            }

            if ($this->login) {
                $dol_authmode = $this->conf->authmode; // This properties is defined only when logged, to say what mode was successfully used
                $dol_tz = $_POST["tz"];
                $dol_tz_string = $_POST["tz_string"];
                $dol_tz_string = preg_replace('/\s*\(.+\)$/', '', $dol_tz_string);
                $dol_tz_string = preg_replace('/,/', '/', $dol_tz_string);
                $dol_tz_string = preg_replace('/\s/', '_', $dol_tz_string);
                $dol_dst = 0;
                // Keep $_POST here. Do not use DolibarrFunctions::GETPOSTISSET
                if (isset($_POST["dst_first"]) && isset($_POST["dst_second"])) {
                    include_once DOL_DOCUMENT_ROOT . '/core/lib/date.lib.php';
                    $datenow = DolibarrFunctions::dol_now();
                    $datefirst = DolibarrDate::dol_stringtotime($_POST["dst_first"]);
                    $datesecond = DolibarrDate::dol_stringtotime($_POST["dst_second"]);
                    if ($datenow >= $datefirst && $datenow < $datesecond) {
                        $dol_dst = 1;
                    }
                }
                //print $datefirst.'-'.$datesecond.'-'.$datenow.'-'.$dol_tz.'-'.$dol_tzstring.'-'.$dol_dst; exit;
            }

            if (!$this->login) {
                DolibarrFunctions::dol_syslog('Bad password, connexion refused', LOG_DEBUG);
                // Load translation files required by page
                //            $this->langs->loadLangs(['main', 'errors']);

                // Bad password. No authmode has found a good password.
                // We set a generic message if not defined inside function DolibarrSecurity2::checkLoginPassEntity or subfunctions
                if (empty($_SESSION["dol_loginmesg"])) {
                    $_SESSION["dol_loginmesg"] = $this->langs->transnoentitiesnoconv("ErrorBadLoginPassword");
                }

                // Call trigger for the "security events" log
                $this->user->trigger_mesg = $this->langs->trans("ErrorBadLoginPassword") . ' - login=' . DolibarrFunctions::GETPOST("username", "alpha", 2);

                // Call trigger
                $result = $this->user->call_trigger('USER_LOGIN_FAILED', $this->user);
                if ($result < 0) {
                    $this->error++;
                }
                // End call triggers

                // Hooks on failed login
                $action = '';
                $this->hookmanager->initHooks(['login']);
                $parameters = ['dol_authmode' => $dol_authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
                $reshook = $this->hookmanager->executeHooks('afterLoginFailed', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
                if ($reshook < 0) {
                    $this->error++;
                }
                // Note: exit is done in next chapter
            }
        }

        // End test login / passwords
        if (!$this->login || (in_array('ldap', $this->authmode) && empty($passwordtotest))) {    // With LDAP we refused empty password because some LDAP are "opened" for anonymous access so connexion is a success.
            // No data to test login, so we show the login page.
            DolibarrFunctions::dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . " - action=" . DolibarrFunctions::GETPOST('action', 'aZ09') . " - actionlogin=" . DolibarrFunctions::GETPOST('actionlogin', 'aZ09') . " - showing the login form and exit", LOG_INFO);
            if (!defined('NOREDIRECTBYMAINTOLOGIN') || constant('NOREDIRECTBYMAINTOLOGIN')) {
                return 'ERROR_NOT_LOGGED';
            } else {
                if ($_SERVER["HTTP_USER_AGENT"] == 'securitytest') {
                    http_response_code(401); // It makes easier to understand if session was broken during security tests
                }
                DolibarrSecurity2::dol_loginfunction($this->controller, $this->langs, $this->conf, (!empty($this->mysoc) ? $this->mysoc : ''));
            }
            exit;
        }

        die('Validate?');

        $resultFetchUser = $this->user->fetch('', $this->login, '', 1, ($entitytotest > 0 ? $entitytotest : -1)); // login was retrieved previously when checking password.

        if ($resultFetchUser <= 0) {
            DolibarrFunctions::dol_syslog('User not found, connexion refused');
            session_destroy();
            session_set_cookie_params(0, '/', null, (empty($this->forcehttps) ? false : true), true); // Add tag secure and httponly on session cookie
            session_name($this->sessionname);
            session_start();

            if ($resultFetchUser == 0) {
                // Load translation files required by page
                $this->langs->loadLangs(['main', 'errors']);

                $_SESSION["dol_loginmesg"] = $this->langs->transnoentitiesnoconv("ErrorCantLoadUserFromDolibarrDatabase", $this->login);

                $this->user->trigger_mesg = 'ErrorCantLoadUserFromDolibarrDatabase - login=' . $this->login;
            }
            if ($resultFetchUser < 0) {
                $_SESSION["dol_loginmesg"] = $this->user->error;

                $this->user->trigger_mesg = $this->user->error;
            }

            // Call trigger
            $result = $this->user->call_trigger('USER_LOGIN_FAILED', $this->user);
            if ($result < 0) {
                $this->error++;
            }
            // End call triggers

            // Hooks on failed login
            $action = '';
            $this->hookmanager->initHooks(['login']);
            $parameters = ['dol_authmode' => $dol_authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
            $reshook = $this->hookmanager->executeHooks('afterLoginFailed', $parameters, $this->user, $action); // Note that $action and $object may have been modified by some hooks
            if ($reshook < 0) {
                $this->error++;
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
                $this->langs->setDefaultLang($this->user->conf->MAIN_LANG_DEFAULT);
            }
        }
    }
}
