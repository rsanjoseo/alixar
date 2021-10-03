<?php
/*
 * View
 */

$wikihelp = 'EN:First_setup|FR:Premiers_paramétrages|ES:Primeras_configuraciones';
llxHeader('', $langs->trans("Setup"), $wikihelp);

$form = new Form($db);
$formother = new FormOther($db);
$formcompany = new FormCompany($db);

$countrynotdefined = '<font class="error">' . $langs->trans("ErrorSetACountryFirst") . ' (' . $langs->trans("SeeAbove") . ')</font>';

print load_fiche_titre($langs->trans("CompanyFoundation"), '', 'title_setup');

$head = company_admin_prepare_head();

print dol_get_fiche_head($head, 'company', $langs->trans("Company"), -1, 'company');

print '<span class="opacitymedium">' . $langs->trans("CompanyFundationDesc", $langs->transnoentities("Save")) . "</span><br>\n";
print "<br>\n";

/**
 * Edit parameters
 */
if (!empty($conf->use_javascript_ajax)) {
    print "\n" . '<script type="text/javascript" language="javascript">';
    print '$(document).ready(function () {
		  $("#selectcountry_id").change(function() {
			document.form_index.action.value="updateedit";
			document.form_index.submit();
		  });
	  });';
    print '</script>' . "\n";
}

print '<form enctype="multipart/form-data" method="POST" action="' . $_SERVER["PHP_SELF"] . '" name="form_index">';
print '<input type="hidden" name="token" value="' . newToken() . '">';
print '<input type="hidden" name="action" value="update">';

print '<table class="noborder centpercent editmode">';
print '<tr class="liste_titre"><th class="titlefieldcreate wordbreak">' . $langs->trans("CompanyInfo") . '</th><th>' . $langs->trans("Value") . '</th></tr>' . "\n";

// Name
print '<tr class="oddeven"><td class="fieldrequired wordbreak"><label for="name">' . $langs->trans("CompanyName") . '</label></td><td>';
print '<input name="nom" id="name" class="minwidth200" value="' . dol_escape_htmltag((GETPOSTISSET('nom') ? GETPOST('nom', 'nohtml') : (!empty($conf->global->MAIN_INFO_SOCIETE_NOM) ? $conf->global->MAIN_INFO_SOCIETE_NOM : ''))) . '"' . (empty($conf->global->MAIN_INFO_SOCIETE_NOM) ? ' autofocus="autofocus"' : '') . '></td></tr>' . "\n";

// Address
print '<tr class="oddeven"><td><label for="MAIN_INFO_SOCIETE_ADDRESS">' . $langs->trans("CompanyAddress") . '</label></td><td>';
print '<textarea name="MAIN_INFO_SOCIETE_ADDRESS" id="MAIN_INFO_SOCIETE_ADDRESS" class="quatrevingtpercent" rows="' . ROWS_3 . '">' . (GETPOSTISSET('MAIN_INFO_SOCIETE_ADDRESS') ? GETPOST('MAIN_INFO_SOCIETE_ADDRESS', 'nohtml') : (!empty($conf->global->MAIN_INFO_SOCIETE_ADDRESS) ? $conf->global->MAIN_INFO_SOCIETE_ADDRESS : '')) . '</textarea></td></tr>' . "\n";

// Zip
print '<tr class="oddeven"><td><label for="MAIN_INFO_SOCIETE_ZIP">' . $langs->trans("CompanyZip") . '</label></td><td>';
print '<input class="width100" name="MAIN_INFO_SOCIETE_ZIP" id="MAIN_INFO_SOCIETE_ZIP" value="' . dol_escape_htmltag((GETPOSTISSET('MAIN_INFO_SOCIETE_ZIP') ? GETPOST('MAIN_INFO_SOCIETE_ZIP', 'alpha') : (!empty($conf->global->MAIN_INFO_SOCIETE_ZIP) ? $conf->global->MAIN_INFO_SOCIETE_ZIP : ''))) . '"></td></tr>' . "\n";

print '<tr class="oddeven"><td><label for="MAIN_INFO_SOCIETE_TOWN">' . $langs->trans("CompanyTown") . '</label></td><td>';
print '<input name="MAIN_INFO_SOCIETE_TOWN" class="minwidth200" id="MAIN_INFO_SOCIETE_TOWN" value="' . dol_escape_htmltag((GETPOSTISSET('MAIN_INFO_SOCIETE_TOWN') ? GETPOST('MAIN_INFO_SOCIETE_TOWN', 'nohtml') : (!empty($conf->global->MAIN_INFO_SOCIETE_TOWN) ? $conf->global->MAIN_INFO_SOCIETE_TOWN : ''))) . '"></td></tr>' . "\n";

// Country
print '<tr class="oddeven"><td class="fieldrequired"><label for="selectcountry_id">' . $langs->trans("Country") . '</label></td><td class="maxwidthonsmartphone">';
print img_picto('', 'globe-americas', 'class="pictofixedwidth"');
print $form->select_country($mysoc->country_id, 'country_id', '', 0);
if ($user->admin) {
    print info_admin($langs->trans("YouCanChangeValuesForThisListFromDictionarySetup"), 1);
}
print '</td></tr>' . "\n";

print '<tr class="oddeven"><td><label for="state_id">' . $langs->trans("State") . '</label></td><td class="maxwidthonsmartphone">';
$state_id = 0;
if (!empty($conf->global->MAIN_INFO_SOCIETE_STATE)) {
    $tmp = explode(':', $conf->global->MAIN_INFO_SOCIETE_STATE);
    $state_id = $tmp[0];
}
print img_picto('', 'state', 'class="pictofixedwidth"');
print $formcompany->select_state($state_id, $mysoc->country_code, 'state_id');
print '</td></tr>' . "\n";

// Currency
print '<tr class="oddeven"><td><label for="currency">' . $langs->trans("CompanyCurrency") . '</label></td><td>';
print img_picto('', 'multicurrency', 'class="pictofixedwidth"');
print $form->selectCurrency($conf->currency, "currency");
print '</td></tr>' . "\n";

// Phone
print '<tr class="oddeven"><td><label for="phone">' . $langs->trans("Phone") . '</label></td><td>';
print img_picto('', 'object_phoning', '', false, 0, 0, '', 'pictofixedwidth');
print '<input class="maxwidth150 widthcentpercentminusx" name="tel" id="phone" value="' . dol_escape_htmltag((GETPOSTISSET('tel') ? GETPOST('tel', 'alphanohtml') : (!empty($conf->global->MAIN_INFO_SOCIETE_TEL) ? $conf->global->MAIN_INFO_SOCIETE_TEL : ''))) . '"></td></tr>';
print '</td></tr>' . "\n";

// Fax
print '<tr class="oddeven"><td><label for="fax">' . $langs->trans("Fax") . '</label></td><td>';
print img_picto('', 'object_phoning_fax', '', false, 0, 0, '', 'pictofixedwidth');
print '<input class="maxwidth150" name="fax" id="fax" value="' . dol_escape_htmltag((GETPOSTISSET('fax') ? GETPOST('fax', 'alphanohtml') : (!empty($conf->global->MAIN_INFO_SOCIETE_FAX) ? $conf->global->MAIN_INFO_SOCIETE_FAX : ''))) . '"></td></tr>';
print '</td></tr>' . "\n";

// Email
print '<tr class="oddeven"><td><label for="email">' . $langs->trans("EMail") . '</label></td><td>';
print img_picto('', 'object_email', '', false, 0, 0, '', 'pictofixedwidth');
print '<input class="maxwidth150" name="mail" id="email" value="' . dol_escape_htmltag((GETPOSTISSET('mail') ? GETPOST('mail', 'alphanohtml') : (!empty($conf->global->MAIN_INFO_SOCIETE_MAIL) ? $conf->global->MAIN_INFO_SOCIETE_MAIL : ''))) . '"></td></tr>';
print '</td></tr>' . "\n";

// Web
print '<tr class="oddeven"><td><label for="web">' . $langs->trans("Web") . '</label></td><td>';
print img_picto('', 'globe', '', false, 0, 0, '', 'pictofixedwidth');
print '<input class="maxwidth300 widthcentpercentminusx" name="web" id="web" value="' . dol_escape_htmltag((GETPOSTISSET('web') ? GETPOST('web', 'alphanohtml') : (!empty($conf->global->MAIN_INFO_SOCIETE_WEB) ? $conf->global->MAIN_INFO_SOCIETE_WEB : ''))) . '"></td></tr>';
print '</td></tr>' . "\n";

// Barcode
if (!empty($conf->barcode->enabled)) {
    print '<tr class="oddeven"><td>';
    print '<label for="barcode">' . $langs->trans("Gencod") . '</label></td><td>';
    print '<span class="fa fa-barcode pictofixedwidth"></span>';
    print '<input name="barcode" id="barcode" class="minwidth150 widthcentpercentminusx maxwidth300" value="' . dol_escape_htmltag((GETPOSTISSET('barcode') ? GETPOST('barcode', 'alphanohtml') : (!empty($conf->global->MAIN_INFO_SOCIETE_GENCODE) ? $conf->global->MAIN_INFO_SOCIETE_GENCODE : ''))) . '"></td></tr>';
    print '</td></tr>';
}

// Logo
print '<tr class="oddeven"><td><label for="logo">' . $form->textwithpicto($langs->trans("Logo"), 'png, jpg') . '</label></td><td>';
print '<div class="centpercent nobordernopadding valignmiddle "><div class="inline-block marginrightonly">';
print '<input type="file" class="flat minwidth100 maxwidthinputfileonsmartphone" name="logo" id="logo" accept="image/*">';
print '</div>';
if (!empty($mysoc->logo_small)) {
    if (file_exists($conf->mycompany->dir_output . '/logos/thumbs/' . $mysoc->logo_small)) {
        print '<div class="inline-block valignmiddle">';
        print '<img style="max-height: 80px; max-width: 200px;" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/thumbs/' . $mysoc->logo_small) . '">';
        print '</div>';
    } elseif (!empty($mysoc->logo)) {
        if (!file_exists($conf->mycompany->dir_output . '/logos/thumbs/' . $mysoc->logo_mini)) {
            $imgThumbMini = vignette($conf->mycompany->dir_output . '/logos/' . $mysoc->logo, $maxwidthmini, $maxheightmini, '_mini', $quality);
        }
        $imgThumbSmall = vignette($conf->mycompany->dir_output . '/logos/' . $mysoc->logo, $maxwidthmini, $maxheightmini, '_small', $quality);
        print '<div class="inline-block valignmiddle">';
        print '<img style="max-height: 80px; max-width: 200px;" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/thumbs/' . basename($imgThumbSmall)) . '">';
        print '</div>';
    }
    print '<div class="inline-block valignmiddle marginrightonly">';
    print '<a class="reposition" href="' . $_SERVER["PHP_SELF"] . '?action=removelogo">' . img_delete($langs->trans("Delete"), '', 'marginleftonly') . '</a>';
    print '</div>';
} elseif (!empty($mysoc->logo)) {
    if (file_exists($conf->mycompany->dir_output . '/logos/' . $mysoc->logo)) {
        print '<div class="inline-block valignmiddle">';
        print '<img style="max-height: 80px" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/' . $mysoc->logo) . '">';
        print '</div>';
        print '<div class="inline-block valignmiddle marginrightonly"><a class="reposition" href="' . $_SERVER["PHP_SELF"] . '?action=removelogo">' . img_delete($langs->trans("Delete"), '', 'marginleftonly') . '</a></div>';
    } else {
        print '<div class="inline-block valignmiddle">';
        print '<img height="80" src="' . DOL_URL_ROOT . '/public/theme/common/nophoto.png">';
        print '</div>';
    }
}
print '</div>';
print '</td></tr>';

// Logo (squarred)
print '<tr class="oddeven"><td><label for="logo_squarred">' . $form->textwithpicto($langs->trans("LogoSquarred"), 'png, jpg') . '</label></td><td>';
print '<div class="centpercent nobordernopadding valignmiddle"><div class="inline-block marginrightonly">';
print '<input type="file" class="flat minwidth100 maxwidthinputfileonsmartphone" name="logo_squarred" id="logo_squarred" accept="image/*">';
print '</div>';
if (!empty($mysoc->logo_squarred_small)) {
    if (file_exists($conf->mycompany->dir_output . '/logos/thumbs/' . $mysoc->logo_squarred_small)) {
        print '<div class="inline-block valignmiddle marginrightonly">';
        print '<img style="max-height: 80px" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/thumbs/' . $mysoc->logo_squarred_small) . '">';
        print '</div>';
    } elseif (!empty($mysoc->logo_squarred)) {
        if (!file_exists($conf->mycompany->dir_output . '/logos/thumbs/' . $mysoc->logo_squarred_mini)) {
            $imgThumbMini = vignette($conf->mycompany->dir_output . '/logos/' . $mysoc->logo_squarred, $maxwidthmini, $maxheightmini, '_mini', $quality);
        }
        $imgThumbSmall = vignette($conf->mycompany->dir_output . '/logos/' . $mysoc->logo_squarred, $maxwidthmini, $maxheightmini, '_small', $quality);
        print '<div class="inline-block valignmiddle">';
        print '<img style="max-height: 80px" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/thumbs/' . basename($imgThumbSmall)) . '">';
        print '</div>';
    }
    print '<div class="inline-block valignmiddle marginrightonly"><a class="reposition" href="' . $_SERVER["PHP_SELF"] . '?action=removelogosquarred">' . img_delete($langs->trans("Delete"), '', 'marginleftonly') . '</a></div>';
} elseif (!empty($mysoc->logo_squarred)) {
    if (file_exists($conf->mycompany->dir_output . '/logos/' . $mysoc->logo_squarred)) {
        print '<div class="inline-block valignmiddle">';
        print '<img style="max-height: 80px" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/' . $mysoc->logo_squarred) . '">';
        print '</div>';
        print '<div class="inline-block valignmiddle marginrightonly"><a class="reposition" href="' . $_SERVER["PHP_SELF"] . '?action=removelogosquarred">' . img_delete($langs->trans("Delete"), '', 'marginleftonly') . '</a></div>';
    } else {
        print '<div class="inline-block valignmiddle">';
        print '<img height="80" src="' . DOL_URL_ROOT . '/public/theme/common/nophoto.png">';
        print '</div>';
    }
}
print '</div>';
print '</td></tr>';

// Note
print '<tr class="oddeven"><td class="tdtop"><label for="note">' . $langs->trans("Note") . '</label></td><td>';
print '<textarea class="flat quatrevingtpercent" name="note" id="note" rows="' . ROWS_5 . '">' . (GETPOSTISSET('note') ? GETPOST('note', 'restricthtml') : (!empty($conf->global->MAIN_INFO_SOCIETE_NOTE) ? $conf->global->MAIN_INFO_SOCIETE_NOTE : '')) . '</textarea></td></tr>';
print '</td></tr>';

print '</table>';

print '<br>';

// IDs of the company (country-specific)
print '<div class="div-table-responsive-no-min">';
print '<table class="noborder centpercent editmode">';
print '<tr class="liste_titre"><td class="titlefieldcreate wordbreak">' . $langs->trans("CompanyIds") . '</td><td>' . $langs->trans("Value") . '</td></tr>';

$langs->load("companies");

// Managing Director(s)
print '<tr class="oddeven"><td><label for="director">' . $langs->trans("ManagingDirectors") . '</label></td><td>';
print '<input name="MAIN_INFO_SOCIETE_MANAGERS" id="directors" class="minwidth300" value="' . dol_escape_htmltag((GETPOSTISSET('MAIN_INFO_SOCIETE_MANAGERS') ? GETPOST('MAIN_INFO_SOCIETE_MANAGERS', 'nohtml') : (!empty($conf->global->MAIN_INFO_SOCIETE_MANAGERS) ? $conf->global->MAIN_INFO_SOCIETE_MANAGERS : ''))) . '"></td></tr>';

// GDPR contact
print '<tr class="oddeven"><td>';
print $form->textwithpicto($langs->trans("GDPRContact"), $langs->trans("GDPRContactDesc"));
print '</td><td>';
print '<input name="MAIN_INFO_GDPR" id="infodirector" class="minwidth300" value="' . dol_escape_htmltag((GETPOSTISSET("MAIN_INFO_GDPR") ? GETPOST("MAIN_INFO_GDPR", 'nohtml') : (!empty($conf->global->MAIN_INFO_GDPR) ? $conf->global->MAIN_INFO_GDPR : ''))) . '"></td></tr>';

// Capital
print '<tr class="oddeven"><td><label for="capital">' . $langs->trans("Capital") . '</label></td><td>';
print '<input name="capital" id="capital" class="maxwidth100" value="' . dol_escape_htmltag((GETPOSTISSET('capital') ? GETPOST('capital', 'nohtml') : (!empty($conf->global->MAIN_INFO_CAPITAL) ? $conf->global->MAIN_INFO_CAPITAL : ''))) . '"></td></tr>';

// Juridical Status
print '<tr class="oddeven"><td><label for="forme_juridique_code">' . $langs->trans("JuridicalStatus") . '</label></td><td>';
if ($mysoc->country_code) {
    print $formcompany->select_juridicalstatus($conf->global->MAIN_INFO_SOCIETE_FORME_JURIDIQUE, $mysoc->country_code, '', 'forme_juridique_code');
} else {
    print $countrynotdefined;
}
print '</td></tr>';

// ProfId1
if ($langs->transcountry("ProfId1", $mysoc->country_code) != '-') {
    print '<tr class="oddeven"><td><label for="profid1">' . $langs->transcountry("ProfId1", $mysoc->country_code) . '</label></td><td>';
    if (!empty($mysoc->country_code)) {
        print '<input name="siren" id="profid1" class="minwidth200" value="' . dol_escape_htmltag(!empty($conf->global->MAIN_INFO_SIREN) ? $conf->global->MAIN_INFO_SIREN : '') . '">';
    } else {
        print $countrynotdefined;
    }
    print '</td></tr>';
}

// ProfId2
if ($langs->transcountry("ProfId2", $mysoc->country_code) != '-') {
    print '<tr class="oddeven"><td><label for="profid2">' . $langs->transcountry("ProfId2", $mysoc->country_code) . '</label></td><td>';
    if (!empty($mysoc->country_code)) {
        print '<input name="siret" id="profid2" class="minwidth200" value="' . dol_escape_htmltag(!empty($conf->global->MAIN_INFO_SIRET) ? $conf->global->MAIN_INFO_SIRET : '') . '">';
    } else {
        print $countrynotdefined;
    }
    print '</td></tr>';
}

// ProfId3
if ($langs->transcountry("ProfId3", $mysoc->country_code) != '-') {
    print '<tr class="oddeven"><td><label for="profid3">' . $langs->transcountry("ProfId3", $mysoc->country_code) . '</label></td><td>';
    if (!empty($mysoc->country_code)) {
        print '<input name="ape" id="profid3" class="minwidth200" value="' . dol_escape_htmltag(!empty($conf->global->MAIN_INFO_APE) ? $conf->global->MAIN_INFO_APE : '') . '">';
    } else {
        print $countrynotdefined;
    }
    print '</td></tr>';
}

// ProfId4
if ($langs->transcountry("ProfId4", $mysoc->country_code) != '-') {
    print '<tr class="oddeven"><td><label for="profid4">' . $langs->transcountry("ProfId4", $mysoc->country_code) . '</label></td><td>';
    if (!empty($mysoc->country_code)) {
        print '<input name="rcs" id="profid4" class="minwidth200" value="' . dol_escape_htmltag(!empty($conf->global->MAIN_INFO_RCS) ? $conf->global->MAIN_INFO_RCS : '') . '">';
    } else {
        print $countrynotdefined;
    }
    print '</td></tr>';
}

// ProfId5
if ($langs->transcountry("ProfId5", $mysoc->country_code) != '-') {
    print '<tr class="oddeven"><td><label for="profid5">' . $langs->transcountry("ProfId5", $mysoc->country_code) . '</label></td><td>';
    if (!empty($mysoc->country_code)) {
        print '<input name="MAIN_INFO_PROFID5" id="profid5" class="minwidth200" value="' . dol_escape_htmltag(!empty($conf->global->MAIN_INFO_PROFID5) ? $conf->global->MAIN_INFO_PROFID5 : '') . '">';
    } else {
        print $countrynotdefined;
    }
    print '</td></tr>';
}

// ProfId6
if ($langs->transcountry("ProfId6", $mysoc->country_code) != '-') {
    print '<tr class="oddeven"><td><label for="profid6">' . $langs->transcountry("ProfId6", $mysoc->country_code) . '</label></td><td>';
    if (!empty($mysoc->country_code)) {
        print '<input name="MAIN_INFO_PROFID6" id="profid6" class="minwidth200" value="' . dol_escape_htmltag(!empty($conf->global->MAIN_INFO_PROFID6) ? $conf->global->MAIN_INFO_PROFID6 : '') . '">';
    } else {
        print $countrynotdefined;
    }
    print '</td></tr>';
}

// Intra-community VAT number
print '<tr class="oddeven"><td><label for="intra_vat">' . $langs->trans("VATIntra") . '</label></td><td>';
print '<input name="tva" id="intra_vat" class="minwidth200" value="' . dol_escape_htmltag(!empty($conf->global->MAIN_INFO_TVAINTRA) ? $conf->global->MAIN_INFO_TVAINTRA : '') . '">';
print '</td></tr>';

// Object of the company
print '<tr class="oddeven"><td><label for="object">' . $langs->trans("CompanyObject") . '</label></td><td>';
print '<textarea class="flat quatrevingtpercent" name="object" id="object" rows="' . ROWS_5 . '">' . (!empty($conf->global->MAIN_INFO_SOCIETE_OBJECT) ? $conf->global->MAIN_INFO_SOCIETE_OBJECT : '') . '</textarea></td></tr>';
print '</td></tr>';

print '</table>';
print '</div>';

// Fiscal year start
print '<br>';
print '<table class="noborder centpercent editmode">';
print '<tr class="liste_titre">';
print '<td class="titlefieldcreate">' . $langs->trans("FiscalYearInformation") . '</td><td>' . $langs->trans("Value") . '</td>';
print "</tr>\n";

print '<tr class="oddeven"><td><label for="SOCIETE_FISCAL_MONTH_START">' . $langs->trans("FiscalMonthStart") . '</label></td><td>';
print $formother->select_month(!empty($conf->global->SOCIETE_FISCAL_MONTH_START) ? $conf->global->SOCIETE_FISCAL_MONTH_START : '', 'SOCIETE_FISCAL_MONTH_START', 0, 1, 'maxwidth100') . '</td></tr>';

print "</table>";
print '<br>';

// Sales taxes (VAT, IRPF, ...)
print load_fiche_titre($langs->trans("TypeOfSaleTaxes"), '', 'object_payment');

print '<table class="noborder centpercent editmode">';
print '<tr class="liste_titre">';
print '<td class="titlefieldcreate">' . $langs->trans("VATManagement") . '</td><td>' . $langs->trans("Description") . '</td>';
print '<td class="right">&nbsp;</td>';
print "</tr>\n";

// Main tax
print '<tr class="oddeven"><td><label><input type="radio" name="optiontva" id="use_vat" value="1"' . (empty($conf->global->FACTURE_TVAOPTION) ? "" : " checked") . "> " . $langs->trans("VATIsUsed") . "</label></td>";
print '<td colspan="2">';
$tooltiphelp = '';
if ($mysoc->country_code == 'FR') {
    $tooltiphelp = '<i>' . $langs->trans("Example") . ': ' . $langs->trans("VATIsUsedExampleFR") . "</i>";
}
print '<label for="use_vat">' . $form->textwithpicto($langs->trans("VATIsUsedDesc"), $tooltiphelp) . "</label>";
print "</td></tr>\n";

print '<tr class="oddeven"><td width="140"><label><input type="radio" name="optiontva" id="no_vat" value="0"' . (empty($conf->global->FACTURE_TVAOPTION) ? " checked" : "") . "> " . $langs->trans("VATIsNotUsed") . "</label></td>";
print '<td colspan="2">';
$tooltiphelp = '';
if ($mysoc->country_code == 'FR') {
    $tooltiphelp = "<i>" . $langs->trans("Example") . ': ' . $langs->trans("VATIsNotUsedExampleFR") . "</i>\n";
}
print '<label for="no_vat">' . $form->textwithpicto($langs->trans("VATIsNotUsedDesc"), $tooltiphelp) . "</label>";
print "</td></tr>\n";

print "</table>";

// Second tax
print '<br>';
print '<table class="noborder centpercent editmode">';
print '<tr class="liste_titre">';
print '<td class="titlefieldcreate">' . $form->textwithpicto($langs->transcountry("LocalTax1Management", $mysoc->country_code), $langs->transcountry("LocalTax1IsUsedDesc", $mysoc->country_code)) . '</td><td>' . $langs->trans("Description") . '</td>';
print '<td class="right">&nbsp;</td>';
print "</tr>\n";

if ($mysoc->useLocalTax(1)) {
    // Note: When option is not set, it must not appears as set on on, because there is no default value for this option
    print '<tr class="oddeven"><td><input type="radio" name="optionlocaltax1" id="lt1" value="localtax1on"' . (($conf->global->FACTURE_LOCAL_TAX1_OPTION == '1' || $conf->global->FACTURE_LOCAL_TAX1_OPTION == "localtax1on") ? " checked" : "") . '> <label for="lt1">' . $langs->transcountry("LocalTax1IsUsed", $mysoc->country_code) . "</label></td>";
    print '<td colspan="2">';
    print '<div class="nobordernopadding">';
    $tooltiphelp = $langs->transcountry("LocalTax1IsUsedExample", $mysoc->country_code);
    $tooltiphelp = ($tooltiphelp != "LocalTax1IsUsedExample" ? "<i>" . $langs->trans("Example") . ': ' . $langs->transcountry("LocalTax1IsUsedExample", $mysoc->country_code) . "</i>\n" : "");
    print $form->textwithpicto($langs->transcountry("LocalTax1IsUsedDesc", $mysoc->country_code), $tooltiphelp);
    if (!isOnlyOneLocalTax(1)) {
        print '<br><label for="lt1">' . $langs->trans("LTRate") . '</label>: ';
        $formcompany->select_localtax(1, $conf->global->MAIN_INFO_VALUE_LOCALTAX1, "lt1");
    }

    $opcions = [$langs->trans("CalcLocaltax1") . ' ' . $langs->trans("CalcLocaltax1Desc"), $langs->trans("CalcLocaltax2") . ' - ' . $langs->trans("CalcLocaltax2Desc"), $langs->trans("CalcLocaltax3") . ' - ' . $langs->trans("CalcLocaltax3Desc")];

    print '<br><label for="clt1">' . $langs->trans("CalcLocaltax") . '</label>: ';
    print $form->selectarray("clt1", $opcions, $conf->global->MAIN_INFO_LOCALTAX_CALC1);
    print "</div>";
    print "</td></tr>\n";

    print '<tr class="oddeven"><td><input type="radio" name="optionlocaltax1" id="nolt1" value="localtax1off"' . ((empty($conf->global->FACTURE_LOCAL_TAX1_OPTION) || $conf->global->FACTURE_LOCAL_TAX1_OPTION == "localtax1off") ? " checked" : "") . '> <label for="nolt1">' . $langs->transcountry("LocalTax1IsNotUsed", $mysoc->country_code) . "</label></td>";
    print '<td colspan="2">';
    $tooltiphelp = $langs->transcountry("LocalTax1IsNotUsedExample", $mysoc->country_code);
    $tooltiphelp = ($tooltiphelp != "LocalTax1IsNotUsedExample" ? "<i>" . $langs->trans("Example") . ': ' . $langs->transcountry("LocalTax1IsNotUsedExample", $mysoc->country_code) . "</i>\n" : "");
    print $form->textwithpicto($langs->transcountry("LocalTax1IsNotUsedDesc", $mysoc->country_code), $tooltiphelp);
    print "</td></tr>\n";
} else {
    if (empty($mysoc->country_code)) {
        print '<tr class="oddeven nohover"><td class="">' . $countrynotdefined . '</td><td></td><td></td></tr>';
    } else {
        print '<tr class="oddeven nohover"><td class="" colspan="3"><span class="opacitymedium">' . $langs->trans("NoLocalTaxXForThisCountry", $langs->transnoentitiesnoconv("Setup"), $langs->transnoentitiesnoconv("Dictionaries"), $langs->transnoentitiesnoconv("DictionaryVAT"), $langs->transnoentitiesnoconv("LocalTax1Management")) . '</span></td></tr>';
    }
}

print "</table>";

// Third tax system
print '<br>';
print '<table class="noborder centpercent editmode">';
print '<tr class="liste_titre">';
print '<td class="titlefieldcreate">' . $form->textwithpicto($langs->transcountry("LocalTax2Management", $mysoc->country_code), $langs->transcountry("LocalTax2IsUsedDesc", $mysoc->country_code)) . '</td><td>' . $langs->trans("Description") . '</td>';
print '<td class="right">&nbsp;</td>';
print "</tr>\n";

if ($mysoc->useLocalTax(2)) {
    // Note: When option is not set, it must not appears as set on on, because there is no default value for this option
    print '<tr class="oddeven"><td><input type="radio" name="optionlocaltax2" id="lt2" value="localtax2on"' . (($conf->global->FACTURE_LOCAL_TAX2_OPTION == '1' || $conf->global->FACTURE_LOCAL_TAX2_OPTION == "localtax2on") ? " checked" : "") . '> <label for="lt2">' . $langs->transcountry("LocalTax2IsUsed", $mysoc->country_code) . "</label></td>";
    print '<td colspan="2">';
    print '<div class="nobordernopadding">';
    print '<label for="lt2">' . $langs->transcountry("LocalTax2IsUsedDesc", $mysoc->country_code) . "</label>";
    $tooltiphelp = $langs->transcountry("LocalTax2IsUsedExample", $mysoc->country_code);
    $tooltiphelp = ($tooltiphelp != "LocalTax2IsUsedExample" ? "<i>" . $langs->trans("Example") . ': ' . $langs->transcountry("LocalTax2IsUsedExample", $mysoc->country_code) . "</i>\n" : "");
    if (!isOnlyOneLocalTax(2)) {
        print '<br><label for="lt2">' . $langs->trans("LTRate") . '</label>: ';
        $formcompany->select_localtax(2, $conf->global->MAIN_INFO_VALUE_LOCALTAX2, "lt2");
    }
    print '<br><label for="clt2">' . $langs->trans("CalcLocaltax") . '</label>: ';
    print $form->selectarray("clt2", $opcions, $conf->global->MAIN_INFO_LOCALTAX_CALC2);
    print "</div>";
    print "</td></tr>\n";

    print '<tr class="oddeven"><td><input type="radio" name="optionlocaltax2" id="nolt2" value="localtax2off"' . ((empty($conf->global->FACTURE_LOCAL_TAX2_OPTION) || $conf->global->FACTURE_LOCAL_TAX2_OPTION == "localtax2off") ? " checked" : "") . '> <label for="nolt2">' . $langs->transcountry("LocalTax2IsNotUsed", $mysoc->country_code) . "</label></td>";
    print '<td colspan="2">';
    print "<div>";
    $tooltiphelp = $langs->transcountry("LocalTax2IsNotUsedExample", $mysoc->country_code);
    $tooltiphelp = ($tooltiphelp != "LocalTax2IsNotUsedExample" ? "<i>" . $langs->trans("Example") . ': ' . $langs->transcountry("LocalTax2IsNotUsedExample", $mysoc->country_code) . "</i>\n" : "");
    print "<label for=\"nolt2\">" . $form->textwithpicto($langs->transcountry("LocalTax2IsNotUsedDesc", $mysoc->country_code), $tooltiphelp) . "</label>";
    print "</div>";
    print "</td></tr>\n";
} else {
    if (empty($mysoc->country_code)) {
        print '<tr class="oddeven nohover"><td class="">' . $countrynotdefined . '</td><td></td><td></td></tr>';
    } else {
        print '<tr class="oddeven nohover"><td class="" colspan="3"><span class="opacitymedium">' . $langs->trans("NoLocalTaxXForThisCountry", $langs->transnoentitiesnoconv("Setup"), $langs->transnoentitiesnoconv("Dictionaries"), $langs->transnoentitiesnoconv("DictionaryVAT"), $langs->transnoentitiesnoconv("LocalTax2Management")) . '</span></td></tr>';
    }
}

print "</table>";

// Tax stamp
print '<br>';
print '<table class="noborder centpercent editmode">';
print '<tr class="liste_titre">';
print '<td>' . $form->textwithpicto($langs->trans("RevenueStamp"), $langs->trans("RevenueStampDesc")) . '</td><td>' . $langs->trans("Description") . '</td>';
print '<td class="right">&nbsp;</td>';
print "</tr>\n";
if ($mysoc->useRevenueStamp()) {
    // Note: When option is not set, it must not appears as set on on, because there is no default value for this option
    print '<tr class="oddeven"><td>';
    print $langs->trans("UseRevenueStamp");
    print "</td>";
    print '<td colspan="2">';
    print $langs->trans("UseRevenueStampExample", $langs->transnoentitiesnoconv("Setup"), $langs->transnoentitiesnoconv("Dictionaries"), $langs->transnoentitiesnoconv("DictionaryRevenueStamp"));
    print "</td></tr>\n";
} else {
    if (empty($mysoc->country_code)) {
        print '<tr class="oddeven nohover"><td class="">' . $countrynotdefined . '</td><td></td><td></td></tr>';
    } else {
        print '<tr class="oddeven nohover"><td class="" colspan="3"><span class="opacitymedium">' . $langs->trans("NoLocalTaxXForThisCountry", $langs->transnoentitiesnoconv("Setup"), $langs->transnoentitiesnoconv("Dictionaries"), $langs->transnoentitiesnoconv("DictionaryRevenueStamp"), $langs->transnoentitiesnoconv("RevenueStamp")) . '</span></td></tr>';
    }
}

print "</table>";

print $form->buttonsSaveCancel("Save", '');

print '</form>';

// End of page
llxFooter();
$db->close();
