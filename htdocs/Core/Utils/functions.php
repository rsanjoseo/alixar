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

use Alxarafe\Core\Providers\Constants;
use Alxarafe\Core\Singletons\Config;

/**
 * Create a configuration file, from the Dolibarr configuration file
 *
 * @author  Rafael San José Tovar <info@rsanjoseo.com>
 * @version sept. 2021
 *
 * @return bool
 */
function createConfigFromDolibarr(): bool
{
    /**
     * TODO: Variables that, if they exist, must be migrated from the original Dolibarr configuration to the new one.
     *
     * $dolibarr_main_url_root='https://localhost74/dolibarr/htdocs';
     * $dolibarr_main_document_root='/srv/http/dolibarr/htdocs';
     * $dolibarr_main_url_root_alt='/custom';
     * $dolibarr_main_document_root_alt='/srv/http/dolibarr/htdocs/custom';
     * $dolibarr_main_data_root='/srv/http/dolibarr/documents';
     *
     * // Authentication settings
     * $dolibarr_main_authentication='dolibarr';
     *
     * // Security settings
     * $dolibarr_main_prod='0';
     * $dolibarr_main_force_https='0';
     * $dolibarr_main_restrict_os_commands='mysqldump, mysql, pg_dump, pgrestore';
     * $dolibarr_main_instance_unique_id='89806024fdd26cc753b02ba2fcad4675';
     * $dolibarr_main_distrib='standard';
     *
     * //$dolibarr_main_demo='autologin,autopass';
     * $dolibarr_mailing_limit_sendbyweb='0';
     *
     * //$dolibarr_lib_FPDF_PATH='';
     * //$dolibarr_lib_TCPDF_PATH='';
     * //$dolibarr_lib_FPDI_PATH='';
     * //$dolibarr_lib_TCPDI_PATH='';
     * //$dolibarr_lib_ADODB_PATH='';
     * //$dolibarr_lib_GEOIP_PATH='';
     * //$dolibarr_lib_NUSOAP_PATH='';
     * //$dolibarr_lib_ODTPHP_PATH='';
     * //$dolibarr_lib_ODTPHP_PATHTOPCLZIP='';
     *
     * //$dolibarr_js_CKEDITOR='';
     * //$dolibarr_js_JQUERY='';
     * //$dolibarr_js_JQUERY_UI='';
     *
     * //$dolibarr_font_DOL_DEFAULT_TTF='';
     * //$dolibarr_font_DOL_DEFAULT_TTF_BOLD='';
     *
     * $dolibarr_nocsrfcheck='0';
     */

    Constants::defineConstants();
    $config = Config::getInstance();

    $configDolibarrFile = constant('BASE_FOLDER') . '/conf/conf.php';
    if (!file_exists($configDolibarrFile)) {
        return false;
    }
    require_once $configDolibarrFile;

    $config->setVar('templaterender', 'main', 'skin', 'default');
    $config->setVar('database', 'main', 'dbEngineName', 'PdoMySql');

    $dolibarrDbVars = [
        'dbUser' => 'dolibarr_main_db_user',
        'dbPass' => 'dolibarr_main_db_pass',
        'dbName' => 'dolibarr_main_db_name',
        'dbHost' => 'dolibarr_main_db_host',
        'dbPort' => 'dolibarr_main_db_port',
        'dbPrefix' => 'dolibarr_main_db_prefix',
        'dbType' => 'dolibarr_main_db_type',
        'dbCharSet' => 'dolibarr_main_db_character_set',
        'dbCollation' => 'dolibarr_main_db_collation',
    ];

    foreach ($dolibarrDbVars as $name => $dolibarrVar) {
        if (!empty(${$dolibarrVar})) {
            $config->setVar('database', 'main', $name, ${$dolibarrVar});
        }
    }

    if (!$config->saveConfigFile()) {
        return false;
    }

    return Constants::loadConstants();
}

if (!function_exists('basePath')) {
    /**
     * Returns the app base path.
     *
     * @param string $path
     *
     * @return string
     */
    function basePath(string $path = ''): string
    {
        return realpath(constant('BASE_FOLDER')) .
            (empty($path) ? $path : constant('DIRECTORY_SEPARATOR') . trim($path, constant('DIRECTORY_SEPARATOR')));
    }
}
