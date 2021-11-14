<?php
/* Copyright (C) 2011-2019 Alexandre Spangaro   <aspangaro@open-dsi.fr>
 * Copyright (C) 2014      Juanjo Menent        <jmenent@2byte.es>
 * Copyright (C) 2021	   Gauthier VERDOL      <gauthier.verdol@atm-consulting.fr>
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
 *  \file       htdocs/salaries/class/paymentsalary.class.php
 *  \ingroup    salaries
 *  \brief      File of class to manage payment of salaries
 */

// Put here all includes required by your class file
require_once DOL_DOCUMENT_ROOT . '/core/class/commonobject.class.php';
require_once DOL_DOCUMENT_ROOT . '/salaries/class/salary.class.php';

/**
 *    Class to manage payments of salaries
 */
class PaymentSalary extends CommonObject
{
    /**
     * @var string ID to identify managed object
     */
    public $element = 'payment_salary';

    /**
     * @var string Name of table without prefix where object is stored
     */
    public $table_element = 'payment_salary';

    /**
     * @var string String with name of icon for myobject. Must be the part after the 'object_' into object_myobject.png
     */
    public $picto = 'payment';

    /**
     * @var int ID
     */
    public $fk_salary;

    public $datec = '';
    public $tms = '';
    public $datep = '';

    /**
     * @deprecated
     * @see $amount
     */
    public $total;

    public $amount; // Total amount of payment
    public $amounts = []; // Array of amounts

    /**
     * @var int ID
     */
    public $fk_typepayment;

    /**
     * @var string
     * @deprecated
     */
    public $num_paiement;

    /**
     * @var string
     */
    public $num_payment;

    /**
     * @var int ID
     */
    public $fk_bank;

    /**
     * @var int ID
     */
    public $fk_user_author;

    /**
     * @var int ID
     */
    public $fk_user_modif;

    /**
     * @var array
     */
    public $fields = [
        'rowid' => ['type' => 'integer', 'label' => 'TechnicalID', 'enabled' => 1, 'visible' => -2, 'notnull' => 1, 'index' => 1, 'position' => 1, 'comment' => 'Id'],
    ];

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
     *  Update database
     *
     * @param User $user      User that modify
     * @param int  $notrigger 0=launch triggers after, 1=disable triggers
     *
     * @return int                    <0 if KO, >0 if OK
     */
    public function update($user = null, $notrigger = 0)
    {
        global $conf, $langs;
        $error = 0;

        // Clean parameters

        if (isset($this->fk_salary)) {
            $this->fk_salary = (int) $this->fk_salary;
        }
        if (isset($this->amount)) {
            $this->amount = trim($this->amount);
        }
        if (isset($this->fk_typepayment)) {
            $this->fk_typepayment = (int) $this->fk_typepayment;
        }
        if (isset($this->num_paiement)) {
            $this->num_paiement = trim($this->num_paiement);
        } // deprecated
        if (isset($this->num_payment)) {
            $this->num_payment = trim($this->num_payment);
        }
        if (isset($this->note)) {
            $this->note = trim($this->note);
        }
        if (isset($this->fk_bank)) {
            $this->fk_bank = (int) $this->fk_bank;
        }
        if (isset($this->fk_user_author)) {
            $this->fk_user_author = (int) $this->fk_user_author;
        }
        if (isset($this->fk_user_modif)) {
            $this->fk_user_modif = (int) $this->fk_user_modif;
        }

        // Check parameters
        // Put here code to add control on parameters values

        // Update request
        $sql = "UPDATE " . MAIN_DB_PREFIX . "payment_salary SET";
        $sql .= " fk_salary=" . (isset($this->fk_salary) ? $this->fk_salary : "null") . ",";
        $sql .= " datec=" . (dol_strlen($this->datec) != 0 ? "'" . $this->db->idate($this->datec) . "'" : 'null') . ",";
        $sql .= " tms=" . (dol_strlen($this->tms) != 0 ? "'" . $this->db->idate($this->tms) . "'" : 'null') . ",";
        $sql .= " datep=" . (dol_strlen($this->datep) != 0 ? "'" . $this->db->idate($this->datep) . "'" : 'null') . ",";
        $sql .= " amount=" . (isset($this->amount) ? $this->amount : "null") . ",";
        $sql .= " fk_typepayment=" . (isset($this->fk_typepayment) ? $this->fk_typepayment : "null") . ",";
        $sql .= " num_payment=" . (isset($this->num_payment) ? "'" . $this->db->escape($this->num_payment) . "'" : "null") . ",";
        $sql .= " note=" . (isset($this->note) ? "'" . $this->db->escape($this->note) . "'" : "null") . ",";
        $sql .= " fk_bank=" . (isset($this->fk_bank) ? $this->fk_bank : "null") . ",";
        $sql .= " fk_user_author=" . (isset($this->fk_user_author) ? $this->fk_user_author : "null") . ",";
        $sql .= " fk_user_modif=" . (isset($this->fk_user_modif) ? $this->fk_user_modif : "null") . "";
        $sql .= " WHERE rowid=" . ((int) $this->id);

        $this->db->begin();

        dol_syslog(get_class($this) . "::update", LOG_DEBUG);
        $resql = $this->db->query($sql);
        if (!$resql) {
            $error++;
            $this->errors[] = "Error " . $this->db->lasterror();
        }

        // Commit or rollback
        if ($error) {
            foreach ($this->errors as $errmsg) {
                dol_syslog(get_class($this) . "::update " . $errmsg, LOG_ERR);
                $this->error .= ($this->error ? ', ' . $errmsg : $errmsg);
            }
            $this->db->rollback();
            return -1 * $error;
        } else {
            $this->db->commit();
            return 1;
        }
    }

    /**
     *  Delete object in database
     *
     * @param User $user      User that delete
     * @param int  $notrigger 0=launch triggers after, 1=disable triggers
     *
     * @return int                        <0 if KO, >0 if OK
     */
    public function delete($user, $notrigger = 0)
    {
        global $conf, $langs;
        $error = 0;

        dol_syslog(get_class($this) . "::delete");

        $this->db->begin();

        if ($this->bank_line > 0) {
            $accline = new AccountLine($this->db);
            $accline->fetch($this->bank_line);
            $result = $accline->delete();
            if ($result < 0) {
                $this->errors[] = $accline->error;
                $error++;
            }
        }

        if (!$error) {
            $sql = "DELETE FROM " . MAIN_DB_PREFIX . "payment_salary";
            $sql .= " WHERE rowid=" . ((int) $this->id);

            dol_syslog(get_class($this) . "::delete", LOG_DEBUG);
            $resql = $this->db->query($sql);
            if (!$resql) {
                $error++;
                $this->errors[] = "Error " . $this->db->lasterror();
            }
        }

        // Commit or rollback
        if ($error) {
            foreach ($this->errors as $errmsg) {
                dol_syslog(get_class($this) . "::delete " . $errmsg, LOG_ERR);
                $this->error .= ($this->error ? ', ' . $errmsg : $errmsg);
            }
            $this->db->rollback();
            return -1 * $error;
        } else {
            $this->db->commit();
            return 1;
        }
    }

    /**
     *    Load an object from its id and create a new one in database
     *
     * @param User $user   User making the clone
     * @param int  $fromid Id of object to clone
     *
     * @return    int                        New id of clone
     */
    public function createFromClone(User $user, $fromid)
    {
        $error = 0;

        $object = new PaymentSalary($this->db);

        $this->db->begin();

        // Load source object
        $object->fetch($fromid);
        $object->id = 0;
        $object->statut = 0;

        // Clear fields
        // ...

        // Create clone
        $object->context['createfromclone'] = 'createfromclone';
        $result = $object->create($user);

        // Other options
        if ($result < 0) {
            $this->error = $object->error;
            $error++;
        }

        unset($object->context['createfromclone']);

        // End
        if (!$error) {
            $this->db->commit();
            return $object->id;
        } else {
            $this->db->rollback();
            return -1;
        }
    }

    /**
     *  Load object in memory from database
     *
     * @param int $id Id object
     *
     * @return int                <0 if KO, >0 if OK
     */
    public function fetch($id)
    {
        global $langs;
        $sql = "SELECT";
        $sql .= " t.rowid,";
        $sql .= " t.fk_salary,";
        $sql .= " t.datec,";
        $sql .= " t.tms,";
        $sql .= " t.datep,";
        $sql .= " t.amount,";
        $sql .= " t.fk_typepayment,";
        $sql .= " t.num_payment as num_payment,";
        $sql .= " t.note,";
        $sql .= " t.fk_bank,";
        $sql .= " t.fk_user_author,";
        $sql .= " t.fk_user_modif,";
        $sql .= " pt.code as type_code, pt.libelle as type_label,";
        $sql .= ' b.fk_account';
        $sql .= " FROM " . MAIN_DB_PREFIX . "payment_salary as t LEFT JOIN " . MAIN_DB_PREFIX . "c_paiement as pt ON t.fk_typepayment = pt.id";
        $sql .= ' LEFT JOIN ' . MAIN_DB_PREFIX . 'bank as b ON t.fk_bank = b.rowid';
        $sql .= " WHERE t.rowid = " . ((int) $id);
        // TODO link on entity of tax;

        dol_syslog(get_class($this) . "::fetch", LOG_DEBUG);
        $resql = $this->db->query($sql);
        if ($resql) {
            if ($this->db->num_rows($resql)) {
                $obj = $this->db->fetch_object($resql);

                $this->id = $obj->rowid;
                $this->ref = $obj->rowid;

                $this->fk_salary = $obj->fk_salary;
                $this->datec = $this->db->jdate($obj->datec);
                $this->tms = $this->db->jdate($obj->tms);
                $this->datep = $this->db->jdate($obj->datep);
                $this->amount = $obj->amount;
                $this->fk_typepayment = $obj->fk_typepayment;
                $this->num_paiement = $obj->num_payment;
                $this->num_payment = $obj->num_payment;
                $this->note = $obj->note;
                $this->fk_bank = $obj->fk_bank;
                $this->fk_user_author = $obj->fk_user_author;
                $this->fk_user_modif = $obj->fk_user_modif;

                $this->type_code = $obj->type_code;
                $this->type_label = $obj->type_label;

                $this->bank_account = $obj->fk_account;
                $this->bank_line = $obj->fk_bank;
            }
            $this->db->free($resql);

            return 1;
        } else {
            $this->error = "Error " . $this->db->lasterror();
            return -1;
        }
    }

    /**
     *  Create payment of salary into database.
     *  Use this->amounts to have list of lines for the payment
     *
     * @param User $user             User making payment
     * @param int  $closepaidcontrib 1=Also close payed contributions to paid, 0=Do nothing more
     *
     * @return     int                            <0 if KO, id of payment if OK
     */
    public function create($user, $closepaidcontrib = 0)
    {
        global $conf, $langs;

        $error = 0;

        $now = dol_now();

        dol_syslog(get_class($this) . "::create", LOG_DEBUG);

        // Validate parametres
        if (!$this->datepaye) {
            $this->error = 'ErrorBadValueForParameterCreatePaymentSalary';
            return -1;
        }

        // Clean parameters
        if (isset($this->fk_salary)) {
            $this->fk_salary = (int) $this->fk_salary;
        }
        if (isset($this->amount)) {
            $this->amount = trim($this->amount);
        }
        if (isset($this->fk_typepayment)) {
            $this->fk_typepayment = (int) $this->fk_typepayment;
        }
        if (isset($this->num_paiement)) {
            $this->num_paiement = trim($this->num_paiement);
        } // deprecated
        if (isset($this->num_payment)) {
            $this->num_payment = trim($this->num_payment);
        }
        if (isset($this->note)) {
            $this->note = trim($this->note);
        }
        if (isset($this->fk_bank)) {
            $this->fk_bank = (int) $this->fk_bank;
        }
        if (isset($this->fk_user_author)) {
            $this->fk_user_author = (int) $this->fk_user_author;
        }
        if (isset($this->fk_user_modif)) {
            $this->fk_user_modif = (int) $this->fk_user_modif;
        }

        $totalamount = 0;
        foreach ($this->amounts as $key => $value) {  // How payment is dispatch
            $newvalue = price2num($value, 'MT');
            $this->amounts[$key] = $newvalue;
            $totalamount += $newvalue;
        }
        $totalamount = price2num($totalamount);

        // Check parameters
        if ($totalamount == 0) {
            return -1;
        } // On accepte les montants negatifs pour les rejets de prelevement mais pas null

        $this->db->begin();

        if ($totalamount != 0) {
            $sql = "INSERT INTO " . MAIN_DB_PREFIX . "payment_salary (fk_salary, datec, datep, amount,";
            $sql .= " fk_typepayment, num_payment, note, fk_user_author, fk_bank)";
            $sql .= " VALUES ($this->chid, '" . $this->db->idate($now) . "',";
            $sql .= " '" . $this->db->idate($this->datepaye) . "',";
            $sql .= " " . price2num($totalamount) . ",";
            $sql .= " " . ((int) $this->paiementtype) . ", '" . $this->db->escape($this->num_payment) . "', '" . $this->db->escape($this->note) . "', " . ((int) $user->id) . ",";
            $sql .= " 0)";

            $resql = $this->db->query($sql);
            if ($resql) {
                $this->id = $this->db->last_insert_id(MAIN_DB_PREFIX . "payment_salary");

                // Insere tableau des montants / factures
                foreach ($this->amounts as $key => $amount) {
                    $contribid = $key;
                    if (is_numeric($amount) && $amount <> 0) {
                        $amount = price2num($amount);

                        // If we want to closed payed invoices
                        if ($closepaidcontrib) {
                            $contrib = new Salary($this->db);
                            $contrib->fetch($contribid);
                            $paiement = $contrib->getSommePaiement();
                            //$creditnotes=$contrib->getSumCreditNotesUsed();
                            $creditnotes = 0;
                            //$deposits=$contrib->getSumDepositsUsed();
                            $deposits = 0;
                            $alreadypayed = price2num($paiement + $creditnotes + $deposits, 'MT');
                            $remaintopay = price2num($contrib->amount - $paiement - $creditnotes - $deposits, 'MT');
                            if ($remaintopay == 0) {
                                $result = $contrib->set_paid($user);
                            } else {
                                dol_syslog("Remain to pay for conrib " . $contribid . " not null. We do nothing.");
                            }
                        }
                    }
                }
            } else {
                $error++;
            }
        }

        $result = $this->call_trigger('PAYMENTSALARY_CREATE', $user);
        if ($result < 0) {
            $error++;
        }

        if ($totalamount != 0 && !$error) {
            $this->amount = $totalamount;
            $this->total = $totalamount; // deprecated
            $this->db->commit();
            return $this->id;
        } else {
            $this->error = $this->db->error();
            $this->db->rollback();
            return -1;
        }
    }

    /**
     *  Initialise an instance with random values.
     *  Used to build previews or test instances.
     *    id must be 0 if object instance is a specimen.
     *
     * @return    void
     */
    public function initAsSpecimen()
    {
        $this->id = 0;

        $this->fk_salary = '';
        $this->datec = '';
        $this->tms = '';
        $this->datep = '';
        $this->amount = '';
        $this->fk_typepayment = '';
        $this->num_payment = '';
        $this->note_private = '';
        $this->note_public = '';
        $this->fk_bank = '';
        $this->fk_user_author = '';
        $this->fk_user_modif = '';
    }

    /**
     *      Add record into bank for payment with links between this bank record and invoices of payment.
     *      All payment properties must have been set first like after a call to create().
     *
     * @param User   $user            Object of user making payment
     * @param string $mode            'payment_salary'
     * @param string $label           Label to use in bank record
     * @param int    $accountid       Id of bank account to do link with
     * @param string $emetteur_nom    Name of transmitter
     * @param string $emetteur_banque Name of bank
     *
     * @return int                        <0 if KO, >0 if OK
     */
    public function addPaymentToBank($user, $mode, $label, $accountid, $emetteur_nom, $emetteur_banque)
    {
        global $conf;

        // Clean data
        $this->num_payment = trim($this->num_payment ? $this->num_payment : $this->num_paiement);

        $error = 0;

        if (!empty($conf->banque->enabled)) {
            include_once DOL_DOCUMENT_ROOT . '/Modules/Compta/bank/class/account.class.php';

            $acc = new Account($this->db);
            $acc->fetch($accountid);

            $total = $this->amount;

            // Insert payment into llx_bank
            $bank_line_id = $acc->addline(
                $this->datepaye,
                $this->paiementtype, // Payment mode id or code ("CHQ or VIR for example")
                $label,
                -$total,
                $this->num_payment,
                '',
                $user,
                $emetteur_nom,
                $emetteur_banque,
                '',
                $this->datev
            );

            // Update fk_bank into llx_paiement_salary.
            // so we know the payment that was used to generated the bank entry.
            if ($bank_line_id > 0) {
                $result = $this->update_fk_bank($bank_line_id);
                if ($result <= 0) {
                    $error++;
                    dol_print_error($this->db);
                }

                // Add link 'payment_salary' in bank_url between payment and bank transaction
                $url = '';
                if ($mode == 'payment_salary') {
                    $url = DOL_URL_ROOT . '/salaries/payment_salary/card.php?id=';
                }

                if ($url) {
                    $result = $acc->add_url_line($bank_line_id, $this->id, $url, '(paiement)', $mode);
                    if ($result <= 0) {
                        $error++;
                        dol_print_error($this->db);
                    }
                }

                // Add link 'user' in bank_url between user and bank transaction
                foreach ($this->amounts as $key => $value) {
                    if (!$error) {
                        if ($mode == 'payment_salary') {
                            $salary = new Salary($this->db);
                            $salary->fetch($key);
                            $salary->fetch_user($salary->fk_user);

                            $fuser = $salary->user;

                            if ($fuser->id > 0) {
                                $result = $acc->add_url_line(
                                    $bank_line_id,
                                    $fuser->id,
                                    DOL_URL_ROOT . '/Modules/Users/card.php?id=',
                                    $fuser->getFullName($langs),
                                    'user'
                                );
                            }
                            if ($result <= 0) {
                                $this->error = $this->db->lasterror();
                                dol_syslog(get_class($this) . '::addPaymentToBank ' . $this->error);
                                $error++;
                            }
                        }
                    }
                }
            } else {
                $this->error = $acc->error;
                $error++;
            }
        }

        if (!$error) {
            return 1;
        } else {
            return -1;
        }
    }


    // phpcs:disable PEAR.NamingConventions.ValidFunctionName.ScopeNotCamelCaps

    /**
     *  Mise a jour du lien entre le paiement de  salaire et la ligne dans llx_bank generee
     *
     * @param int $id_bank Id if bank
     *
     * @return    int                         >0 if OK, <=0 if KO
     */
    public function update_fk_bank($id_bank)
    {
        // phpcs:enable
        $sql = "UPDATE " . MAIN_DB_PREFIX . "payment_salary SET fk_bank = " . ((int) $id_bank) . " WHERE rowid = " . ((int) $this->id);

        dol_syslog(get_class($this) . "::update_fk_bank", LOG_DEBUG);
        $result = $this->db->query($sql);
        if ($result) {
            return 1;
        } else {
            $this->error = $this->db->error();
            return 0;
        }
    }

    /**
     * Retourne le libelle du statut d'une facture (brouillon, validee, abandonnee, payee)
     *
     * @param int $mode 0=libelle long, 1=libelle court, 2=Picto + Libelle court, 3=Picto, 4=Picto + Libelle long, 5=Libelle court + Picto
     *
     * @return  string                Libelle
     */
    public function getLibStatut($mode = 0)
    {
        return $this->LibStatut($this->statut, $mode);
    }

    // phpcs:disable PEAR.NamingConventions.ValidFunctionName.ScopeNotCamelCaps

    /**
     * Renvoi le libelle d'un statut donne
     *
     * @param int $status Statut
     * @param int $mode   0=libelle long, 1=libelle court, 2=Picto + Libelle court, 3=Picto, 4=Picto + Libelle long, 5=Libelle court + Picto
     *
     * @return    string            Libelle du statut
     */
    public function LibStatut($status, $mode = 0)
    {
        // phpcs:enable
        global $langs; // TODO Renvoyer le libelle anglais et faire traduction a affichage

        $langs->load('compta');
        /*if ($mode == 0)
            {
            if ($status == 0) return $langs->trans('ToValidate');
            if ($status == 1) return $langs->trans('Validated');
            }
            if ($mode == 1)
            {
            if ($status == 0) return $langs->trans('ToValidate');
            if ($status == 1) return $langs->trans('Validated');
            }
            if ($mode == 2)
            {
            if ($status == 0) return img_picto($langs->trans('ToValidate'),'statut1').' '.$langs->trans('ToValidate');
            if ($status == 1) return img_picto($langs->trans('Validated'),'statut4').' '.$langs->trans('Validated');
            }
            if ($mode == 3)
            {
            if ($status == 0) return img_picto($langs->trans('ToValidate'),'statut1');
            if ($status == 1) return img_picto($langs->trans('Validated'),'statut4');
            }
            if ($mode == 4)
            {
            if ($status == 0) return img_picto($langs->trans('ToValidate'),'statut1').' '.$langs->trans('ToValidate');
            if ($status == 1) return img_picto($langs->trans('Validated'),'statut4').' '.$langs->trans('Validated');
            }
            if ($mode == 5)
            {
            if ($status == 0) return $langs->trans('ToValidate').' '.img_picto($langs->trans('ToValidate'),'statut1');
            if ($status == 1) return $langs->trans('Validated').' '.img_picto($langs->trans('Validated'),'statut4');
            }
            if ($mode == 6)
            {
            if ($status == 0) return $langs->trans('ToValidate').' '.img_picto($langs->trans('ToValidate'),'statut1');
            if ($status == 1) return $langs->trans('Validated').' '.img_picto($langs->trans('Validated'),'statut4');
            }*/
        return '';
    }

    /**
     *  Return clicable name (with picto eventually)
     *
     * @param int $withpicto 0=No picto, 1=Include picto into link, 2=Only picto
     * @param int $maxlen    Longueur max libelle
     *
     * @return    string                    Chaine avec URL
     */
    public function getNomUrl($withpicto = 0, $maxlen = 0)
    {
        global $langs;

        $result = '';

        if (empty($this->ref)) {
            $this->ref = $this->lib;
        }

        $label = img_picto('', $this->picto) . ' <u>' . $langs->trans("SalaryPayment") . '</u>';
        $label .= '<br><b>' . $langs->trans('Ref') . ':</b> ' . $this->ref;
        if (!empty($this->label)) {
            $labeltoshow = $this->label;
            $reg = [];
            if (preg_match('/^\((.*)\)$/i', $this->label, $reg)) {
                // Label generique car entre parentheses. On l'affiche en le traduisant
                if ($reg[1] == 'paiement') {
                    $reg[1] = 'Payment';
                }
                $labeltoshow = $langs->trans($reg[1]);
            }
            $label .= '<br><b>' . $langs->trans('Label') . ':</b> ' . $labeltoshow;
        }
        if ($this->datep) {
            $label .= '<br><b>' . $langs->trans('Date') . ':</b> ' . dol_print_date($this->datep, 'day');
        }

        if (!empty($this->id)) {
            $link = '<a href="' . DOL_URL_ROOT . '/salaries/payment_salary/card.php?id=' . $this->id . '" title="' . dol_escape_htmltag($label, 1) . '" class="classfortooltip">';
            $linkend = '</a>';

            if ($withpicto) {
                $result .= ($link . img_object($label, 'payment', 'class="classfortooltip"') . $linkend . ' ');
            }
            if ($withpicto && $withpicto != 2) {
                $result .= ' ';
            }
            if ($withpicto != 2) {
                $result .= $link . ($maxlen ? dol_trunc($this->ref, $maxlen) : $this->ref) . $linkend;
            }
        }

        return $result;
    }
}