<?php
/*
 *  View
 */

$form = new Form($db);
$formfile = new FormFile($db);
$formadmin = new FormAdmin($db);
$formcompany = new FormCompany($db);
if (!empty($conf->accounting->enabled)) {
    $formaccounting = new FormAccounting($db);
}

if ($socid > 0 && empty($object->id)) {
    $result = $object->fetch($socid);
    if ($result <= 0) {
        dol_print_error('', $object->error);
    }
}

$title = $langs->trans("ThirdParty");
if (!empty($conf->global->MAIN_HTML_TITLE) && preg_match('/thirdpartynameonly/', $conf->global->MAIN_HTML_TITLE) && $object->name) {
    $title = $object->name . " - " . $langs->trans('Card');
}

$help_url = 'EN:Module_Third_Parties|FR:Module_Tiers|ES:Empresas|DE:Modul_Geschäftspartner';

llxHeader('', $title, $help_url);

$countrynotdefined = $langs->trans("ErrorSetACountryFirst") . ' (' . $langs->trans("SeeAbove") . ')';

if (is_object($objcanvas) && $objcanvas->displayCanvasExists($action)) {
    // -----------------------------------------
    // When used with CANVAS
    // -----------------------------------------
    $objcanvas->assign_values($action, $object->id, $object->ref); // Set value for templates
    $objcanvas->display_canvas($action); // Show template
} else {
    // -----------------------------------------
    // When used in standard mode
    // -----------------------------------------
    if ($action == 'create') {
        /*
		 *  Creation
		 */
        $private = GETPOST("private", "int");
        if (!empty($conf->global->THIRDPARTY_DEFAULT_CREATE_CONTACT) && !GETPOSTISSET('private')) {
            $private = 1;
        }
        if (empty($private)) {
            $private = 0;
        }

        // Load object modCodeTiers
        $module = (!empty($conf->global->SOCIETE_CODECLIENT_ADDON) ? $conf->global->SOCIETE_CODECLIENT_ADDON : 'mod_codeclient_leopard');
        if (substr($module, 0, 15) == 'mod_codeclient_' && substr($module, -3) == 'php') {
            $module = substr($module, 0, dol_strlen($module) - 4);
        }
        $dirsociete = array_merge(['/core/modules/societe/'], $conf->modules_parts['societe']);
        foreach ($dirsociete as $dirroot) {
            $res = dol_include_once($dirroot . $module . '.php');
            if ($res) {
                break;
            }
        }
        $modCodeClient = new $module;
        // Load object modCodeFournisseur
        $module = (!empty($conf->global->SOCIETE_CODECLIENT_ADDON) ? $conf->global->SOCIETE_CODECLIENT_ADDON : 'mod_codeclient_leopard');
        if (substr($module, 0, 15) == 'mod_codeclient_' && substr($module, -3) == 'php') {
            $module = substr($module, 0, dol_strlen($module) - 4);
        }
        $dirsociete = array_merge(['/core/modules/societe/'], $conf->modules_parts['societe']);
        foreach ($dirsociete as $dirroot) {
            $res = dol_include_once($dirroot . $module . '.php');
            if ($res) {
                break;
            }
        }
        $modCodeFournisseur = new $module;

        // Define if customer/prospect or supplier status is set or not
        if (GETPOST("type") != 'f') {
            $object->client = -1;
            if (!empty($conf->global->THIRDPARTY_CUSTOMERPROSPECT_BY_DEFAULT)) {
                $object->client = 3;
            }
        }
        // Prospect / Customer
        if (GETPOST("type") == 'c') {
            if (!empty($conf->global->THIRDPARTY_CUSTOMERTYPE_BY_DEFAULT)) {
                $object->client = $conf->global->THIRDPARTY_CUSTOMERTYPE_BY_DEFAULT;
            } else {
                $object->client = 3;
            }
        }
        if (GETPOST("type") == 'p') {
            $object->client = 2;
        }
        if (((!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled)) && (GETPOST("type") == 'f' || (GETPOST("type") == '' && !empty($conf->global->THIRDPARTY_SUPPLIER_BY_DEFAULT)))) {
            $object->fournisseur = 1;
        }

        $object->name = GETPOST('name', 'alphanohtml');
        $object->name_alias = GETPOST('name_alias', 'alphanohtml');
        $object->firstname = GETPOST('firstname', 'alphanohtml');
        $object->particulier = $private;
        $object->prefix_comm = GETPOST('prefix_comm', 'alphanohtml');
        $object->client = GETPOST('client', 'int') ? GETPOST('client', 'int') : $object->client;

        if (empty($duplicate_code_error)) {
            $object->code_client = GETPOST('customer_code', 'alpha');
            $object->fournisseur = GETPOST('fournisseur') ? GETPOST('fournisseur', 'int') : $object->fournisseur;
            $object->code_fournisseur = GETPOST('supplier_code', 'alpha');
        } else {
            setEventMessages($langs->trans('NewCustomerSupplierCodeProposed'), '', 'warnings');
        }

        $object->address = GETPOST('address', 'alphanohtml');
        $object->zip = GETPOST('zipcode', 'alphanohtml');
        $object->town = GETPOST('town', 'alphanohtml');
        $object->state_id = GETPOST('state_id', 'int');
        //$object->skype				= GETPOST('skype', 'alpha');
        //$object->twitter			= GETPOST('twitter', 'alpha');
        //$object->facebook			= GETPOST('facebook', 'alpha');
        //$object->linkedin			= GETPOST('linkedin', 'alpha');
        $object->socialnetworks = [];
        if (!empty($conf->socialnetworks->enabled)) {
            foreach ($socialnetworks as $key => $value) {
                if (GETPOSTISSET($key) && GETPOST($key, 'alphanohtml') != '') {
                    $object->socialnetworks[$key] = GETPOST($key, 'alphanohtml');
                }
            }
        }
        $object->phone = GETPOST('phone', 'alpha');
        $object->fax = GETPOST('fax', 'alpha');
        $object->email = GETPOST('email', 'custom', 0, FILTER_SANITIZE_EMAIL);
        $object->url = GETPOST('url', 'custom', 0, FILTER_SANITIZE_URL);
        $object->capital = GETPOST('capital', 'alphanohtml');
        $object->barcode = GETPOST('barcode', 'alphanohtml');
        $object->idprof1 = GETPOST('idprof1', 'alphanohtml');
        $object->idprof2 = GETPOST('idprof2', 'alphanohtml');
        $object->idprof3 = GETPOST('idprof3', 'alphanohtml');
        $object->idprof4 = GETPOST('idprof4', 'alphanohtml');
        $object->idprof5 = GETPOST('idprof5', 'alphanohtml');
        $object->idprof6 = GETPOST('idprof6', 'alphanohtml');
        $object->typent_id = GETPOST('typent_id', 'int');
        $object->effectif_id = GETPOST('effectif_id', 'int');
        $object->civility_id = GETPOST('civility_id', 'alpha');

        $object->tva_assuj = GETPOST('assujtva_value', 'int');
        $object->status = GETPOST('status', 'int');

        //Local Taxes
        $object->localtax1_assuj = GETPOST('localtax1assuj_value', 'int');
        $object->localtax2_assuj = GETPOST('localtax2assuj_value', 'int');

        $object->localtax1_value = GETPOST('lt1', 'int');
        $object->localtax2_value = GETPOST('lt2', 'int');

        $object->tva_intra = GETPOST('tva_intra', 'alphanohtml');

        $object->commercial_id = GETPOST('commercial_id', 'int');
        $object->default_lang = GETPOST('default_lang');

        if (GETPOSTISSET('accountancy_code_sell')) {
            $accountancy_code_sell = GETPOST('accountancy_code_sell', 'alpha');

            if (empty($accountancy_code_sell) || $accountancy_code_sell == '-1') {
                $object->accountancy_code_sell = '';
            } else {
                $object->accountancy_code_sell = $accountancy_code_sell;
            }
        }
        if (GETPOSTISSET('accountancy_code_buy')) {
            $accountancy_code_buy = GETPOST('accountancy_code_buy', 'alpha');

            if (empty($accountancy_code_buy) || $accountancy_code_buy == '-1') {
                $object->accountancy_code_buy = '';
            } else {
                $object->accountancy_code_buy = $accountancy_code_buy;
            }
        }

        $object->logo = (isset($_FILES['photo']) ? dol_sanitizeFileName($_FILES['photo']['name']) : '');

        // Gestion du logo de la société
        $dir = $conf->societe->multidir_output[$conf->entity] . "/" . $object->id . "/logos";
        $file_OK = (isset($_FILES['photo']) ? is_uploaded_file($_FILES['photo']['tmp_name']) : false);
        if ($file_OK) {
            if (image_format_supported($_FILES['photo']['name'])) {
                dol_mkdir($dir);

                if (@is_dir($dir)) {
                    $newfile = $dir . '/' . dol_sanitizeFileName($_FILES['photo']['name']);
                    $result = dol_move_uploaded_file($_FILES['photo']['tmp_name'], $newfile, 1);

                    if (!$result > 0) {
                        $errors[] = "ErrorFailedToSaveFile";
                    } else {
                        // Create thumbs
                        $object->addThumbs($newfile);
                    }
                }
            }
        }

        // We set country_id, country_code and country for the selected country
        $object->country_id = GETPOST('country_id') ? GETPOST('country_id') : $mysoc->country_id;
        if ($object->country_id) {
            $tmparray = getCountry($object->country_id, 'all');
            $object->country_code = $tmparray['code'];
            $object->country = $tmparray['label'];
        }
        $object->forme_juridique_code = GETPOST('forme_juridique_code');
        /* Show create form */

        $linkback = "";
        print load_fiche_titre($langs->trans("NewThirdParty"), $linkback, 'building');

        if (!empty($conf->use_javascript_ajax)) {
            if (!empty($conf->global->THIRDPARTY_SUGGEST_ALSO_ADDRESS_CREATION)) {
                print "\n" . '<script type="text/javascript">';
                print '$(document).ready(function () {
						id_te_private=8;
                        id_ef15=1;
                        is_private=' . $private . ';
						if (is_private) {
							$(".individualline").show();
						} else {
							$(".individualline").hide();
						}
                        $("#radiocompany").click(function() {
                        	$(".individualline").hide();
                        	$("#typent_id").val(0);
                        	$("#typent_id").change();
                        	$("#effectif_id").val(0);
                        	$("#effectif_id").change();
                        	$("#TypeName").html(document.formsoc.ThirdPartyName.value);
                        	document.formsoc.private.value=0;
                        });
                        $("#radioprivate").click(function() {
                        	$(".individualline").show();
                        	$("#typent_id").val(id_te_private);
                        	$("#typent_id").change();
                        	$("#effectif_id").val(id_ef15);
                        	$("#effectif_id").change();
                        	$("#TypeName").html(document.formsoc.LastName.value);
                        	document.formsoc.private.value=1;
                        });

						init_customer_categ();
			  			$("#customerprospect").change(function() {
								init_customer_categ();
						});
						function init_customer_categ() {
								console.log("is customer or prospect = "+jQuery("#customerprospect").val());
								if (jQuery("#customerprospect").val() == 0 && (jQuery("#fournisseur").val() == 0 || ' . (empty($conf->global->THIRDPARTY_CAN_HAVE_CATEGORY_EVEN_IF_NOT_CUSTOMER_PROSPECT_SUPPLIER) ? '1' : '0') . '))
								{
									jQuery(".visibleifcustomer").hide();
								}
								else
								{
									jQuery(".visibleifcustomer").show();
								}
						}

						init_supplier_categ();
			       		$("#fournisseur").change(function() {
							init_supplier_categ();
						});
						function init_supplier_categ() {
								console.log("is supplier = "+jQuery("#fournisseur").val());
								if (jQuery("#fournisseur").val() == 0)
								{
									jQuery(".visibleifsupplier").hide();
								}
								else
								{
									jQuery(".visibleifsupplier").show();
								}
						}

                        $("#selectcountry_id").change(function() {
                        	document.formsoc.action.value="create";
                        	document.formsoc.submit();
                        });';
                if ($conf->global->MAILING_CONTACT_DEFAULT_BULK_STATUS == 2) {
                    print '
						function init_check_no_email(input) {
							if (input.val()!="") {
								$(".noemail").addClass("fieldrequired");
							} else {
								$(".noemail").removeClass("fieldrequired");
							}
						}
						$("#email").keyup(function() {
							init_check_no_email($(this));
						});
						init_check_no_email($("#email"));';
                }
                print '});';
                print '</script>' . "\n";

                print '<div id="selectthirdpartytype">';
                print '<div class="hideonsmartphone float">';
                print $langs->trans("ThirdPartyType") . ': &nbsp; &nbsp; ';
                print '</div>';
                print '<label for="radiocompany" class="radiocompany">';
                print '<input type="radio" id="radiocompany" class="flat" name="private"  value="0"' . ($private ? '' : ' checked') . '>';
                print '&nbsp;';
                print $langs->trans("CreateThirdPartyOnly");
                print '</label>';
                print ' &nbsp; &nbsp; ';
                print '<label for="radioprivate" class="radioprivate">';
                $text = '<input type="radio" id="radioprivate" class="flat" name="private" value="1"' . ($private ? ' checked' : '') . '>';
                $text .= '&nbsp;';
                $text .= $langs->trans("CreateThirdPartyAndContact");
                $htmltext = $langs->trans("ToCreateContactWithSameName");
                print $form->textwithpicto($text, $htmltext, 1, 'help', '', 0, 3);
                print '</label>';
                print '</div>';
                print "<br>\n";
            } else {
                print '<script type="text/javascript">';
                print '$(document).ready(function () {
                        $("#selectcountry_id").change(function() {
                        	document.formsoc.action.value="create";
                        	document.formsoc.submit();
                        });
                     });';
                print '</script>' . "\n";
            }
        }

        dol_htmloutput_mesg(is_numeric($error) ? '' : $error, $errors, 'error');

        print '<form enctype="multipart/form-data" action="' . $_SERVER["PHP_SELF"] . '" method="post" name="formsoc" autocomplete="off">'; // Chrome ignor autocomplete

        print '<input type="hidden" name="action" value="add">';
        print '<input type="hidden" name="backtopage" value="' . $backtopage . '">';
        print '<input type="hidden" name="token" value="' . newToken() . '">';
        print '<input type="hidden" name="private" value=' . $object->particulier . '>';
        print '<input type="hidden" name="type" value=' . GETPOST("type", 'alpha') . '>';
        print '<input type="hidden" name="LastName" value="' . $langs->trans('ThirdPartyName') . ' / ' . $langs->trans('LastName') . '">';
        print '<input type="hidden" name="ThirdPartyName" value="' . $langs->trans('ThirdPartyName') . '">';
        if ($modCodeClient->code_auto || $modCodeFournisseur->code_auto) {
            print '<input type="hidden" name="code_auto" value="1">';
        }

        print dol_get_fiche_head(null, 'card', '', 0, '');

        print '<table class="border centpercent">';

        // Name, firstname
        print '<tr class="tr-field-thirdparty-name"><td class="titlefieldcreate">';
        if ($object->particulier || $private) {
            print '<span id="TypeName" class="fieldrequired">' . $langs->trans('ThirdPartyName') . ' / ' . $langs->trans('LastName', 'name') . '</span>';
        } else {
            print '<span id="TypeName" class="fieldrequired">' . $form->editfieldkey('ThirdPartyName', 'name', '', $object, 0) . '</span>';
        }
        print '</td><td' . (empty($conf->global->SOCIETE_USEPREFIX) ? ' colspan="3"' : '') . '>';
        print '<input type="text" class="minwidth300" maxlength="128" name="name" id="name" value="' . dol_escape_htmltag($object->name) . '" autofocus="autofocus">';
        print $form->widgetForTranslation("name", $object, $permissiontoadd, 'string', 'alpahnohtml', 'minwidth300');
        print '</td>';
        if (!empty($conf->global->SOCIETE_USEPREFIX)) {  // Old not used prefix field
            print '<td>' . $langs->trans('Prefix') . '</td><td><input type="text" size="5" maxlength="5" name="prefix_comm" value="' . dol_escape_htmltag($object->prefix_comm) . '"></td>';
        }
        print '</tr>';

        // If javascript on, we show option individual
        if ($conf->use_javascript_ajax) {
            if (!empty($conf->global->THIRDPARTY_SUGGEST_ALSO_ADDRESS_CREATION)) {
                // Firstname
                print '<tr class="individualline"><td>' . $form->editfieldkey('FirstName', 'firstname', '', $object, 0) . '</td>';
                print '<td colspan="3"><input type="text" class="minwidth300" maxlength="128" name="firstname" id="firstname" value="' . dol_escape_htmltag($object->firstname) . '"></td>';
                print '</tr>';

                // Title
                print '<tr class="individualline"><td>' . $form->editfieldkey('UserTitle', 'civility_id', '', $object, 0) . '</td><td colspan="3" class="maxwidthonsmartphone">';
                print $formcompany->select_civility($object->civility_id, 'civility_id', 'maxwidth100') . '</td>';
                print '</tr>';
            }
        }

        // Alias names (commercial, trademark or alias names)
        print '<tr id="name_alias"><td><label for="name_alias_input">' . $langs->trans('AliasNames') . '</label></td>';
        print '<td colspan="3"><input type="text" class="minwidth300" name="name_alias" id="name_alias_input" value="' . dol_escape_htmltag($object->name_alias) . '"></td></tr>';

        // Prospect/Customer
        print '<tr><td class="titlefieldcreate">' . $form->editfieldkey('ProspectCustomer', 'customerprospect', '', $object, 0, 'string', '', 1) . '</td>';
        print '<td class="maxwidthonsmartphone">';
        $selected = (GETPOSTISSET('client') ? GETPOST('client', 'int') : $object->client);
        print $formcompany->selectProspectCustomerType($selected);
        print '</td>';

        if ($conf->browser->layout == 'phone') {
            print '</tr><tr>';
        }

        print '<td>' . $form->editfieldkey('CustomerCode', 'customer_code', '', $object, 0) . '</td><td>';
        print '<table class="nobordernopadding"><tr><td>';
        $tmpcode = $object->code_client;
        if (empty($tmpcode) && !empty($modCodeClient->code_auto)) {
            $tmpcode = $modCodeClient->getNextValue($object, 0);
        }
        print '<input type="text" name="customer_code" id="customer_code" class="maxwidthonsmartphone" value="' . dol_escape_htmltag($tmpcode) . '" maxlength="24">';
        print '</td><td>';
        $s = $modCodeClient->getToolTip($langs, $object, 0);
        print $form->textwithpicto('', $s, 1);
        print '</td></tr></table>';
        print '</td></tr>';

        if ((!empty($conf->fournisseur->enabled) && !empty($user->rights->fournisseur->lire) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || (!empty($conf->supplier_order->enabled) && !empty($user->rights->supplier_order->lire)) || (!empty($conf->supplier_invoice->enabled) && !empty($user->rights->supplier_invoice->lire))
            || (!empty($conf->supplier_proposal->enabled) && !empty($user->rights->supplier_proposal->lire))) {
            // Supplier
            print '<tr>';
            print '<td>' . $form->editfieldkey('Vendor', 'fournisseur', '', $object, 0, 'string', '', 1) . '</td><td>';
            $default = -1;
            if (!empty($conf->global->THIRDPARTY_SUPPLIER_BY_DEFAULT)) {
                $default = 1;
            }
            print $form->selectyesno("fournisseur", (GETPOST('fournisseur', 'int') != '' ? GETPOST('fournisseur', 'int') : (GETPOST("type", 'alpha') == '' ? $default : $object->fournisseur)), 1, 0, (GETPOST("type", 'alpha') == '' ? 1 : 0), 1);
            print '</td>';

            if ($conf->browser->layout == 'phone') {
                print '</tr><tr>';
            }

            print '<td>';
            if ((!empty($conf->fournisseur->enabled) && !empty($user->rights->fournisseur->lire) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || (!empty($conf->supplier_order->enabled) && !empty($user->rights->supplier_order->lire)) || (!empty($conf->supplier_invoice->enabled) && !empty($user->rights->supplier_invoice->lire))) {
                print $form->editfieldkey('SupplierCode', 'supplier_code', '', $object, 0);
            }
            print '</td><td>';
            if ((!empty($conf->fournisseur->enabled) && !empty($user->rights->fournisseur->lire) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || (!empty($conf->supplier_order->enabled) && !empty($user->rights->supplier_order->lire)) || (!empty($conf->supplier_invoice->enabled) && !empty($user->rights->supplier_invoice->lire))) {
                print '<table class="nobordernopadding"><tr><td>';
                $tmpcode = $object->code_fournisseur;
                if (empty($tmpcode) && !empty($modCodeFournisseur->code_auto)) {
                    $tmpcode = $modCodeFournisseur->getNextValue($object, 1);
                }
                print '<input type="text" name="supplier_code" id="supplier_code" class="maxwidthonsmartphone" value="' . dol_escape_htmltag($tmpcode) . '" maxlength="24">';
                print '</td><td>';
                $s = $modCodeFournisseur->getToolTip($langs, $object, 1);
                print $form->textwithpicto('', $s, 1);
                print '</td></tr></table>';
            }
            print '</td></tr>';
        }

        // Status
        print '<tr><td>' . $form->editfieldkey('Status', 'status', '', $object, 0) . '</td><td colspan="3">';
        print $form->selectarray('status', ['0' => $langs->trans('ActivityCeased'), '1' => $langs->trans('InActivity')], 1, 0, 0, 0, '', 0, 0, 0, '', 'minwidth100', 1);
        print '</td></tr>';

        // Barcode
        if (!empty($conf->barcode->enabled)) {
            print '<tr><td>' . $form->editfieldkey('Gencod', 'barcode', '', $object, 0) . '</td>';
            print '<td colspan="3">';
            print img_picto('', 'barcode');
            print '<input type="text" name="barcode" id="barcode" value="' . dol_escape_htmltag($object->barcode) . '">';
            print '</td></tr>';
        }

        // Address
        print '<tr><td class="tdtop">';
        print $form->editfieldkey('Address', 'address', '', $object, 0);
        print '</td>';
        print '<td colspan="3">';
        print '<textarea name="address" id="address" class="quatrevingtpercent" rows="' . ROWS_2 . '" wrap="soft">';
        print dol_escape_htmltag($object->address, 0, 1);
        print '</textarea>';
        print $form->widgetForTranslation("address", $object, $permissiontoadd, 'textarea', 'alphanohtml', 'quatrevingtpercent');
        print '</td></tr>';

        // Zip / Town
        print '<tr><td>' . $form->editfieldkey('Zip', 'zipcode', '', $object, 0) . '</td><td>';
        print $formcompany->select_ziptown($object->zip, 'zipcode', ['town', 'selectcountry_id', 'state_id'], 0, 0, '', 'maxwidth100');
        print '</td>';
        if ($conf->browser->layout == 'phone') {
            print '</tr><tr>';
        }
        print '<td class="tdtop">' . $form->editfieldkey('Town', 'town', '', $object, 0) . '</td><td>';
        print $formcompany->select_ziptown($object->town, 'town', ['zipcode', 'selectcountry_id', 'state_id'], 0, 0, '', 'maxwidth100 quatrevingtpercent');
        print $form->widgetForTranslation("town", $object, $permissiontoadd, 'string', 'alphanohtml', 'maxwidth100 quatrevingtpercent');
        print '</td></tr>';

        // Country
        print '<tr><td>' . $form->editfieldkey('Country', 'selectcountry_id', '', $object, 0) . '</td><td colspan="3" class="maxwidthonsmartphone">';
        print img_picto('', 'country', 'class="paddingrightonly"');
        print $form->select_country((GETPOSTISSET('country_id') ? GETPOST('country_id') : $object->country_id), 'country_id', '', 0, 'minwidth300 maxwidth500 widthcentpercentminusx');
        if ($user->admin) {
            print info_admin($langs->trans("YouCanChangeValuesForThisListFromDictionarySetup"), 1);
        }
        print '</td></tr>';

        // State
        if (empty($conf->global->SOCIETE_DISABLE_STATE)) {
            if (!empty($conf->global->MAIN_SHOW_REGION_IN_STATE_SELECT) && ($conf->global->MAIN_SHOW_REGION_IN_STATE_SELECT == 1 || $conf->global->MAIN_SHOW_REGION_IN_STATE_SELECT == 2)) {
                print '<tr><td>' . $form->editfieldkey('Region-State', 'state_id', '', $object, 0) . '</td><td colspan="3" class="maxwidthonsmartphone">';
            } else {
                print '<tr><td>' . $form->editfieldkey('State', 'state_id', '', $object, 0) . '</td><td colspan="3" class="maxwidthonsmartphone">';
            }

            if ($object->country_id) {
                print img_picto('', 'state', 'class="pictofixedwidth"');
                print $formcompany->select_state($object->state_id, $object->country_code);
            } else {
                print $countrynotdefined;
            }
            print '</td></tr>';
        }

        // Phone / Fax
        print '<tr><td>' . $form->editfieldkey('Phone', 'phone', '', $object, 0) . '</td>';
        print '<td' . ($conf->browser->layout == 'phone' ? ' colspan="3"' : '') . '>' . img_picto('', 'object_phoning') . ' <input type="text" name="phone" id="phone" class="maxwidth200 widthcentpercentminusx" value="' . (GETPOSTISSET('phone') ? GETPOST('phone', 'alpha') : $object->phone) . '"></td>';
        if ($conf->browser->layout == 'phone') {
            print '</tr><tr>';
        }
        print '<td>' . $form->editfieldkey('Fax', 'fax', '', $object, 0) . '</td>';
        print '<td' . ($conf->browser->layout == 'phone' ? ' colspan="3"' : '') . '>' . img_picto('', 'object_phoning_fax') . ' <input type="text" name="fax" id="fax" class="maxwidth200 widthcentpercentminusx" value="' . (GETPOSTISSET('fax') ? GETPOST('fax', 'alpha') : $object->fax) . '"></td></tr>';

        // Email / Web
        print '<tr><td>' . $form->editfieldkey('EMail', 'email', '', $object, 0, 'string', '', empty($conf->global->SOCIETE_EMAIL_MANDATORY) ? '' : $conf->global->SOCIETE_EMAIL_MANDATORY) . '</td>';
        print '<td' . (($conf->browser->layout == 'phone') || empty($conf->mailing->enabled) ? ' colspan="3"' : '') . '>' . img_picto('', 'object_email') . ' <input type="text" class="maxwidth200 widthcentpercentminusx" name="email" id="email" value="' . $object->email . '"></td>';
        if (!empty($conf->mailing->enabled) && !empty($conf->global->THIRDPARTY_SUGGEST_ALSO_ADDRESS_CREATION)) {
            if ($conf->browser->layout == 'phone') {
                print '</tr><tr>';
            }
            print '<td class="individualline noemail">' . $form->editfieldkey($langs->trans('No_Email') . ' (' . $langs->trans('Contact') . ')', 'contact_no_email', '', $object, 0) . '</td>';
            print '<td class="individualline" ' . (($conf->browser->layout == 'phone') || empty($conf->mailing->enabled) ? ' colspan="3"' : '') . '>' . $form->selectyesno('contact_no_email', (GETPOSTISSET("contact_no_email") ? GETPOST("contact_no_email", 'alpha') : (empty($object->no_email) ? 0 : 1)), 1, false, 1) . '</td>';
        }
        print '</tr>';
        print '<tr><td>' . $form->editfieldkey('Web', 'url', '', $object, 0) . '</td>';
        print '<td colspan="3">' . img_picto('', 'globe') . ' <input type="text" class="maxwidth500 widthcentpercentminusx" name="url" id="url" value="' . $object->url . '"></td></tr>';

        if (!empty($conf->socialnetworks->enabled)) {
            foreach ($socialnetworks as $key => $value) {
                if ($value['active']) {
                    print '<tr>';
                    print '<td><label for="' . $value['label'] . '">' . $form->editfieldkey($value['label'], $key, '', $object, 0) . '</label></td>';
                    print '<td colspan="3">';
                    if (!empty($value['icon'])) {
                        print '<span class="fa ' . $value['icon'] . '"></span>';
                    }
                    print '<input type="text" name="' . $key . '" id="' . $key . '" class="minwidth100" maxlength="80" value="' . dol_escape_htmltag(GETPOSTISSET($key) ? GETPOST($key, 'alphanohtml') : (empty($object->socialnetworks[$key]) ? '' : $object->socialnetworks[$key])) . '">';
                    print '</td>';
                    print '</tr>';
                } elseif (!empty($object->socialnetworks[$key])) {
                    print '<input type="hidden" name="' . $key . '" value="' . $object->socialnetworks[$key] . '">';
                }
            }
        }

        // Prof ids
        $i = 1;
        $j = 0;
        $NBCOLS = ($conf->browser->layout == 'phone' ? 1 : 2);
        while ($i <= 6) {
            $idprof = $langs->transcountry('ProfId' . $i, $object->country_code);
            if ($idprof != '-') {
                $key = 'idprof' . $i;

                if (($j % $NBCOLS) == 0) {
                    print '<tr>';
                }

                $idprof_mandatory = 'SOCIETE_IDPROF' . ($i) . '_MANDATORY';
                print '<td>' . $form->editfieldkey($idprof, $key, '', $object, 0, 'string', '', (empty($conf->global->$idprof_mandatory) ? 0 : 1)) . '</td><td>';

                print $formcompany->get_input_id_prof($i, $key, $object->$key, $object->country_code);
                print '</td>';
                if (($j % $NBCOLS) == ($NBCOLS - 1)) {
                    print '</tr>';
                }
                $j++;
            }
            $i++;
        }
        if ($NBCOLS > 1 && ($j % 2 == 1)) {
            print '<td colspan="2"></td></tr>';
        }

        // Vat is used
        print '<tr><td>' . $form->editfieldkey('VATIsUsed', 'assujtva_value', '', $object, 0) . '</td>';
        print '<td>';
        print $form->selectyesno('assujtva_value', GETPOSTISSET('assujtva_value') ? GETPOST('assujtva_value', 'int') : 1, 1); // Assujeti par defaut en creation
        print '</td>';
        if ($conf->browser->layout == 'phone') {
            print '</tr><tr>';
        }
        print '<td class="nowrap">' . $form->editfieldkey('VATIntra', 'intra_vat', '', $object, 0) . '</td>';
        print '<td class="nowrap">';
        $s = '<input type="text" class="flat maxwidthonsmartphone" name="tva_intra" id="intra_vat" maxlength="20" value="' . $object->tva_intra . '">';

        if (empty($conf->global->MAIN_DISABLEVATCHECK) && isInEEC($object)) {
            $s .= ' ';

            if (!empty($conf->use_javascript_ajax)) {
                $widthpopup = 600;
                if (!empty($conf->dol_use_jmobile)) {
                    $widthpopup = 350;
                }
                $heightpopup = 400;
                print "\n";
                print '<script language="JavaScript" type="text/javascript">';
                print "function CheckVAT(a) {\n";
                print "newpopup('" . DOL_URL_ROOT . "/Modules/Societes/checkvat/checkVatPopup.php?vatNumber='+a, '" . dol_escape_js($langs->trans("VATIntraCheckableOnEUSite")) . "', " . $widthpopup . ", " . $heightpopup . ");\n";
                print "}\n";
                print '</script>';
                print "\n";
                $s .= '<a href="#" class="hideonsmartphone" onclick="javascript: CheckVAT(document.formsoc.tva_intra.value);">' . $langs->trans("VATIntraCheck") . '</a>';
                $s = $form->textwithpicto($s, $langs->trans("VATIntraCheckDesc", $langs->transnoentitiesnoconv("VATIntraCheck")), 1);
            } else {
                $s .= '<a href="' . $langs->transcountry("VATIntraCheckURL", $object->country_id) . '" target="_blank">' . img_picto($langs->trans("VATIntraCheckableOnEUSite"), 'help') . '</a>';
            }
        }
        print $s;
        print '</td>';
        print '</tr>';

        // Local Taxes
        //TODO: Place into a function to control showing by country or study better option
        if ($mysoc->localtax1_assuj == "1" && $mysoc->localtax2_assuj == "1") {
            print '<tr><td>' . $langs->transcountry("LocalTax1IsUsed", $mysoc->country_code) . '</td><td>';
            print $form->selectyesno('localtax1assuj_value', (isset($conf->global->THIRDPARTY_DEFAULT_USELOCALTAX1) ? $conf->global->THIRDPARTY_DEFAULT_USELOCALTAX1 : 0), 1);
            print '</td>';
            if ($conf->browser->layout == 'phone') {
                print '</tr><tr>';
            }
            print '<td>' . $langs->transcountry("LocalTax2IsUsed", $mysoc->country_code) . '</td><td>';
            print $form->selectyesno('localtax2assuj_value', (isset($conf->global->THIRDPARTY_DEFAULT_USELOCALTAX2) ? $conf->global->THIRDPARTY_DEFAULT_USELOCALTAX2 : 0), 1);
            print '</td></tr>';
        } elseif ($mysoc->localtax1_assuj == "1") {
            print '<tr><td>' . $langs->transcountry("LocalTax1IsUsed", $mysoc->country_code) . '</td><td colspan="3">';
            print $form->selectyesno('localtax1assuj_value', (isset($conf->global->THIRDPARTY_DEFAULT_USELOCALTAX1) ? $conf->global->THIRDPARTY_DEFAULT_USELOCALTAX1 : 0), 1);
            print '</td></tr>';
        } elseif ($mysoc->localtax2_assuj == "1") {
            print '<tr><td>' . $langs->transcountry("LocalTax2IsUsed", $mysoc->country_code) . '</td><td colspan="3">';
            print $form->selectyesno('localtax2assuj_value', (isset($conf->global->THIRDPARTY_DEFAULT_USELOCALTAX2) ? $conf->global->THIRDPARTY_DEFAULT_USELOCALTAX2 : 0), 1);
            print '</td></tr>';
        }

        // Type - Workforce/Staff
        print '<tr><td>' . $form->editfieldkey('ThirdPartyType', 'typent_id', '', $object, 0) . '</td><td class="maxwidthonsmartphone"' . (($conf->browser->layout == 'phone' || !empty($conf->global->SOCIETE_DISABLE_WORKFORCE)) ? ' colspan="3"' : '') . '>' . "\n";
        $sortparam = (empty($conf->global->SOCIETE_SORT_ON_TYPEENT) ? 'ASC' : $conf->global->SOCIETE_SORT_ON_TYPEENT); // NONE means we keep sort of original array, so we sort on position. ASC, means next function will sort on label.
        print $form->selectarray("typent_id", $formcompany->typent_array(0), $object->typent_id, 1, 0, 0, '', 0, 0, 0, $sortparam, '', 1);
        if ($user->admin) {
            print ' ' . info_admin($langs->trans("YouCanChangeValuesForThisListFromDictionarySetup"), 1);
        }
        if (empty($conf->global->SOCIETE_DISABLE_WORKFORCE)) {
            print '</td>';
            if ($conf->browser->layout == 'phone') {
                print '</tr><tr>';
            }
            print '<td>' . $form->editfieldkey('Workforce', 'effectif_id', '', $object, 0) . '</td><td class="maxwidthonsmartphone"' . ($conf->browser->layout == 'phone' ? ' colspan="3"' : '') . '>';
            print $form->selectarray("effectif_id", $formcompany->effectif_array(0), $object->effectif_id, 0, 0, 0, '', 0, 0, 0, '', '', 1);
            if ($user->admin) {
                print ' ' . info_admin($langs->trans("YouCanChangeValuesForThisListFromDictionarySetup"), 1);
            }
        } else {
            print '<input type="hidden" name="effectif_id" id="effectif_id" value="' . $object->effectif_id . '">';
        }
        print '</td></tr>';

        // Legal Form
        print '<tr><td>' . $form->editfieldkey('JuridicalStatus', 'forme_juridique_code', '', $object, 0) . '</td>';
        print '<td colspan="3" class="maxwidthonsmartphone">';
        if ($object->country_id) {
            print $formcompany->select_juridicalstatus($object->forme_juridique_code, $object->country_code, '', 'forme_juridique_code');
        } else {
            print $countrynotdefined;
        }
        print '</td></tr>';

        // Capital
        print '<tr><td>' . $form->editfieldkey('Capital', 'capital', '', $object, 0) . '</td>';
        print '<td colspan="3"><input type="text" name="capital" id="capital" class="maxwidth100" value="' . $object->capital . '"> ';
        print '<span class="hideonsmartphone">' . $langs->trans("Currency" . $conf->currency) . '</span></td></tr>';

        if (!empty($conf->global->MAIN_MULTILANGS)) {
            print '<tr><td>' . $form->editfieldkey('DefaultLang', 'default_lang', '', $object, 0) . '</td><td colspan="3" class="maxwidthonsmartphone">' . "\n";
            print img_picto('', 'language') . $formadmin->select_language(GETPOST('default_lang', 'alpha') ? GETPOST('default_lang', 'alpha') : ($object->default_lang ? $object->default_lang : ''), 'default_lang', 0, 0, 1, 0, 0, 'maxwidth200onsmartphone');
            print '</td>';
            print '</tr>';
        }

        // Incoterms
        if (!empty($conf->incoterm->enabled)) {
            print '<tr>';
            print '<td>' . $form->editfieldkey('IncotermLabel', 'incoterm_id', '', $object, 0) . '</td>';
            print '<td colspan="3" class="maxwidthonsmartphone">';
            print $form->select_incoterms((!empty($object->fk_incoterms) ? $object->fk_incoterms : ''), (!empty($object->location_incoterms) ? $object->location_incoterms : ''));
            print '</td></tr>';
        }

        // Categories
        if (!empty($conf->categorie->enabled) && !empty($user->rights->categorie->lire)) {
            $langs->load('categories');

            // Customer
            //if ($object->prospect || $object->client || (! $object->fournisseur && ! empty($conf->global->THIRDPARTY_CAN_HAVE_CATEGORY_EVEN_IF_NOT_CUSTOMER_PROSPECT_SUPPLIER))) {
            print '<tr class="visibleifcustomer"><td class="toptd">' . $form->editfieldkey('CustomersProspectsCategoriesShort', 'custcats', '', $object, 0) . '</td><td colspan="3">';
            $cate_arbo = $form->select_all_categories(Categorie::TYPE_CUSTOMER, null, 'parent', null, null, 1);
            print img_picto('', 'category') . $form->multiselectarray('custcats', $cate_arbo, GETPOST('custcats', 'array'), null, null, 'quatrevingtpercent widthcentpercentminusx', 0, 0);
            print "</td></tr>";
            //}

            if (!empty($conf->global->THIRDPARTY_SUGGEST_ALSO_ADDRESS_CREATION)) {
                print '<tr class="individualline"><td class="toptd">' . $form->editfieldkey('ContactCategoriesShort', 'contcats', '', $object, 0) . '</td><td colspan="3">';
                $cate_arbo = $form->select_all_categories(Categorie::TYPE_CONTACT, null, 'parent', null, null, 1);
                print img_picto('', 'category') . $form->multiselectarray('contcats', $cate_arbo, GETPOST('contcats', 'array'), null, null, 'quatrevingtpercent widthcentpercentminusx', 0, 0);
                print "</td></tr>";
            }

            if (!empty($conf->global->THIRDPARTY_SUGGEST_ALSO_ADDRESS_CREATION)) {
                print '<tr class="individualline"><td class="toptd">' . $form->editfieldkey('ContactCategoriesShort', 'contcats', '', $object, 0) . '</td><td colspan="3">';
                $cate_arbo = $form->select_all_categories(Categorie::TYPE_CONTACT, null, 'parent', null, null, 1);
                print img_picto('', 'category') . $form->multiselectarray('contcats', $cate_arbo, GETPOST('contcats', 'array'), null, null, 'quatrevingtpercent widthcentpercentminusx', 0, 0);
                print "</td></tr>";
            }

            // Supplier
            if ((!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled)) {
                print '<tr class="visibleifsupplier"><td class="toptd">' . $form->editfieldkey('SuppliersCategoriesShort', 'suppcats', '', $object, 0) . '</td><td colspan="3">';
                $cate_arbo = $form->select_all_categories(Categorie::TYPE_SUPPLIER, null, 'parent', null, null, 1);
                print img_picto('', 'category') . $form->multiselectarray('suppcats', $cate_arbo, GETPOST('suppcats', 'array'), null, null, 'quatrevingtpercent widthcentpercentminusx', 0, 0);
                print "</td></tr>";
            }
        }

        // Multicurrency
        if (!empty($conf->multicurrency->enabled)) {
            print '<tr>';
            print '<td>' . $form->editfieldkey('Currency', 'multicurrency_code', '', $object, 0) . '</td>';
            print '<td colspan="3" class="maxwidthonsmartphone">';
            print $form->selectMultiCurrency(($object->multicurrency_code ? $object->multicurrency_code : $conf->currency), 'multicurrency_code', 1);
            print '</td></tr>';
        }

        // Other attributes
        $parameters = ['socid' => $socid, 'colspan' => ' colspan="3"', 'colspanvalue' => '3'];
        include DOL_DOCUMENT_ROOT . '/core/tpl/extrafields_add.tpl.php';

        // Assign a sale representative
        print '<tr>';
        print '<td>' . $form->editfieldkey('AllocateCommercial', 'commercial_id', '', $object, 0) . '</td>';
        print '<td colspan="3" class="maxwidthonsmartphone">';
        $userlist = $form->select_dolusers('', '', 0, null, 0, '', '', 0, 0, 0, 'AND u.statut = 1', 0, '', '', 0, 1);
        // Note: If user has no right to "see all thirdparties", we force selection of sale representative to him, so after creation he can see the record.
        $selected = (count(GETPOST('commercial', 'array')) > 0 ? GETPOST('commercial', 'array') : (GETPOST('commercial', 'int') > 0 ? [GETPOST('commercial', 'int')] : (empty($user->rights->societe->client->voir) ? [$user->id] : [])));
        print img_picto('', 'user') . $form->multiselectarray('commercial', $userlist, $selected, null, null, 'quatrevingtpercent widthcentpercentminusx', 0, 0);
        print '</td></tr>';

        // Add logo
        print '<tr class="hideonsmartphone">';
        print '<td>' . $form->editfieldkey('Logo', 'photoinput', '', $object, 0) . '</td>';
        print '<td colspan="3">';
        print '<input class="flat" type="file" name="photo" id="photoinput" />';
        print '</td>';
        print '</tr>';

        print '</table>' . "\n";

        // Accountancy codes
        if (!empty($conf->global->ACCOUNTANCY_USE_PRODUCT_ACCOUNT_ON_THIRDPARTY)) {
            print '<table class="border" width="100%">';

            if (!empty($conf->accounting->enabled)) {
                // Accountancy_code_sell
                print '<tr><td class="titlefieldcreate">' . $langs->trans("ProductAccountancySellCode") . '</td>';
                print '<td>';
                $accountancy_code_sell = GETPOST('accountancy_code_sell', 'alpha');
                print $formaccounting->select_account($accountancy_code_sell, 'accountancy_code_sell', 1, null, 1, 1, '');
                print '</td></tr>';

                // Accountancy_code_buy
                print '<tr><td class="titlefieldcreate">' . $langs->trans("ProductAccountancyBuyCode") . '</td>';
                print '<td>';
                $accountancy_code_buy = GETPOST('accountancy_code_buy', 'alpha');
                print $formaccounting->select_account($accountancy_code_buy, 'accountancy_code_buy', 1, null, 1, 1, '');
                print '</td></tr>';
            } else { // For external software
                // Accountancy_code_sell
                print '<tr><td class="titlefieldcreate">' . $langs->trans("ProductAccountancySellCode") . '</td>';
                print '<td class="maxwidthonsmartphone"><input class="minwidth100" name="accountancy_code_sell" value="' . $object->accountancy_code_sell . '">';
                print '</td></tr>';

                // Accountancy_code_buy
                print '<tr><td class="titlefieldcreate">' . $langs->trans("ProductAccountancyBuyCode") . '</td>';
                print '<td class="maxwidthonsmartphone"><input class="minwidth100" name="accountancy_code_buy" value="' . $object->accountancy_code_buy . '">';
                print '</td></tr>';
            }

            print '</table>';
        }

        print dol_get_fiche_end();

        print $form->buttonsSaveCancel("AddThirdParty");

        print '</form>' . "\n";
    } elseif ($action == 'edit') {
        //print load_fiche_titre($langs->trans("EditCompany"));

        if ($socid) {
            $res = $object->fetch_optionals();
            //if ($res < 0) { dol_print_error($db); exit; }

            $head = societe_prepare_head($object);

            // Load object modCodeTiers
            $module = (!empty($conf->global->SOCIETE_CODECLIENT_ADDON) ? $conf->global->SOCIETE_CODECLIENT_ADDON : 'mod_codeclient_leopard');
            if (substr($module, 0, 15) == 'mod_codeclient_' && substr($module, -3) == 'php') {
                $module = substr($module, 0, dol_strlen($module) - 4);
            }
            $dirsociete = array_merge(['/core/modules/societe/'], $conf->modules_parts['societe']);
            foreach ($dirsociete as $dirroot) {
                $res = dol_include_once($dirroot . $module . '.php');
                if ($res) {
                    break;
                }
            }
            $modCodeClient = new $module($db);
            // We verified if the tag prefix is used
            if ($modCodeClient->code_auto) {
                $prefixCustomerIsUsed = $modCodeClient->verif_prefixIsUsed();
            }
            $module = $conf->global->SOCIETE_CODECLIENT_ADDON;
            if (substr($module, 0, 15) == 'mod_codeclient_' && substr($module, -3) == 'php') {
                $module = substr($module, 0, dol_strlen($module) - 4);
            }
            $dirsociete = array_merge(['/core/modules/societe/'], $conf->modules_parts['societe']);
            foreach ($dirsociete as $dirroot) {
                $res = dol_include_once($dirroot . $module . '.php');
                if ($res) {
                    break;
                }
            }
            $modCodeFournisseur = new $module($db);
            // On verifie si la balise prefix est utilisee
            if ($modCodeFournisseur->code_auto) {
                $prefixSupplierIsUsed = $modCodeFournisseur->verif_prefixIsUsed();
            }

            $object->oldcopy = clone $object;

            if (GETPOSTISSET('name')) {
                // We overwrite with values if posted
                $object->name = GETPOST('name', 'alphanohtml');
                $object->prefix_comm = GETPOST('prefix_comm', 'alphanohtml');
                $object->client = GETPOST('client', 'int');
                $object->code_client = GETPOST('customer_code', 'alpha');
                $object->fournisseur = GETPOST('fournisseur', 'int');
                $object->code_fournisseur = GETPOST('supplier_code', 'alpha');
                $object->address = GETPOST('address', 'alphanohtml');
                $object->zip = GETPOST('zipcode', 'alphanohtml');
                $object->town = GETPOST('town', 'alphanohtml');
                $object->country_id = GETPOST('country_id') ? GETPOST('country_id', 'int') : $mysoc->country_id;
                $object->state_id = GETPOST('state_id', 'int');
                //$object->skype				= GETPOST('skype', 'alpha');
                //$object->twitter				= GETPOST('twitter', 'alpha');
                //$object->facebook				= GETPOST('facebook', 'alpha');
                //$object->linkedin				= GETPOST('linkedin', 'alpha');
                $object->socialnetworks = [];
                if (!empty($conf->socialnetworks->enabled)) {
                    foreach ($socialnetworks as $key => $value) {
                        if (GETPOSTISSET($key) && GETPOST($key, 'alphanohtml') != '') {
                            $object->socialnetworks[$key] = GETPOST($key, 'alphanohtml');
                        }
                    }
                }
                $object->phone = GETPOST('phone', 'alpha');
                $object->fax = GETPOST('fax', 'alpha');
                $object->email = GETPOST('email', 'custom', 0, FILTER_SANITIZE_EMAIL);
                $object->url = GETPOST('url', 'custom', 0, FILTER_SANITIZE_URL);
                $object->capital = GETPOST('capital', 'alphanohtml');
                $object->idprof1 = GETPOST('idprof1', 'alphanohtml');
                $object->idprof2 = GETPOST('idprof2', 'alphanohtml');
                $object->idprof3 = GETPOST('idprof3', 'alphanohtml');
                $object->idprof4 = GETPOST('idprof4', 'alphanohtml');
                $object->idprof5 = GETPOST('idprof5', 'alphanohtml');
                $object->idprof6 = GETPOST('idprof6', 'alphanohtml');
                $object->typent_id = GETPOST('typent_id', 'int');
                $object->effectif_id = GETPOST('effectif_id', 'int');
                $object->barcode = GETPOST('barcode', 'alphanohtml');
                $object->forme_juridique_code = GETPOST('forme_juridique_code', 'int');
                $object->default_lang = GETPOST('default_lang', 'alpha');

                $object->tva_assuj = GETPOST('assujtva_value', 'int');
                $object->tva_intra = GETPOST('tva_intra', 'alphanohtml');
                $object->status = GETPOST('status', 'int');

                // Webservices url/key
                $object->webservices_url = GETPOST('webservices_url', 'custom', 0, FILTER_SANITIZE_URL);
                $object->webservices_key = GETPOST('webservices_key', 'san_alpha');

                if (GETPOSTISSET('accountancy_code_sell')) {
                    $accountancy_code_sell = GETPOST('accountancy_code_sell', 'alpha');

                    if (empty($accountancy_code_sell) || $accountancy_code_sell == '-1') {
                        $object->accountancy_code_sell = '';
                    } else {
                        $object->accountancy_code_sell = $accountancy_code_sell;
                    }
                }
                if (GETPOSTISSET('accountancy_code_buy')) {
                    $accountancy_code_buy = GETPOST('accountancy_code_buy', 'alpha');

                    if (empty($accountancy_code_buy) || $accountancy_code_buy == '-1') {
                        $object->accountancy_code_buy = '';
                    } else {
                        $object->accountancy_code_buy = $accountancy_code_buy;
                    }
                }

                //Incoterms
                if (!empty($conf->incoterm->enabled)) {
                    $object->fk_incoterms = GETPOST('incoterm_id', 'int');
                    $object->location_incoterms = GETPOST('lcoation_incoterms', 'alpha');
                }

                //Local Taxes
                $object->localtax1_assuj = GETPOST('localtax1assuj_value');
                $object->localtax2_assuj = GETPOST('localtax2assuj_value');

                $object->localtax1_value = GETPOST('lt1');
                $object->localtax2_value = GETPOST('lt2');

                // We set country_id, and country_code label of the chosen country
                if ($object->country_id > 0) {
                    $tmparray = getCountry($object->country_id, 'all');
                    $object->country_code = $tmparray['code'];
                    $object->country = $tmparray['label'];
                }
            }

            if ($object->localtax1_assuj == 0) {
                $sub = 0;
            } else {
                $sub = 1;
            }
            if ($object->localtax2_assuj == 0) {
                $sub2 = 0;
            } else {
                $sub2 = 1;
            }

            if (!empty($conf->use_javascript_ajax)) {
                print "\n" . '<script type="text/javascript">';
                print '$(document).ready(function () {
    			var val=' . $sub . ';
    			var val2=' . $sub2 . ';
    			if("#localtax1assuj_value".value==undefined){
    				if(val==1){
    					$(".cblt1").show();
    				}else{
    					$(".cblt1").hide();
    				}
    			}
    			if("#localtax2assuj_value".value==undefined){
    				if(val2==1){
    					$(".cblt2").show();
    				}else{
    					$(".cblt2").hide();
    				}
    			}
    			$("#localtax1assuj_value").change(function() {
               		var value=document.getElementById("localtax1assuj_value").value;
    				if(value==1){
    					$(".cblt1").show();
    				}else{
    					$(".cblt1").hide();
    				}
    			});
    			$("#localtax2assuj_value").change(function() {
    				var value=document.getElementById("localtax2assuj_value").value;
    				if(value==1){
    					$(".cblt2").show();
    				}else{
    					$(".cblt2").hide();
    				}
    			});

				init_customer_categ();
	  			$("#customerprospect").change(function() {
					init_customer_categ();
				});
       			function init_customer_categ() {
					console.log("is customer or prospect = "+jQuery("#customerprospect").val());
					if (jQuery("#customerprospect").val() == 0 && (jQuery("#fournisseur").val() == 0 || ' . (empty($conf->global->THIRDPARTY_CAN_HAVE_CATEGORY_EVEN_IF_NOT_CUSTOMER_PROSPECT_SUPPLIER) ? '1' : '0') . '))
					{
						jQuery(".visibleifcustomer").hide();
					}
					else
					{
						jQuery(".visibleifcustomer").show();
					}
				}

				init_supplier_categ();
	  			$("#fournisseur").change(function() {
					init_supplier_categ();
				});
       			function init_supplier_categ() {
					console.log("is supplier = "+jQuery("#fournisseur").val());
					if (jQuery("#fournisseur").val() == 0)
					{
						jQuery(".visibleifsupplier").hide();
					}
					else
					{
						jQuery(".visibleifsupplier").show();
					}
				};

       			$("#selectcountry_id").change(function() {
       				document.formsoc.action.value="edit";
      				document.formsoc.submit();
        			});

                })';
                print '</script>' . "\n";
            }

            print '<form enctype="multipart/form-data" action="' . $_SERVER["PHP_SELF"] . '?socid=' . $object->id . '" method="post" name="formsoc">';
            print '<input type="hidden" name="action" value="update">';
            print '<input type="hidden" name="token" value="' . newToken() . '">';
            print '<input type="hidden" name="socid" value="' . $object->id . '">';
            print '<input type="hidden" name="entity" value="' . $object->entity . '">';
            if ($modCodeClient->code_auto || $modCodeFournisseur->code_auto) {
                print '<input type="hidden" name="code_auto" value="1">';
            }

            print dol_get_fiche_head($head, 'card', $langs->trans("ThirdParty"), 0, 'company');

            print '<div class="fichecenter2">';
            print '<table class="border centpercent">';

            // Ref/ID
            if (!empty($conf->global->MAIN_SHOW_TECHNICAL_ID)) {
                print '<tr><td class="titlefieldcreate">' . $langs->trans("ID") . '</td><td colspan="3">';
                print $object->ref;
                print '</td></tr>';
            }

            // Name
            print '<tr><td class="titlefieldcreate">' . $form->editfieldkey('ThirdPartyName', 'name', '', $object, 0, 'string', '', 1) . '</td>';
            print '<td colspan="3"><input type="text" class="minwidth300" maxlength="128" name="name" id="name" value="' . dol_escape_htmltag($object->name) . '" autofocus="autofocus">';
            print $form->widgetForTranslation("name", $object, $permissiontoadd, 'string', 'alpahnohtml', 'minwidth300');
            print '</td></tr>';

            // Alias names (commercial, trademark or alias names)
            print '<tr id="name_alias"><td><label for="name_alias_input">' . $langs->trans('AliasNames') . '</label></td>';
            print '<td colspan="3"><input type="text" class="minwidth300" name="name_alias" id="name_alias_input" value="' . dol_escape_htmltag($object->name_alias) . '"></td></tr>';

            // Prefix
            if (!empty($conf->global->SOCIETE_USEPREFIX)) {  // Old not used prefix field
                print '<tr><td>' . $form->editfieldkey('Prefix', 'prefix', '', $object, 0) . '</td><td colspan="3">';
                // It does not change the prefix mode using the auto numbering prefix
                if (($prefixCustomerIsUsed || $prefixSupplierIsUsed) && $object->prefix_comm) {
                    print '<input type="hidden" name="prefix_comm" value="' . dol_escape_htmltag($object->prefix_comm) . '">';
                    print $object->prefix_comm;
                } else {
                    print '<input type="text" size="5" maxlength="5" name="prefix_comm" id="prefix" value="' . dol_escape_htmltag($object->prefix_comm) . '">';
                }
                print '</td>';
            }

            // Prospect/Customer
            print '<tr><td>' . $form->editfieldkey('ProspectCustomer', 'customerprospect', '', $object, 0, 'string', '', 1) . '</td>';
            print '<td class="maxwidthonsmartphone">';
            print $formcompany->selectProspectCustomerType($object->client);
            print '</td>';
            if ($conf->browser->layout == 'phone') {
                print '</tr><tr>';
            }
            print '<td>' . $form->editfieldkey('CustomerCode', 'customer_code', '', $object, 0) . '</td><td>';

            print '<table class="nobordernopadding"><tr><td>';
            if ((!$object->code_client || $object->code_client == -1) && $modCodeClient->code_auto) {
                $tmpcode = $object->code_client;
                if (empty($tmpcode) && !empty($object->oldcopy->code_client)) {
                    $tmpcode = $object->oldcopy->code_client; // When there is an error to update a thirdparty, the number for supplier and customer code is kept to old value.
                }
                if (empty($tmpcode) && !empty($modCodeClient->code_auto)) {
                    $tmpcode = $modCodeClient->getNextValue($object, 0);
                }
                print '<input type="text" name="customer_code" id="customer_code" size="16" value="' . dol_escape_htmltag($tmpcode) . '" maxlength="24">';
            } elseif ($object->codeclient_modifiable()) {
                print '<input type="text" name="customer_code" id="customer_code" size="16" value="' . dol_escape_htmltag($object->code_client) . '" maxlength="24">';
            } else {
                print $object->code_client;
                print '<input type="hidden" name="customer_code" value="' . dol_escape_htmltag($object->code_client) . '">';
            }
            print '</td><td>';
            $s = $modCodeClient->getToolTip($langs, $object, 0);
            print $form->textwithpicto('', $s, 1);
            print '</td></tr></table>';

            print '</td></tr>';

            // Supplier
            if (((!empty($conf->fournisseur->enabled) && !empty($user->rights->fournisseur->lire) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || (!empty($conf->supplier_order->enabled) && !empty($user->rights->supplier_order->lire)) || (!empty($conf->supplier_invoice->enabled) && !empty($user->rights->supplier_invoice->lire)))
                || (!empty($conf->supplier_proposal->enabled) && !empty($user->rights->supplier_proposal->lire))) {
                print '<tr>';
                print '<td>' . $form->editfieldkey('Supplier', 'fournisseur', '', $object, 0, 'string', '', 1) . '</td>';
                print '<td class="maxwidthonsmartphone">';
                print $form->selectyesno("fournisseur", $object->fournisseur, 1, false, 0, 1);
                print '</td>';
                if ($conf->browser->layout == 'phone') {
                    print '</tr><tr>';
                }
                print '<td>';
                if ((!empty($conf->fournisseur->enabled) && !empty($user->rights->fournisseur->lire) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || (!empty($conf->supplier_order->enabled) && !empty($user->rights->supplier_order->lire)) || (!empty($conf->supplier_invoice->enabled) && !empty($user->rights->supplier_invoice->lire))) {
                    print $form->editfieldkey('SupplierCode', 'supplier_code', '', $object, 0);
                }
                print '</td>';
                print '<td>';
                print '<table class="nobordernopadding"><tr><td>';
                if ((!$object->code_fournisseur || $object->code_fournisseur == -1) && $modCodeFournisseur->code_auto) {
                    $tmpcode = $object->code_fournisseur;
                    if (empty($tmpcode) && !empty($object->oldcopy->code_fournisseur)) {
                        $tmpcode = $object->oldcopy->code_fournisseur; // When there is an error to update a thirdparty, the number for supplier and customer code is kept to old value.
                    }
                    if (empty($tmpcode) && !empty($modCodeFournisseur->code_auto)) {
                        $tmpcode = $modCodeFournisseur->getNextValue($object, 1);
                    }
                    print '<input type="text" name="supplier_code" id="supplier_code" size="16" value="' . dol_escape_htmltag($tmpcode) . '" maxlength="24">';
                } elseif ($object->codefournisseur_modifiable()) {
                    print '<input type="text" name="supplier_code" id="supplier_code" size="16" value="' . dol_escape_htmltag($object->code_fournisseur) . '" maxlength="24">';
                } else {
                    print $object->code_fournisseur;
                    print '<input type="hidden" name="supplier_code" value="' . $object->code_fournisseur . '">';
                }
                print '</td><td>';
                $s = $modCodeFournisseur->getToolTip($langs, $object, 1);
                print $form->textwithpicto('', $s, 1);
                print '</td></tr></table>';
                print '</td></tr>';
            }

            // Barcode
            if (!empty($conf->barcode->enabled)) {
                print '<tr><td class="tdtop">' . $form->editfieldkey('Gencod', 'barcode', '', $object, 0) . '</td>';
                print '<td colspan="3">';
                print img_picto('', 'barcode');
                print '<input type="text" name="barcode" id="barcode" value="' . dol_escape_htmltag($object->barcode) . '">';
                print '</td></tr>';
            }

            // Status
            print '<tr><td>' . $form->editfieldkey('Status', 'status', '', $object, 0) . '</td><td colspan="3">';
            print $form->selectarray('status', ['0' => $langs->trans('ActivityCeased'), '1' => $langs->trans('InActivity')], $object->status, 0, 0, 0, '', 0, 0, 0, '', 'minwidth100', 1);
            print '</td></tr>';

            // Address
            print '<tr><td class="tdtop">' . $form->editfieldkey('Address', 'address', '', $object, 0) . '</td>';
            print '<td colspan="3"><textarea name="address" id="address" class="quatrevingtpercent" rows="3" wrap="soft">';
            print dol_escape_htmltag($object->address, 0, 1);
            print '</textarea>';
            print $form->widgetForTranslation("address", $object, $permissiontoadd, 'textarea', 'alphanohtml', 'quatrevingtpercent');
            print '</td></tr>';

            // Zip / Town
            print '<tr><td>' . $form->editfieldkey('Zip', 'zipcode', '', $object, 0) . '</td><td>';
            print $formcompany->select_ziptown($object->zip, 'zipcode', ['town', 'selectcountry_id', 'state_id'], 0, 0, '', 'maxwidth100');
            print '</td>';
            if ($conf->browser->layout == 'phone') {
                print '</tr><tr>';
            }
            print '<td>' . $form->editfieldkey('Town', 'town', '', $object, 0) . '</td><td>';
            print $formcompany->select_ziptown($object->town, 'town', ['zipcode', 'selectcountry_id', 'state_id']);
            print $form->widgetForTranslation("town", $object, $permissiontoadd, 'string', 'alphanohtml', 'maxwidth100 quatrevingtpercent');
            print '</td></tr>';

            // Country
            print '<tr><td>' . $form->editfieldkey('Country', 'selectcounty_id', '', $object, 0) . '</td><td colspan="3">';
            print img_picto('', 'globe-americas', 'class="paddingrightonly"');
            print $form->select_country((GETPOSTISSET('country_id') ? GETPOST('country_id') : $object->country_id), 'country_id', '', 0, 'minwidth300 maxwidth500 widthcentpercentminusx');
            if ($user->admin) {
                print info_admin($langs->trans("YouCanChangeValuesForThisListFromDictionarySetup"), 1);
            }
            print '</td></tr>';

            // State
            if (empty($conf->global->SOCIETE_DISABLE_STATE)) {
                if (!empty($conf->global->MAIN_SHOW_REGION_IN_STATE_SELECT) && ($conf->global->MAIN_SHOW_REGION_IN_STATE_SELECT == 1 || $conf->global->MAIN_SHOW_REGION_IN_STATE_SELECT == 2)) {
                    print '<tr><td>' . $form->editfieldkey('Region-State', 'state_id', '', $object, 0) . '</td><td colspan="3">';
                } else {
                    print '<tr><td>' . $form->editfieldkey('State', 'state_id', '', $object, 0) . '</td><td colspan="3">';
                }

                print img_picto('', 'state', 'class="pictofixedwidth"');
                print $formcompany->select_state($object->state_id, $object->country_code);
                print '</td></tr>';
            }

            // Phone / Fax
            print '<tr><td>' . $form->editfieldkey('Phone', 'phone', GETPOST('phone', 'alpha'), $object, 0) . '</td>';
            print '<td>' . img_picto('', 'object_phoning') . ' <input type="text" name="phone" id="phone" class="maxwidth200 widthcentpercentminusx" value="' . (GETPOSTISSET('phone') ? GETPOST('phone', 'alpha') : $object->phone) . '"></td>';
            if ($conf->browser->layout == 'phone') {
                print '</tr><tr>';
            }
            print '<td>' . $form->editfieldkey('Fax', 'fax', GETPOST('fax', 'alpha'), $object, 0) . '</td>';
            print '<td>' . img_picto('', 'object_phoning_fax') . ' <input type="text" name="fax" id="fax" class="maxwidth200 widthcentpercentminusx" value="' . (GETPOSTISSET('fax') ? GETPOST('fax', 'alpha') : $object->fax) . '"></td></tr>';

            // EMail / Web
            print '<tr><td>' . $form->editfieldkey('EMail', 'email', GETPOST('email', 'custom', 0, FILTER_SANITIZE_EMAIL), $object, 0, 'string', '', (!empty($conf->global->SOCIETE_EMAIL_MANDATORY))) . '</td>';
            print '<td colspan="3">' . img_picto('', 'object_email') . ' <input type="text" name="email" id="email" class="maxwidth200onsmartphone maxwidth500 widthcentpercentminusx" value="' . (GETPOSTISSET('email') ? GETPOST('email', 'custom', 0, FILTER_SANITIZE_EMAIL) : $object->email) . '"></td></tr>';
            print '<tr><td>' . $form->editfieldkey('Web', 'url', GETPOST('url', 'alpha'), $object, 0) . '</td>';
            print '<td colspan="3">' . img_picto('', 'globe') . ' <input type="text" name="url" id="url" class="maxwidth200onsmartphone maxwidth500 widthcentpercentminusx " value="' . (GETPOSTISSET('url') ? GETPOST('url', 'alpha') : $object->url) . '"></td></tr>';

            if (!empty($conf->socialnetworks->enabled)) {
                foreach ($socialnetworks as $key => $value) {
                    if ($value['active']) {
                        print '<tr>';
                        print '<td><label for="' . $value['label'] . '">' . $form->editfieldkey($value['label'], $key, '', $object, 0) . '</label></td>';
                        print '<td colspan="3">';
                        if (!empty($value['icon'])) {
                            print '<span class="fa ' . $value['icon'] . '"></span>';
                        }
                        print '<input type="text" name="' . $key . '" id="' . $key . '" class="minwidth100" maxlength="80" value="' . (empty($object->socialnetworks[$key]) ? '' : $object->socialnetworks[$key]) . '">';
                        print '</td>';
                        print '</tr>';
                    } elseif (!empty($object->socialnetworks[$key])) {
                        print '<input type="hidden" name="' . $key . '" value="' . $object->socialnetworks[$key] . '">';
                    }
                }
            }

            // Prof ids
            $i = 1;
            $j = 0;
            $NBCOLS = ($conf->browser->layout == 'phone' ? 1 : 2);
            while ($i <= 6) {
                $idprof = $langs->transcountry('ProfId' . $i, $object->country_code);
                if ($idprof != '-') {
                    $key = 'idprof' . $i;

                    if (($j % $NBCOLS) == 0) {
                        print '<tr>';
                    }

                    $idprof_mandatory = 'SOCIETE_IDPROF' . ($i) . '_MANDATORY';
                    print '<td>' . $form->editfieldkey($idprof, $key, '', $object, 0, 'string', '', !(empty($conf->global->$idprof_mandatory) || !$object->isACompany())) . '</td><td>';
                    print $formcompany->get_input_id_prof($i, $key, $object->$key, $object->country_code);
                    print '</td>';
                    if (($j % $NBCOLS) == ($NBCOLS - 1)) {
                        print '</tr>';
                    }
                    $j++;
                }
                $i++;
            }
            if ($NBCOLS > 0 && $j % 2 == 1) {
                print '<td colspan="2"></td></tr>';
            }

            // VAT is used
            print '<tr><td>' . $form->editfieldkey('VATIsUsed', 'assujtva_value', '', $object, 0) . '</td><td colspan="3">';
            print $form->selectyesno('assujtva_value', $object->tva_assuj, 1);
            print '</td></tr>';

            // Local Taxes
            //TODO: Place into a function to control showing by country or study better option
            if ($mysoc->localtax1_assuj == "1" && $mysoc->localtax2_assuj == "1") {
                print '<tr><td>' . $form->editfieldkey($langs->transcountry("LocalTax1IsUsed", $mysoc->country_code), 'localtax1assuj_value', '', $object, 0) . '</td><td>';
                print $form->selectyesno('localtax1assuj_value', $object->localtax1_assuj, 1);
                if (!isOnlyOneLocalTax(1)) {
                    print '<span class="cblt1">     ' . $langs->transcountry("Type", $mysoc->country_code) . ': ';
                    $formcompany->select_localtax(1, $object->localtax1_value, "lt1");
                    print '</span>';
                }
                print '</td>';
                print '</tr><tr>';
                print '<td>' . $form->editfieldkey($langs->transcountry("LocalTax2IsUsed", $mysoc->country_code), 'localtax2assuj_value', '', $object, 0) . '</td><td>';
                print $form->selectyesno('localtax2assuj_value', $object->localtax2_assuj, 1);
                if (!isOnlyOneLocalTax(2)) {
                    print '<span class="cblt2">     ' . $langs->transcountry("Type", $mysoc->country_code) . ': ';
                    $formcompany->select_localtax(2, $object->localtax2_value, "lt2");
                    print '</span>';
                }
                print '</td></tr>';
            } elseif ($mysoc->localtax1_assuj == "1" && $mysoc->localtax2_assuj != "1") {
                print '<tr><td>' . $form->editfieldkey($langs->transcountry("LocalTax1IsUsed", $mysoc->country_code), 'localtax1assuj_value', '', $object, 0) . '</td><td colspan="3">';
                print $form->selectyesno('localtax1assuj_value', $object->localtax1_assuj, 1);
                if (!isOnlyOneLocalTax(1)) {
                    print '<span class="cblt1">     ' . $langs->transcountry("Type", $mysoc->country_code) . ': ';
                    $formcompany->select_localtax(1, $object->localtax1_value, "lt1");
                    print '</span>';
                }
                print '</td></tr>';
            } elseif ($mysoc->localtax2_assuj == "1" && $mysoc->localtax1_assuj != "1") {
                print '<tr><td>' . $form->editfieldkey($langs->transcountry("LocalTax2IsUsed", $mysoc->country_code), 'localtax2assuj_value', '', $object, 0) . '</td><td colspan="3">';
                print $form->selectyesno('localtax2assuj_value', $object->localtax2_assuj, 1);
                if (!isOnlyOneLocalTax(2)) {
                    print '<span class="cblt2">     ' . $langs->transcountry("Type", $mysoc->country_code) . ': ';
                    $formcompany->select_localtax(2, $object->localtax2_value, "lt2");
                    print '</span>';
                }
                print '</td></tr>';
            }

            // VAT Code
            print '<tr><td>' . $form->editfieldkey('VATIntra', 'intra_vat', '', $object, 0) . '</td>';
            print '<td colspan="3">';
            $s = '<input type="text" class="flat maxwidthonsmartphone" name="tva_intra" id="intra_vat" maxlength="20" value="' . $object->tva_intra . '">';

            if (empty($conf->global->MAIN_DISABLEVATCHECK) && isInEEC($object)) {
                $s .= ' &nbsp; ';

                if ($conf->use_javascript_ajax) {
                    $widthpopup = 600;
                    if (!empty($conf->dol_use_jmobile)) {
                        $widthpopup = 350;
                    }
                    $heightpopup = 400;
                    print "\n";
                    print '<script language="JavaScript" type="text/javascript">';
                    print "function CheckVAT(a) {\n";
                    print "newpopup('" . DOL_URL_ROOT . "/Modules/Societes/checkvat/checkVatPopup.php?vatNumber='+a,'" . dol_escape_js($langs->trans("VATIntraCheckableOnEUSite")) . "', " . $widthpopup . ", " . $heightpopup . ");\n";
                    print "}\n";
                    print '</script>';
                    print "\n";
                    $s .= '<a href="#" class="hideonsmartphone" onclick="javascript: CheckVAT(document.formsoc.tva_intra.value);">' . $langs->trans("VATIntraCheck") . '</a>';
                    $s = $form->textwithpicto($s, $langs->trans("VATIntraCheckDesc", $langs->transnoentitiesnoconv("VATIntraCheck")), 1);
                } else {
                    $s .= '<a href="' . $langs->transcountry("VATIntraCheckURL", $object->country_id) . '" class="hideonsmartphone" target="_blank">' . img_picto($langs->trans("VATIntraCheckableOnEUSite"), 'help') . '</a>';
                }
            }
            print $s;
            print '</td>';
            print '</tr>';

            // Type - Workforce/Staff
            print '<tr><td>' . $form->editfieldkey('ThirdPartyType', 'typent_id', '', $object, 0) . '</td><td class="maxwidthonsmartphone"' . (($conf->browser->layout == 'phone' || !empty($conf->global->SOCIETE_DISABLE_WORKFORCE)) ? ' colspan="3"' : '') . '>';
            print $form->selectarray("typent_id", $formcompany->typent_array(0), $object->typent_id, 1, 0, 0, '', 0, 0, 0, (empty($conf->global->SOCIETE_SORT_ON_TYPEENT) ? 'ASC' : $conf->global->SOCIETE_SORT_ON_TYPEENT), '', 1);
            if ($user->admin) {
                print info_admin($langs->trans("YouCanChangeValuesForThisListFromDictionarySetup"), 1);
            }
            if (empty($conf->global->SOCIETE_DISABLE_WORKFORCE)) {
                print '</td>';
                if ($conf->browser->layout == 'phone') {
                    print '</tr><tr>';
                }
                print '<td>' . $form->editfieldkey('Workforce', 'effectif_id', '', $object, 0) . '</td><td class="maxwidthonsmartphone">';
                print $form->selectarray("effectif_id", $formcompany->effectif_array(0), $object->effectif_id, 0, 0, 0, '', 0, 0, 0, '', '', 1);
                if ($user->admin) {
                    print info_admin($langs->trans("YouCanChangeValuesForThisListFromDictionarySetup"), 1);
                }
            } else {
                print '<input type="hidden" name="effectif_id" id="effectif_id" value="' . $object->effectif_id . '">';
            }
            print '</td></tr>';

            // Juridical type
            print '<tr><td>' . $form->editfieldkey('JuridicalStatus', 'forme_juridique_code', '', $object, 0) . '</td><td class="maxwidthonsmartphone" colspan="3">';
            print $formcompany->select_juridicalstatus($object->forme_juridique_code, $object->country_code, '', 'forme_juridique_code');
            print '</td></tr>';

            // Capital
            print '<tr><td>' . $form->editfieldkey('Capital', 'capital', '', $object, 0) . '</td>';
            print '<td colspan="3"><input type="text" name="capital" id="capital" size="10" value="';
            print $object->capital != '' ? dol_escape_htmltag(price($object->capital)) : '';
            print '"> <font class="hideonsmartphone">' . $langs->trans("Currency" . $conf->currency) . '</font></td></tr>';

            // Default language
            if (!empty($conf->global->MAIN_MULTILANGS)) {
                print '<tr><td>' . $form->editfieldkey('DefaultLang', 'default_lang', '', $object, 0) . '</td><td colspan="3">' . "\n";
                print img_picto('', 'language') . $formadmin->select_language($object->default_lang, 'default_lang', 0, 0, 1);
                print '</td>';
                print '</tr>';
            }

            // Incoterms
            if (!empty($conf->incoterm->enabled)) {
                print '<tr>';
                print '<td>' . $form->editfieldkey('IncotermLabel', 'incoterm_id', '', $object, 0) . '</td>';
                print '<td colspan="3" class="maxwidthonsmartphone">';
                print $form->select_incoterms((!empty($object->fk_incoterms) ? $object->fk_incoterms : ''), (!empty($object->location_incoterms) ? $object->location_incoterms : ''));
                print '</td></tr>';
            }

            // Categories
            if (!empty($conf->categorie->enabled) && !empty($user->rights->categorie->lire)) {
                // Customer
                print '<tr class="visibleifcustomer"><td>' . $form->editfieldkey('CustomersCategoriesShort', 'custcats', '', $object, 0) . '</td>';
                print '<td colspan="3">';
                $cate_arbo = $form->select_all_categories(Categorie::TYPE_CUSTOMER, null, null, null, null, 1);
                $c = new Categorie($db);
                $cats = $c->containing($object->id, Categorie::TYPE_CUSTOMER);
                $arrayselected = [];
                foreach ($cats as $cat) {
                    $arrayselected[] = $cat->id;
                }
                print img_picto('', 'category') . $form->multiselectarray('custcats', $cate_arbo, $arrayselected, 0, 0, 'quatrevingtpercent widthcentpercentminusx', 0, 0);
                print "</td></tr>";

                // Supplier
                if ((!empty($conf->fournisseur->enabled) && !empty($user->rights->fournisseur->lire) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || (!empty($conf->supplier_order->enabled) && !empty($user->rights->supplier_order->lire)) || (!empty($conf->supplier_invoice->enabled) && !empty($user->rights->supplier_invoice->lire))) {
                    print '<tr class="visibleifsupplier"><td>' . $form->editfieldkey('SuppliersCategoriesShort', 'suppcats', '', $object, 0) . '</td>';
                    print '<td colspan="3">';
                    $cate_arbo = $form->select_all_categories(Categorie::TYPE_SUPPLIER, null, null, null, null, 1);
                    $c = new Categorie($db);
                    $cats = $c->containing($object->id, Categorie::TYPE_SUPPLIER);
                    $arrayselected = [];
                    foreach ($cats as $cat) {
                        $arrayselected[] = $cat->id;
                    }
                    print img_picto('', 'category') . $form->multiselectarray('suppcats', $cate_arbo, $arrayselected, 0, 0, 'quatrevingtpercent widthcentpercentminusx', 0, 0);
                    print "</td></tr>";
                }
            }

            // Multicurrency
            if (!empty($conf->multicurrency->enabled)) {
                print '<tr>';
                print '<td>' . $form->editfieldkey('Currency', 'multicurrency_code', '', $object, 0) . '</td>';
                print '<td colspan="3" class="maxwidthonsmartphone">';
                print $form->selectMultiCurrency(($object->multicurrency_code ? $object->multicurrency_code : $conf->currency), 'multicurrency_code', 1);
                print '</td></tr>';
            }

            // Other attributes
            $parameters = ['socid' => $socid, 'colspan' => ' colspan="3"', 'colspanvalue' => '3'];
            include DOL_DOCUMENT_ROOT . '/core/tpl/extrafields_edit.tpl.php';

            // Webservices url/key
            if (!empty($conf->syncsupplierwebservices->enabled)) {
                print '<tr><td>' . $form->editfieldkey('WebServiceURL', 'webservices_url', '', $object, 0) . '</td>';
                print '<td><input type="text" name="webservices_url" id="webservices_url" size="32" value="' . $object->webservices_url . '"></td>';
                print '<td>' . $form->editfieldkey('WebServiceKey', 'webservices_key', '', $object, 0) . '</td>';
                print '<td><input type="text" name="webservices_key" id="webservices_key" size="32" value="' . $object->webservices_key . '"></td></tr>';
            }

            // Logo
            print '<tr class="hideonsmartphone">';
            print '<td>' . $form->editfieldkey('Logo', 'photoinput', '', $object, 0) . '</td>';
            print '<td colspan="3">';
            if ($object->logo) {
                print $form->showphoto('societe', $object);
            }
            $caneditfield = 1;
            if ($caneditfield) {
                if ($object->logo) {
                    print "<br>\n";
                }
                print '<table class="nobordernopadding">';
                if ($object->logo) {
                    print '<tr><td><input type="checkbox" class="flat photodelete" name="deletephoto" id="photodelete"> ' . $langs->trans("Delete") . '<br><br></td></tr>';
                }
                //print '<tr><td>'.$langs->trans("PhotoFile").'</td></tr>';
                print '<tr><td><input type="file" class="flat" name="photo" id="photoinput"></td></tr>';
                print '</table>';
            }
            print '</td>';
            print '</tr>';

            // Assign sale representative
            print '<tr>';
            print '<td>' . $form->editfieldkey('AllocateCommercial', 'commercial_id', '', $object, 0) . '</td>';
            print '<td colspan="3" class="maxwidthonsmartphone">';
            $userlist = $form->select_dolusers('', '', 0, null, 0, '', '', 0, 0, 0, 'AND u.statut = 1', 0, '', '', 0, 1);
            $arrayselected = GETPOST('commercial', 'array');
            if (empty($arrayselected)) {
                $arrayselected = $object->getSalesRepresentatives($user, 1);
            }
            print img_picto('', 'user') . $form->multiselectarray('commercial', $userlist, $arrayselected, 0, 0, 'quatrevingtpercent widthcentpercentminusx', 0, 0, '', '', '', 1);
            print '</td></tr>';

            print '</table>';

            if (!empty($conf->global->ACCOUNTANCY_USE_PRODUCT_ACCOUNT_ON_THIRDPARTY)) {
                print '<br>';
                print '<table class="border centpercent">';

                if (!empty($conf->accounting->enabled)) {
                    // Accountancy_code_sell
                    print '<tr><td class="titlefield">' . $langs->trans("ProductAccountancySellCode") . '</td>';
                    print '<td>';
                    print $formaccounting->select_account($object->accountancy_code_sell, 'accountancy_code_sell', 1, '', 1, 1);
                    print '</td></tr>';

                    // Accountancy_code_buy
                    print '<tr><td>' . $langs->trans("ProductAccountancyBuyCode") . '</td>';
                    print '<td>';
                    print $formaccounting->select_account($object->accountancy_code_buy, 'accountancy_code_buy', 1, '', 1, 1);
                    print '</td></tr>';
                } else { // For external software
                    // Accountancy_code_sell
                    print '<tr><td class="titlefield">' . $langs->trans("ProductAccountancySellCode") . '</td>';
                    print '<td><input name="accountancy_code_sell" class="maxwidth200" value="' . $object->accountancy_code_sell . '">';
                    print '</td></tr>';

                    // Accountancy_code_buy
                    print '<tr><td>' . $langs->trans("ProductAccountancyBuyCode") . '</td>';
                    print '<td><input name="accountancy_code_buy" class="maxwidth200" value="' . $object->accountancy_code_buy . '">';
                    print '</td></tr>';
                }
                print '</table>';
            }

            print '</div>';

            print dol_get_fiche_end();

            print $form->buttonsSaveCancel();

            print '</form>';
        }
    } else {
        /*
		 * View
		 */

        if (!empty($object->id)) {
            $res = $object->fetch_optionals();
        }
        //if ($res < 0) { dol_print_error($db); exit; }

        $head = societe_prepare_head($object);

        print dol_get_fiche_head($head, 'card', $langs->trans("ThirdParty"), -1, 'company');

        $formconfirm = '';

        // Confirm delete third party
        if ($action == 'delete' || ($conf->use_javascript_ajax && empty($conf->dol_use_jmobile))) {
            $formconfirm = $form->formconfirm($_SERVER["PHP_SELF"] . "?socid=" . $object->id, $langs->trans("DeleteACompany"), $langs->trans("ConfirmDeleteCompany"), "confirm_delete", '', 0, "action-delete");
        }

        if ($action == 'merge') {
            $formquestion = [
                [
                    'name' => 'soc_origin',
                    'label' => $langs->trans('MergeOriginThirdparty'),
                    'type' => 'other',
                    'value' => $form->select_company('', 'soc_origin', '', 'SelectThirdParty', 0, 0, [], 0, 'minwidth200', '', '', 1, null, false, [$object->id]),
                ],
            ];

            $formconfirm .= $form->formconfirm($_SERVER["PHP_SELF"] . "?socid=" . $object->id, $langs->trans("MergeThirdparties"), $langs->trans("ConfirmMergeThirdparties"), "confirm_merge", $formquestion, 'no', 1, 250);
        }

        // Call Hook formConfirm
        $parameters = ['formConfirm' => $formconfirm];
        $reshook = $hookmanager->executeHooks('formConfirm', $parameters, $object, $action); // Note that $action and $object may have been modified by hook
        if (empty($reshook)) {
            $formconfirm .= $hookmanager->resPrint;
        } elseif ($reshook > 0) {
            $formconfirm = $hookmanager->resPrint;
        }

        // Print form confirm
        print $formconfirm;

        dol_htmloutput_mesg(is_numeric($error) ? '' : $error, $errors, 'error');

        $linkback = '<a href="' . DOL_URL_ROOT . '/Modules/Societes/list.php?restore_lastsearch_values=1">' . $langs->trans("BackToList") . '</a>';

        dol_banner_tab($object, 'socid', $linkback, ($user->socid ? 0 : 1), 'rowid', 'nom');

        print '<div class="fichecenter">';
        print '<div class="fichehalfleft">';

        print '<div class="underbanner clearboth"></div>';
        print '<table class="border tableforfield" width="100%">';

        // Type Prospect/Customer/Supplier
        print '<tr><td class="titlefield">' . $langs->trans('NatureOfThirdParty') . '</td><td>';
        print $object->getTypeUrl(1);
        print '</td></tr>';

        // Prefix
        if (!empty($conf->global->SOCIETE_USEPREFIX)) {  // Old not used prefix field
            print '<tr><td>' . $langs->trans('Prefix') . '</td><td>' . dol_escape_htmltag($object->prefix_comm) . '</td>';
            print '</tr>';
        }

        // Customer code
        if ($object->client) {
            print '<tr><td>';
            print $langs->trans('CustomerCode');
            print '</td>';
            print '<td>';
            print showValueWithClipboardCPButton(dol_escape_htmltag($object->code_client));
            print '</td>';
            $tmpcheck = $object->check_codeclient();
            if ($tmpcheck != 0 && $tmpcheck != -5) {
                print ' <font class="error">(' . $langs->trans("WrongCustomerCode") . ')</font>';
            }
            print '</td>';
            print '</tr>';
        }

        // Supplier code
        if (((!empty($conf->fournisseur->enabled) && !empty($user->rights->fournisseur->lire) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || (!empty($conf->supplier_order->enabled) && !empty($user->rights->supplier_order->lire)) || (!empty($conf->supplier_invoice->enabled) && !empty($user->rights->supplier_invoice->lire))) && $object->fournisseur) {
            print '<tr><td>';
            print $langs->trans('SupplierCode') . '</td><td>';
            print showValueWithClipboardCPButton(dol_escape_htmltag($object->code_fournisseur));
            $tmpcheck = $object->check_codefournisseur();
            if ($tmpcheck != 0 && $tmpcheck != -5) {
                print ' <font class="error">(' . $langs->trans("WrongSupplierCode") . ')</font>';
            }
            print '</td>';
            print '</tr>';
        }

        // Barcode
        if (!empty($conf->barcode->enabled)) {
            print '<tr><td>';
            print $langs->trans('Gencod') . '</td><td>' . showValueWithClipboardCPButton(dol_escape_htmltag($object->barcode));
            print '</td>';
            print '</tr>';
        }

        // Prof ids
        $i = 1;
        $j = 0;
        while ($i <= 6) {
            $idprof = $langs->transcountry('ProfId' . $i, $object->country_code);
            if ($idprof != '-') {
                //if (($j % 2) == 0) print '<tr>';
                print '<tr>';
                print '<td>' . $idprof . '</td><td>';
                $key = 'idprof' . $i;
                print showValueWithClipboardCPButton(dol_escape_htmltag($object->$key));
                if ($object->$key) {
                    if ($object->id_prof_check($i, $object) > 0) {
                        print ' &nbsp; ' . $object->id_prof_url($i, $object);
                    } else {
                        print ' <font class="error">(' . $langs->trans("ErrorWrongValue") . ')</font>';
                    }
                }
                print '</td>';
                //if (($j % 2) == 1) print '</tr>';
                print '</tr>';
                $j++;
            }
            $i++;
        }
        //if ($j % 2 == 1)  print '<td colspan="2"></td></tr>';

        // This fields are used to know VAT to include in an invoice when the thirdparty is making a sale, so when it is a supplier.
        // We don't need them into customer profile.
        // Except for spain and localtax where localtax depends on buyer and not seller

        if ($object->fournisseur) {
            // VAT is used
            print '<tr><td>';
            print $form->textwithpicto($langs->trans('VATIsUsed'), $langs->trans('VATIsUsedWhenSelling'));
            print '</td><td>';
            print yn($object->tva_assuj);
            print '</td>';
            print '</tr>';
        }

        // Local Taxes
        if ($object->fournisseur || $mysoc->country_code == 'ES') {
            if ($mysoc->localtax1_assuj == "1" && $mysoc->localtax2_assuj == "1") {
                print '<tr><td>' . $langs->transcountry("LocalTax1IsUsed", $mysoc->country_code) . '</td><td>';
                print yn($object->localtax1_assuj);
                print '</td></tr><tr><td>' . $langs->transcountry("LocalTax2IsUsed", $mysoc->country_code) . '</td><td>';
                print yn($object->localtax2_assuj);
                print '</td></tr>';

                if ($object->localtax1_assuj == "1" && (!isOnlyOneLocalTax(1))) {
                    print '<form method="post" action="' . $_SERVER['PHP_SELF'] . '?socid=' . $object->id . '">';
                    print '<input type="hidden" name="action" value="set_localtax1">';
                    print '<input type="hidden" name="token" value="' . newToken() . '">';
                    print '<tr><td>' . $langs->transcountry("Localtax1", $mysoc->country_code) . ' <a class="editfielda" href="' . $_SERVER["PHP_SELF"] . '?action=editRE&token=' . newToken() . '&socid=' . $object->id . '">' . img_edit($langs->transnoentitiesnoconv('Edit'), 1) . '</td>';
                    if ($action == 'editRE') {
                        print '<td class="left">';
                        $formcompany->select_localtax(1, $object->localtax1_value, "lt1");
                        print '<input type="submit" class="button button-edit" value="' . $langs->trans("Modify") . '"></td>';
                    } else {
                        print '<td>' . $object->localtax1_value . '</td>';
                    }
                    print '</tr></form>';
                }
                if ($object->localtax2_assuj == "1" && (!isOnlyOneLocalTax(2))) {
                    print '<form method="post" action="' . $_SERVER['PHP_SELF'] . '?socid=' . $object->id . '">';
                    print '<input type="hidden" name="action" value="set_localtax2">';
                    print '<input type="hidden" name="token" value="' . newToken() . '">';
                    print '<tr><td>' . $langs->transcountry("Localtax2", $mysoc->country_code) . '<a class="editfielda" href="' . $_SERVER["PHP_SELF"] . '?action=editIRPF&token=' . newToken() . '&socid=' . $object->id . '">' . img_edit($langs->transnoentitiesnoconv('Edit'), 1) . '</td>';
                    if ($action == 'editIRPF') {
                        print '<td class="left">';
                        $formcompany->select_localtax(2, $object->localtax2_value, "lt2");
                        print '<input type="submit" class="button button-edit" value="' . $langs->trans("Modify") . '"></td>';
                    } else {
                        print '<td>' . $object->localtax2_value . '</td>';
                    }
                    print '</tr></form>';
                }
            } elseif ($mysoc->localtax1_assuj == "1" && $mysoc->localtax2_assuj != "1") {
                print '<tr><td>' . $langs->transcountry("LocalTax1IsUsed", $mysoc->country_code) . '</td><td>';
                print yn($object->localtax1_assuj);
                print '</td></tr>';
                if ($object->localtax1_assuj == "1" && (!isOnlyOneLocalTax(1))) {
                    print '<form method="post" action="' . $_SERVER['PHP_SELF'] . '?socid=' . $object->id . '">';
                    print '<input type="hidden" name="action" value="set_localtax1">';
                    print '<input type="hidden" name="token" value="' . newToken() . '">';
                    print '<tr><td> ' . $langs->transcountry("Localtax1", $mysoc->country_code) . '<a class="editfielda" href="' . $_SERVER["PHP_SELF"] . '?action=editRE&token=' . newToken() . '&socid=' . $object->id . '">' . img_edit($langs->transnoentitiesnoconv('Edit'), 1) . '</td>';
                    if ($action == 'editRE') {
                        print '<td class="left">';
                        $formcompany->select_localtax(1, $object->localtax1_value, "lt1");
                        print '<input type="submit" class="button button-edit" value="' . $langs->trans("Modify") . '"></td>';
                    } else {
                        print '<td>' . $object->localtax1_value . '</td>';
                    }
                    print '</tr></form>';
                }
            } elseif ($mysoc->localtax2_assuj == "1" && $mysoc->localtax1_assuj != "1") {
                print '<tr><td>' . $langs->transcountry("LocalTax2IsUsed", $mysoc->country_code) . '</td><td>';
                print yn($object->localtax2_assuj);
                print '</td></tr>';
                if ($object->localtax2_assuj == "1" && (!isOnlyOneLocalTax(2))) {
                    print '<form method="post" action="' . $_SERVER['PHP_SELF'] . '?socid=' . $object->id . '">';
                    print '<input type="hidden" name="action" value="set_localtax2">';
                    print '<input type="hidden" name="token" value="' . newToken() . '">';
                    print '<tr><td> ' . $langs->transcountry("Localtax2", $mysoc->country_code) . ' <a class="editfielda" href="' . $_SERVER["PHP_SELF"] . '?action=editIRPF&token=' . newToken() . '&socid=' . $object->id . '">' . img_edit($langs->transnoentitiesnoconv('Edit'), 1) . '</td>';
                    if ($action == 'editIRPF') {
                        print '<td class="left">';
                        $formcompany->select_localtax(2, $object->localtax2_value, "lt2");
                        print '<input type="submit" class="button button-edit" value="' . $langs->trans("Modify") . '"></td>';
                    } else {
                        print '<td>' . $object->localtax2_value . '</td>';
                    }
                    print '</tr></form>';
                }
            }
        }

        // Sale tax code (VAT code)
        print '<tr>';
        print '<td class="nowrap">' . $langs->trans('VATIntra') . '</td><td>';
        if ($object->tva_intra) {
            $s = '';
            $s .= showValueWithClipboardCPButton(dol_escape_htmltag($object->tva_intra));
            $s .= '<input type="hidden" id="tva_intra" name="tva_intra" maxlength="20" value="' . $object->tva_intra . '">';

            if (empty($conf->global->MAIN_DISABLEVATCHECK) && isInEEC($object)) {
                $s .= ' &nbsp; ';

                if ($conf->use_javascript_ajax) {
                    $widthpopup = 600;
                    if (!empty($conf->dol_use_jmobile)) {
                        $widthpopup = 350;
                    }
                    $heightpopup = 400;
                    print "\n";
                    print '<script language="JavaScript" type="text/javascript">';
                    print "function CheckVAT(a) {\n";
                    print "newpopup('" . DOL_URL_ROOT . "/Modules/Societes/checkvat/checkVatPopup.php?vatNumber='+a, '" . dol_escape_js($langs->trans("VATIntraCheckableOnEUSite")) . "', " . $widthpopup . ", " . $heightpopup . ");\n";
                    print "}\n";
                    print '</script>';
                    print "\n";
                    $s .= '<a href="#" class="hideonsmartphone" onclick="javascript: CheckVAT( $(\'#tva_intra\').val() );">' . $langs->trans("VATIntraCheck") . '</a>';
                    $s = $form->textwithpicto($s, $langs->trans("VATIntraCheckDesc", $langs->transnoentitiesnoconv("VATIntraCheck")), 1);
                } else {
                    $s .= '<a href="' . $langs->transcountry("VATIntraCheckURL", $object->country_id) . '" class="hideonsmartphone" target="_blank">' . img_picto($langs->trans("VATIntraCheckableOnEUSite"), 'help') . '</a>';
                }
            }
            print $s;
        } else {
            print '&nbsp;';
        }
        print '</td></tr>';

        // Warehouse
        if (!empty($conf->stock->enabled) && !empty($conf->global->SOCIETE_ASK_FOR_WAREHOUSE)) {
            $langs->load('stocks');
            require_once DOL_DOCUMENT_ROOT . '/Modules/Products/class/html.formproduct.class.php';
            $formproduct = new FormProduct($db);
            print '<tr class="nowrap">';
            print '<td>';
            print $form->editfieldkey("Warehouse", 'warehouse', '', $object, $user->rights->societe->creer);
            print '</td><td>';
            if ($action == 'editwarehouse') {
                $formproduct->formSelectWarehouses($_SERVER['PHP_SELF'] . '?id=' . $object->id, $object->fk_warehouse, 'fk_warehouse', 1);
            } else {
                if ($object->fk_warehouse > 0) {
                    print img_picto('', 'stock', 'class="paddingrightonly"');
                }
                $formproduct->formSelectWarehouses($_SERVER['PHP_SELF'] . '?id=' . $object->id, $object->fk_warehouse, 'none');
            }
            print '</td>';
            print '</tr>';
        }

        print '</table>';
        print '</div>';

        print '<div class="fichehalfright"><div class="ficheaddleft">';

        print '<div class="underbanner clearboth"></div>';
        print '<table class="border tableforfield" width="100%">';

        // Tags / categories
        if (!empty($conf->categorie->enabled) && !empty($user->rights->categorie->lire)) {
            // Customer
            if ($object->prospect || $object->client || (!$object->fournisseur && !empty($conf->global->THIRDPARTY_CAN_HAVE_CATEGORY_EVEN_IF_NOT_CUSTOMER_PROSPECT_SUPPLIER))) {
                print '<tr><td>' . $langs->trans("CustomersCategoriesShort") . '</td>';
                print '<td>';
                print $form->showCategories($object->id, Categorie::TYPE_CUSTOMER, 1);
                print "</td></tr>";
            }

            // Supplier
            if (((!empty($conf->fournisseur->enabled) && !empty($user->rights->fournisseur->lire) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || (!empty($conf->supplier_order->enabled) && !empty($user->rights->supplier_order->lire)) || (!empty($conf->supplier_invoice->enabled) && !empty($user->rights->supplier_invoice->lire))) && $object->fournisseur) {
                print '<tr><td>' . $langs->trans("SuppliersCategoriesShort") . '</td>';
                print '<td>';
                print $form->showCategories($object->id, Categorie::TYPE_SUPPLIER, 1);
                print "</td></tr>";
            }
        }

        // Third-Party Type
        print '<tr><td>';
        print '<table class="nobordernopadding" width="100%"><tr><td>' . $langs->trans('ThirdPartyType') . '</td>';
        if ($action != 'editthirdpartytype' && $user->rights->societe->creer) {
            print '<td class="right"><a class="editfielda" href="' . $_SERVER["PHP_SELF"] . '?action=editthirdpartytype&token=' . newToken() . '&socid=' . $object->id . '">' . img_edit($langs->transnoentitiesnoconv('Edit'), 1) . '</a></td>';
        }
        print '</tr></table>';
        print '</td><td>';
        $html_name = ($action == 'editthirdpartytype') ? 'typent_id' : 'none';
        $formcompany->formThirdpartyType($_SERVER['PHP_SELF'] . '?socid=' . $object->id, $object->typent_id, $html_name, '');
        print '</td></tr>';

        // Workforce/Staff
        if (empty($conf->global->SOCIETE_DISABLE_WORKFORCE)) {
            print '<tr><td>' . $langs->trans("Workforce") . '</td><td>' . $object->effectif . '</td></tr>';
        }

        // Legal
        print '<tr><td class="titlefield">' . $langs->trans('JuridicalStatus') . '</td><td>' . $object->forme_juridique . '</td></tr>';

        // Capital
        print '<tr><td>' . $langs->trans('Capital') . '</td><td>';
        if ($object->capital) {
            print price($object->capital, '', $langs, 0, -1, -1, $conf->currency);
        } else {
            print '&nbsp;';
        }
        print '</td></tr>';

        // Default language
        if (!empty($conf->global->MAIN_MULTILANGS)) {
            require_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';
            print '<tr><td>' . $langs->trans("DefaultLang") . '</td><td>';
            //$s=picto_from_langcode($object->default_lang);
            //print ($s?$s.' ':'');
            $langs->load("languages");
            $labellang = ($object->default_lang ? $langs->trans('Language_' . $object->default_lang) : '');
            print picto_from_langcode($object->default_lang, 'class="paddingrightonly saturatemedium opacitylow"');
            print $labellang;
            print '</td></tr>';
        }

        // Incoterms
        if (!empty($conf->incoterm->enabled)) {
            print '<tr><td>';
            print '<table width="100%" class="nobordernopadding"><tr><td>' . $langs->trans('IncotermLabel') . '</td>';
            if ($action != 'editincoterm' && $user->rights->societe->creer) {
                print '<td class="right"><a class="editfielda" href="' . $_SERVER["PHP_SELF"] . '?socid=' . $object->id . '&action=editincoterm&token=' . newToken() . '">' . img_edit('', 1) . '</a></td>';
            }
            print '</tr></table>';
            print '</td><td colspan="3">';
            if ($action != 'editincoterm') {
                print $form->textwithpicto($object->display_incoterms(), $object->label_incoterms, 1);
            } else {
                print $form->select_incoterms((!empty($object->fk_incoterms) ? $object->fk_incoterms : ''), (!empty($object->location_incoterms) ? $object->location_incoterms : ''), $_SERVER['PHP_SELF'] . '?socid=' . $object->id);
            }
            print '</td></tr>';
        }

        // Multicurrency
        if (!empty($conf->multicurrency->enabled)) {
            print '<tr>';
            print '<td>' . $form->editfieldkey('Currency', 'multicurrency_code', '', $object, 0) . '</td>';
            print '<td>';
            print !empty($object->multicurrency_code) ? currency_name($object->multicurrency_code, 1) : '';
            print '</td></tr>';
        }

        if (!empty($conf->global->ACCOUNTANCY_USE_PRODUCT_ACCOUNT_ON_THIRDPARTY)) {
            // Accountancy sell code
            print '<tr><td class="nowrap">';
            print $langs->trans("ProductAccountancySellCode");
            print '</td><td colspan="2">';
            if (!empty($conf->accounting->enabled)) {
                if (!empty($object->accountancy_code_sell)) {
                    $accountingaccount = new AccountingAccount($db);
                    $accountingaccount->fetch('', $object->accountancy_code_sell, 1);

                    print $accountingaccount->getNomUrl(0, 1, 1, '', 1);
                }
            } else {
                print $object->accountancy_code_sell;
            }
            print '</td></tr>';

            // Accountancy buy code
            print '<tr><td class="nowrap">';
            print $langs->trans("ProductAccountancyBuyCode");
            print '</td><td colspan="2">';
            if (!empty($conf->accounting->enabled)) {
                if (!empty($object->accountancy_code_buy)) {
                    $accountingaccount2 = new AccountingAccount($db);
                    $accountingaccount2->fetch('', $object->accountancy_code_buy, 1);

                    print $accountingaccount2->getNomUrl(0, 1, 1, '', 1);
                }
            } else {
                print $object->accountancy_code_buy;
            }
            print '</td></tr>';
        }

        // Other attributes
        $parameters = ['socid' => $socid, 'colspan' => ' colspan="3"', 'colspanvalue' => '3'];
        include DOL_DOCUMENT_ROOT . '/core/tpl/extrafields_view.tpl.php';

        // Parent company
        if (empty($conf->global->SOCIETE_DISABLE_PARENTCOMPANY)) {
            print '<tr><td>';
            print '<table class="nobordernopadding" width="100%"><tr><td>' . $langs->trans('ParentCompany') . '</td>';
            if ($action != 'editparentcompany' && $user->rights->societe->creer) {
                print '<td class="right"><a class="editfielda" href="' . $_SERVER["PHP_SELF"] . '?action=editparentcompany&token=' . newToken() . '&socid=' . $object->id . '">' . img_edit($langs->transnoentitiesnoconv('Edit'), 1) . '</a></td>';
            }
            print '</tr></table>';
            print '</td><td>';
            $html_name = ($action == 'editparentcompany') ? 'parent_id' : 'none';
            $form->form_thirdparty($_SERVER['PHP_SELF'] . '?socid=' . $object->id, $object->parent, $html_name, '', 1, 0, 0, null, 0, [$object->id]);
            print '</td></tr>';
        }

        // Sales representative
        include DOL_DOCUMENT_ROOT . '/Modules/Societes/tpl/linesalesrepresentative.tpl.php';

        // Module Adherent
        if (!empty($conf->adherent->enabled)) {
            $langs->load("members");
            print '<tr><td>' . $langs->trans("LinkedToDolibarrMember") . '</td>';
            print '<td>';
            $adh = new Adherent($db);
            $result = $adh->fetch('', '', $object->id);
            if ($result > 0) {
                $adh->ref = $adh->getFullName($langs);
                print $adh->getNomUrl(-1);
            } else {
                print '<span class="opacitymedium">' . $langs->trans("ThirdpartyNotLinkedToMember") . '</span>';
            }
            print "</td></tr>\n";
        }

        // Webservices url/key
        if (!empty($conf->syncsupplierwebservices->enabled)) {
            print '<tr><td>' . $langs->trans("WebServiceURL") . '</td><td>' . dol_print_url($object->webservices_url) . '</td>';
            print '<td class="nowrap">' . $langs->trans('WebServiceKey') . '</td><td>' . $object->webservices_key . '</td></tr>';
        }

        print '</table>';
        print '</div>';

        print '</div></div>';
        print '<div style="clear:both"></div>';

        print dol_get_fiche_end();

        /*
		 *  Actions
		 */
        if ($action != 'presend') {
            print '<div class="tabsAction">' . "\n";

            $parameters = [];
            $reshook = $hookmanager->executeHooks('addMoreActionsButtons', $parameters, $object, $action); // Note that $action and $object may have been modified by hook
            if (empty($reshook)) {
                $at_least_one_email_contact = false;
                $TContact = $object->contact_array_objects();
                foreach ($TContact as &$contact) {
                    if (!empty($contact->email)) {
                        $at_least_one_email_contact = true;
                        break;
                    }
                }

                if (empty($user->socid)) {
                    if (!empty($object->email) || $at_least_one_email_contact) {
                        $langs->load("mails");
                        print '<a class="butAction" href="' . $_SERVER['PHP_SELF'] . '?socid=' . $object->id . '&action=presend&mode=init#formmailbeforetitle">' . $langs->trans('SendMail') . '</a>' . "\n";
                    } else {
                        $langs->load("mails");
                        print '<a class="butActionRefused classfortooltip" href="#" title="' . dol_escape_htmltag($langs->trans("NoEMail")) . '">' . $langs->trans('SendMail') . '</a>' . "\n";
                    }
                }

                if ($user->rights->societe->creer) {
                    print '<a class="butAction" href="' . $_SERVER["PHP_SELF"] . '?socid=' . $object->id . '&action=edit&token=' . newToken() . '">' . $langs->trans("Modify") . '</a>' . "\n";
                }

                if (!empty($conf->adherent->enabled)) {
                    $adh = new Adherent($db);
                    $result = $adh->fetch('', '', $object->id);
                    if ($result == 0 && ($object->client == 1 || $object->client == 3) && !empty($conf->global->MEMBER_CAN_CONVERT_CUSTOMERS_TO_MEMBERS)) {
                        print '<a class="butAction" href="' . DOL_URL_ROOT . '/Modules/Adherents/card.php?&action=create&socid=' . $object->id . '" title="' . dol_escape_htmltag($langs->trans("NewMember")) . '">' . $langs->trans("NewMember") . '</a>' . "\n";
                    }
                }

                if ($user->rights->societe->supprimer) {
                    print '<a class="butActionDelete" href="card.php?action=merge&socid=' . $object->id . '" title="' . dol_escape_htmltag($langs->trans("MergeThirdparties")) . '">' . $langs->trans('Merge') . '</a>' . "\n";
                }

                if ($user->rights->societe->supprimer) {
                    if ($conf->use_javascript_ajax && empty($conf->dol_use_jmobile)) {    // We can't use preloaded confirm form with jmobile
                        print '<span id="action-delete" class="butActionDelete">' . $langs->trans('Delete') . '</span>' . "\n";
                    } else {
                        print '<a class="butActionDelete" href="' . $_SERVER["PHP_SELF"] . '?socid=' . $object->id . '&action=delete&token=' . newToken() . '">' . $langs->trans('Delete') . '</a>' . "\n";
                    }
                }
            }

            print '</div>' . "\n";
        }

        //Select mail models is same action as presend
        if (GETPOST('modelselected')) {
            $action = 'presend';
        }

        if ($action != 'presend') {
            print '<div class="fichecenter"><div class="fichehalfleft">';

            if (empty($conf->global->SOCIETE_DISABLE_BUILDDOC)) {
                print '<a name="builddoc"></a>'; // ancre

                /*
				 * Generated documents
				 */
                $filedir = $conf->societe->multidir_output[$object->entity] . '/' . $object->id;
                $urlsource = $_SERVER["PHP_SELF"] . "?socid=" . $object->id;
                $genallowed = $user->rights->societe->lire;
                $delallowed = $user->rights->societe->creer;

                print $formfile->showdocuments('company', $object->id, $filedir, $urlsource, $genallowed, $delallowed, $object->model_pdf, 0, 0, 0, 28, 0, 'entity=' . $object->entity, 0, '', $object->default_lang);
            }

            // Subsidiaries list
            if (empty($conf->global->SOCIETE_DISABLE_SUBSIDIARIES)) {
                $result = show_subsidiaries($conf, $langs, $db, $object);
            }

            print '</div><div class="fichehalfright"><div class="ficheaddleft">';

            $MAXEVENT = 10;

            $morehtmlright = dolGetButtonTitle($langs->trans('SeeAll'), '', 'fa fa-list-alt imgforviewmode', DOL_URL_ROOT . '/Modules/Societes/agenda.php?socid=' . $object->id);

            // List of actions on element
            include_once DOL_DOCUMENT_ROOT . '/core/class/html.formactions.class.php';
            $formactions = new FormActions($db);
            $somethingshown = $formactions->showactions($object, '', $socid, 1, '', $MAXEVENT, '', $morehtmlright); // Show all action for thirdparty

            print '</div></div></div>';

            if (!empty($conf->global->MAIN_DUPLICATE_CONTACTS_TAB_ON_MAIN_CARD)) {
                // Contacts list
                if (empty($conf->global->SOCIETE_DISABLE_CONTACTS)) {
                    $result = show_contacts($conf, $langs, $db, $object, $_SERVER["PHP_SELF"] . '?socid=' . $object->id);
                }

                // Addresses list
                if (!empty($conf->global->SOCIETE_ADDRESSES_MANAGEMENT)) {
                    $result = show_addresses($conf, $langs, $db, $object, $_SERVER["PHP_SELF"] . '?socid=' . $object->id);
                }
            }
        }

        // Presend form
        $modelmail = 'thirdparty';
        $defaulttopic = 'Information';
        $diroutput = $conf->societe->dir_output;
        $trackid = 'thi' . $object->id;

        include DOL_DOCUMENT_ROOT . '/core/tpl/card_presend.tpl.php';
    }
}
// End of page
llxFooter();
$db->close();
