<?php
/* Copyright (C) 2009 Laurent Destailleur  <eldy@users.sourceforge.net>
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

/**
 *  \defgroup   geoip      Module geoipmaxmind
 *  \brief      Module to make geoip conversions
 *    \file       htdocs/core/modules/modGeoIPMaxmind.class.php
 *    \ingroup    geoip
 *    \brief      Description and activation file for the module geoipmaxmind
 */

use Alxarafe\Dolibarr\Classes\DolibarrModules;

//include_once DOL_DOCUMENT_ROOT . '/core/modules/DolibarrModules.class.php';

/**
 *    Class to describe and enable module Import
 */
class modGeoIPMaxmind extends DolibarrModules
{

    /**
     *   Constructor. Define names, constants, directories, boxes, permissions
     */
    public function __construct()
    {
        parent::__construct();

        $this->numero = 2900;

        // Family can be 'crm','financial','hr','projects','products','ecm','technic','other'
        // It is used to group modules in module setup page
        $this->family = "interface";
        // Module label (no space allowed), used if translation string 'ModuleXXXName' not found (where XXX is value of numeric property 'numero' of module)
        $this->name = preg_replace('/^mod/i', '', get_class($this));
        // Module description, used if translation string 'ModuleXXXDesc' not found (where XXX is value of numeric property 'numero' of module)
        $this->description = "GeoIP Maxmind conversions capabilities";
        // Possible values for version are: 'development', 'experimental', 'dolibarr' or version
        $this->version = 'dolibarr';
        // Key used in llx_const table to save module status enabled/disabled (where MYMODULE is value of property name of module in uppercase)
        $this->const_name = 'MAIN_MODULE_' . strtoupper($this->name);
        // Name of image file used for this module.
        // If file is in theme/yourtheme/img directory under name object_pictovalue.png, use this->picto='pictovalue'
        // If file is in module/images directory, use this->picto=DOL_URL_ROOT.'/module/images/file.png'
        $this->picto = 'geoip';

        // Data directories to create when module is enabled
        $this->dirs = ["/geoipmaxmind"];

        // Config pages
        $this->config_page_url = ["geoipmaxmind.php"];

        // Dependencies
        $this->hidden = false; // A condition to hide module
        $this->depends = []; // List of module class names as string that must be enabled if this module is enabled
        $this->requiredby = []; // List of module ids to disable if this one is disabled
        $this->conflictwith = []; // List of module class names as string this module is in conflict with
        $this->phpmin = [5, 6];
        $this->phpmax = [];
        $this->need_dolibarr_version = [2, 7, -1]; // Minimum version of Dolibarr required by module
        $this->need_javascript_ajax = 1;

        // Constants
        $this->const = [];

        // Boxes
        $this->boxes = [];

        // Permissions
        $this->rights = [];
        $this->rights_class = 'geoipmaxmind';
        $r = 0;
    }
}
