<?php
/* Copyright (C) 2017 ATM Consulting      <contact@atm-consulting.fr>
 * Copyright (C) 2017 Pierre-Henry Favre  <phf@atm-consulting.fr>
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
 *       \file       htdocs/expensereport/ajax/ajaxik.php
 *       \ingroup    expensereport
 *       \brief      File to return Ajax response on third parties request
 */

if (!defined('NOTOKENRENEWAL')) {
    define('NOTOKENRENEWAL', 1); // Disables token renewal
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
if (!defined('NOCSRFCHECK')) {
    define('NOCSRFCHECK', '1');
}

$res = 0;
// Descend to the htdocs folder
chdir('../../..');
define('BASE_FOLDER', getcwd());

const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;
const NOREQUIREHTML = 0;
const NOREQUIREDB = 0;      // Si aparece el mensaje: "Call to member function useLocalTax() on null"
const NOREQUIRESOC = 0;     // Es que no se ha asignado a $mysoc el valor correspondiente.

require 'main.php';

require_once DOL_DOCUMENT_ROOT . '/Modules/ExpenseReports/class/expensereport.class.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/ExpenseReports/class/expensereport_ik.class.php';

// Load translation files required by the page
$langs->loadlangs(['errors', 'trips']);

$fk_expense = GETPOST('fk_expense', 'int');
$fk_c_exp_tax_cat = GETPOST('fk_c_exp_tax_cat', 'int');

// Security check
$result = restrictedArea($user, 'expensereport', $fk_expense, 'expensereport');

/*
 * View
 */

top_httphead();

if (empty($fk_expense) || $fk_expense < 0) {
    echo json_encode(['error' => $langs->transnoentitiesnoconv('ErrorBadValueForParameter', $fk_expense, 'fk_expense')]);
} elseif (empty($fk_c_exp_tax_cat) || $fk_c_exp_tax_cat < 0) {
    echo json_encode(['error' => $langs->transnoentitiesnoconv('ErrorBadValueForParameter', $fk_c_exp_tax_cat, 'fk_c_exp_tax_cat')]);
} else {
    // @see ndfp.class.php:3576 (method: compute_total_km)
    $expense = new ExpenseReport($db);
    if ($expense->fetch($fk_expense) <= 0) {
        echo json_encode(['error' => $langs->transnoentitiesnoconv('ErrorRecordNotFound'), 'fk_expense' => $fk_expense]);
    } else {
        $userauthor = new User($db);
        if ($userauthor->fetch($expense->fk_user_author) <= 0) {
            echo json_encode(['error' => $langs->transnoentitiesnoconv('ErrorRecordNotFound'), 'fk_user_author' => $expense->fk_user_author]);
        } else {
            $range = ExpenseReportIk::getRangeByUser($userauthor, $fk_c_exp_tax_cat);

            if (empty($range)) {
                echo json_encode(['error' => $langs->transnoentitiesnoconv('ErrorRecordNotFound'), 'range' => $range]);
            } else {
                $ikoffset = price($range->ikoffset, 0, $langs, 1, -1, -1, $conf->currency);
                echo json_encode(['up' => $range->coef, 'ikoffset' => $range->ikoffset, 'title' => $langs->transnoentitiesnoconv('ExpenseRangeOffset', $ikoffset), 'comment' => 'offset should be applied on addline or updateline']);
            }
        }
    }
}
