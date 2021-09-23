<?php
// $authmode lists the different method of identification to be tested in order of preference.
// Example: 'http', 'dolibarr', 'ldap', 'http,forceuser', '...'

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
    //    $langs->load('main');
    dol_print_error('', $langs->trans("ErrorConfigParameterNotDefined", 'dolibarr_main_authentication'));
    exit;
}

// If login request was already post, we retrieve login from the session
// Call module if not realized that his request.
// At the end of this phase, the variable $login is defined.
$resultFetchUser = '';
$test = true;
if (!isset($_SESSION["dol_login"])) {
    // It is not already authenticated and it requests the login / password
    include_once DOL_DOCUMENT_ROOT . '/core/lib/security2.lib.php';

    $dol_dst_observed = GETPOST("dst_observed", 'int', 3);
    $dol_dst_first = GETPOST("dst_first", 'int', 3);
    $dol_dst_second = GETPOST("dst_second", 'int', 3);
    $dol_screenwidth = GETPOST("screenwidth", 'int', 3);
    $dol_screenheight = GETPOST("screenheight", 'int', 3);
    $dol_hide_topmenu = GETPOST('dol_hide_topmenu', 'int', 3);
    $dol_hide_leftmenu = GETPOST('dol_hide_leftmenu', 'int', 3);
    $dol_optimize_smallscreen = GETPOST('dol_optimize_smallscreen', 'int', 3);
    $dol_no_mouse_hover = GETPOST('dol_no_mouse_hover', 'int', 3);
    $dol_use_jmobile = GETPOST('dol_use_jmobile', 'int', 3); // 0=default, 1=to say we use app from a webview app, 2=to say we use app from a webview app and keep ajax
    //dol_syslog("POST key=".join(array_keys($_POST),',').' value='.join($_POST,','));

    // If in demo mode, we check we go to home page through the public/demo/index.php page
    if (!empty($dolibarr_main_demo) && $_SERVER['PHP_SELF'] == DOL_URL_ROOT . '/index.php') {  // We ask index page
        if (empty($_SERVER['HTTP_REFERER']) || !preg_match('/public/', $_SERVER['HTTP_REFERER'])) {
            dol_syslog("Call index page from another url than demo page (call is done from page " . $_SERVER['HTTP_REFERER'] . ")");
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
    $hookmanager->initHooks(['login']);
    $parameters = [];
    $reshook = $hookmanager->executeHooks('beforeLoginAuthentication', $parameters, $user, $action); // Note that $action and $object may have been modified by some hooks
    if ($reshook < 0) {
        $test = false;
        $error++;
    }

    // Verification security graphic code
    if ($test && GETPOST("username", "alpha", 2) && !empty($conf->global->MAIN_SECURITY_ENABLECAPTCHA) && !isset($_SESSION['dol_bypass_antispam'])) {
        $sessionkey = 'dol_antispam_value';
        $ok = (array_key_exists($sessionkey, $_SESSION) === true && (strtolower($_SESSION[$sessionkey]) === strtolower(GETPOST('code', 'none'))));

        // Check code
        if (!$ok) {
            dol_syslog('Bad value for code, connexion refused');
            // Load translation files required by page
            // $langs->loadLangs(['main', 'errors']);

            $_SESSION["dol_loginmesg"] = $langs->transnoentitiesnoconv("ErrorBadValueForCode");
            $test = false;

            // Call trigger for the "security events" log
            $user->trigger_mesg = 'ErrorBadValueForCode - login=' . GETPOST("username", "alpha", 2);

            // Call trigger
            $result = $user->call_trigger('USER_LOGIN_FAILED', $user);
            if ($result < 0) {
                $error++;
            }
            // End call triggers

            // Hooks on failed login
            $action = '';
            $hookmanager->initHooks(['login']);
            $parameters = ['dol_authmode' => $authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
            $reshook = $hookmanager->executeHooks('afterLoginFailed', $parameters, $user, $action); // Note that $action and $object may have been modified by some hooks
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
    $usertotest = (!empty($_COOKIE['login_dolibarr']) ? preg_replace('/[^a-zA-Z0-9_\-]/', '', $_COOKIE['login_dolibarr']) : GETPOST("username", "alpha", $allowedmethodtopostusername));
    $passwordtotest = GETPOST('password', 'none', $allowedmethodtopostusername);
    $entitytotest = (GETPOST('entity', 'int') ? GETPOST('entity', 'int') : (!empty($conf->entity) ? $conf->entity : 1));

    // Define if we received data to test the login.
    $goontestloop = false;
    if (isset($_SERVER["REMOTE_USER"]) && in_array('http', $authmode)) {
        $goontestloop = true;
    }
    if ($dolibarr_main_authentication == 'forceuser' && !empty($dolibarr_auto_user)) {
        $goontestloop = true;
    }
    if (GETPOST("username", "alpha", $allowedmethodtopostusername) || !empty($_COOKIE['login_dolibarr']) || GETPOST('openid_mode', 'alpha', 1)) {
        $goontestloop = true;
    }

    /*
    if (!is_object($langs)) { // This can occurs when calling page with NOREQUIRETRAN defined, however we need langs for error messages.
        include_once DOL_DOCUMENT_ROOT . '/core/class/translate.class.php';
        $langs = new Translate("", $conf);
        $langcode = (GETPOST('lang', 'aZ09', 1) ? GETPOST('lang', 'aZ09', 1) : (empty($conf->global->MAIN_LANG_DEFAULT) ? 'auto' : $conf->global->MAIN_LANG_DEFAULT));
        if (defined('MAIN_LANG_DEFAULT')) {
            $langcode = constant('MAIN_LANG_DEFAULT');
        }
        $langs->setDefaultLang($langcode);
    }
    */

    // Validation of login/pass/entity
    // If ok, the variable login will be returned
    // If error, we will put error message in session under the name dol_loginmesg
    if ($test && $goontestloop && (GETPOST('actionlogin', 'aZ09') == 'login' || $dolibarr_main_authentication != 'dolibarr')) {
        $login = checkLoginPassEntity($usertotest, $passwordtotest, $entitytotest, $authmode);
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
            // Keep $_POST here. Do not use GETPOSTISSET
            if (isset($_POST["dst_first"]) && isset($_POST["dst_second"])) {
                include_once DOL_DOCUMENT_ROOT . '/core/lib/date.lib.php';
                $datenow = dol_now();
                $datefirst = dol_stringtotime($_POST["dst_first"]);
                $datesecond = dol_stringtotime($_POST["dst_second"]);
                if ($datenow >= $datefirst && $datenow < $datesecond) {
                    $dol_dst = 1;
                }
            }
            //print $datefirst.'-'.$datesecond.'-'.$datenow.'-'.$dol_tz.'-'.$dol_tzstring.'-'.$dol_dst; exit;
        }

        if (!$login) {
            dol_syslog('Bad password, connexion refused', LOG_DEBUG);
            // Load translation files required by page
            //            // $langs->loadLangs(['main', 'errors']);

            // Bad password. No authmode has found a good password.
            // We set a generic message if not defined inside function checkLoginPassEntity or subfunctions
            if (empty($_SESSION["dol_loginmesg"])) {
                $_SESSION["dol_loginmesg"] = $langs->transnoentitiesnoconv("ErrorBadLoginPassword");
            }

            // Call trigger for the "security events" log
            $user->trigger_mesg = $langs->trans("ErrorBadLoginPassword") . ' - login=' . GETPOST("username", "alpha", 2);

            // Call trigger
            $result = $user->call_trigger('USER_LOGIN_FAILED', $user);
            if ($result < 0) {
                $error++;
            }
            // End call triggers

            // Hooks on failed login
            $action = '';
            $hookmanager->initHooks(['login']);
            $parameters = ['dol_authmode' => $dol_authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
            $reshook = $hookmanager->executeHooks('afterLoginFailed', $parameters, $user, $action); // Note that $action and $object may have been modified by some hooks
            if ($reshook < 0) {
                $error++;
            }
            // Note: exit is done in next chapter
        }
    }

    // End test login / passwords
    if (!$login || (in_array('ldap', $authmode) && empty($passwordtotest))) {    // With LDAP we refused empty password because some LDAP are "opened" for anonymous access so connexion is a success.
        // No data to test login, so we show the login page.
        dol_syslog("--- Access to " . (empty($_SERVER["REQUEST_METHOD"]) ? '' : $_SERVER["REQUEST_METHOD"] . ' ') . $_SERVER["PHP_SELF"] . " - action=" . GETPOST('action', 'aZ09') . " - actionlogin=" . GETPOST('actionlogin', 'aZ09') . " - showing the login form and exit", LOG_INFO);
        if (!defined('NOREDIRECTBYMAINTOLOGIN') || constant('NOREDIRECTBYMAINTOLOGIN')) {
            return 'ERROR_NOT_LOGGED';
        } else {
            if ($_SERVER["HTTP_USER_AGENT"] == 'securitytest') {
                http_response_code(401); // It makes easier to understand if session was broken during security tests
            }
            dol_loginfunction($langs, $conf, (!empty($mysoc) ? $mysoc : ''));
        }
        exit;
    }

    $resultFetchUser = $user->fetch('', $login, '', 1, ($entitytotest > 0 ? $entitytotest : -1)); // login was retrieved previously when checking password.
    if ($resultFetchUser <= 0) {
        dol_syslog('User not found, connexion refused');
        session_destroy();
        session_set_cookie_params(0, '/', null, (empty($dolibarr_main_force_https) ? false : true), true); // Add tag secure and httponly on session cookie
        session_name($sessionname);
        session_start();

        if ($resultFetchUser == 0) {
            // Load translation files required by page
            // $langs->loadLangs(['main', 'errors']);

            $_SESSION["dol_loginmesg"] = $langs->transnoentitiesnoconv("ErrorCantLoadUserFromDolibarrDatabase", $login);

            $user->trigger_mesg = 'ErrorCantLoadUserFromDolibarrDatabase - login=' . $login;
        }
        if ($resultFetchUser < 0) {
            $_SESSION["dol_loginmesg"] = $user->error;

            $user->trigger_mesg = $user->error;
        }

        // Call trigger
        $result = $user->call_trigger('USER_LOGIN_FAILED', $user);
        if ($result < 0) {
            $error++;
        }
        // End call triggers

        // Hooks on failed login
        $action = '';
        $hookmanager->initHooks(['login']);
        $parameters = ['dol_authmode' => $dol_authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
        $reshook = $hookmanager->executeHooks('afterLoginFailed', $parameters, $user, $action); // Note that $action and $object may have been modified by some hooks
        if ($reshook < 0) {
            $error++;
        }

        $paramsurl = [];
        if (GETPOST('textbrowser', 'int')) {
            $paramsurl[] = 'textbrowser=' . GETPOST('textbrowser', 'int');
        }
        if (GETPOST('nojs', 'int')) {
            $paramsurl[] = 'nojs=' . GETPOST('nojs', 'int');
        }
        if (GETPOST('lang', 'aZ09')) {
            $paramsurl[] = 'lang=' . GETPOST('lang', 'aZ09');
        }
        header('Location: ' . DOL_URL_ROOT . '/index.php' . (count($paramsurl) ? '?' . implode('&', $paramsurl) : ''));
        exit;
    } else {
        // User is loaded, we may need to change language for him according to its choice
        if (!empty($user->conf->MAIN_LANG_DEFAULT)) {
            $langs->setDefaultLang($user->conf->MAIN_LANG_DEFAULT);
        }
    }
} else {
    // We are already into an authenticated session
    $login = $_SESSION["dol_login"];
    $entity = isset($_SESSION["dol_entity"]) ? $_SESSION["dol_entity"] : 0;
    dol_syslog("- This is an already logged session. _SESSION['dol_login']=" . $login . " _SESSION['dol_entity']=" . $entity, LOG_DEBUG);

    $resultFetchUser = $user->fetch('', $login, '', 1, ($entity > 0 ? $entity : -1));
    if ($resultFetchUser <= 0) {
        // Account has been removed after login
        dol_syslog("Can't load user even if session logged. _SESSION['dol_login']=" . $login, LOG_WARNING);
        session_destroy();
        session_set_cookie_params(0, '/', null, (empty($dolibarr_main_force_https) ? false : true), true); // Add tag secure and httponly on session cookie
        session_name($sessionname);
        session_start();

        if ($resultFetchUser == 0) {
            // Load translation files required by page
            // $langs->loadLangs(['main', 'errors']);

            $_SESSION["dol_loginmesg"] = $langs->transnoentitiesnoconv("ErrorCantLoadUserFromDolibarrDatabase", $login);

            $user->trigger_mesg = 'ErrorCantLoadUserFromDolibarrDatabase - login=' . $login;
        }
        if ($resultFetchUser < 0) {
            $_SESSION["dol_loginmesg"] = $user->error;

            $user->trigger_mesg = $user->error;
        }

        // Call trigger
        $result = $user->call_trigger('USER_LOGIN_FAILED', $user);
        if ($result < 0) {
            $error++;
        }
        // End call triggers

        // Hooks on failed login
        $action = '';
        $hookmanager->initHooks(['login']);
        $parameters = ['dol_authmode' => $dol_authmode, 'dol_loginmesg' => $_SESSION["dol_loginmesg"]];
        $reshook = $hookmanager->executeHooks('afterLoginFailed', $parameters, $user, $action); // Note that $action and $object may have been modified by some hooks
        if ($reshook < 0) {
            $error++;
        }

        $paramsurl = [];
        if (GETPOST('textbrowser', 'int')) {
            $paramsurl[] = 'textbrowser=' . GETPOST('textbrowser', 'int');
        }
        if (GETPOST('nojs', 'int')) {
            $paramsurl[] = 'nojs=' . GETPOST('nojs', 'int');
        }
        if (GETPOST('lang', 'aZ09')) {
            $paramsurl[] = 'lang=' . GETPOST('lang', 'aZ09');
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
        $reshook = $hookmanager->executeHooks('updateSession', [], $user, $action);
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
    $_SESSION["dol_login"] = $user->login;
    $_SESSION["dol_authmode"] = isset($dol_authmode) ? $dol_authmode : '';
    $_SESSION["dol_tz"] = isset($dol_tz) ? $dol_tz : '';
    $_SESSION["dol_tz_string"] = isset($dol_tz_string) ? $dol_tz_string : '';
    $_SESSION["dol_dst"] = isset($dol_dst) ? $dol_dst : '';
    $_SESSION["dol_dst_observed"] = isset($dol_dst_observed) ? $dol_dst_observed : '';
    $_SESSION["dol_dst_first"] = isset($dol_dst_first) ? $dol_dst_first : '';
    $_SESSION["dol_dst_second"] = isset($dol_dst_second) ? $dol_dst_second : '';
    $_SESSION["dol_screenwidth"] = isset($dol_screenwidth) ? $dol_screenwidth : '';
    $_SESSION["dol_screenheight"] = isset($dol_screenheight) ? $dol_screenheight : '';
    $_SESSION["dol_company"] = getDolGlobalString("MAIN_INFO_SOCIETE_NOM");
    $_SESSION["dol_entity"] = $conf->entity;
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

    dol_syslog("This is a new started user session. _SESSION['dol_login']=" . $_SESSION["dol_login"] . " Session id=" . session_id());

    $db->beginTransaction();

    $user->update_last_login_date();

    $loginfo = 'TZ=' . $_SESSION["dol_tz"] . ';TZString=' . $_SESSION["dol_tz_string"] . ';Screen=' . $_SESSION["dol_screenwidth"] . 'x' . $_SESSION["dol_screenheight"];

    // Call triggers for the "security events" log
    $user->trigger_mesg = $loginfo;

    // Call trigger
    $result = $user->call_trigger('USER_LOGIN', $user);
    if ($result < 0) {
        $error++;
    }
    // End call triggers

    // Hooks on successfull login
    $action = '';
    $hookmanager->initHooks(['login']);
    $parameters = ['dol_authmode' => $dol_authmode, 'dol_loginfo' => $loginfo];
    $reshook = $hookmanager->executeHooks('afterLogin', $parameters, $user, $action); // Note that $action and $object may have been modified by some hooks
    if ($reshook < 0) {
        $error++;
    }

    if ($error) {
        $db->rollbackTransactions();
        session_destroy();
        dol_print_error($db, 'Error in some triggers USER_LOGIN or in some hooks afterLogin');
        exit;
    } else {
        $db->commitTransaction();
    }

    // Change landing page if defined.
    $landingpage = (empty($user->conf->MAIN_LANDING_PAGE) ? (empty($conf->global->MAIN_LANDING_PAGE) ? '' : $conf->global->MAIN_LANDING_PAGE) : $user->conf->MAIN_LANDING_PAGE);
    if (!empty($landingpage)) {    // Example: /index.php
        $newpath = dol_buildpath($landingpage, 1);
        if ($_SERVER["PHP_SELF"] != $newpath) {   // not already on landing page (avoid infinite loop)
            header('Location: ' . $newpath);
            exit;
        }
    }
}

// If user admin, we force the rights-based modules
if ($user->admin) {
    $user->rights->user->user->lire = 1;
    $user->rights->user->user->creer = 1;
    $user->rights->user->user->password = 1;
    $user->rights->user->user->supprimer = 1;
    $user->rights->user->self->creer = 1;
    $user->rights->user->self->password = 1;

    //Required if advanced permissions are used with MAIN_USE_ADVANCED_PERMS
    if (!empty($conf->global->MAIN_USE_ADVANCED_PERMS)) {
        $user->rights->user->user_advance->readperms = 1;
        $user->rights->user->user_advance->write = 1;
        $user->rights->user->self_advance->readperms = 1;
        $user->rights->user->self_advance->writeperms = 1;
        $user->rights->user->group_advance->read = 1;
        $user->rights->user->group_advance->readperms = 1;
        $user->rights->user->group_advance->write = 1;
        $user->rights->user->group_advance->delete = 1;
    }
}

/*
 * Overwrite some configs globals (try to avoid this and have code to use instead $user->conf->xxx)
 */

// Set liste_limit
if (isset($user->conf->MAIN_SIZE_LISTE_LIMIT)) {
    $conf->liste_limit = $user->conf->MAIN_SIZE_LISTE_LIMIT; // Can be 0
}
if (isset($user->conf->PRODUIT_LIMIT_SIZE)) {
    $conf->product->limit_size = $user->conf->PRODUIT_LIMIT_SIZE; // Can be 0
}

// Replace conf->css by personalized value if theme not forced
if (empty($conf->global->MAIN_FORCETHEME) && !empty($user->conf->MAIN_THEME)) {
    $conf->theme = $user->conf->MAIN_THEME;
    $conf->css = "/theme/" . $conf->theme . "/style.css.php";
}
