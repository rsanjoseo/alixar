<?php
/* Copyright (C) - 2020	Andreu Bisquerra Gaya <jove@bisquerra.com>
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
 *       \file       htdocs/takepos/public/auto_order.php
 *       \ingroup    takepos
 *       \brief      Public orders for customers
 */

if (!defined("NOLOGIN")) {
    define("NOLOGIN", '1'); // If this page is public (can be called outside logged session)
}
if (!defined('NOIPCHECK')) {
    define('NOIPCHECK', '1'); // Do not check IP defined into conf $dolibarr_main_restrict_ip
}
if (!defined('NOBROWSERNOTIF')) {
    define('NOBROWSERNOTIF', '1');
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

if (!$conf->global->TAKEPOS_AUTO_ORDER) {
    accessforbidden(); // If Auto Order is disabled never allow NO LOGIN access
}

$_SESSION["basiclayout"] = 1;
$_SESSION["takeposterminal"] = 1;

define('INCLUDE_PHONEPAGE_FROM_PUBLIC_PAGE', 1);
if (GETPOSTISSET("mobilepage")) {
    require '../invoice.php';
} elseif (GETPOSTISSET("genimg")) {
    require DOL_DOCUMENT_ROOT . '/takepos/genimg/index.php';
} else {
    require '../phone.php';
}
