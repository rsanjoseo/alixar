<?php
/* Copyright (C) 2005      Rodolphe Quiedeville <rodolphe@quiedeville.org>
 * Copyright (C) 2005-2007 Laurent Destailleur  <eldy@users.sourceforge.net>
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
 *    \defgroup   notification    Module email notification
 *    \brief      Module pour gerer les notifications (par mail ou autre)
 *    \file       htdocs/core/modules/modNotification.class.php
 *    \ingroup    notification
 *    \brief      Description and activation file for the module Notification
 */

use Alxarafe\Dolibarr\Classes\DolibarrModules;

//include_once DOL_DOCUMENT_ROOT . '/core/modules/DolibarrModules.class.php';

/**
 *    Class to describe and enable module Mailing
 */
class modNotification extends DolibarrModules
{

    /**
     *   Constructor. Define names, constants, directories, boxes, permissions
     */
    public function __construct()
    {
        parent::__construct();

        $this->numero = 600;

        // Family can be 'crm','financial','hr','projects','products','ecm','technic','other'
        // It is used to group modules in module setup page
        $this->family = "interface";
        // Module position in the family on 2 digits ('01', '10', '20', ...)
        $this->module_position = '22';
        // Module label (no space allowed), used if translation string 'ModuleXXXName' not found (where XXX is value of numeric property 'numero' of module)
        $this->name = preg_replace('/^mod/i', '', get_class($this));
        $this->description = "EMail notifications (push) on business Dolibarr events";
        $this->descriptionlong = 'Module600Long';
        // Possible values for version are: 'development', 'experimental', 'dolibarr' or version
        $this->version = 'dolibarr';
        $this->const_name = 'MAIN_MODULE_' . strtoupper($this->name);
        $this->picto = 'email';

        // Data directories to create when module is enabled.
        $this->dirs = [];

        // Dependencies
        $this->hidden = false; // A condition to hide module
        $this->depends = []; // List of module class names as string that must be enabled if this module is enabled
        $this->requiredby = []; // List of module ids to disable if this one is disabled
        $this->conflictwith = []; // List of module class names as string this module is in conflict with
        $this->phpmin = [5, 6]; // Minimum version of PHP required by module
        $this->langfiles = ["mails"];

        // Config pages
        $this->config_page_url = ["notification.php"];

        // Constants
        $this->const = [];

        // Boxes
        $this->boxes = [];

        // Permissions
        $this->rights = [];
        $this->rights_class = 'notification';
    }

    /**
     *        Function called when module is enabled.
     *        The init function add constants, boxes, permissions and menus (defined in constructor) into Dolibarr database.
     *        It also creates data directories
     *
     * @param string $options Options when enabling module ('', 'noboxes')
     *
     * @return     int                1 if OK, 0 if KO
     */
    public function init($options = '')
    {
        // Permissions
        $this->remove($options);

        $sql = [];

        return $this->_init($sql, $options);
    }
}
