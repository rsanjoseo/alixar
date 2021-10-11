<?php

// Descend to the htdocs folder
chdir('../../..');
define('BASE_FOLDER', getcwd());

const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;
const NOREQUIREHTML = 0;
const NOREQUIREDB = 0;      // Si aparece el mensaje: "Call to member function useLocalTax() on null"
const NOREQUIRESOC = 0;     // Es que no se ha asignado a $mysoc el valor correspondiente.

require 'main.php';

require_once DOL_DOCUMENT_ROOT . '/Modules/Products/inventory/class/inventory.class.php';

$get = GETPOST('get', 'alpha');
$put = GETPOST('put', 'alpha');

switch ($put) {
    case 'qty':
        if (empty($user->rights->stock->creer)) {
            echo -1;
            exit;
        }

        $fk_det_inventory = GETPOST('fk_det_inventory');

        $det = new InventoryLine($db);
        if ($det->fetch($fk_det_inventory)) {
            $det->qty_view += GETPOST('qty');
            $res = $det->update($user);

            echo $det->qty_view;
        } else {
            echo -2;
        }

        break;

    case 'pmp':
        if (empty($user->rights->stock->creer) || empty($user->rights->stock->changePMP)) {
            echo -1;
            exit;
        }

        $fk_det_inventory = GETPOST('fk_det_inventory');

        $det = new InventoryLine($db);
        if ($det->fetch($fk_det_inventory)) {
            $det->new_pmp = price2num(GETPOST('pmp'));
            $det->update($user);

            echo $det->new_pmp;
        } else {
            echo -2;
        }

        break;
}
