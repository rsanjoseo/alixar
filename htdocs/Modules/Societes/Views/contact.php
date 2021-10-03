<?php

/*
 *  View
 */

$form = new Form($db);
$formfile = new FormFile($db);
$formadmin = new FormAdmin($db);
$formcompany = new FormCompany($db);

if ($socid > 0 && empty($object->id)) {
    $result = $object->fetch($socid);
    if ($result <= 0) {
        dol_print_error('', $object->error);
    }
}

$title = $langs->trans("ThirdParty");
if (!empty($conf->global->MAIN_HTML_TITLE) && preg_match('/thirdpartynameonly/', $conf->global->MAIN_HTML_TITLE) && $object->name) {
    $title = $object->name . " - " . $langs->trans('ContactsAddresses');
}
$help_url = 'EN:Module_Third_Parties|FR:Module_Tiers|ES:Empresas';
llxHeader('', $title, $help_url);

$countrynotdefined = $langs->trans("ErrorSetACountryFirst") . ' (' . $langs->trans("SeeAbove") . ')';

if (!empty($object->id)) {
    $res = $object->fetch_optionals();
}
//if ($res < 0) { dol_print_error($db); exit; }

$head = societe_prepare_head($object);

print dol_get_fiche_head($head, 'contact', $langs->trans("ThirdParty"), 0, 'company');

$linkback = '<a href="' . DOL_URL_ROOT . '/Modules/Societes/list.php?restore_lastsearch_values=1">' . $langs->trans("BackToList") . '</a>';

dol_banner_tab($object, 'socid', $linkback, ($user->socid ? 0 : 1), 'rowid', 'nom', '', '', 0, '', '', 'arearefnobottom');

print dol_get_fiche_end();

print '<br>';

if ($action != 'presend') {
    // Contacts list
    if (empty($conf->global->SOCIETE_DISABLE_CONTACTS)) {
        $result = show_contacts($conf, $langs, $db, $object, $_SERVER["PHP_SELF"] . '?socid=' . $object->id);
    }
}

// End of page
llxFooter();
$db->close();
