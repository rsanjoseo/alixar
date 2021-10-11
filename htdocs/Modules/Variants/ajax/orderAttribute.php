<?php

/* Copyright (C) 2016	Marcos García	<marcosgdf@gmail.com>
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

if (!defined('NOTOKENRENEWAL')) {
    define('NOTOKENRENEWAL', '1'); // Disable token renewal
}
if (!defined('NOREQUIREMENU')) {
    define('NOREQUIREMENU', '1');
}
if (!defined('NOREQUIREHTML')) {
    define('NOREQUIREHTML', '1');
}
if (!defined('NOREQUIREAJAX')) {
    define('NOREQUIREAJAX', '1');
}
if (!defined('NOREQUIRESOC')) {
    define('NOREQUIRESOC', '1');
}
if (!defined('NOREQUIRETRAN')) {
    define('NOREQUIRETRAN', '1');
}

// Descend to the htdocs folder
chdir('../../..');
define('BASE_FOLDER', getcwd());

const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;
const NOREQUIREHTML = 0;
const NOREQUIREDB = 0;      // Si aparece el mensaje: "Call to member function useLocalTax() on null"
const NOREQUIRESOC = 0;     // Es que no se ha asignado a $mysoc el valor correspondiente.

require 'main.php';

$permissiontoread = $user->rights->produit->lire || $user->rights->service->lire;

// Security check
if (empty($conf->variants->enabled)) {
    accessforbidden('Module not enabled');
}
if ($user->socid > 0) { // Protection if external user
    accessforbidden();
}
//$result = restrictedArea($user, 'variant');
if (!$permissiontoread) {
    accessforbidden();
}

/*
 * View
 */

top_httphead();

// Registering the location of boxes
if (GETPOSTISSET('roworder')) {
    $roworder = GETPOST('roworder', 'intcomma', 2);

    dol_syslog("AjaxOrderAttribute roworder=" . $roworder, LOG_DEBUG);

    $rowordertab = explode(',', $roworder);

    $newrowordertab = [];
    foreach ($rowordertab as $value) {
        if (!empty($value)) {
            $newrowordertab[] = $value;
        }
    }

    require DOL_DOCUMENT_ROOT . '/variants/class/ProductAttribute.class.php';

    ProductAttribute::bulkUpdateOrder($db, $newrowordertab);
}
