<?php
/*
 * View
 */

namespace Alxarafe\Modules\Admin\Views;

use Alxarafe\Dolibarr\Base\DolibarrView;
use Alxarafe\Dolibarr\Classes\Form;
use Alxarafe\Dolibarr\Classes\FormCompany;
use Alxarafe\Dolibarr\Classes\FormOther;
use Alxarafe\Dolibarr\Libraries\DolibarrAdmin;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;

class CompanyView extends DolibarrView
{
    function printPage(): string
    {
        $wikihelp = 'EN:First_setup|FR:Premiers_paramétrages|ES:Primeras_configuraciones';
        $this->llxHeader('', $this->langs->trans("Setup"), $wikihelp);

        $form = new Form();
        $formother = new FormOther();
        $formcompany = new FormCompany();

        $countrynotdefined = '<font class="error">' . $this->langs->trans("ErrorSetACountryFirst") . ' (' . $this->langs->trans("SeeAbove") . ')</font>';

        print DolibarrFunctions::load_fiche_titre($this->langs->trans("CompanyFoundation"), '', 'title_setup');

        $head = DolibarrAdmin::company_admin_prepare_head();

        print DolibarrFunctions::dol_get_fiche_head($head, 'company', $this->langs->trans("Company"), -1, 'company');

        print '<span class="opacitymedium">' . $this->langs->trans("CompanyFundationDesc", $this->langs->transnoentities("Save")) . "</span><br>\n";
        print "<br>\n";

        /**
         * Edit parameters
         */
        if (!empty($this->conf->use_javascript_ajax)) {
            print "\n" . '<script type="text/javascript" language="javascript">';
            print '$(document).ready(function () {
		  $("#selectcountry_id").change(function() {
			document.form_index.action.value="updateedit";
			document.form_index.submit();
		  });
	  });';
            print '</script>' . "\n";
        }

        $url = $_SERVER['PHP_SELF'] .
            '?' . self::MODULE_GET_VAR . '=' . $_GET[self::MODULE_GET_VAR] .
            '&' . self::CONTROLLER_GET_VAR . '=' . $_GET[self::CONTROLLER_GET_VAR];

        print '<form enctype="multipart/form-data" method="POST" action="' . $url . '" name="form_index">';
        print '<input type="hidden" name="token" value="' . DolibarrFunctions::newToken() . '">';
        print '<input type="hidden" name="action" value="update">';

        print '<table class="noborder centpercent editmode">';
        print '<tr class="liste_titre"><th class="titlefieldcreate wordbreak">' . $this->langs->trans("CompanyInfo") . '</th><th>' . $this->langs->trans("Value") . '</th></tr>' . "\n";

        // Name
        print '<tr class="oddeven"><td class="fieldrequired wordbreak"><label for="name">' . $this->langs->trans("CompanyName") . '</label></td><td>';
        print '<input name="nom" id="name" class="minwidth200" value="' . DolibarrFunctions::dol_escape_htmltag((DolibarrFunctions::GETPOSTISSET('nom') ? DolibarrFunctions::GETPOST('nom', 'nohtml') : (!empty($this->conf->global->MAIN_INFO_SOCIETE_NOM) ? $this->conf->global->MAIN_INFO_SOCIETE_NOM : ''))) . '"' . (empty($this->conf->global->MAIN_INFO_SOCIETE_NOM) ? ' autofocus="autofocus"' : '') . '></td></tr>' . "\n";

        // Address
        print '<tr class="oddeven"><td><label for="MAIN_INFO_SOCIETE_ADDRESS">' . $this->langs->trans("CompanyAddress") . '</label></td><td>';
        print '<textarea name="MAIN_INFO_SOCIETE_ADDRESS" id="MAIN_INFO_SOCIETE_ADDRESS" class="quatrevingtpercent" rows="' . ROWS_3 . '">' . (DolibarrFunctions::GETPOSTISSET('MAIN_INFO_SOCIETE_ADDRESS') ? DolibarrFunctions::GETPOST('MAIN_INFO_SOCIETE_ADDRESS', 'nohtml') : (!empty($this->conf->global->MAIN_INFO_SOCIETE_ADDRESS) ? $this->conf->global->MAIN_INFO_SOCIETE_ADDRESS : '')) . '</textarea></td></tr>' . "\n";

        // Zip
        print '<tr class="oddeven"><td><label for="MAIN_INFO_SOCIETE_ZIP">' . $this->langs->trans("CompanyZip") . '</label></td><td>';
        print '<input class="width100" name="MAIN_INFO_SOCIETE_ZIP" id="MAIN_INFO_SOCIETE_ZIP" value="' . DolibarrFunctions::dol_escape_htmltag((DolibarrFunctions::GETPOSTISSET('MAIN_INFO_SOCIETE_ZIP') ? DolibarrFunctions::GETPOST('MAIN_INFO_SOCIETE_ZIP', 'alpha') : (!empty($this->conf->global->MAIN_INFO_SOCIETE_ZIP) ? $this->conf->global->MAIN_INFO_SOCIETE_ZIP : ''))) . '"></td></tr>' . "\n";

        print '<tr class="oddeven"><td><label for="MAIN_INFO_SOCIETE_TOWN">' . $this->langs->trans("CompanyTown") . '</label></td><td>';
        print '<input name="MAIN_INFO_SOCIETE_TOWN" class="minwidth200" id="MAIN_INFO_SOCIETE_TOWN" value="' . DolibarrFunctions::dol_escape_htmltag((DolibarrFunctions::GETPOSTISSET('MAIN_INFO_SOCIETE_TOWN') ? DolibarrFunctions::GETPOST('MAIN_INFO_SOCIETE_TOWN', 'nohtml') : (!empty($this->conf->global->MAIN_INFO_SOCIETE_TOWN) ? $this->conf->global->MAIN_INFO_SOCIETE_TOWN : ''))) . '"></td></tr>' . "\n";

        // Country
        print '<tr class="oddeven"><td class="fieldrequired"><label for="selectcountry_id">' . $this->langs->trans("Country") . '</label></td><td class="maxwidthonsmartphone">';
        print DolibarrFunctions::img_picto('', 'globe-americas', 'class="pictofixedwidth"');
        print $form->select_country($this->mysoc->country_id, 'country_id', '', 0);
        if ($this->user->admin) {
            print DolibarrFunctions::info_admin($this->langs->trans("YouCanChangeValuesForThisListFromDictionarySetup"), 1);
        }
        print '</td></tr>' . "\n";

        print '<tr class="oddeven"><td><label for="state_id">' . $this->langs->trans("State") . '</label></td><td class="maxwidthonsmartphone">';
        $state_id = 0;
        if (!empty($this->conf->global->MAIN_INFO_SOCIETE_STATE)) {
            $tmp = explode(':', $this->conf->global->MAIN_INFO_SOCIETE_STATE);
            $state_id = $tmp[0];
        }
        print DolibarrFunctions::img_picto('', 'state', 'class="pictofixedwidth"');
        print $formcompany->select_state($state_id, $this->mysoc->country_code, 'state_id');
        print '</td></tr>' . "\n";

        // Currency
        print '<tr class="oddeven"><td><label for="currency">' . $this->langs->trans("CompanyCurrency") . '</label></td><td>';
        print DolibarrFunctions::img_picto('', 'multicurrency', 'class="pictofixedwidth"');
        print $form->selectCurrency($this->conf->currency, "currency");
        print '</td></tr>' . "\n";

        // Phone
        print '<tr class="oddeven"><td><label for="phone">' . $this->langs->trans("Phone") . '</label></td><td>';
        print DolibarrFunctions::img_picto('', 'object_phoning', '', false, 0, 0, '', 'pictofixedwidth');
        print '<input class="maxwidth150 widthcentpercentminusx" name="tel" id="phone" value="' . DolibarrFunctions::dol_escape_htmltag((DolibarrFunctions::GETPOSTISSET('tel') ? DolibarrFunctions::GETPOST('tel', 'alphanohtml') : (!empty($this->conf->global->MAIN_INFO_SOCIETE_TEL) ? $this->conf->global->MAIN_INFO_SOCIETE_TEL : ''))) . '"></td></tr>';
        print '</td></tr>' . "\n";

        // Fax
        print '<tr class="oddeven"><td><label for="fax">' . $this->langs->trans("Fax") . '</label></td><td>';
        print DolibarrFunctions::img_picto('', 'object_phoning_fax', '', false, 0, 0, '', 'pictofixedwidth');
        print '<input class="maxwidth150" name="fax" id="fax" value="' . DolibarrFunctions::dol_escape_htmltag((DolibarrFunctions::GETPOSTISSET('fax') ? DolibarrFunctions::GETPOST('fax', 'alphanohtml') : (!empty($this->conf->global->MAIN_INFO_SOCIETE_FAX) ? $this->conf->global->MAIN_INFO_SOCIETE_FAX : ''))) . '"></td></tr>';
        print '</td></tr>' . "\n";

        // Email
        print '<tr class="oddeven"><td><label for="email">' . $this->langs->trans("EMail") . '</label></td><td>';
        print DolibarrFunctions::img_picto('', 'object_email', '', false, 0, 0, '', 'pictofixedwidth');
        print '<input class="maxwidth150" name="mail" id="email" value="' . DolibarrFunctions::dol_escape_htmltag((DolibarrFunctions::GETPOSTISSET('mail') ? DolibarrFunctions::GETPOST('mail', 'alphanohtml') : (!empty($this->conf->global->MAIN_INFO_SOCIETE_MAIL) ? $this->conf->global->MAIN_INFO_SOCIETE_MAIL : ''))) . '"></td></tr>';
        print '</td></tr>' . "\n";

        // Web
        print '<tr class="oddeven"><td><label for="web">' . $this->langs->trans("Web") . '</label></td><td>';
        print DolibarrFunctions::img_picto('', 'globe', '', false, 0, 0, '', 'pictofixedwidth');
        print '<input class="maxwidth300 widthcentpercentminusx" name="web" id="web" value="' . DolibarrFunctions::dol_escape_htmltag((DolibarrFunctions::GETPOSTISSET('web') ? DolibarrFunctions::GETPOST('web', 'alphanohtml') : (!empty($this->conf->global->MAIN_INFO_SOCIETE_WEB) ? $this->conf->global->MAIN_INFO_SOCIETE_WEB : ''))) . '"></td></tr>';
        print '</td></tr>' . "\n";

        // Barcode
        if (!empty($this->conf->barcode->enabled)) {
            print '<tr class="oddeven"><td>';
            print '<label for="barcode">' . $this->langs->trans("Gencod") . '</label></td><td>';
            print '<span class="fa fa-barcode pictofixedwidth"></span>';
            print '<input name="barcode" id="barcode" class="minwidth150 widthcentpercentminusx maxwidth300" value="' . DolibarrFunctions::dol_escape_htmltag((DolibarrFunctions::GETPOSTISSET('barcode') ? DolibarrFunctions::GETPOST('barcode', 'alphanohtml') : (!empty($this->conf->global->MAIN_INFO_SOCIETE_GENCODE) ? $this->conf->global->MAIN_INFO_SOCIETE_GENCODE : ''))) . '"></td></tr>';
            print '</td></tr>';
        }

        // Logo
        print '<tr class="oddeven"><td><label for="logo">' . $form->textwithpicto($this->langs->trans("Logo"), 'png, jpg') . '</label></td><td>';
        print '<div class="centpercent nobordernopadding valignmiddle "><div class="inline-block marginrightonly">';
        print '<input type="file" class="flat minwidth100 maxwidthinputfileonsmartphone" name="logo" id="logo" accept="image/*">';
        print '</div>';
        if (!empty($this->mysoc->logo_small)) {
            if (file_exists($this->conf->mycompany->dir_output . '/logos/thumbs/' . $this->mysoc->logo_small)) {
                print '<div class="inline-block valignmiddle">';
                print '<img style="max-height: 80px; max-width: 200px;" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/thumbs/' . $this->mysoc->logo_small) . '">';
                print '</div>';
            } elseif (!empty($this->mysoc->logo)) {
                if (!file_exists($this->conf->mycompany->dir_output . '/logos/thumbs/' . $this->mysoc->logo_mini)) {
                    $imgThumbMini = vignette($this->conf->mycompany->dir_output . '/logos/' . $this->mysoc->logo, $maxwidthmini, $maxheightmini, '_mini', $quality);
                }
                $imgThumbSmall = vignette($this->conf->mycompany->dir_output . '/logos/' . $this->mysoc->logo, $maxwidthmini, $maxheightmini, '_small', $quality);
                print '<div class="inline-block valignmiddle">';
                print '<img style="max-height: 80px; max-width: 200px;" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/thumbs/' . basename($imgThumbSmall)) . '">';
                print '</div>';
            }
            print '<div class="inline-block valignmiddle marginrightonly">';
            print '<a class="reposition" href="' . $_SERVER["PHP_SELF"] . '?action=removelogo">' . img_delete($this->langs->trans("Delete"), '', 'marginleftonly') . '</a>';
            print '</div>';
        } elseif (!empty($this->mysoc->logo)) {
            if (file_exists($this->conf->mycompany->dir_output . '/logos/' . $this->mysoc->logo)) {
                print '<div class="inline-block valignmiddle">';
                print '<img style="max-height: 80px" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/' . $this->mysoc->logo) . '">';
                print '</div>';
                print '<div class="inline-block valignmiddle marginrightonly"><a class="reposition" href="' . $_SERVER["PHP_SELF"] . '?action=removelogo">' . img_delete($this->langs->trans("Delete"), '', 'marginleftonly') . '</a></div>';
            } else {
                print '<div class="inline-block valignmiddle">';
                print '<img height="80" src="' . DOL_URL_ROOT . '/public/theme/common/nophoto.png">';
                print '</div>';
            }
        }
        print '</div>';
        print '</td></tr>';

        // Logo (squarred)
        print '<tr class="oddeven"><td><label for="logo_squarred">' . $form->textwithpicto($this->langs->trans("LogoSquarred"), 'png, jpg') . '</label></td><td>';
        print '<div class="centpercent nobordernopadding valignmiddle"><div class="inline-block marginrightonly">';
        print '<input type="file" class="flat minwidth100 maxwidthinputfileonsmartphone" name="logo_squarred" id="logo_squarred" accept="image/*">';
        print '</div>';
        if (!empty($this->mysoc->logo_squarred_small)) {
            if (file_exists($this->conf->mycompany->dir_output . '/logos/thumbs/' . $this->mysoc->logo_squarred_small)) {
                print '<div class="inline-block valignmiddle marginrightonly">';
                print '<img style="max-height: 80px" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/thumbs/' . $this->mysoc->logo_squarred_small) . '">';
                print '</div>';
            } elseif (!empty($this->mysoc->logo_squarred)) {
                if (!file_exists($this->conf->mycompany->dir_output . '/logos/thumbs/' . $this->mysoc->logo_squarred_mini)) {
                    $imgThumbMini = vignette($this->conf->mycompany->dir_output . '/logos/' . $this->mysoc->logo_squarred, $maxwidthmini, $maxheightmini, '_mini', $quality);
                }
                $imgThumbSmall = vignette($this->conf->mycompany->dir_output . '/logos/' . $this->mysoc->logo_squarred, $maxwidthmini, $maxheightmini, '_small', $quality);
                print '<div class="inline-block valignmiddle">';
                print '<img style="max-height: 80px" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/thumbs/' . basename($imgThumbSmall)) . '">';
                print '</div>';
            }
            print '<div class="inline-block valignmiddle marginrightonly"><a class="reposition" href="' . $_SERVER["PHP_SELF"] . '?action=removelogosquarred">' . img_delete($this->langs->trans("Delete"), '', 'marginleftonly') . '</a></div>';
        } elseif (!empty($this->mysoc->logo_squarred)) {
            if (file_exists($this->conf->mycompany->dir_output . '/logos/' . $this->mysoc->logo_squarred)) {
                print '<div class="inline-block valignmiddle">';
                print '<img style="max-height: 80px" src="' . DOL_URL_ROOT . '/viewimage.php?modulepart=mycompany&amp;file=' . urlencode('logos/' . $this->mysoc->logo_squarred) . '">';
                print '</div>';
                print '<div class="inline-block valignmiddle marginrightonly"><a class="reposition" href="' . $_SERVER["PHP_SELF"] . '?action=removelogosquarred">' . img_delete($this->langs->trans("Delete"), '', 'marginleftonly') . '</a></div>';
            } else {
                print '<div class="inline-block valignmiddle">';
                print '<img height="80" src="' . DOL_URL_ROOT . '/public/theme/common/nophoto.png">';
                print '</div>';
            }
        }
        print '</div>';
        print '</td></tr>';

        // Note
        print '<tr class="oddeven"><td class="tdtop"><label for="note">' . $this->langs->trans("Note") . '</label></td><td>';
        print '<textarea class="flat quatrevingtpercent" name="note" id="note" rows="' . ROWS_5 . '">' . (DolibarrFunctions::GETPOSTISSET('note') ? DolibarrFunctions::GETPOST('note', 'restricthtml') : (!empty($this->conf->global->MAIN_INFO_SOCIETE_NOTE) ? $this->conf->global->MAIN_INFO_SOCIETE_NOTE : '')) . '</textarea></td></tr>';
        print '</td></tr>';

        print '</table>';

        print '<br>';

        // IDs of the company (country-specific)
        print '<div class="div-table-responsive-no-min">';
        print '<table class="noborder centpercent editmode">';
        print '<tr class="liste_titre"><td class="titlefieldcreate wordbreak">' . $this->langs->trans("CompanyIds") . '</td><td>' . $this->langs->trans("Value") . '</td></tr>';

        $this->langs->load("companies");

        // Managing Director(s)
        print '<tr class="oddeven"><td><label for="director">' . $this->langs->trans("ManagingDirectors") . '</label></td><td>';
        print '<input name="MAIN_INFO_SOCIETE_MANAGERS" id="directors" class="minwidth300" value="' . DolibarrFunctions::dol_escape_htmltag((DolibarrFunctions::GETPOSTISSET('MAIN_INFO_SOCIETE_MANAGERS') ? DolibarrFunctions::GETPOST('MAIN_INFO_SOCIETE_MANAGERS', 'nohtml') : (!empty($this->conf->global->MAIN_INFO_SOCIETE_MANAGERS) ? $this->conf->global->MAIN_INFO_SOCIETE_MANAGERS : ''))) . '"></td></tr>';

        // GDPR contact
        print '<tr class="oddeven"><td>';
        print $form->textwithpicto($this->langs->trans("GDPRContact"), $this->langs->trans("GDPRContactDesc"));
        print '</td><td>';
        print '<input name="MAIN_INFO_GDPR" id="infodirector" class="minwidth300" value="' . DolibarrFunctions::dol_escape_htmltag((DolibarrFunctions::GETPOSTISSET("MAIN_INFO_GDPR") ? DolibarrFunctions::GETPOST("MAIN_INFO_GDPR", 'nohtml') : (!empty($this->conf->global->MAIN_INFO_GDPR) ? $this->conf->global->MAIN_INFO_GDPR : ''))) . '"></td></tr>';

        // Capital
        print '<tr class="oddeven"><td><label for="capital">' . $this->langs->trans("Capital") . '</label></td><td>';
        print '<input name="capital" id="capital" class="maxwidth100" value="' . DolibarrFunctions::dol_escape_htmltag((DolibarrFunctions::GETPOSTISSET('capital') ? DolibarrFunctions::GETPOST('capital', 'nohtml') : (!empty($this->conf->global->MAIN_INFO_CAPITAL) ? $this->conf->global->MAIN_INFO_CAPITAL : ''))) . '"></td></tr>';

        // Juridical Status
        print '<tr class="oddeven"><td><label for="forme_juridique_code">' . $this->langs->trans("JuridicalStatus") . '</label></td><td>';
        if ($this->mysoc->country_code) {
            print $formcompany->select_juridicalstatus($this->conf->global->MAIN_INFO_SOCIETE_FORME_JURIDIQUE, $this->mysoc->country_code, '', 'forme_juridique_code');
        } else {
            print $countrynotdefined;
        }
        print '</td></tr>';

        // ProfId1
        if ($this->langs->transcountry("ProfId1", $this->mysoc->country_code) != '-') {
            print '<tr class="oddeven"><td><label for="profid1">' . $this->langs->transcountry("ProfId1", $this->mysoc->country_code) . '</label></td><td>';
            if (!empty($this->mysoc->country_code)) {
                print '<input name="siren" id="profid1" class="minwidth200" value="' . DolibarrFunctions::dol_escape_htmltag(!empty($this->conf->global->MAIN_INFO_SIREN) ? $this->conf->global->MAIN_INFO_SIREN : '') . '">';
            } else {
                print $countrynotdefined;
            }
            print '</td></tr>';
        }

        // ProfId2
        if ($this->langs->transcountry("ProfId2", $this->mysoc->country_code) != '-') {
            print '<tr class="oddeven"><td><label for="profid2">' . $this->langs->transcountry("ProfId2", $this->mysoc->country_code) . '</label></td><td>';
            if (!empty($this->mysoc->country_code)) {
                print '<input name="siret" id="profid2" class="minwidth200" value="' . DolibarrFunctions::dol_escape_htmltag(!empty($this->conf->global->MAIN_INFO_SIRET) ? $this->conf->global->MAIN_INFO_SIRET : '') . '">';
            } else {
                print $countrynotdefined;
            }
            print '</td></tr>';
        }

        // ProfId3
        if ($this->langs->transcountry("ProfId3", $this->mysoc->country_code) != '-') {
            print '<tr class="oddeven"><td><label for="profid3">' . $this->langs->transcountry("ProfId3", $this->mysoc->country_code) . '</label></td><td>';
            if (!empty($this->mysoc->country_code)) {
                print '<input name="ape" id="profid3" class="minwidth200" value="' . DolibarrFunctions::dol_escape_htmltag(!empty($this->conf->global->MAIN_INFO_APE) ? $this->conf->global->MAIN_INFO_APE : '') . '">';
            } else {
                print $countrynotdefined;
            }
            print '</td></tr>';
        }

        // ProfId4
        if ($this->langs->transcountry("ProfId4", $this->mysoc->country_code) != '-') {
            print '<tr class="oddeven"><td><label for="profid4">' . $this->langs->transcountry("ProfId4", $this->mysoc->country_code) . '</label></td><td>';
            if (!empty($this->mysoc->country_code)) {
                print '<input name="rcs" id="profid4" class="minwidth200" value="' . DolibarrFunctions::dol_escape_htmltag(!empty($this->conf->global->MAIN_INFO_RCS) ? $this->conf->global->MAIN_INFO_RCS : '') . '">';
            } else {
                print $countrynotdefined;
            }
            print '</td></tr>';
        }

        // ProfId5
        if ($this->langs->transcountry("ProfId5", $this->mysoc->country_code) != '-') {
            print '<tr class="oddeven"><td><label for="profid5">' . $this->langs->transcountry("ProfId5", $this->mysoc->country_code) . '</label></td><td>';
            if (!empty($this->mysoc->country_code)) {
                print '<input name="MAIN_INFO_PROFID5" id="profid5" class="minwidth200" value="' . DolibarrFunctions::dol_escape_htmltag(!empty($this->conf->global->MAIN_INFO_PROFID5) ? $this->conf->global->MAIN_INFO_PROFID5 : '') . '">';
            } else {
                print $countrynotdefined;
            }
            print '</td></tr>';
        }

        // ProfId6
        if ($this->langs->transcountry("ProfId6", $this->mysoc->country_code) != '-') {
            print '<tr class="oddeven"><td><label for="profid6">' . $this->langs->transcountry("ProfId6", $this->mysoc->country_code) . '</label></td><td>';
            if (!empty($this->mysoc->country_code)) {
                print '<input name="MAIN_INFO_PROFID6" id="profid6" class="minwidth200" value="' . DolibarrFunctions::dol_escape_htmltag(!empty($this->conf->global->MAIN_INFO_PROFID6) ? $this->conf->global->MAIN_INFO_PROFID6 : '') . '">';
            } else {
                print $countrynotdefined;
            }
            print '</td></tr>';
        }

        // Intra-community VAT number
        print '<tr class="oddeven"><td><label for="intra_vat">' . $this->langs->trans("VATIntra") . '</label></td><td>';
        print '<input name="tva" id="intra_vat" class="minwidth200" value="' . DolibarrFunctions::dol_escape_htmltag(!empty($this->conf->global->MAIN_INFO_TVAINTRA) ? $this->conf->global->MAIN_INFO_TVAINTRA : '') . '">';
        print '</td></tr>';

        // Object of the company
        print '<tr class="oddeven"><td><label for="object">' . $this->langs->trans("CompanyObject") . '</label></td><td>';
        print '<textarea class="flat quatrevingtpercent" name="object" id="object" rows="' . ROWS_5 . '">' . (!empty($this->conf->global->MAIN_INFO_SOCIETE_OBJECT) ? $this->conf->global->MAIN_INFO_SOCIETE_OBJECT : '') . '</textarea></td></tr>';
        print '</td></tr>';

        print '</table>';
        print '</div>';

        // Fiscal year start
        print '<br>';
        print '<table class="noborder centpercent editmode">';
        print '<tr class="liste_titre">';
        print '<td class="titlefieldcreate">' . $this->langs->trans("FiscalYearInformation") . '</td><td>' . $this->langs->trans("Value") . '</td>';
        print "</tr>\n";

        print '<tr class="oddeven"><td><label for="SOCIETE_FISCAL_MONTH_START">' . $this->langs->trans("FiscalMonthStart") . '</label></td><td>';
        print $formother->select_month(!empty($this->conf->global->SOCIETE_FISCAL_MONTH_START) ? $this->conf->global->SOCIETE_FISCAL_MONTH_START : '', 'SOCIETE_FISCAL_MONTH_START', 0, 1, 'maxwidth100') . '</td></tr>';

        print "</table>";
        print '<br>';

        // Sales taxes (VAT, IRPF, ...)
        print DolibarrFunctions::load_fiche_titre($this->langs->trans("TypeOfSaleTaxes"), '', 'object_payment');

        print '<table class="noborder centpercent editmode">';
        print '<tr class="liste_titre">';
        print '<td class="titlefieldcreate">' . $this->langs->trans("VATManagement") . '</td><td>' . $this->langs->trans("Description") . '</td>';
        print '<td class="right">&nbsp;</td>';
        print "</tr>\n";

        // Main tax
        print '<tr class="oddeven"><td><label><input type="radio" name="optiontva" id="use_vat" value="1"' . (empty($this->conf->global->FACTURE_TVAOPTION) ? "" : " checked") . "> " . $this->langs->trans("VATIsUsed") . "</label></td>";
        print '<td colspan="2">';
        $tooltiphelp = '';
        if ($this->mysoc->country_code == 'FR') {
            $tooltiphelp = '<i>' . $this->langs->trans("Example") . ': ' . $this->langs->trans("VATIsUsedExampleFR") . "</i>";
        }
        print '<label for="use_vat">' . $form->textwithpicto($this->langs->trans("VATIsUsedDesc"), $tooltiphelp) . "</label>";
        print "</td></tr>\n";

        print '<tr class="oddeven"><td width="140"><label><input type="radio" name="optiontva" id="no_vat" value="0"' . (empty($this->conf->global->FACTURE_TVAOPTION) ? " checked" : "") . "> " . $this->langs->trans("VATIsNotUsed") . "</label></td>";
        print '<td colspan="2">';
        $tooltiphelp = '';
        if ($this->mysoc->country_code == 'FR') {
            $tooltiphelp = "<i>" . $this->langs->trans("Example") . ': ' . $this->langs->trans("VATIsNotUsedExampleFR") . "</i>\n";
        }
        print '<label for="no_vat">' . $form->textwithpicto($this->langs->trans("VATIsNotUsedDesc"), $tooltiphelp) . "</label>";
        print "</td></tr>\n";

        print "</table>";

        // Second tax
        print '<br>';
        print '<table class="noborder centpercent editmode">';
        print '<tr class="liste_titre">';
        print '<td class="titlefieldcreate">' . $form->textwithpicto($this->langs->transcountry("LocalTax1Management", $this->mysoc->country_code), $this->langs->transcountry("LocalTax1IsUsedDesc", $this->mysoc->country_code)) . '</td><td>' . $this->langs->trans("Description") . '</td>';
        print '<td class="right">&nbsp;</td>';
        print "</tr>\n";

        if ($this->mysoc->useLocalTax(1)) {
            // Note: When option is not set, it must not appears as set on on, because there is no default value for this option
            print '<tr class="oddeven"><td><input type="radio" name="optionlocaltax1" id="lt1" value="localtax1on"' . (($this->conf->global->FACTURE_LOCAL_TAX1_OPTION == '1' || $this->conf->global->FACTURE_LOCAL_TAX1_OPTION == "localtax1on") ? " checked" : "") . '> <label for="lt1">' . $this->langs->transcountry("LocalTax1IsUsed", $this->mysoc->country_code) . "</label></td>";
            print '<td colspan="2">';
            print '<div class="nobordernopadding">';
            $tooltiphelp = $this->langs->transcountry("LocalTax1IsUsedExample", $this->mysoc->country_code);
            $tooltiphelp = ($tooltiphelp != "LocalTax1IsUsedExample" ? "<i>" . $this->langs->trans("Example") . ': ' . $this->langs->transcountry("LocalTax1IsUsedExample", $this->mysoc->country_code) . "</i>\n" : "");
            print $form->textwithpicto($this->langs->transcountry("LocalTax1IsUsedDesc", $this->mysoc->country_code), $tooltiphelp);
            if (!DolibarrFunctions::isOnlyOneLocalTax(1)) {
                print '<br><label for="lt1">' . $this->langs->trans("LTRate") . '</label>: ';
                $formcompany->select_localtax(1, $this->conf->global->MAIN_INFO_VALUE_LOCALTAX1, "lt1");
            }

            $opcions = [$this->langs->trans("CalcLocaltax1") . ' ' . $this->langs->trans("CalcLocaltax1Desc"), $this->langs->trans("CalcLocaltax2") . ' - ' . $this->langs->trans("CalcLocaltax2Desc"), $this->langs->trans("CalcLocaltax3") . ' - ' . $this->langs->trans("CalcLocaltax3Desc")];

            print '<br><label for="clt1">' . $this->langs->trans("CalcLocaltax") . '</label>: ';
            print $form->selectarray("clt1", $opcions, $this->conf->global->MAIN_INFO_LOCALTAX_CALC1);
            print "</div>";
            print "</td></tr>\n";

            print '<tr class="oddeven"><td><input type="radio" name="optionlocaltax1" id="nolt1" value="localtax1off"' . ((empty($this->conf->global->FACTURE_LOCAL_TAX1_OPTION) || $this->conf->global->FACTURE_LOCAL_TAX1_OPTION == "localtax1off") ? " checked" : "") . '> <label for="nolt1">' . $this->langs->transcountry("LocalTax1IsNotUsed", $this->mysoc->country_code) . "</label></td>";
            print '<td colspan="2">';
            $tooltiphelp = $this->langs->transcountry("LocalTax1IsNotUsedExample", $this->mysoc->country_code);
            $tooltiphelp = ($tooltiphelp != "LocalTax1IsNotUsedExample" ? "<i>" . $this->langs->trans("Example") . ': ' . $this->langs->transcountry("LocalTax1IsNotUsedExample", $this->mysoc->country_code) . "</i>\n" : "");
            print $form->textwithpicto($this->langs->transcountry("LocalTax1IsNotUsedDesc", $this->mysoc->country_code), $tooltiphelp);
            print "</td></tr>\n";
        } else {
            if (empty($this->mysoc->country_code)) {
                print '<tr class="oddeven nohover"><td class="">' . $countrynotdefined . '</td><td></td><td></td></tr>';
            } else {
                print '<tr class="oddeven nohover"><td class="" colspan="3"><span class="opacitymedium">' . $this->langs->trans("NoLocalTaxXForThisCountry", $this->langs->transnoentitiesnoconv("Setup"), $this->langs->transnoentitiesnoconv("Dictionaries"), $this->langs->transnoentitiesnoconv("DictionaryVAT"), $this->langs->transnoentitiesnoconv("LocalTax1Management")) . '</span></td></tr>';
            }
        }

        print "</table>";

        // Third tax system
        print '<br>';
        print '<table class="noborder centpercent editmode">';
        print '<tr class="liste_titre">';
        print '<td class="titlefieldcreate">' . $form->textwithpicto($this->langs->transcountry("LocalTax2Management", $this->mysoc->country_code), $this->langs->transcountry("LocalTax2IsUsedDesc", $this->mysoc->country_code)) . '</td><td>' . $this->langs->trans("Description") . '</td>';
        print '<td class="right">&nbsp;</td>';
        print "</tr>\n";

        if ($this->mysoc->useLocalTax(2)) {
            // Note: When option is not set, it must not appears as set on on, because there is no default value for this option
            print '<tr class="oddeven"><td><input type="radio" name="optionlocaltax2" id="lt2" value="localtax2on"' . (($this->conf->global->FACTURE_LOCAL_TAX2_OPTION == '1' || $this->conf->global->FACTURE_LOCAL_TAX2_OPTION == "localtax2on") ? " checked" : "") . '> <label for="lt2">' . $this->langs->transcountry("LocalTax2IsUsed", $this->mysoc->country_code) . "</label></td>";
            print '<td colspan="2">';
            print '<div class="nobordernopadding">';
            print '<label for="lt2">' . $this->langs->transcountry("LocalTax2IsUsedDesc", $this->mysoc->country_code) . "</label>";
            $tooltiphelp = $this->langs->transcountry("LocalTax2IsUsedExample", $this->mysoc->country_code);
            $tooltiphelp = ($tooltiphelp != "LocalTax2IsUsedExample" ? "<i>" . $this->langs->trans("Example") . ': ' . $this->langs->transcountry("LocalTax2IsUsedExample", $this->mysoc->country_code) . "</i>\n" : "");
            if (!DolibarrFunctions::isOnlyOneLocalTax(2)) {
                print '<br><label for="lt2">' . $this->langs->trans("LTRate") . '</label>: ';
                $formcompany->select_localtax(2, $this->conf->global->MAIN_INFO_VALUE_LOCALTAX2, "lt2");
            }
            print '<br><label for="clt2">' . $this->langs->trans("CalcLocaltax") . '</label>: ';
            print $form->selectarray("clt2", $opcions, $this->conf->global->MAIN_INFO_LOCALTAX_CALC2);
            print "</div>";
            print "</td></tr>\n";

            print '<tr class="oddeven"><td><input type="radio" name="optionlocaltax2" id="nolt2" value="localtax2off"' . ((empty($this->conf->global->FACTURE_LOCAL_TAX2_OPTION) || $this->conf->global->FACTURE_LOCAL_TAX2_OPTION == "localtax2off") ? " checked" : "") . '> <label for="nolt2">' . $this->langs->transcountry("LocalTax2IsNotUsed", $this->mysoc->country_code) . "</label></td>";
            print '<td colspan="2">';
            print "<div>";
            $tooltiphelp = $this->langs->transcountry("LocalTax2IsNotUsedExample", $this->mysoc->country_code);
            $tooltiphelp = ($tooltiphelp != "LocalTax2IsNotUsedExample" ? "<i>" . $this->langs->trans("Example") . ': ' . $this->langs->transcountry("LocalTax2IsNotUsedExample", $this->mysoc->country_code) . "</i>\n" : "");
            print "<label for=\"nolt2\">" . $form->textwithpicto($this->langs->transcountry("LocalTax2IsNotUsedDesc", $this->mysoc->country_code), $tooltiphelp) . "</label>";
            print "</div>";
            print "</td></tr>\n";
        } else {
            if (empty($this->mysoc->country_code)) {
                print '<tr class="oddeven nohover"><td class="">' . $countrynotdefined . '</td><td></td><td></td></tr>';
            } else {
                print '<tr class="oddeven nohover"><td class="" colspan="3"><span class="opacitymedium">' . $this->langs->trans("NoLocalTaxXForThisCountry", $this->langs->transnoentitiesnoconv("Setup"), $this->langs->transnoentitiesnoconv("Dictionaries"), $this->langs->transnoentitiesnoconv("DictionaryVAT"), $this->langs->transnoentitiesnoconv("LocalTax2Management")) . '</span></td></tr>';
            }
        }

        print "</table>";

        // Tax stamp
        print '<br>';
        print '<table class="noborder centpercent editmode">';
        print '<tr class="liste_titre">';
        print '<td>' . $form->textwithpicto($this->langs->trans("RevenueStamp"), $this->langs->trans("RevenueStampDesc")) . '</td><td>' . $this->langs->trans("Description") . '</td>';
        print '<td class="right">&nbsp;</td>';
        print "</tr>\n";
        if ($this->mysoc->useRevenueStamp()) {
            // Note: When option is not set, it must not appears as set on on, because there is no default value for this option
            print '<tr class="oddeven"><td>';
            print $this->langs->trans("UseRevenueStamp");
            print "</td>";
            print '<td colspan="2">';
            print $this->langs->trans("UseRevenueStampExample", $this->langs->transnoentitiesnoconv("Setup"), $this->langs->transnoentitiesnoconv("Dictionaries"), $this->langs->transnoentitiesnoconv("DictionaryRevenueStamp"));
            print "</td></tr>\n";
        } else {
            if (empty($this->mysoc->country_code)) {
                print '<tr class="oddeven nohover"><td class="">' . $countrynotdefined . '</td><td></td><td></td></tr>';
            } else {
                print
                    '<tr class="oddeven nohover"><td class="" colspan="3"><span class="opacitymedium">' .
                    $this->langs->trans("NoLocalTaxXForThisCountry") .
                    $this->langs->transnoentitiesnoconv("Setup") .
                    $this->langs->transnoentitiesnoconv("Dictionaries") .
                    $this->langs->transnoentitiesnoconv("DictionaryRevenueStamp") .
                    $this->langs->transnoentitiesnoconv("RevenueStamp") .
                    '</span></td></tr>';
            }
        }

        print "</table>";

        print $form->buttonsSaveCancel("Save", '');

        print '</form>';

        // End of page
        $this->llxFooter();
        // $db->close();

        return parent::printPage();
    }

    /**
     * Assign the template.
     */
    function setTemplate(): void
    {
        $this->template = 'dolibarr';
    }

}

