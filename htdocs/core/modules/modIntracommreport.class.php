<?php
/* Copyright (C) 2003       Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2012  Laurent Destailleur     <eldy@users.sourceforge.net>
 * Copyright (C) 2005-2012  Regis Houssin           <regis.houssin@capnetworks.com>
 * Copyright (C) 2019       Open-DSI                <support@open-dsi.fr>
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
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/**
 *  \file       htdocs/core/modules/modIntracommreport.class.php
 *    \ingroup    Intracomm report
 *    \brief      Description and activation file for the module intracomm report
 */

use Alxarafe\Dolibarr\Classes\DolibarrModules;

//include_once DOL_DOCUMENT_ROOT . '/core/modules/DolibarrModules.class.php';

/**
 *  Description and activation class for module intracommreport
 */
class modIntracommreport extends DolibarrModules
{
    /**
     *   Constructor. Define names, constants, directories, boxes, permissions
     */
    public function __construct()
    {
        parent::__construct();

        $this->numero = 68000;

        $this->family = "financial";
        $this->module_position = '60';
        // Module label (no space allowed), used if translation string 'ModuleXXXName' not found (where XXX is value of numeric property 'numero' of module)
        $this->name = preg_replace('/^mod/i', '', get_class($this));
        $this->description = "Intracomm report management (Support for French DEB/DES format)";

        // Possible values for version are: 'development', 'experimental', 'dolibarr' or 'dolibarr_deprecated' or version
        $this->version = 'experimental';

        $this->const_name = 'MAIN_MODULE_' . strtoupper($this->name);
        $this->picto = 'intracommreport';

        // Data directories to create when module is enabled
        $this->dirs = ['/intracommreport/temp'];

        // Config pages
        $this->config_page_url = ["intracommreport.php@intracommreport"];

        // Dependencies
        $this->depends = ["modFacture", "modTax", "modCategorie"]; // List of modules id that must be enabled if this module is enabled
        $this->requiredby = []; // List of modules id to disable if this one is disabled
        $this->conflictwith = []; // List of modules id this module is in conflict with
        $this->phpmin = [5, 6]; // Minimum version of PHP required by module
        $this->need_dolibarr_version = [13, 0, -5]; // Minimum version of Dolibarr required by module
        $this->langfiles = ["intracommreport"];

        // Constants
        // List of particular constants to add when module is enabled (key, 'chaine', value, desc, visible, 'current' or 'allentities', deleteonunactive)
        // Example: $this->const=array(0=>array('MYMODULE_MYNEWCONST1','chaine','myvalue','This is a constant to add',1),
        //                             1=>array('MYMODULE_MYNEWCONST2','chaine','myvalue','This is another constant to add',0, 'current', 1)
        // );
        $this->const = [];

        // Tabs
        $this->tabs = [];

        // Css
        $this->module_parts = [];

        // Boxes
        $this->boxes = [];

        // Dictionaries
        if (!isset($this->conf->intracommreport->enabled)) {
            $this->conf->intracommreport = new stdClass();
            $this->conf->intracommreport->enabled = 0;
        }
        $this->dictionaries = [];

        // Permissions
        $this->rights = [];
        $this->rights_class = 'intracommreport';
        $r = 0;

        $r++;
        $this->rights[$r][0] = 68001;
        $this->rights[$r][1] = 'Read intracomm report';
        $this->rights[$r][2] = 'r';
        $this->rights[$r][3] = 0;
        $this->rights[$r][4] = 'read';

        $r++;
        $this->rights[$r][0] = 68002;
        $this->rights[$r][1] = 'Create/modify intracomm report';
        $this->rights[$r][2] = 'w';
        $this->rights[$r][3] = 0;
        $this->rights[$r][4] = 'write';

        $r++;
        $this->rights[$r][0] = 68004;
        $this->rights[$r][1] = 'Delete intracomm report';
        $this->rights[$r][2] = 'd';
        $this->rights[$r][3] = 0;
        $this->rights[$r][4] = 'delete';

        // Main menu entries
        $this->menu = []; // List of menus to add
        $r = 0;

        // Exports
        $r = 1;
    }
}
