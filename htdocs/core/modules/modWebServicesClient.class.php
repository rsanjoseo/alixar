<?php
/* Copyright (C) 2014      Ion Agorria          <ion@agorria.com>
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
 *      \brief      Module to enable client for supplier WebServices
 *       \file       htdocs/core/modules/modWebServicesClient.class.php
 *       \ingroup    webservices
 *       \brief      Description and activation file for the module supplier webservices module
 */

use Alxarafe\Dolibarr\Classes\DolibarrModules;

//include_once DOL_DOCUMENT_ROOT . '/core/modules/DolibarrModules.class.php';

/**
 *    Class to describe a sync supplier web services module
 */
class modWebServicesClient extends DolibarrModules
{

    /**
     *   Constructor. Define names, constants, directories, boxes, permissions
     */
    public function __construct()
    {
        parent::__construct();

        $this->numero = 2660;

        $this->family = "interface";
        $this->module_position = '25';
        // Module label (no space allowed), used if translation string 'ModuleXXXName' not found (where XXX is value of numeric property 'numero' of module)
        $this->name = preg_replace('/^mod/i', '', get_class($this));
        $this->description = "Enable the web service client to call external supplier web services";
        // Possible values for version are: 'development', 'experimental', 'dolibarr' or version
        $this->version = 'experimental';
        // Key used in llx_const table to save module status enabled/disabled (where MYMODULE is value of property name of module in uppercase)
        $this->const_name = 'MAIN_MODULE_' . strtoupper($this->name);
        // Name of image file used for this module.
        $this->picto = 'technic';

        // Data directories to create when module is enabled
        $this->dirs = [];

        // Config pages
        //$this->config_page_url = array();

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
        $this->rights_class = 'syncsupplierwebservices';
        $r = 0;
    }
}
