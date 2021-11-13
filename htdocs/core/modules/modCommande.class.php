<?php
/* Copyright (C) 2003-2005	Rodolphe Quiedeville	<rodolphe@quiedeville.org>
 * Copyright (C) 2004-2013	Laurent Destailleur		<eldy@users.sourceforge.net>
 * Copyright (C) 2004		Sebastien Di Cintio		<sdicintio@ressource-toi.org>
 * Copyright (C) 2004		Benoit Mortier			<benoit.mortier@opensides.be>
 * Copyright (C) 2004		Eric Seigne				<eric.seigne@ryxeo.com>
 * Copyright (C) 2005-2012	Regis Houssin			<regis.houssin@inodbox.com>
 * Copyright (C) 2012		Juanjo Menent			<jmenent@2byte.es>
 * Copyright (C) 2020		Ahmad Jamaly Rabub		<rabib@metroworks.co.jp>
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
 *        \defgroup   commande     Module orders
 *        \brief      Module pour gerer le suivi des commandes
 *        \file       htdocs/core/modules/modCommande.class.php
 *        \ingroup    commande
 *        \brief      Description and activation file for the module command
 */

use Alxarafe\Dolibarr\Classes\DolibarrModules;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;

//include_once DOL_DOCUMENT_ROOT . '/core/modules/DolibarrModules.class.php';

/**
 *    Class to describe module customer orders
 */
class modCommande extends DolibarrModules
{

    /**
     *   Constructor. Define names, constants, directories, boxes, permissions
     */
    public function __construct()
    {
        parent::__construct();

        $this->numero = 25;

        $this->family = "crm";
        $this->module_position = '11';
        // Module label (no space allowed), used if translation string 'ModuleXXXName' not found (where XXX is value of numeric property 'numero' of module)
        $this->name = preg_replace('/^mod/i', '', get_class($this));
        $this->description = "Gestion des commandes clients";
        // Possible values for version are: 'development', 'experimental', 'dolibarr' or version
        $this->version = 'dolibarr';

        $this->const_name = 'MAIN_MODULE_' . strtoupper($this->name);
        $this->picto = 'order';

        // Data directories to create when module is enabled
        $this->dirs = ["/Modules/Commande/temp"];

        // Config pages
        $this->config_page_url = ["commande.php"];

        // Dependancies
        $this->depends = ["modSociete"];
        $this->requiredby = ["modExpedition"];
        $this->conflictwith = [];
        $this->langfiles = ['orders', 'bills', 'companies', 'products', 'deliveries', 'sendings'];

        // Constants
        $this->const = [];
        $r = 0;

        $this->const[$r][0] = "COMMANDE_ADDON_PDF";
        $this->const[$r][1] = "chaine";
        $this->const[$r][2] = "einstein";
        $this->const[$r][3] = 'Name of PDF model of order';
        $this->const[$r][4] = 0;

        $r++;
        $this->const[$r][0] = "COMMANDE_ADDON";
        $this->const[$r][1] = "chaine";
        $this->const[$r][2] = "mod_commande_marbre";
        $this->const[$r][3] = 'Name of numbering numerotation rules of order';
        $this->const[$r][4] = 0;

        $r++;
        $this->const[$r][0] = "COMMANDE_ADDON_PDF_ODT_PATH";
        $this->const[$r][1] = "chaine";
        $this->const[$r][2] = "DOL_DATA_ROOT/doctemplates/orders";
        $this->const[$r][3] = "";
        $this->const[$r][4] = 0;

        /*$r++;
        $this->const[$r][0] = "COMMANDE_DRAFT_WATERMARK";
        $this->const[$r][1] = "chaine";
        $this->const[$r][2] = "__(Draft)__";
        $this->const[$r][3] = 'Watermark to show on draft orders';
        $this->const[$r][4] = 0;*/

        // Boxes
        $this->boxes = [
            0 => ['file' => 'box_commandes.php', 'enabledbydefaulton' => 'Home'],
            2 => ['file' => 'box_graph_orders_permonth.php', 'enabledbydefaulton' => 'Home'],
        ];

        // Permissions
        $this->rights = [];
        $this->rights_class = 'commande';

        $r = 0;

        $r++;
        $this->rights[$r][0] = 81;
        $this->rights[$r][1] = 'Read sales orders';
        $this->rights[$r][2] = 'r';
        $this->rights[$r][3] = 0;
        $this->rights[$r][4] = 'lire';

        $r++;
        $this->rights[$r][0] = 82;
        $this->rights[$r][1] = 'Creeat/modify sales orders';
        $this->rights[$r][2] = 'w';
        $this->rights[$r][3] = 0;
        $this->rights[$r][4] = 'creer';

        $r++;
        $this->rights[$r][0] = 84;
        $this->rights[$r][1] = 'Validate sales orders';
        $this->rights[$r][2] = 'd';
        $this->rights[$r][3] = 0;
        $this->rights[$r][4] = 'order_advance';
        $this->rights[$r][5] = 'validate';

        $r++;
        $this->rights[$r][0] = 86;
        $this->rights[$r][1] = 'Send sale orders by email';
        $this->rights[$r][2] = 'd';
        $this->rights[$r][3] = 0;
        $this->rights[$r][4] = 'order_advance';
        $this->rights[$r][5] = 'send';

        $r++;
        $this->rights[$r][0] = 87;
        $this->rights[$r][1] = 'Close sale orders';
        $this->rights[$r][2] = 'd';
        $this->rights[$r][3] = 0;
        $this->rights[$r][4] = 'order_advance';
        $this->rights[$r][5] = 'close';

        $r++;
        $this->rights[$r][0] = 88;
        $this->rights[$r][1] = 'Cancel sale orders';
        $this->rights[$r][2] = 'd';
        $this->rights[$r][3] = 0;
        $this->rights[$r][4] = 'order_advance';
        $this->rights[$r][5] = 'annuler';

        $r++;
        $this->rights[$r][0] = 89;
        $this->rights[$r][1] = 'Delete sales orders';
        $this->rights[$r][2] = 'd';
        $this->rights[$r][3] = 0;
        $this->rights[$r][4] = 'supprimer';

        $r++;
        $this->rights[$r][0] = 1421;
        $this->rights[$r][1] = 'Export sales orders and attributes';
        $this->rights[$r][2] = 'r';
        $this->rights[$r][3] = 0;
        $this->rights[$r][4] = 'commande';
        $this->rights[$r][5] = 'export';

        // Menus
        //-------
        $this->menu = 1; // This module add menu entries. They are coded into menu manager.

        // Exports
        //--------
        $r = 0;

        $r++;
        $this->export_code[$r] = $this->rights_class . '_' . $r;
        $this->export_label[$r] = 'CustomersOrdersAndOrdersLines'; // Translation key (used only if key ExportDataset_xxx_z not found)
        $this->export_permission[$r] = [["commande", "commande", "export"]];
        $this->export_fields_array[$r] = [
            's.rowid' => "IdCompany", 's.nom' => 'CompanyName', 'ps.nom' => 'ParentCompany', 's.address' => 'Address', 's.zip' => 'Zip', 's.town' => 'Town', 'd.nom' => 'State', 'co.label' => 'Country',
            'co.code' => "CountryCode", 's.phone' => 'Phone', 's.siren' => 'ProfId1', 's.siret' => 'ProfId2', 's.ape' => 'ProfId3', 's.idprof4' => 'ProfId4', 'c.rowid' => "Id",
            'c.ref' => "Ref", 'c.ref_client' => "RefCustomer", 'c.fk_soc' => "IdCompany", 'c.date_creation' => "DateCreation", 'c.date_commande' => "OrderDate",
            'c.date_livraison' => "DateDeliveryPlanned", 'c.amount_ht' => "Amount", 'c.remise_percent' => "GlobalDiscount", 'c.total_ht' => "TotalHT",
            'c.total_ttc' => "TotalTTC", 'c.facture' => "Billed", 'c.fk_statut' => 'Status', 'c.note_public' => "Note", 'c.date_livraison' => 'DeliveryDate',
            'c.fk_user_author' => 'CreatedById', 'uc.login' => 'CreatedByLogin', 'c.fk_user_valid' => 'ValidatedById', 'uv.login' => 'ValidatedByLogin',
            'pj.ref' => 'ProjectRef', 'cd.rowid' => 'LineId', 'cd.label' => "Label", 'cd.description' => "LineDescription", 'cd.product_type' => 'TypeOfLineServiceOrProduct',
            'cd.tva_tx' => "LineVATRate", 'cd.qty' => "LineQty", 'cd.total_ht' => "LineTotalHT", 'cd.total_tva' => "LineTotalVAT", 'cd.total_ttc' => "LineTotalTTC",
            'p.rowid' => 'ProductId', 'p.ref' => 'ProductRef', 'p.label' => 'ProductLabel',
        ];
        if (!empty($this->conf->multicurrency->enabled)) {
            $this->export_fields_array[$r]['c.multicurrency_code'] = 'Currency';
            $this->export_fields_array[$r]['c.multicurrency_tx'] = 'CurrencyRate';
            $this->export_fields_array[$r]['c.multicurrency_total_ht'] = 'MulticurrencyAmountHT';
            $this->export_fields_array[$r]['c.multicurrency_total_tva'] = 'MulticurrencyAmountVAT';
            $this->export_fields_array[$r]['c.multicurrency_total_ttc'] = 'MulticurrencyAmountTTC';
        }
        //$this->export_TypeFields_array[$r]=array(
        //	's.rowid'=>"List:societe:nom",'s.nom'=>'Text','s.address'=>'Text','s.zip'=>'Text','s.town'=>'Text','co.label'=>'List:c_country:label:label',
        //	'co.code'=>'Text','s.phone'=>'Text','s.siren'=>'Text','s.siret'=>'Text','s.ape'=>'Text','s.idprof4'=>'Text','c.ref'=>"Text",'c.ref_client'=>"Text",
        //	'c.date_creation'=>"Date",'c.date_commande'=>"Date",'c.amount_ht'=>"Numeric",'c.remise_percent'=>"Numeric",'c.total_ht'=>"Numeric",
        //	'c.total_ttc'=>"Numeric",'c.facture'=>"Boolean",'c.fk_statut'=>'Status','c.note_public'=>"Text",'c.date_livraison'=>'Date','cd.description'=>"Text",
        //	'cd.product_type'=>'Boolean','cd.tva_tx'=>"Numeric",'cd.qty'=>"Numeric",'cd.total_ht'=>"Numeric",'cd.total_tva'=>"Numeric",'cd.total_ttc'=>"Numeric",
        //	'p.rowid'=>'List:product:ref','p.ref'=>'Text','p.label'=>'Text'
        //);
        $this->export_TypeFields_array[$r] = [
            's.nom' => 'Text', 'ps.nom' => 'Text', 's.address' => 'Text', 's.zip' => 'Text', 's.town' => 'Text', 'co.label' => 'List:c_country:label:label', 'co.code' => 'Text', 's.phone' => 'Text',
            's.siren' => 'Text', 's.siret' => 'Text', 's.ape' => 'Text', 's.idprof4' => 'Text', 'c.ref' => "Text", 'c.ref_client' => "Text", 'c.date_creation' => "Date",
            'c.date_commande' => "Date", 'c.date_livraison' => "Date", 'c.amount_ht' => "Numeric", 'c.remise_percent' => "Numeric", 'c.total_ht' => "Numeric",
            'c.total_ttc' => "Numeric", 'c.facture' => "Boolean", 'c.fk_statut' => 'Status', 'c.note_public' => "Text", 'c.date_livraison' => 'Date', 'pj.ref' => 'Text',
            'cd.description' => "Text", 'cd.product_type' => 'Boolean', 'cd.tva_tx' => "Numeric", 'cd.qty' => "Numeric", 'cd.total_ht' => "Numeric", 'cd.total_tva' => "Numeric",
            'cd.total_ttc' => "Numeric", 'p.rowid' => 'List:product:ref::product', 'p.ref' => 'Text', 'p.label' => 'Text', 'd.nom' => 'Text',
        ];
        $this->export_entities_array[$r] = [
            's.rowid' => "company", 's.nom' => 'company', 'ps.nom' => 'company', 's.address' => 'company', 's.zip' => 'company', 's.town' => 'company', 'd.nom' => 'company', 'co.label' => 'company',
            'co.code' => 'company', 's.phone' => 'company', 's.siren' => 'company', 's.ape' => 'company', 's.idprof4' => 'company', 's.siret' => 'company', 'c.rowid' => "order",
            'c.ref' => "order", 'c.ref_client' => "order", 'c.fk_soc' => "order", 'c.date_creation' => "order", 'c.date_commande' => "order", 'c.amount_ht' => "order",
            'c.remise_percent' => "order", 'c.total_ht' => "order", 'c.total_ttc' => "order", 'c.facture' => "order", 'c.fk_statut' => "order", 'c.note' => "order",
            'c.date_livraison' => "order", 'pj.ref' => 'project', 'cd.rowid' => 'order_line', 'cd.label' => "order_line", 'cd.description' => "order_line",
            'cd.product_type' => 'order_line', 'cd.tva_tx' => "order_line", 'cd.qty' => "order_line", 'cd.total_ht' => "order_line", 'cd.total_tva' => "order_line",
            'cd.total_ttc' => "order_line", 'p.rowid' => 'product', 'p.ref' => 'product', 'p.label' => 'product',
        ];
        $this->export_dependencies_array[$r] = ['order_line' => 'cd.rowid', 'product' => 'cd.rowid']; // To add unique key if we ask a field of a child to avoid the DISTINCT to discard them
        $keyforselect = 'commande';
        $keyforelement = 'order';
        $keyforaliasextra = 'extra';
        include DOL_DOCUMENT_ROOT . '/core/extrafieldsinexport.inc.php';
        $keyforselect = 'commandedet';
        $keyforelement = 'order_line';
        $keyforaliasextra = 'extra2';
        include DOL_DOCUMENT_ROOT . '/core/extrafieldsinexport.inc.php';
        $keyforselect = 'product';
        $keyforelement = 'product';
        $keyforaliasextra = 'extra3';
        include DOL_DOCUMENT_ROOT . '/core/extrafieldsinexport.inc.php';
        $keyforselect = 'societe';
        $keyforelement = 'company';
        $keyforaliasextra = 'extra4';
        include DOL_DOCUMENT_ROOT . '/core/extrafieldsinexport.inc.php';
        $this->export_sql_start[$r] = 'SELECT DISTINCT ';
        $this->export_sql_end[$r] = ' FROM ' . MAIN_DB_PREFIX . 'societe as s';
        $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'societe_extrafields as extra4 ON s.rowid = extra4.fk_object';
        $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'societe as ps ON ps.rowid = s.parent';
        if (empty($user->rights->societe->client->voir)) {
            $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'societe_commerciaux as sc ON sc.fk_soc = s.rowid';
        }
        $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'c_departements as d ON s.fk_departement = d.rowid';
        $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'c_country as co ON s.fk_pays = co.rowid,';
        $this->export_sql_end[$r] .= ' ' . MAIN_DB_PREFIX . 'commande as c';
        $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'projet as pj ON c.fk_projet = pj.rowid';
        $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'user as uc ON c.fk_user_author = uc.rowid';
        $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'user as uv ON c.fk_user_valid = uv.rowid';
        $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'commande_extrafields as extra ON c.rowid = extra.fk_object';
        $this->export_sql_end[$r] .= ' , ' . MAIN_DB_PREFIX . 'commandedet as cd';
        $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'commandedet_extrafields as extra2 on cd.rowid = extra2.fk_object';
        $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'product as p on cd.fk_product = p.rowid';
        $this->export_sql_end[$r] .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'product_extrafields as extra3 on p.rowid = extra3.fk_object';
        $this->export_sql_end[$r] .= ' WHERE c.fk_soc = s.rowid AND c.rowid = cd.fk_commande';
        $this->export_sql_end[$r] .= ' AND c.entity IN (' . DolibarrFunctions::getEntity('commande') . ')';
        if (empty($user->rights->societe->client->voir)) {
            $this->export_sql_end[$r] .= ' AND sc.fk_user = ' . (empty($user) ? 0 : $user->id);
        }

        // Imports
        //--------
        $r = 0;
        //Import Order Header

        $r++;
        $this->import_code[$r] = 'commande_' . $r;
        $this->import_label[$r] = 'CustomersOrders';
        $this->import_icon[$r] = $this->picto;
        $this->import_entities_array[$r] = [];
        $this->import_tables_array[$r] = ['c' => MAIN_DB_PREFIX . 'commande', 'extra' => MAIN_DB_PREFIX . 'commande_extrafields'];
        $this->import_tables_creator_array[$r] = ['c' => 'fk_user_author']; // Fields to store import user id
        $this->import_fields_array[$r] = [
            'c.ref' => 'Ref*',
            'c.ref_client' => 'RefCustomer',
            'c.fk_soc' => 'ThirdPartyName*',
            'c.fk_projet' => 'ProjectId',
            'c.date_creation' => 'DateCreation',
            'c.date_valid' => 'DateValid',
            'c.date_commande' => 'DateOrder',
            'c.fk_user_modif' => 'ModifiedById',
            'c.fk_user_valid' => 'ValidatedById',
            'c.fk_statut' => 'Status*',
            'c.remise_percent' => 'GlobalDiscount',
            'c.total_tva' => 'TotalTVA',
            'c.total_ht' => 'TotalHT',
            'c.total_ttc' => 'TotalTTC',
            'c.note_private' => 'NotePrivate',
            'c.note_public' => 'Note',
            'c.facture' => 'Invoice(1/0)',
            'c.date_livraison' => 'DeliveryDate',
            'c.fk_cond_reglement' => 'Payment Condition',
            'c.fk_mode_reglement' => 'Payment Mode',
            'c.model_pdf' => 'Model',
        ];

        if (!empty($this->conf->multicurrency->enabled)) {
            $this->import_fields_array[$r]['c.multicurrency_code'] = 'Currency';
            $this->import_fields_array[$r]['c.multicurrency_tx'] = 'CurrencyRate';
            $this->import_fields_array[$r]['c.multicurrency_total_ht'] = 'MulticurrencyAmountHT';
            $this->import_fields_array[$r]['c.multicurrency_total_tva'] = 'MulticurrencyAmountVAT';
            $this->import_fields_array[$r]['c.multicurrency_total_ttc'] = 'MulticurrencyAmountTTC';
        }

        // Add extra fields
        $import_extrafield_sample = [];
        $sql = "SELECT name, label, fieldrequired FROM " . MAIN_DB_PREFIX . "extrafields WHERE elementtype = 'commande' AND entity IN (0, " . $this->conf->entity . ")";
        $resql = $this->db->query($sql);

        if ($resql) {
            while ($obj = $this->db->fetch_object($resql)) {
                $fieldname = 'extra.' . $obj->name;
                $fieldlabel = ucfirst($obj->label);
                $this->import_fields_array[$r][$fieldname] = $fieldlabel . ($obj->fieldrequired ? '*' : '');
                $import_extrafield_sample[$fieldname] = $fieldlabel;
            }
        }
        // End add extra fields

        $this->import_fieldshidden_array[$r] = ['extra.fk_object' => 'lastrowid-' . MAIN_DB_PREFIX . 'commande'];
        $this->import_regex_array[$r] = [
            'c.multicurrency_code' => 'code@' . MAIN_DB_PREFIX . 'multicurrency',
        ];

        $this->import_updatekeys_array[$r] = ['c.ref' => 'Ref'];
        $this->import_convertvalue_array[$r] = [
            'c.fk_soc' => [
                'rule' => 'fetchidfromref',
                'file' => '/Modules/Societes/class/societe.class.php',
                'class' => 'Societe',
                'method' => 'fetch',
                'element' => 'ThirdParty',
            ],
            'c.fk_user_valid' => [
                'rule' => 'fetchidfromref',
                'file' => '/Modules/Users/class/user.class.php',
                'class' => 'User',
                'method' => 'fetch',
                'element' => 'user',
            ],
            'c.fk_mode_reglement' => [
                'rule' => 'fetchidfromcodeorlabel',
                'file' => '/Modules/Compta/paiement/class/cpaiement.class.php',
                'class' => 'Cpaiement',
                'method' => 'fetch',
                'element' => 'cpayment',
            ],
        ];

        //Import CPV Lines
        $r++;
        $this->import_code[$r] = 'commande_lines_' . $r;
        $this->import_label[$r] = 'SaleOrderLines';
        $this->import_icon[$r] = $this->picto;
        $this->import_entities_array[$r] = [];
        $this->import_tables_array[$r] = ['cd' => MAIN_DB_PREFIX . 'commandedet', 'extra' => MAIN_DB_PREFIX . 'commandedet_extrafields'];
        $this->import_fields_array[$r] = [
            'cd.fk_commande' => 'SalesOrder*',
            'cd.fk_parent_line' => 'PrParentLine',
            'cd.fk_product' => 'IdProduct',
            'cd.label' => 'Label',
            'cd.description' => 'LineDescription',
            'cd.tva_tx' => 'LineVATRate',
            'cd.qty' => 'LineQty',
            'cd.remise_percent' => 'Reduc. Percent',
            'cd.remise' => 'Reduc.',
            'cd.price' => 'Price',
            'cd.subprice' => 'Sub Price',
            'cd.total_ht' => 'LineTotalHT',
            'cd.total_tva' => 'LineTotalVAT',
            'cd.total_ttc' => 'LineTotalTTC',
            'cd.product_type' => 'TypeOfLineServiceOrProduct',
            'cd.date_start' => 'Start Date',
            'cd.date_end' => 'End Date',
            'cd.buy_price_ht' => 'LineBuyPriceHT',
            'cd.rang' => 'LinePosition',
        ];

        if (!empty($this->conf->multicurrency->enabled)) {
            $this->import_fields_array[$r]['cd.multicurrency_code'] = 'Currency';
            $this->import_fields_array[$r]['cd.multicurrency_subprice'] = 'CurrencyRate';
            $this->import_fields_array[$r]['cd.multicurrency_total_ht'] = 'MulticurrencyAmountHT';
            $this->import_fields_array[$r]['cd.multicurrency_total_tva'] = 'MulticurrencyAmountVAT';
            $this->import_fields_array[$r]['cd.multicurrency_total_ttc'] = 'MulticurrencyAmountTTC';
        }

        // Add extra fields
        $sql = "SELECT name, label, fieldrequired FROM " . MAIN_DB_PREFIX . "extrafields WHERE elementtype = 'commandedet' AND entity IN (0, " . $this->conf->entity . ")";
        $resql = $this->db->query($sql);
        if ($resql) {
            while ($obj = $this->db->fetch_object($resql)) {
                $fieldname = 'extra.' . $obj->name;
                $fieldlabel = ucfirst($obj->label);
                $this->import_fields_array[$r][$fieldname] = $fieldlabel . ($obj->fieldrequired ? '*' : '');
            }
        }
        // End add extra fields

        $this->import_fieldshidden_array[$r] = ['extra.fk_object' => 'lastrowid-' . MAIN_DB_PREFIX . 'commandedet'];
        $this->import_regex_array[$r] = [
            'cd.product_type' => '[0|1]$',
            'cd.fk_product' => 'rowid@' . MAIN_DB_PREFIX . 'product',
            'cd.multicurrency_code' => 'code@' . MAIN_DB_PREFIX . 'multicurrency',
        ];
        $this->import_updatekeys_array[$r] = ['cd.fk_commande' => 'Sales Order Id', 'cd.fk_product' => 'Product Id'];
        $this->import_convertvalue_array[$r] = [
            'cd.fk_commande' => [
                'rule' => 'fetchidfromref',
                'file' => '/Modules/Commande/class/commande.class.php',
                'class' => 'Commande',
                'method' => 'fetch',
                'element' => 'commande',
            ],
        ];
    }

    /**
     *        Function called when module is enabled.
     *        The init function add constants, boxes, permissions and menus (defined in constructor) into Dolibarr database.
     *        It also creates data directories
     *
     * @param string $options Options when enabling module ('', 'newboxdefonly', 'noboxes')
     *
     * @return     int                1 if OK, 0 if KO
     */
    public function init($options = '')
    {
        global $conf, $langs;

        // Permissions
        $this->remove($options);

        //ODT template
        $src = DOL_DOCUMENT_ROOT . '/install/doctemplates/orders/template_order.odt';
        $dirodt = DOL_DATA_ROOT . '/doctemplates/orders';
        $dest = $dirodt . '/template_order.odt';

        if (file_exists($src) && !file_exists($dest)) {
            require_once DOL_DOCUMENT_ROOT . '/core/lib/files.lib.php';
            dol_mkdir($dirodt);
            $result = dol_copy($src, $dest, 0, 0);
            if ($result < 0) {
                $langs->load("errors");
                $this->error = $langs->trans('ErrorFailToCopyFile', $src, $dest);
                return 0;
            }
        }

        $sql = [
            "DELETE FROM " . MAIN_DB_PREFIX . "document_model WHERE nom = '" . $this->db->escape($this->const[0][2]) . "' AND type = 'order' AND entity = " . ((int) $this->conf->entity),
            "INSERT INTO " . MAIN_DB_PREFIX . "document_model (nom, type, entity) VALUES('" . $this->db->escape($this->const[0][2]) . "', 'order', " . ((int) $this->conf->entity) . ")",
        ];

        return $this->_init($sql, $options);
    }
}
