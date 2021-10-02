<?php
/*
 * View
 */

// TODO: Used only to determine the default language
$formadmin = new FormAdmin(''); // Note: $db does not exist yet but we don't need it, so we put ''.

pHeader("", "check"); // Next step = check

// Ask installation language
print '<br><br><div class="center">';
print '<table>';

print '<tr>';
print '<td>' . $langs->trans("DefaultLanguage") . ' : </td><td>';
print $formadmin->select_language('auto', 'selectlang', 1, 0, 0, 1);
print '</td>';
print '</tr>';

print '</table></div>';

print '<br><br><span class="opacitymedium">' . $langs->trans("SomeTranslationAreUncomplete") . '</span>';

// If there's no error, we display the next step button
if ($err == 0) {
    pFooter(0);
}
