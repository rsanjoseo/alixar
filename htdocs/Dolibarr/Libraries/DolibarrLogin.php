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

namespace Alxarafe\Dolibarr\Libraries;

use Alxarafe\Core\Base\BasicController;
use Alxarafe\Dolibarr\Base\DolibarrView;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions2;

/**
 * Class DolibarrLogin
 *
 * Login to be used temporarily in the controllers, while it is being migrated to MVC.
 *
 * @package Alxarafe\Dolibarr\Tpl
 */
class DolibarrLogin extends DolibarrView
{
    public function __construct(BasicController $controller)
    {
        parent::__construct($controller);

        // Need global variable $urllogo, $title and $titletruedolibarrversion to be defined by caller (like dol_loginfunction in security2.lib.php)
        // Caller can also set 	$morelogincontent = array(['options']=>array('js'=>..., 'table'=>...);

        if (!defined('NOBROWSERNOTIF')) {
            define('NOBROWSERNOTIF', 1);
        }

        // Protection to avoid direct call of template
        if (empty($this->conf) || !is_object($this->conf)) {
            print "Error, template page can't be called as URL";
            exit;
        }

        // require_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';

        header('Cache-Control: Public, must-revalidate');
        header("Content-type: text/html; charset=" . $this->conf->file->character_set_client);

        if (DolibarrFunctions::GETPOST('dol_hide_topmenu')) {
            $this->conf->dol_hide_topmenu = 1;
        }
        if (DolibarrFunctions::GETPOST('dol_hide_leftmenu')) {
            $this->conf->dol_hide_leftmenu = 1;
        }
        if (DolibarrFunctions::GETPOST('dol_optimize_smallscreen')) {
            $this->conf->dol_optimize_smallscreen = 1;
        }
        if (DolibarrFunctions::GETPOST('dol_no_mouse_hover')) {
            $this->conf->dol_no_mouse_hover = 1;
        }
        if (DolibarrFunctions::GETPOST('dol_use_jmobile')) {
            $this->conf->dol_use_jmobile = 1;
        }

        // If we force to use jmobile, then we reenable javascript
        if (!empty($this->conf->dol_use_jmobile)) {
            $this->conf->use_javascript_ajax = 1;
        }

        $php_self = DolibarrFunctions::dol_escape_htmltag($_SERVER['PHP_SELF']);
        $php_self .= DolibarrFunctions::dol_escape_htmltag($_SERVER["QUERY_STRING"]) ? '?' . DolibarrFunctions::dol_escape_htmltag($_SERVER["QUERY_STRING"]) : '';
        if (!preg_match('/mainmenu=/', $php_self)) {
            $php_self .= (preg_match('/\?/', $php_self) ? '&' : '?') . 'mainmenu=home';
        }

        // Javascript code on logon page only to detect user tz, dst_observed, dst_first, dst_second
        $arrayofjs = [
            '/includes/jstz/jstz.min.js' . (empty($this->conf->dol_use_jmobile) ? '' : '?version=' . urlencode(DOL_VERSION)),
            '/core/js/dst.js' . (empty($this->conf->dol_use_jmobile) ? '' : '?version=' . urlencode(DOL_VERSION)),
        ];

        // We display application title instead Login term
        if (!empty($this->conf->global->MAIN_APPLICATION_TITLE)) {
            $titleofloginpage = $this->conf->global->MAIN_APPLICATION_TITLE;
        } else {
            $titleofloginpage = $this->langs->trans('Login');
        }
        $titleofloginpage .= ' @ ' . $titletruedolibarrversion; // $titletruedolibarrversion is defined by dol_loginfunction in security2.lib.php. We must keep the @, some tools use it to know it is login page and find true dolibarr version.

        $disablenofollow = 1;
        if (!preg_match('/' . constant('DOL_APPLICATION_TITLE') . '/', $title)) {
            $disablenofollow = 0;
        }
        if (!empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
            $disablenofollow = 0;
        }

        print $this->top_htmlhead('', $titleofloginpage, 0, 0, $arrayofjs, [], 0, $disablenofollow);

        $colorbackhmenu1 = '60,70,100'; // topmenu
        if (!isset($this->conf->global->THEME_ELDY_TOPMENU_BACK1)) {
            $this->conf->global->THEME_ELDY_TOPMENU_BACK1 = $colorbackhmenu1;
        }
        $colorbackhmenu1 = empty($user->conf->THEME_ELDY_ENABLE_PERSONALIZED) ? (empty($this->conf->global->THEME_ELDY_TOPMENU_BACK1) ? $colorbackhmenu1 : $this->conf->global->THEME_ELDY_TOPMENU_BACK1) : (empty($user->conf->THEME_ELDY_TOPMENU_BACK1) ? $colorbackhmenu1 : $user->conf->THEME_ELDY_TOPMENU_BACK1);
        $colorbackhmenu1 = join(',', DolibarrFunctions2::colorStringToArray($colorbackhmenu1)); // Normalize value to 'x,y,z'

        print "<!-- BEGIN PHP TEMPLATE LOGIN.TPL.PHP -->\n";

        if (!empty($this->conf->global->ADD_UNSPLASH_LOGIN_BACKGROUND)) {
            // For example $this->conf->global->ADD_UNSPLASH_LOGIN_BACKGROUND = 'https://source.unsplash.com/random'
            print '
<body class="body bodylogin"
      style="background-image: url(' . DolibarrFunctions::dol_escape_htmltag($this->conf->global->ADD_UNSPLASH_LOGIN_BACKGROUND) . '); background-repeat: no-repeat; background-position: center center; background-attachment: fixed; background-size: cover; background-color: #ffffff;">
';
        } else {
            print '
<body class="body bodylogin"' . empty($this->conf->global->MAIN_LOGIN_BACKGROUND) ? '' : ' style="background-size: cover; background-position: center center; background-attachment: fixed; background-repeat: no-repeat; background-image: url(\'' . DOL_URL_ROOT . '/viewimage.php?cache=1&noalt=1&modulepart=mycompany&file=logos/' . urlencode($this->conf->global->MAIN_LOGIN_BACKGROUND) . '\')"' . '>
';
        }

        if (empty($this->conf->dol_use_jmobile)) {
            print '<script>
        $(document).ready(function () {
            /* Set focus on correct field */';
            if ($focus_element) {
                print '$(' . $focus_element . ').focus();';
            }        // Warning to use this only on visible element
            print '});
    </script>';
        }

        print '<div class="login_center center"' . (empty($this->conf->global->MAIN_LOGIN_BACKGROUND) ? ' style="background-size: cover; background-position: center center; background-attachment: fixed; background-repeat: no-repeat; background-image: linear-gradient(rgb(' . $colorbackhmenu1 . ',0.3), rgb(240,240,240));"' : '') .
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
            <input type="hidden" name="dol_hide_topmenu" id="dol_hide_topmenu"
                   value="' . $dol_hide_topmenu . '"/>
            <input type="hidden" name="dol_hide_leftmenu" id="dol_hide_leftmenu"
                   value="' . $dol_hide_leftmenu . '"/>
            <input type="hidden" name="dol_optimize_smallscreen" id="dol_optimize_smallscreen"
                   value="' . $dol_optimize_smallscreen . '"/>
            <input type="hidden" name="dol_no_mouse_hover" id="dol_no_mouse_hover"
                   value="' . $dol_no_mouse_hover . '"/>
            <input type="hidden" name="dol_use_jmobile" id="dol_use_jmobile" value="' . $dol_use_jmobile . '"/>


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
        if (!empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
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
        if (!empty($this->conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
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
                                           autocomplete="' . (empty($this->conf->global->MAIN_LOGIN_ENABLE_PASSWORD_AUTOCOMPLETE) ? 'off' : 'on') . '"/>
                                </div>
                            </div>';

        if (!empty($captcha)) {
            // Add a variable param to force not using cache (jmobile)
            $php_self = preg_replace('/[&\?]time=(\d+)/', '', $php_self); // Remove param time
            if (preg_match('/\?/', $php_self)) {
                $php_self .= '&time=' . dol_print_date(dol_now(), 'dayhourlog');
            } else {
                $php_self .= '?time=' . dol_print_date(dol_now(), 'dayhourlog');
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
                $moreparam .= (strpos($moreparam, '?') === false ? '?' : '&') . 'dol_hide_topmenu=' . $dol_hide_topmenu;
            }
            if ($dol_hide_leftmenu) {
                $moreparam .= (strpos($moreparam, '?') === false ? '?' : '&') . 'dol_hide_leftmenu=' . $dol_hide_leftmenu;
            }
            if ($dol_no_mouse_hover) {
                $moreparam .= (strpos($moreparam, '?') === false ? '?' : '&') . 'dol_no_mouse_hover=' . $dol_no_mouse_hover;
            }
            if ($dol_use_jmobile) {
                $moreparam .= (strpos($moreparam, '?') === false ? '?' : '&') . 'dol_use_jmobile=' . $dol_use_jmobile;
            }

            echo '<br>';
            echo '<div class="center" style="margin-top: 5px;">';
            if ($forgetpasslink) {
                $url = DOL_URL_ROOT . '/Modules/Users/passwordforgotten.php' . $moreparam;
                if (!empty($this->conf->global->MAIN_PASSWORD_FORGOTLINK)) {
                    $url = $this->conf->global->MAIN_PASSWORD_FORGOTLINK;
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
                if (!empty($this->conf->global->MAIN_HELPCENTER_LINKTOUSE)) {
                    $url = $this->conf->global->MAIN_HELPCENTER_LINKTOUSE;
                }
                echo '<a class="alogin" href="' . DolibarrFunctions::dol_escape_htmltag($url) . '" target="_blank">';
                echo $this->langs->trans('NeedHelpCenter');
                echo '</a>';
            }
            echo '</div>';
        }

        if (isset($this->conf->file->main_authentication) && preg_match('/openid/', $this->conf->file->main_authentication)) {
            $this->langs->load("users");

            //if (! empty($this->conf->global->MAIN_OPENIDURL_PERUSER)) $url=
            echo '<br>';
            echo '<div class="center" style="margin-top: 4px;">';

            $url = $this->conf->global->MAIN_AUTHENTICATION_OPENID_URL;
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
        if (!empty($this->conf->global->MAIN_EASTER_EGG_COMMITSTRIP)) {
            include_once DOL_DOCUMENT_ROOT . '/core/lib/geturl.lib.php';
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
            print '<div class="center login_main_home paddingtopbottom ' . (empty($this->conf->global->MAIN_LOGIN_BACKGROUND) ? '' : ' backgroundsemitransparent boxshadow') . '"
                 style="max-width: 70%">
                ' . $main_home . '</div><br>';
        }

        print'
        <!-- authentication mode = ' . $main_authentication . ' -->
        <!-- cookie name used for this session = ' . $session_name . ' -->
        <!-- urlfrom in this session = ' . (isset($_SESSION["urlfrom"]) ? $_SESSION["urlfrom"] : '') . ' -->

        <!-- Common footer is not used for login page, this is same than footer but inside login tpl -->';

        if (!empty($this->conf->global->MAIN_HTML_FOOTER)) {
            print $this->conf->global->MAIN_HTML_FOOTER;
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
        if (!empty($this->conf->google->enabled) && !empty($this->conf->global->MAIN_GOOGLE_AN_ID)) {
            $tmptagarray = explode(',', $this->conf->global->MAIN_GOOGLE_AN_ID);
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
        if (!empty($this->conf->google->enabled) && !empty($this->conf->global->MAIN_GOOGLE_AD_CLIENT) && !empty($this->conf->global->MAIN_GOOGLE_AD_SLOT)) {
            if (empty($this->conf->dol_use_jmobile)) {
                print '
                <div class="center"><br>
                    <script><!--
                        google_ad_client = "' . $this->conf->global->MAIN_GOOGLE_AD_CLIENT . '";
                        google_ad_slot = "' . $this->conf->global->MAIN_GOOGLE_AD_SLOT . '";
                        google_ad_width = ' . $this->conf->global->MAIN_GOOGLE_AD_WIDTH . ';
                        google_ad_height = ' . $this->conf->global->MAIN_GOOGLE_AD_HEIGHT . ';
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
