<?php
/* TVI
 * Copyright (C) 2015	Florian HENRY 		<florian.henry@open-concept.pro>
 * Copyright (C) 2020   Maxime DEMAREST     <maxime@indelog.fr>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

/**
 *  \file htdocs/loan/calcmens.php
 *  \ingroup    loan
 *  \brief File to calculate loan monthly payments
 */

if (!defined('NOTOKENRENEWAL')) {
    define('NOTOKENRENEWAL', '1'); // Disables token renewal
}
if (!defined('NOREQUIREMENU')) {
    define('NOREQUIREMENU', '1');
}
if (!defined('NOREQUIREAJAX')) {
    define('NOREQUIREAJAX', '1');
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

require DOL_DOCUMENT_ROOT . '/core/lib/loan.lib.php';

$mens = price2num(GETPOST('mens'));
$capital = price2num(GETPOST('capital'));
$rate = price2num(GETPOST('rate'));
$echance = GETPOST('echeance', 'int');
$nbterm = GETPOST('nbterm', 'int');

top_httphead();

$output = [];

$output = loanCalcMonthlyPayment($mens, $capital, $rate, $echance, $nbterm);

echo json_encode($output);
