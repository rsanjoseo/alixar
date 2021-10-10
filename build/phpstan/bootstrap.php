<?php

// Descend to the htdocs folder
chdir('../../..');
define('BASE_FOLDER', getcwd());

// Example to use PHPStan
// cd git/dolibarr
// /usr/bin/php7.2 ../phpstan.phar -l1 analyze htdocs/societe/website.php --memory-limit 2G

// Defined some constants and load Dolibarr env to reduce PHPStan bootstrap that fails to load a lot of things.
//define('DOL_DOCUMENT_ROOT', __DIR__ . '/../../htdocs');
//define('DOL_DATA_ROOT', __DIR__ . '/../../documents');
//define('DOL_URL_ROOT', '/');

// Load the main.inc.php file to have functions llx_Header and llx_Footer defined
if (!defined("NOLOGIN")) {
    define("NOLOGIN", '1');
}
global $conf, $langs, $user, $db;

const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;
const NOREQUIREHTML = 0;
const NOREQUIREDB = 0;      // Si aparece el mensaje: "Call to member function useLocalTax() on null"
const NOREQUIRESOC = 0;     // Es que no se ha asignado a $mysoc el valor correspondiente.

require 'main.php';
