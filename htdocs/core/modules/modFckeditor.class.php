<?php
/* Copyright (C) 2004      Rodolphe Quiedeville <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2007 Laurent Destailleur  <eldy@users.sourceforge.net>
 * Copyright (C) 2005-2011 Regis Houssin        <regis.houssin@inodbox.com>
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
 *  \defgroup   fckeditor     Module fckeditor
 *  \brief      Module pour mettre en page les zones de saisie de texte
 *  \file       htdocs/core/modules/modFckeditor.class.php
 *  \ingroup    fckeditor
 *  \brief      Description and activation file for the module Fckeditor
 */

include_once DOL_DOCUMENT_ROOT . '/core/modules/DolibarrModules.class.php';

/**
 *    Class to describe and enable module Fckeditor
 */
class modFckeditor extends DolibarrModules
{
    /**
     *   Constructor. Define names, constants, directories, boxes, permissions
     *
     * @param DoliDB $db Database handler
     */
    public function __construct($db)
    {
        $this->db = $db;
        $this->numero = 2000;

        $this->family = "technic";
        $this->module_position = '20';
        // Module label (no space allowed), used if translation string 'ModuleXXXName' not found (where XXX is value of numeric property 'numero' of module)
        $this->name = preg_replace('/^mod/i', '', get_class($this));
        $this->description = "Editeur WYSIWYG";
        // Possible values for version are: 'development', 'experimental', 'dolibarr' or version
        $this->version = 'dolibarr';
        $this->const_name = 'MAIN_MODULE_' . strtoupper($this->name);
        // Name of png file (without png) used for this module.
        // Png file must be in theme/yourtheme/img directory under name object_pictovalue.png.
        $this->picto = 'paragraph';

        // Data directories to create when module is enabled
        $this->dirs = ["/medias/temp", "/medias/image"];

        // Config pages
        $this->config_page_url = ["fckeditor.php"];

        // Dependencies
        $this->disabled = in_array(constant('JS_CKEDITOR'), ['disabled', 'disabled/']);
        $this->depends = [];
        $this->requiredby = ['modWebsites'];

        // Constants
        $this->const = [];
        $this->const[0] = ["FCKEDITOR_ENABLE_SOCIETE", "yesno", "1", "WYSIWIG for description and note (except products/services)"];
        $this->const[1] = ["FCKEDITOR_ENABLE_PRODUCTDESC", "yesno", "1", "WYSIWIG for products/services description and note"];
        $this->const[2] = ["FCKEDITOR_ENABLE_MAILING", "yesno", "1", "WYSIWIG for mass emailings"];
        $this->const[3] = ["FCKEDITOR_ENABLE_DETAILS", "yesno", "1", "WYSIWIG for products details lines for all entities"];
        $this->const[4] = ["FCKEDITOR_ENABLE_USERSIGN", "yesno", "1", "WYSIWIG for user signature"];
        $this->const[5] = ["FCKEDITOR_ENABLE_MAIL", "yesno", "1", "WYSIWIG for products details lines for all entities"];
        $this->const[6] = ["FCKEDITOR_SKIN", "string", "moono-lisa", "Skin by default for fckeditor"];

        // Boxes
        $this->boxes = [];

        // Permissions
        $this->rights = [];
        $this->rights_class = 'fckeditor';
    }
}
