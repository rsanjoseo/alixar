<?php
/**
 * We could rename each original file, and make it redirect to the main index.php to update the application.
 */
if (file_exists('index_dol.php')) {
    include 'index_dol.php';
    die();
}
header('location: index2.php?module=societe&controller=init');
die();