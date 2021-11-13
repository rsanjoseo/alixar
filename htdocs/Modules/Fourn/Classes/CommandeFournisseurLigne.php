<?php
/* Copyright (C) 2003-2006	Rodolphe Quiedeville	<rodolphe@quiedeville.org>
 * Copyright (C) 2004-2017	Laurent Destailleur		<eldy@users.sourceforge.net>
 * Copyright (C) 2005-2012	Regis Houssin			<regis.houssin@inodbox.com>
 * Copyright (C) 2007		Franky Van Liedekerke	<franky.van.liedekerke@telenet.be>
 * Copyright (C) 2010-2020	Juanjo Menent			<jmenent@2byte.es>
 * Copyright (C) 2010-2018	Philippe Grand			<philippe.grand@atoo-net.com>
 * Copyright (C) 2012-2015  Marcos García           <marcosgdf@gmail.com>
 * Copyright (C) 2013       Florian Henry		  	<florian.henry@open-concept.pro>
 * Copyright (C) 2013       Cédric Salvador         <csalvador@gpcsolutions.fr>
 * Copyright (C) 2018       Nicolas ZABOURI			<info@inovea-conseil.com>
 * Copyright (C) 2018-2020  Frédéric France         <frederic.france@netlogic.fr>
 * Copyright (C) 2018       Ferran Marcet         	<fmarcet@2byte.es>
 * Copyright (C) 2021       Josep Lluís Amador      <joseplluis@lliuretic.cat>
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

namespace Alxarafe\Dolibarr\Classes;

/**
 *    \file       htdocs/fourn/class/fournisseur.commande.class.php
 *    \ingroup    fournisseur,commande
 *    \brief      File of class to manage suppliers orders
 */

//include_once DOL_DOCUMENT_ROOT . '/core/class/commonorder.class.php';
//require_once DOL_DOCUMENT_ROOT . '/Modules/Products/class/product.class.php';
//if (!empty($conf->productbatch->enabled)) {
//    require_once DOL_DOCUMENT_ROOT . '/Modules/Products/class/productbatch.class.php';
//}
//require_once DOL_DOCUMENT_ROOT . '/Modules/Multicurrency/class/multicurrency.class.php';

/**
 *  Class to manage line orders
 */
class CommandeFournisseurLigne extends CommonOrderLine
{
    /**
     * @var string ID to identify managed object
     */
    public $element = 'commande_fournisseurdet';

    /**
     * @var string Name of table without prefix where object is stored
     */
    public $table_element = 'commande_fournisseurdet';

    public $oldline;

    /**
     * Id of parent order
     *
     * @var int
     */
    public $fk_commande;

    // From llx_commande_fournisseurdet
    /**
     * @var int ID
     */
    public $fk_parent_line;

    /**
     * @var int ID
     */
    public $fk_facture;

    public $rang = 0;
    public $special_code = 0;

    /**
     * Unit price without taxes
     *
     * @var float
     */
    public $pu_ht;

    public $date_start;
    public $date_end;

    // From llx_product_fournisseur_price

    /**
     * Supplier reference of price when we added the line. May have been changed after line was added.
     *
     * @var string
     */
    public $ref_supplier;
    public $remise;

    /**
     *    Constructor
     *
     * @param DoliDB $db Database handler
     */
    public function __construct($db)
    {
        $this->db = $db;
    }

    /**
     *  Load line order
     *
     * @param int $rowid Id line order
     *
     * @return    int                    <0 if KO, >0 if OK
     */
    public function fetch($rowid)
    {
        global $conf;

        $sql = 'SELECT cd.rowid, cd.fk_commande, cd.fk_product, cd.product_type, cd.description, cd.qty, cd.tva_tx, cd.special_code,';
        $sql .= ' cd.localtax1_tx, cd.localtax2_tx, cd.localtax1_type, cd.localtax2_type, cd.ref,';
        $sql .= ' cd.remise, cd.remise_percent, cd.subprice,';
        $sql .= ' cd.info_bits, cd.total_ht, cd.total_tva, cd.total_ttc,';
        $sql .= ' cd.total_localtax1, cd.total_localtax2,';
        $sql .= ' p.ref as product_ref, p.label as product_label, p.description as product_desc,';
        $sql .= ' cd.date_start, cd.date_end, cd.fk_unit,';
        $sql .= ' cd.multicurrency_subprice, cd.multicurrency_total_ht, cd.multicurrency_total_tva, cd.multicurrency_total_ttc';
        if (!empty($conf->global->PRODUCT_USE_SUPPLIER_PACKAGING)) {
            $sql .= ", pfp.rowid as fk_pfp, pfp.packaging";
        }
        $sql .= ' FROM ' . MAIN_DB_PREFIX . 'commande_fournisseurdet as cd';
        $sql .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'product as p ON cd.fk_product = p.rowid';
        if (!empty($conf->global->PRODUCT_USE_SUPPLIER_PACKAGING)) {
            $sql .= " LEFT JOIN " . MAIN_DB_PREFIX . "product_fournisseur_price as pfp ON cd.fk_product = pfp.fk_product and cd.ref = pfp.ref_fourn";
        }
        $sql .= ' WHERE cd.rowid = ' . ((int) $rowid);
        $result = $this->db->query($sql);
        if ($result) {
            $objp = $this->db->fetch_object($result);

            if (!empty($objp)) {
                $this->rowid = $objp->rowid;
                $this->id = $objp->rowid;
                $this->fk_commande = $objp->fk_commande;
                $this->desc = $objp->description;
                $this->qty = $objp->qty;
                $this->ref_fourn = $objp->ref;
                $this->ref_supplier = $objp->ref;
                $this->subprice = $objp->subprice;
                $this->tva_tx = $objp->tva_tx;
                $this->localtax1_tx = $objp->localtax1_tx;
                $this->localtax2_tx = $objp->localtax2_tx;
                $this->localtax1_type = $objp->localtax1_type;
                $this->localtax2_type = $objp->localtax2_type;
                $this->remise = $objp->remise;
                $this->remise_percent = $objp->remise_percent;
                $this->fk_product = $objp->fk_product;
                $this->info_bits = $objp->info_bits;
                $this->total_ht = $objp->total_ht;
                $this->total_tva = $objp->total_tva;
                $this->total_localtax1 = $objp->total_localtax1;
                $this->total_localtax2 = $objp->total_localtax2;
                $this->total_ttc = $objp->total_ttc;
                $this->product_type = $objp->product_type;
                $this->special_code = $objp->special_code;

                $this->ref = $objp->product_ref;

                $this->product_ref = $objp->product_ref;
                $this->product_label = $objp->product_label;
                $this->product_desc = $objp->product_desc;
                if (!empty($conf->global->PRODUCT_USE_SUPPLIER_PACKAGING)) {
                    $this->packaging = $objp->packaging;
                    $this->fk_fournprice = $objp->fk_pfp;
                }

                $this->date_start = $this->db->jdate($objp->date_start);
                $this->date_end = $this->db->jdate($objp->date_end);
                $this->fk_unit = $objp->fk_unit;

                $this->multicurrency_subprice = $objp->multicurrency_subprice;
                $this->multicurrency_total_ht = $objp->multicurrency_total_ht;
                $this->multicurrency_total_tva = $objp->multicurrency_total_tva;
                $this->multicurrency_total_ttc = $objp->multicurrency_total_ttc;

                $this->fetch_optionals();

                $this->db->free($result);
                return 1;
            } else {
                $this->error = 'Supplier order line  with id=' . $rowid . ' not found';
                dol_syslog(get_class($this) . "::fetch Error " . $this->error, LOG_ERR);
                return 0;
            }
        } else {
            dol_print_error($this->db);
            return -1;
        }
    }

    /**
     *    Insert line into database
     *
     * @param int $notrigger 1 = disable triggers
     *
     * @return        int                        <0 if KO, >0 if OK
     */
    public function insert($notrigger = 0)
    {
        global $conf, $user;

        $error = 0;

        dol_syslog(get_class($this) . "::insert rang=" . $this->rang);

        // Clean parameters
        if (empty($this->tva_tx)) {
            $this->tva_tx = 0;
        }
        if (empty($this->localtax1_tx)) {
            $this->localtax1_tx = 0;
        }
        if (empty($this->localtax2_tx)) {
            $this->localtax2_tx = 0;
        }
        if (empty($this->localtax1_type)) {
            $this->localtax1_type = '0';
        }
        if (empty($this->localtax2_type)) {
            $this->localtax2_type = '0';
        }
        if (empty($this->total_localtax1)) {
            $this->total_localtax1 = 0;
        }
        if (empty($this->total_localtax2)) {
            $this->total_localtax2 = 0;
        }
        if (empty($this->rang)) {
            $this->rang = 0;
        }
        if (empty($this->remise)) {
            $this->remise = 0;
        }
        if (empty($this->remise_percent)) {
            $this->remise_percent = 0;
        }
        if (empty($this->info_bits)) {
            $this->info_bits = 0;
        }
        if (empty($this->special_code)) {
            $this->special_code = 0;
        }
        if (empty($this->fk_parent_line)) {
            $this->fk_parent_line = 0;
        }
        if (empty($this->pa_ht)) {
            $this->pa_ht = 0;
        }

        // Multicurrency
        if (!empty($this->multicurrency_code)) {
            [$this->fk_multicurrency, $this->multicurrency_tx] = MultiCurrency::getIdAndTxFromCode($this->db, $this->multicurrency_code);
        }
        if (empty($this->fk_multicurrency)) {
            $this->multicurrency_code = $conf->currency;
            $this->fk_multicurrency = 0;
            $this->multicurrency_tx = 1;
        }

        // Check parameters
        if ($this->product_type < 0) {
            return -1;
        }

        $this->db->begin();

        // Insertion dans base de la ligne
        $sql = 'INSERT INTO ' . MAIN_DB_PREFIX . $this->table_element;
        $sql .= " (fk_commande, label, description, date_start, date_end,";
        $sql .= " fk_product, product_type, special_code, rang,";
        $sql .= " qty, vat_src_code, tva_tx, localtax1_tx, localtax2_tx, localtax1_type, localtax2_type, remise_percent, subprice, ref,";
        $sql .= " total_ht, total_tva, total_localtax1, total_localtax2, total_ttc, fk_unit,";
        $sql .= " fk_multicurrency, multicurrency_code, multicurrency_subprice, multicurrency_total_ht, multicurrency_total_tva, multicurrency_total_ttc";
        $sql .= ")";
        $sql .= " VALUES (" . $this->fk_commande . ", '" . $this->db->escape($this->label) . "','" . $this->db->escape($this->desc) . "',";
        $sql .= " " . ($this->date_start ? "'" . $this->db->idate($this->date_start) . "'" : "null") . ",";
        $sql .= " " . ($this->date_end ? "'" . $this->db->idate($this->date_end) . "'" : "null") . ",";
        if ($this->fk_product) {
            $sql .= $this->fk_product . ",";
        } else {
            $sql .= "null,";
        }
        $sql .= "'" . $this->db->escape($this->product_type) . "',";
        $sql .= "'" . $this->db->escape($this->special_code) . "',";
        $sql .= "'" . $this->db->escape($this->rang) . "',";
        $sql .= "'" . $this->db->escape($this->qty) . "', ";
        $sql .= " " . (empty($this->vat_src_code) ? "''" : "'" . $this->db->escape($this->vat_src_code) . "'") . ",";
        $sql .= " " . price2num($this->tva_tx) . ", ";
        $sql .= " " . price2num($this->localtax1_tx) . ",";
        $sql .= " " . price2num($this->localtax2_tx) . ",";
        $sql .= " '" . $this->db->escape($this->localtax1_type) . "',";
        $sql .= " '" . $this->db->escape($this->localtax2_type) . "',";
        $sql .= " " . ((float) $this->remise_percent) . ", " . price2num($this->subprice, 'MU') . ", '" . $this->db->escape($this->ref_supplier) . "',";
        $sql .= " " . price2num($this->total_ht) . ",";
        $sql .= " " . price2num($this->total_tva) . ",";
        $sql .= " " . price2num($this->total_localtax1) . ",";
        $sql .= " " . price2num($this->total_localtax2) . ",";
        $sql .= " " . price2num($this->total_ttc) . ",";
        $sql .= ($this->fk_unit ? "'" . $this->db->escape($this->fk_unit) . "'" : "null");
        $sql .= ", " . ($this->fk_multicurrency ? ((int) $this->fk_multicurrency) : "null");
        $sql .= ", '" . $this->db->escape($this->multicurrency_code) . "'";
        $sql .= ", " . ($this->multicurrency_subprice ? price2num($this->multicurrency_subprice) : '0');
        $sql .= ", " . ($this->multicurrency_total_ht ? price2num($this->multicurrency_total_ht) : '0');
        $sql .= ", " . ($this->multicurrency_total_tva ? price2num($this->multicurrency_total_tva) : '0');
        $sql .= ", " . ($this->multicurrency_total_ttc ? price2num($this->multicurrency_total_ttc) : '0');
        $sql .= ")";

        dol_syslog(get_class($this) . "::insert", LOG_DEBUG);
        $resql = $this->db->query($sql);
        if ($resql) {
            $this->id = $this->db->last_insert_id(MAIN_DB_PREFIX . $this->table_element);
            $this->rowid = $this->id;

            if (!$error) {
                $result = $this->insertExtraFields();
                if ($result < 0) {
                    $error++;
                }
            }

            if (!$error && !$notrigger) {
                // Call trigger
                $result = $this->call_trigger('LINEORDER_SUPPLIER_CREATE', $user);
                if ($result < 0) {
                    $error++;
                }
                // End call triggers
            }

            if (!$error) {
                $this->db->commit();
                return 1;
            }

            foreach ($this->errors as $errmsg) {
                dol_syslog(get_class($this) . "::delete " . $errmsg, LOG_ERR);
                $this->errors[] = ($this->errors ? ', ' . $errmsg : $errmsg);
            }
            $this->db->rollback();
            return -1 * $error;
        } else {
            $this->errors[] = $this->db->error();
            $this->db->rollback();
            return -2;
        }
    }

    /**
     *    Update the line object into db
     *
     * @param int $notrigger 1 = disable triggers
     *
     * @return        int        <0 si ko, >0 si ok
     */
    public function update($notrigger = 0)
    {
        global $conf, $user;

        $error = 0;

        $this->db->begin();

        // Mise a jour ligne en base
        $sql = "UPDATE " . MAIN_DB_PREFIX . $this->table_element . " SET";
        $sql .= "  description='" . $this->db->escape($this->desc) . "'";
        $sql .= ", ref='" . $this->db->escape($this->ref_supplier) . "'";
        $sql .= ", subprice='" . price2num($this->subprice) . "'";
        //$sql.= ",remise='".price2num($remise)."'";
        $sql .= ", remise_percent='" . price2num($this->remise_percent) . "'";

        $sql .= ", vat_src_code = '" . (empty($this->vat_src_code) ? '' : $this->vat_src_code) . "'";
        $sql .= ", tva_tx='" . price2num($this->tva_tx) . "'";
        $sql .= ", localtax1_tx='" . price2num($this->total_localtax1) . "'";
        $sql .= ", localtax2_tx='" . price2num($this->total_localtax2) . "'";
        $sql .= ", localtax1_type='" . $this->db->escape($this->localtax1_type) . "'";
        $sql .= ", localtax2_type='" . $this->db->escape($this->localtax2_type) . "'";
        $sql .= ", qty='" . price2num($this->qty) . "'";
        $sql .= ", date_start=" . (!empty($this->date_start) ? "'" . $this->db->idate($this->date_start) . "'" : "null");
        $sql .= ", date_end=" . (!empty($this->date_end) ? "'" . $this->db->idate($this->date_end) . "'" : "null");
        $sql .= ", info_bits='" . $this->db->escape($this->info_bits) . "'";
        $sql .= ", total_ht='" . price2num($this->total_ht) . "'";
        $sql .= ", total_tva='" . price2num($this->total_tva) . "'";
        $sql .= ", total_localtax1='" . price2num($this->total_localtax1) . "'";
        $sql .= ", total_localtax2='" . price2num($this->total_localtax2) . "'";
        $sql .= ", total_ttc='" . price2num($this->total_ttc) . "'";
        $sql .= ", product_type=" . $this->product_type;
        $sql .= ", special_code=" . (!empty($this->special_code) ? $this->special_code : 0);
        $sql .= ($this->fk_unit ? ", fk_unit='" . $this->db->escape($this->fk_unit) . "'" : ", fk_unit=null");

        // Multicurrency
        $sql .= ", multicurrency_subprice=" . price2num($this->multicurrency_subprice) . "";
        $sql .= ", multicurrency_total_ht=" . price2num($this->multicurrency_total_ht) . "";
        $sql .= ", multicurrency_total_tva=" . price2num($this->multicurrency_total_tva) . "";
        $sql .= ", multicurrency_total_ttc=" . price2num($this->multicurrency_total_ttc) . "";

        $sql .= " WHERE rowid = " . ((int) $this->id);

        dol_syslog(get_class($this) . "::updateline", LOG_DEBUG);
        $result = $this->db->query($sql);
        if ($result > 0) {
            if (!$error) {
                $result = $this->insertExtraFields();
                if ($result < 0) {
                    $error++;
                }
            }

            if (!$error && !$notrigger) {
                global $user;
                // Call trigger
                $result = $this->call_trigger('LINEORDER_SUPPLIER_UPDATE', $user);
                if ($result < 0) {
                    $this->db->rollback();
                    return -1;
                }
                // End call triggers
            }

            if (!$error) {
                $this->db->commit();
                return 1;
            } else {
                $this->db->rollback();
                return -1;
            }
        } else {
            $this->error = $this->db->lasterror();
            $this->db->rollback();
            return -1;
        }
    }

    /**
     *    Delete line in database
     *
     * @param int $notrigger 1=Disable call to triggers
     *
     * @return     int                 <0 if KO, >0 if OK
     */
    public function delete($notrigger = 0)
    {
        global $user;

        $error = 0;

        $this->db->begin();

        // extrafields
        $result = $this->deleteExtraFields();
        if ($result < 0) {
            $this->db->rollback();
            return -1;
        }

        $sql = 'DELETE FROM ' . MAIN_DB_PREFIX . "commande_fournisseurdet WHERE rowid=" . ((int) $this->id);

        dol_syslog(__METHOD__, LOG_DEBUG);
        $resql = $this->db->query($sql);
        if ($resql) {
            if (!$notrigger) {
                // Call trigger
                $result = $this->call_trigger('LINEORDER_SUPPLIER_DELETE', $user);
                if ($result < 0) {
                    $error++;
                }
                // End call triggers
            }

            if (!$error) {
                $this->db->commit();
                return 1;
            }

            foreach ($this->errors as $errmsg) {
                dol_syslog(get_class($this) . "::delete " . $errmsg, LOG_ERR);
                $this->error .= ($this->error ? ', ' . $errmsg : $errmsg);
            }
            $this->db->rollback();
            return -1 * $error;
        } else {
            $this->error = $this->db->lasterror();
            return -1;
        }
    }
}
