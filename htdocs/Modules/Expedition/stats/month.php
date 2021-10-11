<?php
/* Copyright (C) 2001-2003  Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2009  Laurent Destailleur     <eldy@users.sourceforge.net>
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
 *    \file       htdocs/expedition/stats/month.php
 *    \ingroup    commande
 *    \brief      Page des stats expeditions par mois
 */

// Descend to the htdocs folder
chdir('../../..');
define('BASE_FOLDER', getcwd());

const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;
const NOREQUIREHTML = 0;
const NOREQUIREDB = 0;      // Si aparece el mensaje: "Call to member function useLocalTax() on null"
const NOREQUIRESOC = 0;     // Es que no se ha asignado a $mysoc el valor correspondiente.

require 'main.php';

require_once DOL_DOCUMENT_ROOT . '/Modules/Expedition/class/expedition.class.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Expedition/class/expeditionstats.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/dolgraph.class.php';

$year = GETPOST('year', 'int');

// Security check
if ($user->socid) {
    $socid = $user->socid;
}
restrictedArea($user, 'expedition');

/*
 * View
 */

llxHeader();

$WIDTH = DolGraph::getDefaultGraphSizeForStats('width');
$HEIGHT = DolGraph::getDefaultGraphSizeForStats('height');

$mesg = '';

print load_fiche_titre($langs->trans("StatisticsOfSendings") . ' ' . $year, $mesg);

$stats = new ExpeditionStats($db);
$data = $stats->getNbExpeditionByMonth($year);

dol_mkdir($conf->expedition->dir_temp);

$filename = $conf->expedition->dir_temp . "/expedition" . $year . ".png";
$fileurl = DOL_URL_ROOT . '/viewimage.php?modulepart=expeditionstats&file=expedition' . $year . '.png';

$px = new DolGraph();
$mesg = $px->isGraphKo();
if (!$mesg) {
    $px->SetData($data);
    $px->SetMaxValue($px->GetCeilMaxValue());
    $px->SetWidth($WIDTH);
    $px->SetHeight($HEIGHT);
    $px->SetYLabel($langs->trans("NbOfSendings"));
    $px->SetShading(3);
    $px->SetHorizTickIncrement(1);
    $px->draw($filename, $fileurl);
}

print '<table class="border centpercent">';
print '<tr><td class="center">' . $langs->trans("NbOfSendingsByMonth") . '</td>';
print '<td class="center">';
print $px->show();
print '</td></tr>';
print '</table>';

// End of page
llxFooter();
$db->close();
