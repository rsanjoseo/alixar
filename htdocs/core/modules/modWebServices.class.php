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
 *      \defgroup   webservices     Module webservices
 *      \brief      Module to enable the Dolibarr server of web services
 *       \file       htdocs/core/modules/modWebServices.class.php
 *       \ingroup    webservices
 *       \brief      Description and activation file for the module webservices
 */

use Alxarafe\Dolibarr\Classes\DolibarrModules;

//include_once DOL_DOCUMENT_ROOT . '/core/modules/DolibarrModules.class.php';

/**
 *    Class to describe a WebServices module
 */
class modWebServices extends DolibarrModules
{

    /**
     *   Constructor. Define names, constants, directories, boxes, permissions
     */
    public function __construct()
    {
        parent::__construct();

        $this->numero = 2600;

        $this->family = "interface";
        $this->module_position = '25';
        // Module label (no space allowed), used if translation string 'ModuleXXXName' not found (where XXX is value of numeric property 'numero' of module)
        $this->name = preg_replace('/^mod/i', '', get_class($this));
        $this->description = "Enable the Dolibarr web services server";
        // Possible values for version are: 'development', 'experimental', 'dolibarr' or version
        $this->version = 'dolibarr';
        // Key used in llx_const table to save module status enabled/disabled (where MYMODULE is value of property name of module in uppercase)
        $this->const_name = 'MAIN_MODULE_' . strtoupper($this->name);
        // Name of image file used for this module.
        $this->picto = 'technic';

        // Data directories to create when module is enabled
        $this->dirs = [];

        // Config pages
        $this->config_page_url = ["index.php@webservices"];

        // Dependencies
        $this->hidden = false; // A condition to hide module
        $this->depends = []; // List of module class names as string that must be enabled if this module is enabled
        $this->requiredby = []; // List of module ids to disable if this one is disabled
        $this->conflictwith = []; // List of module class names as string this module is in conflict with
        $this->phpmin = [5, 6]; // Minimum version of PHP required by module
        $this->langfiles = ["other"];

        // Constants
        $this->const = [];

        // New pages on tabs
        $this->tabs = [];

        // Boxes
        $this->boxes = [];

        // Permissions
        $this->rights = [];
        $this->rights_class = 'webservices';
        $r = 0;
    }
}
