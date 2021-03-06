<?php
/* Copyright (C) 2001-2007  Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2003       Brian Fraval            <brian@fraval.org>
 * Copyright (C) 2004-2015  Laurent Destailleur     <eldy@users.sourceforge.net>
 * Copyright (C) 2005       Eric Seigne             <eric.seigne@ryxeo.com>
 * Copyright (C) 2005-2017  Regis Houssin           <regis.houssin@inodbox.com>
 * Copyright (C) 2008       Patrick Raguin          <patrick.raguin@auguria.net>
 * Copyright (C) 2010-2020  Juanjo Menent           <jmenent@2byte.es>
 * Copyright (C) 2011-2013  Alexandre Spangaro      <aspangaro@open-dsi.fr>
 * Copyright (C) 2015       Jean-François Ferry     <jfefe@aternatik.fr>
 * Copyright (C) 2015       Marcos García           <marcosgdf@gmail.com>
 * Copyright (C) 2015       Raphaël Doursenaud      <rdoursenaud@gpcsolutions.fr>
 * Copyright (C) 2018       Nicolas ZABOURI	        <info@inovea-conseil.com>
 * Copyright (C) 2018       Ferran Marcet		    <fmarcet@2byte.es.com>
 * Copyright (C) 2018-2021  Frédéric France         <frederic.france@netlogic.fr>
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

// Descend to the htdocs folder
chdir('../../..');
define('BASE_FOLDER', getcwd());

/**
 *  \file       htdocs/societe/card.php
 *  \ingroup    societe
 *  \brief      Third party card page
 */

/**
 * TODO: Temporarily defined constants
 */
const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;

require 'main.php';

require_once DOL_DOCUMENT_ROOT . '/core/lib/company.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/images.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/files.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/functions.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formadmin.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formcompany.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formfile.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/extrafields.class.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Contacts/class/contact.class.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Categories/class/categorie.class.php';
if (!empty($conf->adherent->enabled)) {
    require_once DOL_DOCUMENT_ROOT . '/Modules/Adherents/class/adherent.class.php';
}
if (!empty($conf->accounting->enabled)) {
    require_once DOL_DOCUMENT_ROOT . '/core/lib/accounting.lib.php';
}
if (!empty($conf->accounting->enabled)) {
    require_once DOL_DOCUMENT_ROOT . '/core/class/html.formaccounting.class.php';
}
if (!empty($conf->accounting->enabled)) {
    require_once DOL_DOCUMENT_ROOT . '/Modules/Accountancy/class/accountingaccount.class.php';
}
if (!empty($conf->eventorganization->enabled)) {
    require_once DOL_DOCUMENT_ROOT . '/Modules/Eventorganization/class/conferenceorboothattendee.class.php';
}

$langs->loadLangs(["companies", "commercial", "bills", "banks", "users"]);
if (!empty($conf->adherent->enabled)) {
    $langs->load("members");
}
if (!empty($conf->categorie->enabled)) {
    $langs->load("categories");
}
if (!empty($conf->incoterm->enabled)) {
    $langs->load("incoterm");
}
if (!empty($conf->notification->enabled)) {
    $langs->load("mails");
}

$error = 0;
$errors = [];

$action = (GETPOST('action', 'aZ09') ? GETPOST('action', 'aZ09') : 'view');
$cancel = GETPOST('cancel', 'alpha');
$backtopage = GETPOST('backtopage', 'alpha');
$confirm = GETPOST('confirm', 'alpha');

$socid = GETPOST('socid', 'int') ? GETPOST('socid', 'int') : GETPOST('id', 'int');
if ($user->socid) {
    $socid = $user->socid;
}
if (empty($socid) && $action == 'view') {
    $action = 'create';
}
$id = $socid;

$object = new Societe($db);
$extrafields = new ExtraFields($db);

// fetch optionals attributes and labels
$extrafields->fetch_name_optionals_label($object->table_element);

$socialnetworks = getArrayOfSocialNetworks();

// Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
$hookmanager->initHooks(['thirdpartycard', 'globalcard']);

if ($socid > 0) {
    $object->fetch($socid);
}

if (!($object->id > 0) && $action == 'view') {
    $langs->load("errors");
    print($langs->trans('ErrorRecordNotFound'));
    exit;
}

// Get object canvas (By default, this is not defined, so standard usage of dolibarr)
$canvas = $object->canvas ? $object->canvas : GETPOST("canvas");
$objcanvas = null;
if (!empty($canvas)) {
    require_once DOL_DOCUMENT_ROOT . '/core/class/canvas.class.php';
    $objcanvas = new Canvas($db, $action);
    $objcanvas->getCanvas('thirdparty', 'card', $canvas);
}

$permissiontoread = $user->rights->societe->lire;
$permissiontoadd = $user->rights->societe->creer; // Used by the include of actions_addupdatedelete.inc.php and actions_lineupdown.inc.php
$permissiontodelete = $user->rights->societe->supprimer || ($permissiontoadd && isset($object->status) && $object->status == 0);
$permissionnote = $user->rights->societe->creer; // Used by the include of actions_setnotes.inc.php
$permissiondellink = $user->rights->societe->creer; // Used by the include of actions_dellink.inc.php
$upload_dir = $conf->societe->multidir_output[isset($object->entity) ? $object->entity : 1];

// Security check
$result = restrictedArea($user, 'societe', $socid, '&societe', '', 'fk_soc', 'rowid', 0);

/*
if ($object->id > 0) {
	if ($object->client == 0 && $object->fournisseur > 0) {
		if (!empty($user->rights->fournisseur->lire)) {
			accessforbidden();
		}
	}
}
*/

/*
 * Actions
 */

$parameters = ['id' => $socid, 'objcanvas' => $objcanvas];
$reshook = $hookmanager->executeHooks('doActions', $parameters, $object, $action); // Note that $action and $object may have been modified by some hooks
if ($reshook < 0) {
    setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
}

if (empty($reshook)) {
    $backurlforlist = DOL_URL_ROOT . '/Modules/Societes/list.php';

    if (empty($backtopage) || ($cancel && empty($id))) {
        if (empty($backtopage) || ($cancel && strpos($backtopage, '__ID__'))) {
            if (empty($id) && (($action != 'add' && $action != 'create') || $cancel)) {
                $backtopage = $backurlforlist;
            } else {
                $backtopage = DOL_URL_ROOT . '/index.php?module=societes&controller=card&id=' . ((!empty($id) && $id > 0) ? $id : '__ID__');
            }
        }
    }

    if ($cancel) {
        if (!empty($backtopageforcancel)) {
            header("Location: " . $backtopageforcancel);
            exit;
        } elseif (!empty($backtopage)) {
            header("Location: " . $backtopage);
            exit;
        }
        $action = '';
    }

    if ($action == 'confirm_merge' && $confirm == 'yes' && $user->rights->societe->creer) {
        $error = 0;
        $soc_origin_id = GETPOST('soc_origin', 'int');
        $soc_origin = new Societe($db);

        if ($soc_origin_id <= 0) {
            $langs->load('errors');
            setEventMessages($langs->trans('ErrorThirdPartyIdIsMandatory', $langs->transnoentitiesnoconv('MergeOriginThirdparty')), null, 'errors');
        } else {
            if (!$error && $soc_origin->fetch($soc_origin_id) < 1) {
                setEventMessages($langs->trans('ErrorRecordNotFound'), null, 'errors');
                $error++;
            }

            if (!$error) {
                // TODO Move the merge function into class of object.

                $db->begin();

                // Recopy some data
                $object->client = $object->client | $soc_origin->client;
                $object->fournisseur = $object->fournisseur | $soc_origin->fournisseur;
                $listofproperties = [
                    'address', 'zip', 'town', 'state_id', 'country_id', 'phone', 'phone_pro', 'fax', 'email', 'skype', 'twitter', 'facebook', 'linkedin', 'socialnetworks', 'url', 'barcode',
                    'idprof1', 'idprof2', 'idprof3', 'idprof4', 'idprof5', 'idprof6',
                    'tva_intra', 'effectif_id', 'forme_juridique', 'remise_percent', 'remise_supplier_percent', 'mode_reglement_supplier_id', 'cond_reglement_supplier_id', 'name_bis',
                    'stcomm_id', 'outstanding_limit', 'price_level', 'parent', 'default_lang', 'ref', 'ref_ext', 'import_key', 'fk_incoterms', 'fk_multicurrency',
                    'code_client', 'code_fournisseur', 'code_compta', 'code_compta_fournisseur',
                    'model_pdf', 'fk_projet',
                ];
                foreach ($listofproperties as $property) {
                    if (empty($object->$property)) {
                        $object->$property = $soc_origin->$property;
                    }
                }

                // Concat some data
                $listofproperties = [
                    'note_public', 'note_private',
                ];
                foreach ($listofproperties as $property) {
                    $object->$property = dol_concatdesc($object->$property, $soc_origin->$property);
                }

                // Merge extrafields
                if (is_array($soc_origin->array_options)) {
                    foreach ($soc_origin->array_options as $key => $val) {
                        if (empty($object->array_options[$key])) {
                            $object->array_options[$key] = $val;
                        }
                    }
                }

                // Merge categories
                $static_cat = new Categorie($db);

                $custcats_ori = $static_cat->containing($soc_origin->id, 'customer', 'id');
                $custcats = $static_cat->containing($object->id, 'customer', 'id');
                $custcats = array_merge($custcats, $custcats_ori);
                $object->setCategories($custcats, 'customer');

                $suppcats_ori = $static_cat->containing($soc_origin->id, 'supplier', 'id');
                $suppcats = $static_cat->containing($object->id, 'supplier', 'id');
                $suppcats = array_merge($suppcats, $suppcats_ori);
                $object->setCategories($suppcats, 'supplier');

                // If thirdparty has a new code that is same than origin, we clean origin code to avoid duplicate key from database unique keys.
                if ($soc_origin->code_client == $object->code_client
                    || $soc_origin->code_fournisseur == $object->code_fournisseur
                    || $soc_origin->barcode == $object->barcode) {
                    dol_syslog("We clean customer and supplier code so we will be able to make the update of target");
                    $soc_origin->code_client = '';
                    $soc_origin->code_fournisseur = '';
                    $soc_origin->barcode = '';
                    $soc_origin->update($soc_origin->id, $user, 0, 1, 1, 'merge');
                }

                // Update
                $result = $object->update($object->id, $user, 0, 1, 1, 'merge');
                if ($result < 0) {
                    setEventMessages($object->error, $object->errors, 'errors');
                    $error++;
                }

                // Move links
                if (!$error) {
                    // This list is also into the api_thirdparties.class.php
                    // TODO Mutualise the list into object societe.class.php
                    $objects = [
                        'Adherent' => '/Modules/Adherents/class/adherent.class.php',
                        'Don' => '/Modules/Don/class/don.class.php',
                        'Societe' => '/Modules/Societes/class/societe.class.php',
                        //'Categorie' => '/Modules/Categories/class/categorie.class.php',
                        'ActionComm' => '/Modules/Comm/action/class/actioncomm.class.php',
                        'Propal' => '/Modules/Comm/propal/class/propal.class.php',
                        'Commande' => '/Modules/Commande/class/commande.class.php',
                        'Facture' => '/Modules/Compta/facture/class/facture.class.php',
                        'FactureRec' => '/Modules/Compta/facture/class/facture-rec.class.php',
                        'LignePrelevement' => '/Modules/Compta/prelevement/class/ligneprelevement.class.php',
                        'Mo' => '/Modules/Mrp/class/mo.class.php',
                        'Contact' => '/Modules/Contacts/class/contact.class.php',
                        'Contrat' => '/Modules/Contrats/class/contrat.class.php',
                        'Expedition' => '/Modules/Expedition/class/expedition.class.php',
                        'Fichinter' => '/Modules/Fichinter/class/fichinter.class.php',
                        'CommandeFournisseur' => '/Modules/Fourn/class/fournisseur.commande.class.php',
                        'FactureFournisseur' => '/Modules/Fourn/class/fournisseur.facture.class.php',
                        'SupplierProposal' => '/supplier_proposal/class/supplier_proposal.class.php',
                        'ProductFournisseur' => '/Modules/Fourn/class/fournisseur.product.class.php',
                        'Delivery' => '/delivery/class/delivery.class.php',
                        'Product' => '/Modules/Products/class/product.class.php',
                        'Project' => '/Modules/Projects/class/project.class.php',
                        'Ticket' => '/Modules/Tickets/class/ticket.class.php',
                        'User' => '/Modules/Users/class/user.class.php',
                        'Account' => '/Modules/Compta/bank/class/account.class.php',
                        'ConferenceOrBoothAttendee' => '/Modules/Eventorganization/class/conferenceorboothattendee.class.php',
                    ];

                    //First, all core objects must update their tables
                    foreach ($objects as $object_name => $object_file) {
                        require_once DOL_DOCUMENT_ROOT . $object_file;

                        if (!$error && !$object_name::replaceThirdparty($db, $soc_origin->id, $object->id)) {
                            $error++;
                            setEventMessages($db->lasterror(), null, 'errors');
                            break;
                        }
                    }
                }

                // External modules should update their ones too
                if (!$error) {
                    $reshook = $hookmanager->executeHooks('replaceThirdparty', [
                        'soc_origin' => $soc_origin->id,
                        'soc_dest' => $object->id,
                    ], $object, $action);

                    if ($reshook < 0) {
                        setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
                        $error++;
                    }
                }

                if (!$error) {
                    $object->context = ['merge' => 1, 'mergefromid' => $soc_origin->id];

                    // Call trigger
                    $result = $object->call_trigger('COMPANY_MODIFY', $user);
                    if ($result < 0) {
                        setEventMessages($object->error, $object->errors, 'errors');
                        $error++;
                    }
                    // End call triggers
                }

                if (!$error) {
                    //We finally remove the old thirdparty
                    if ($soc_origin->delete($soc_origin->id, $user) < 1) {
                        $error++;
                    }
                }

                if (!$error) {
                    setEventMessages($langs->trans('ThirdpartiesMergeSuccess'), null, 'mesgs');
                    $db->commit();
                } else {
                    $langs->load("errors");
                    setEventMessages($langs->trans('ErrorsThirdpartyMerge'), null, 'errors');
                    $db->rollback();
                }
            }
        }
    }

    if (GETPOST('getcustomercode')) {
        // We defined value code_client
        $_POST["customer_code"] = "Acompleter";
    }

    if (GETPOST('getsuppliercode')) {
        // We defined value code_fournisseur
        $_POST["supplier_code"] = "Acompleter";
    }

    if ($action == 'set_localtax1') {
        //obtidre selected del combobox
        $value = GETPOST('lt1');
        $object->fetch($socid);
        $res = $object->setValueFrom('localtax1_value', $value, '', null, 'text', '', $user, 'COMPANY_MODIFY');
    }
    if ($action == 'set_localtax2') {
        //obtidre selected del combobox
        $value = GETPOST('lt2');
        $object->fetch($socid);
        $res = $object->setValueFrom('localtax2_value', $value, '', null, 'text', '', $user, 'COMPANY_MODIFY');
    }

    if ($action == 'update_extras') {
        $object->fetch($socid);

        $object->oldcopy = dol_clone($object);

        // Fill array 'array_options' with data from update form
        $extrafields->fetch_name_optionals_label($object->table_element);

        $ret = $extrafields->setOptionalsFromPost(null, $object, GETPOST('attribute', 'restricthtml'));
        if ($ret < 0) {
            $error++;
        }

        if (!$error) {
            $result = $object->insertExtraFields('COMPANY_MODIFY');
            if ($result < 0) {
                setEventMessages($object->error, $object->errors, 'errors');
                $error++;
            }
        }

        if ($error) {
            $action = 'edit_extras';
        }
    }

    // Add new or update third party
    if ((!GETPOST('getcustomercode') && !GETPOST('getsuppliercode'))
        && ($action == 'add' || $action == 'update') && $user->rights->societe->creer) {
        require_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';

        if (!GETPOST('name')) {
            setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("ThirdPartyName")), null, 'errors');
            $error++;
        }
        if (GETPOST('client') < 0) {
            setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("ProspectCustomer")), null, 'errors');
            $error++;
        }
        if (GETPOST('fournisseur') < 0) {
            setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("Supplier")), null, 'errors');
            $error++;
        }

        if (!empty($conf->mailing->enabled) && !empty($conf->global->MAILING_CONTACT_DEFAULT_BULK_STATUS) && $conf->global->MAILING_CONTACT_DEFAULT_BULK_STATUS == 2 && GETPOST('contact_no_email', 'int') == -1 && !empty(GETPOST('email', 'custom', 0, FILTER_SANITIZE_EMAIL))) {
            $error++;
            setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentities("No_Email")), null, 'errors');
        }

        if (!empty($conf->mailing->enabled) && GETPOST("private", 'int') == 1 && !empty($conf->global->MAILING_CONTACT_DEFAULT_BULK_STATUS) && $conf->global->MAILING_CONTACT_DEFAULT_BULK_STATUS == 2 && GETPOST('contact_no_email', 'int') == -1 && !empty(GETPOST('email', 'custom', 0, FILTER_SANITIZE_EMAIL))) {
            $error++;
            setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentities("No_Email")), null, 'errors');
        }

        if (!$error) {
            if ($action == 'update') {
                $ret = $object->fetch($socid);
                $object->oldcopy = clone $object;
            } else {
                $object->canvas = $canvas;
            }

            if (GETPOST("private", 'int') == 1) {    // Ask to create a contact
                $object->particulier = GETPOST("private", 'int');

                $object->name = dolGetFirstLastname(GETPOST('firstname', 'alphanohtml'), GETPOST('name', 'alphanohtml'));
                $object->civility_id = GETPOST('civility_id', 'alphanohtml'); // Note: civility id is a code, not an int
                // Add non official properties
                $object->name_bis = GETPOST('name', 'alphanohtml');
                $object->firstname = GETPOST('firstname', 'alphanohtml');
            } else {
                $object->name = GETPOST('name', 'alphanohtml');
            }
            $object->entity = (GETPOSTISSET('entity') ? GETPOST('entity', 'int') : $conf->entity);
            $object->name_alias = GETPOST('name_alias', 'alphanohtml');
            $object->address = GETPOST('address', 'alphanohtml');
            $object->zip = GETPOST('zipcode', 'alphanohtml');
            $object->town = GETPOST('town', 'alphanohtml');
            $object->country_id = GETPOST('country_id', 'int');
            $object->state_id = GETPOST('state_id', 'int');
            //$object->skype					= GETPOST('skype', 'alpha');
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
            $object->email = trim(GETPOST('email', 'custom', 0, FILTER_SANITIZE_EMAIL));
            $object->url = trim(GETPOST('url', 'custom', 0, FILTER_SANITIZE_URL));
            $object->idprof1 = trim(GETPOST('idprof1', 'alphanohtml'));
            $object->idprof2 = trim(GETPOST('idprof2', 'alphanohtml'));
            $object->idprof3 = trim(GETPOST('idprof3', 'alphanohtml'));
            $object->idprof4 = trim(GETPOST('idprof4', 'alphanohtml'));
            $object->idprof5 = trim(GETPOST('idprof5', 'alphanohtml'));
            $object->idprof6 = trim(GETPOST('idprof6', 'alphanohtml'));
            $object->prefix_comm = GETPOST('prefix_comm', 'alphanohtml');
            $object->code_client = GETPOSTISSET('customer_code') ? GETPOST('customer_code', 'alpha') : GETPOST('code_client', 'alpha');
            $object->code_fournisseur = GETPOSTISSET('supplier_code') ? GETPOST('supplier_code', 'alpha') : GETPOST('code_fournisseur', 'alpha');
            $object->capital = GETPOST('capital', 'alphanohtml');
            $object->barcode = GETPOST('barcode', 'alphanohtml');

            $object->tva_intra = GETPOST('tva_intra', 'alphanohtml');
            $object->tva_assuj = GETPOST('assujtva_value', 'alpha');
            $object->status = GETPOST('status', 'alpha');

            // Local Taxes
            $object->localtax1_assuj = GETPOST('localtax1assuj_value', 'alpha');
            $object->localtax2_assuj = GETPOST('localtax2assuj_value', 'alpha');

            $object->localtax1_value = GETPOST('lt1', 'alpha');
            $object->localtax2_value = GETPOST('lt2', 'alpha');

            $object->forme_juridique_code = GETPOST('forme_juridique_code', 'int');
            $object->effectif_id = GETPOST('effectif_id', 'int');
            $object->typent_id = GETPOST('typent_id', 'int');

            $object->typent_code = dol_getIdFromCode($db, $object->typent_id, 'c_typent', 'id', 'code'); // Force typent_code too so check in verify() will be done on new type

            $object->client = GETPOST('client', 'int');
            $object->fournisseur = GETPOST('fournisseur', 'int');

            $object->commercial_id = GETPOST('commercial_id', 'int');
            $object->default_lang = GETPOST('default_lang');

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

            // Incoterms
            if (!empty($conf->incoterm->enabled)) {
                $object->fk_incoterms = GETPOST('incoterm_id', 'int');
                $object->location_incoterms = GETPOST('location_incoterms', 'alpha');
            }

            // Multicurrency
            if (!empty($conf->multicurrency->enabled)) {
                $object->multicurrency_code = GETPOST('multicurrency_code', 'alpha');
            }

            // Fill array 'array_options' with data from add form
            $ret = $extrafields->setOptionalsFromPost(null, $object);
            if ($ret < 0) {
                $error++;
            }

            // Fill array 'array_languages' with data from add form
            $ret = $object->setValuesForExtraLanguages();
            if ($ret < 0) {
                $error++;
            }
            //var_dump($object->array_languages);exit;

            if (GETPOST('deletephoto')) {
                $object->logo = '';
            } elseif (!empty($_FILES['photo']['name'])) {
                $object->logo = dol_sanitizeFileName($_FILES['photo']['name']);
            }

            // Check parameters
            if (!GETPOST('cancel', 'alpha')) {
                if (!empty($object->email) && !isValidEMail($object->email)) {
                    $langs->load("errors");
                    $error++;
                    setEventMessages('', $langs->trans("ErrorBadEMail", $object->email), 'errors');
                }
                if (!empty($object->url) && !isValidUrl($object->url)) {
                    $langs->load("errors");
                    setEventMessages('', $langs->trans("ErrorBadUrl", $object->url), 'errors');
                }
                if (!empty($object->webservices_url)) {
                    //Check if has transport, without any the soap client will give error
                    if (strpos($object->webservices_url, "http") === false) {
                        $object->webservices_url = "http://" . $object->webservices_url;
                    }
                    if (!isValidUrl($object->webservices_url)) {
                        $langs->load("errors");
                        $error++;
                        $errors[] = $langs->trans("ErrorBadUrl", $object->webservices_url);
                    }
                }

                // We set country_id, country_code and country for the selected country
                $object->country_id = GETPOST('country_id', 'int') != '' ? GETPOST('country_id', 'int') : $mysoc->country_id;
                if ($object->country_id) {
                    $tmparray = getCountry($object->country_id, 'all');
                    $object->country_code = $tmparray['code'];
                    $object->country = $tmparray['label'];
                }
            }
        }

        if (!$error) {
            if ($action == 'add') {
                $error = 0;

                $db->begin();

                if (empty($object->client)) {
                    $object->code_client = '';
                }
                if (empty($object->fournisseur)) {
                    $object->code_fournisseur = '';
                }

                $result = $object->create($user);

                if ($result >= 0) {
                    if ($object->particulier) {
                        dol_syslog("We ask to create a contact/address too", LOG_DEBUG);
                        $contcats = GETPOST('contcats', 'array');
                        $no_email = GETPOST('contact_no_email', 'int');
                        $result = $object->create_individual($user, $no_email, $contcats);
                        if ($result < 0) {
                            setEventMessages($object->error, $object->errors, 'errors');
                            $error++;
                        }
                    }

                    // Links with users
                    $salesreps = GETPOST('commercial', 'array');
                    $result = $object->setSalesRep($salesreps, true);
                    if ($result < 0) {
                        $error++;
                        setEventMessages($object->error, $object->errors, 'errors');
                    }

                    // Customer categories association
                    $custcats = GETPOST('custcats', 'array');
                    $result = $object->setCategories($custcats, 'customer');
                    if ($result < 0) {
                        $error++;
                        setEventMessages($object->error, $object->errors, 'errors');
                    }

                    // Supplier categories association
                    $suppcats = GETPOST('suppcats', 'array');
                    $result = $object->setCategories($suppcats, 'supplier');
                    if ($result < 0) {
                        $error++;
                        setEventMessages($object->error, $object->errors, 'errors');
                    }

                    // Logo/Photo save
                    $dir = $conf->societe->multidir_output[$conf->entity] . "/" . $object->id . "/logos/";
                    $file_OK = is_uploaded_file($_FILES['photo']['tmp_name']);
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
                    } else {
                        switch ($_FILES['photo']['error']) {
                            case 1: //uploaded file exceeds the upload_max_filesize directive in php.ini
                            case 2: //uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the html form
                                $errors[] = "ErrorFileSizeTooLarge";
                                break;
                            case 3: //uploaded file was only partially uploaded
                                $errors[] = "ErrorFilePartiallyUploaded";
                                break;
                        }
                    }
                } else {
                    if ($result == -3 && in_array('ErrorCustomerCodeAlreadyUsed', $object->errors)) {
                        $duplicate_code_error = true;
                        $object->code_client = null;
                    }

                    if ($result == -3 && in_array('ErrorSupplierCodeAlreadyUsed', $object->errors)) {
                        $duplicate_code_error = true;
                        $object->code_fournisseur = null;
                    }

                    if ($db->lasterrno() == 'DB_ERROR_RECORD_ALREADY_EXISTS') {    // TODO Sometime errors on duplicate on profid and not on code, so we must manage this case
                        $duplicate_code_error = true;
                    }

                    setEventMessages($object->error, $object->errors, 'errors');
                    $error++;
                }

                if ($result >= 0 && !$error) {
                    $db->commit();

                    if (!empty($backtopage)) {
                        $backtopage = preg_replace('/--IDFORBACKTOPAGE--/', $object->id, $backtopage); // New method to autoselect project after a New on another form object creation
                        if (preg_match('/\?/', $backtopage)) {
                            $backtopage .= '&socid=' . $object->id; // Old method
                        }
                        header("Location: " . $backtopage);
                        exit;
                    } else {
                        $url = $_SERVER["PHP_SELF"] . "?socid=" . $object->id; // Old method
                        if (($object->client == 1 || $object->client == 3) && empty($conf->global->SOCIETE_DISABLE_CUSTOMERS)) {
                            $url = DOL_URL_ROOT . "/Modules/Comm/card.php?socid=" . $object->id;
                        } elseif ($object->fournisseur == 1) {
                            $url = DOL_URL_ROOT . "/Modules/Fourn/card.php?socid=" . $object->id;
                        }

                        header("Location: " . $url);
                        exit;
                    }
                } else {
                    $db->rollback();
                    $action = 'create';
                }
            }

            if ($action == 'update') {
                $error = 0;

                if (GETPOST('cancel', 'alpha')) {
                    if (!empty($backtopage)) {
                        header("Location: " . $backtopage);
                        exit;
                    } else {
                        header("Location: " . $_SERVER["PHP_SELF"] . "?socid=" . $socid);
                        exit;
                    }
                }

                // To not set code if third party is not concerned. But if it had values, we keep them.
                if (empty($object->client) && empty($object->oldcopy->code_client)) {
                    $object->code_client = '';
                }
                if (empty($object->fournisseur) && empty($object->oldcopy->code_fournisseur)) {
                    $object->code_fournisseur = '';
                }
                //var_dump($object);exit;

                $result = $object->update($socid, $user, 1, $object->oldcopy->codeclient_modifiable(), $object->oldcopy->codefournisseur_modifiable(), 'update', 0);

                if ($result <= 0) {
                    setEventMessages($object->error, $object->errors, 'errors');
                    $error++;
                }

                // Links with users
                $salesreps = GETPOST('commercial', 'array');
                $result = $object->setSalesRep($salesreps);
                if ($result < 0) {
                    $error++;
                    setEventMessages($object->error, $object->errors, 'errors');
                }

                // Prevent thirdparty's emptying if a user hasn't rights $user->rights->categorie->lire (in such a case, post of 'custcats' is not defined)
                if (!$error && !empty($user->rights->categorie->lire)) {
                    // Customer categories association
                    $categories = GETPOST('custcats', 'array');
                    $result = $object->setCategories($categories, 'customer');
                    if ($result < 0) {
                        $error++;
                        setEventMessages($object->error, $object->errors, 'errors');
                    }

                    // Supplier categories association
                    $categories = GETPOST('suppcats', 'array');
                    $result = $object->setCategories($categories, 'supplier');
                    if ($result < 0) {
                        $error++;
                        setEventMessages($object->error, $object->errors, 'errors');
                    }
                }

                // Logo/Photo save
                $dir = $conf->societe->multidir_output[$object->entity] . "/" . $object->id . "/logos";
                $file_OK = is_uploaded_file($_FILES['photo']['tmp_name']);
                if (GETPOST('deletephoto') && $object->logo) {
                    $fileimg = $dir . '/' . $object->logo;
                    $dirthumbs = $dir . '/thumbs';
                    dol_delete_file($fileimg);
                    dol_delete_dir_recursive($dirthumbs);
                }
                if ($file_OK) {
                    if (image_format_supported($_FILES['photo']['name']) > 0) {
                        dol_mkdir($dir);

                        if (@is_dir($dir)) {
                            $newfile = $dir . '/' . dol_sanitizeFileName($_FILES['photo']['name']);
                            $result = dol_move_uploaded_file($_FILES['photo']['tmp_name'], $newfile, 1);

                            if (!$result > 0) {
                                $errors[] = "ErrorFailedToSaveFile";
                            } else {
                                // Create thumbs
                                $object->addThumbs($newfile);

                                // Index file in database
                                if (!empty($conf->global->THIRDPARTY_LOGO_ALLOW_EXTERNAL_DOWNLOAD)) {
                                    require_once DOL_DOCUMENT_ROOT . '/core/lib/files.lib.php';
                                    // the dir dirname($newfile) is directory of logo, so we should have only one file at once into index, so we delete indexes for the dir
                                    deleteFilesIntoDatabaseIndex(dirname($newfile), '', '');
                                    // now we index the uploaded logo file
                                    addFileIntoDatabaseIndex(dirname($newfile), basename($newfile), '', 'uploaded', 1);
                                }
                            }
                        }
                    } else {
                        $errors[] = "ErrorBadImageFormat";
                    }
                } else {
                    switch ($_FILES['photo']['error']) {
                        case 1: //uploaded file exceeds the upload_max_filesize directive in php.ini
                        case 2: //uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the html form
                            $errors[] = "ErrorFileSizeTooLarge";
                            break;
                        case 3: //uploaded file was only partially uploaded
                            $errors[] = "ErrorFilePartiallyUploaded";
                            break;
                    }
                }
                // Gestion du logo de la société

                // Update linked member
                if (!$error && $object->fk_soc > 0) {
                    $sql = "UPDATE " . MAIN_DB_PREFIX . "adherent";
                    $sql .= " SET fk_soc = NULL WHERE fk_soc = " . ((int) $socid);
                    if (!$object->db->query($sql)) {
                        $error++;
                        $object->error .= $object->db->lasterror();
                        setEventMessages($object->error, $object->errors, 'errors');
                    }
                }

                if (!$error && !count($errors)) {
                    if (!empty($backtopage)) {
                        header("Location: " . $backtopage);
                        exit;
                    } else {
                        header("Location: " . $_SERVER["PHP_SELF"] . "?socid=" . $socid);
                        exit;
                    }
                } else {
                    $object->id = $socid;
                    $action = "edit";
                }
            }
        } else {
            $action = ($action == 'add' ? 'create' : 'edit');
        }
    }

    // Delete third party
    if ($action == 'confirm_delete' && $confirm == 'yes' && $user->rights->societe->supprimer) {
        $object->fetch($socid);
        $object->oldcopy = clone $object;
        $result = $object->delete($socid, $user);

        if ($result > 0) {
            header("Location: " . DOL_URL_ROOT . "/Modules/Societes/list.php?restore_lastsearch_values=1&delsoc=" . urlencode($object->name));
            exit;
        } else {
            $langs->load("errors");
            setEventMessages($object->error, $object->errors, 'errors');
            $error++;
            $action = '';
        }
    }

    // Set third-party type
    if ($action == 'set_thirdpartytype' && $user->rights->societe->creer) {
        $object->fetch($socid);
        $result = $object->setThirdpartyType(GETPOST('typent_id', 'int'));
    }

    // Set incoterm
    if ($action == 'set_incoterms' && $user->rights->societe->creer && !empty($conf->incoterm->enabled)) {
        $object->fetch($socid);
        $result = $object->setIncoterms(GETPOST('incoterm_id', 'int'), GETPOST('location_incoterms', 'alpha'));
    }

    // Set parent company
    if ($action == 'set_thirdparty' && $user->rights->societe->creer) {
        $object->fetch($socid);
        $result = $object->setParent(GETPOST('parent_id', 'int'));
    }

    // Set sales representatives
    if ($action == 'set_salesrepresentatives' && $user->rights->societe->creer) {
        $object->fetch($socid);
        $result = $object->setSalesRep(GETPOST('commercial', 'array'));
    }

    // warehouse
    if ($action == 'setwarehouse' && $user->rights->societe->creer) {
        $result = $object->setWarehouse(GETPOST('fk_warehouse', 'int'));
    }

    $id = $socid;
    $object->fetch($socid);

    // Selection of new fields
    if (!empty($conf->global->MAIN_DUPLICATE_CONTACTS_TAB_ON_MAIN_CARD) && (empty($conf->global->SOCIETE_DISABLE_CONTACTS) || !empty($conf->global->SOCIETE_ADDRESSES_MANAGEMENT))) {
        include DOL_DOCUMENT_ROOT . '/core/actions_changeselectedfields.inc.php';
    }

    // Actions to send emails
    $triggersendname = 'COMPANY_SENTBYMAIL';
    $paramname = 'socid';
    $mode = 'emailfromthirdparty';
    $trackid = 'thi' . $object->id;
    include DOL_DOCUMENT_ROOT . '/core/actions_sendmails.inc.php';

    // Actions to build doc
    $id = $socid;
    $upload_dir = $conf->societe->dir_output;
    $permissiontoadd = $user->rights->societe->creer;
    include DOL_DOCUMENT_ROOT . '/core/actions_builddoc.inc.php';
}

require_once DOL_DOCUMENT_ROOT . '/Modules/Societes/Views/card.php';
