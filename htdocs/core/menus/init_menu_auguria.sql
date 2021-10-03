--
-- Menu base entries
-- This file is loaded when a menu handler base is activated (auguria, etc..)
--

delete
from llx_menu
where menu_handler =__HANDLER__ and entity=__ENTITY__;

--
-- table llx_menu
--
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '1', 1__ + MAX_llx_menu__, __ HANDLER__, 'top', 'home', '', 0, '/index.php?mainmenu=home&amp;leftmenu=',
        'Home', -1, '', '', '', 2, 10, __ ENTITY__);
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('societe|fournisseur|supplier_order|supplier_invoice',
        '($conf->societe->enabled && (empty($conf->global->SOCIETE_DISABLE_PROSPECTS) || empty($conf->global->SOCIETE_DISABLE_CUSTOMERS) || !empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || $conf->supplier_order->enabled || $conf->supplier_invoice->enabled))',
        2__ + MAX_llx_menu__, __ HANDLER__, 'top', 'companies', '', 0,
        '/societe/index.php?mainmenu=companies&amp;leftmenu=', 'ThirdParties', -1, 'companies',
        '$user->rights->societe->lire || $user->rights->societe->contact->lire', '', 2, 20, __ ENTITY__);
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('product|service', '$conf->product->enabled || $conf->service->enabled', 3__ + MAX_llx_menu__, __ HANDLER__,
        'top', 'products', '', 0, '/product/index.php?mainmenu=products&amp;leftmenu=', 'ProductsPipeServices', -1,
        'products', '$user->rights->produit->lire||$user->rights->service->lire', '', 0, 30, __ ENTITY__);
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('bom|mrp', '$conf->bom->enabled || $conf->mrp->enabled', 16__ + MAX_llx_menu__, __ HANDLER__, 'top', 'mrp', '',
        0, '/mrp/index.php?mainmenu=mrp&amp;leftmenu=', 'MRP', -1, 'mrp',
        '$user->rights->bom->read||$user->rights->mrp->read', '', 0, 31, __ ENTITY__);
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('projet', '$conf->projet->enabled', 7__ + MAX_llx_menu__, __ HANDLER__, 'top', 'project', '', 0,
        '/projet/index.php?mainmenu=project&amp;leftmenu=', 'Projects', -1, 'projects', '$user->rights->projet->lire',
        '', 2, 32, __ ENTITY__);
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('propal|commande|fournisseur|supplier_order|supplier_invoice|contrat|ficheinter',
        '$conf->propal->enabled || $conf->commande->enabled || $conf->supplier_order->enabled || $conf->contrat->enabled || $conf->ficheinter->enabled',
        5__ + MAX_llx_menu__, __ HANDLER__, 'top', 'commercial', '', 0,
        '/comm/index.php?mainmenu=commercial&amp;leftmenu=', 'Commercial', -1, 'commercial',
        '$user->rights->societe->lire || $user->rights->societe->contact->lire', '', 2, 40, __ ENTITY__);
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('facture|don|tax|salaries|loan|banque',
        '$conf->comptabilite->enabled || $conf->accounting->enabled || $conf->facture->enabled || $conf->don->enabled  || $conf->tax->enabled || $conf->salaries->enabled || $conf->supplier_invoice->enabled || $conf->loan->enabled || $conf->banque->enabled',
        6__ + MAX_llx_menu__, __ HANDLER__, 'top', 'billing', '', 0, '/compta/index.php?mainmenu=billing&amp;leftmenu=',
        'MenuFinancial', -1, 'compta',
        '$user->rights->facture->lire|| $user->rights->don->lire || $user->rights->tax->charges->lire || $user->rights->salaries->read || $user->rights->loan->read || $user->rights->banque->lire',
        '', 2, 50, __ ENTITY__);
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('banque|prelevement', '$conf->banque->enabled || $conf->prelevement->enabled', 14__ + MAX_llx_menu__, __
        HANDLER__, 'top', 'bank', '', 0, '/compta/bank/list.php?mainmenu=bank&amp;leftmenu=bank', 'MenuBankCash', -1,
        'banks', '$user->rights->banque->lire || $user->rights->prelevement->bons->lire', '', 0, 52, __ ENTITY__);
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('comptabilite|accounting|asset',
        '$conf->comptabilite->enabled || $conf->accounting->enabled || $conf->asset->enabled', 9__ + MAX_llx_menu__, __
        HANDLER__, 'top', 'accountancy', '', 0, '/compta/index.php?mainmenu=accountancy&amp;leftmenu=accountancy',
        'MenuAccountancy', -1, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->mouvements->lire || $user->rights->asset->read',
        '', 2, 54, __ ENTITY__);
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '', 8__ + MAX_llx_menu__, __ HANDLER__, 'top', 'tools', '', 0,
        '/core/tools.php?mainmenu=tools&amp;leftmenu=', 'Tools', -1, 'other', '', '', 2, 90, __ ENTITY__);
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('adherent', '$conf->adherent->enabled', 13__ + MAX_llx_menu__, __ HANDLER__, 'top', 'members', '', 0,
        '/adherents/index.php?mainmenu=members&amp;leftmenu=', 'Members', -1, 'members',
        '$user->rights->adherent->lire', '', 2, 19, __ ENTITY__);
insert into llx_menu (module, enabled, rowid, menu_handler, type, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('hrm|holiday|deplacement|expensereport',
        '$conf->hrm->enabled || $conf->holiday->enabled || $conf->deplacement->enabled || $conf->expensereport->enabled',
        15__ + MAX_llx_menu__, __ HANDLER__, 'top', 'hrm', '', 0, '/hrm/index.php?mainmenu=hrm&amp;leftmenu=', 'HRM',
        -1, 'holiday',
        '$user->rights->user->user->lire || $user->rights->holiday->read || $user->rights->deplacement->lire || $user->rights->expensereport->lire',
        '', 0, 80, __ ENTITY__);

-- Home - Dashboard
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '1', __ HANDLER__, 'left', 90__ + MAX_llx_menu__, 'home', '', 1__ + MAX_llx_menu__, '/index.php',
        'MyDashboard', 0, '', '', '', 2, 0, __ ENTITY__);

-- Home - Setup
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$user->admin', __ HANDLER__, 'left', 100__ + MAX_llx_menu__, 'home', 'setup', 1__ + MAX_llx_menu__,
        '/admin/index.php?mainmenu=home&amp;leftmenu=setup', 'Setup', 0, 'admin', '', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 101__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '?module=Admin&controller=company&mainmenu=home&amp;leftmenu=setup', 'MenuCompanySetup', 1, 'admin', '', '', 2,
        1, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 102__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/ihm.php?mainmenu=home&amp;leftmenu=setup', 'GUISetup', 1, 'admin', '', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 114__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/translation.php?mainmenu=home&amp;leftmenu=setup', 'Translation', 1, 'admin', '', '', 2, 4, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 115__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/defaultvalues.php?mainmenu=home&amp;leftmenu=setup', 'DefaultValues', 1, 'admin', '', '', 2, 4, __
        ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 103__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/modules.php?mainmenu=home&amp;leftmenu=setup', 'Modules', 1, 'admin', '', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 104__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/boxes.php?mainmenu=home&amp;leftmenu=setup', 'Boxes', 1, 'admin', '', '', 2, 6, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 105__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/menus.php?mainmenu=home&amp;leftmenu=setup', 'Menus', 1, 'admin', '', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 106__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/delais.php?mainmenu=home&amp;leftmenu=setup', 'Alerts', 1, 'admin', '', '', 2, 7, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 108__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/security_other.php?mainmenu=home&amp;leftmenu=setup', 'Security', 1, 'admin', '', '', 2, 8, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 110__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/limits.php?mainmenu=home&amp;leftmenu=setup', 'MenuLimits', 1, 'admin', '', '', 2, 9, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 107__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/pdf.php?mainmenu=home&amp;leftmenu=setup', 'PDF', 1, 'admin', '', '', 2, 10, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 109__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/mails.php?mainmenu=home&amp;leftmenu=setup', 'Emails', 1, 'admin', '', '', 2, 11, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 113__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/sms.php?mainmenu=home&amp;leftmenu=setup', 'SMS', 1, 'admin', '', '', 2, 12, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 111__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/dict.php?mainmenu=home&amp;leftmenu=setup', 'Dictionary', 1, 'admin', '', '', 2, 13, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="setup"', __ HANDLER__, 'left', 112__ + MAX_llx_menu__, 'home', '', 100__ + MAX_llx_menu__,
        '/admin/const.php?mainmenu=home&amp;leftmenu=setup', 'OtherSetup', 1, 'admin', '', '', 2, 14, __ ENTITY__);
-- Home - Admin tools
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$user->admin', __ HANDLER__, 'left', 300__ + MAX_llx_menu__, 'home', 'admintools', 1__ + MAX_llx_menu__,
        '/admin/tools/index.php?mainmenu=home&amp;leftmenu=admintools', 'AdminTools', 0, 'admin', '', '', 2, 2, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 201__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/system/dolibarr.php?mainmenu=home&amp;leftmenu=admintools', 'InfoDolibarr', 1, 'admin', '', '', 2, 0, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 202__ + MAX_llx_menu__, 'home', '', 201__ + MAX_llx_menu__,
        '/admin/system/modules.php?mainmenu=home&amp;leftmenu=admintools', 'Modules', 2, 'admin', '', '', 2, 2, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 203__ + MAX_llx_menu__, 'home', '', 201__ + MAX_llx_menu__,
        '/admin/triggers.php?mainmenu=home&amp;leftmenu=admintools', 'Triggers', 2, 'admin', '', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 204__ + MAX_llx_menu__, 'home', '', 201__ + MAX_llx_menu__,
        '/admin/system/filecheck.php?mainmenu=home&amp;leftmenu=admintools', 'FileCheck', 2, 'admin', '', '', 2, 4, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 205__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/system/browser.php?mainmenu=home&amp;leftmenu=admintools', 'InfoBrowser', 1, 'admin', '', '', 2, 1, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 206__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/system/os.php?mainmenu=home&amp;leftmenu=admintools', 'InfoOS', 1, 'admin', '', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 207__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/system/web.php?mainmenu=home&amp;leftmenu=admintools', 'InfoWebServer', 1, 'admin', '', '', 2, 3, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 208__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/system/phpinfo.php?mainmenu=home&amp;leftmenu=admintools', 'InfoPHP', 1, 'admin', '', '', 2, 4, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 210__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/system/database.php?mainmenu=home&amp;leftmenu=admintools', 'InfoDatabase', 1, 'admin', '', '', 2, 5, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 301__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/tools/dolibarr_export.php?mainmenu=home&amp;leftmenu=admintools', 'Backup', 1, 'admin', '', '', 2, 6, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 302__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/tools/dolibarr_import.php?mainmenu=home&amp;leftmenu=admintools', 'Restore', 1, 'admin', '', '', 2, 7, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 305__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/tools/update.php?mainmenu=home&amp;leftmenu=admintools', 'MenuUpgrade', 1, 'admin', '', '', 2, 8, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 307__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/tools/listevents.php?mainmenu=home&amp;leftmenu=admintools', 'Audit', 1, 'admin', '', '', 2, 10, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 308__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/tools/listsessions.php?mainmenu=home&amp;leftmenu=admintools', 'Sessions', 1, 'admin', '', '', 2, 11, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 309__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/tools/purge.php?mainmenu=home&amp;leftmenu=admintools', 'Purge', 1, 'admin', '', '', 2, 12, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 311__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/admin/system/about.php?mainmenu=home&amp;leftmenu=admintools', 'ExternalResources', 1, 'admin', '', '', 2,
        14, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="admintools"', __ HANDLER__, 'left', 320__ + MAX_llx_menu__, 'home', '', 300__ + MAX_llx_menu__,
        '/product/admin/product_tools.php?mainmenu=home&amp;leftmenu=admintools', 'ProductVatMassChange', 1, 'products',
        '', '', 2, 15, __ ENTITY__);
-- Home - Menu users and groups
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '1', __ HANDLER__, 'left', 400__ + MAX_llx_menu__, 'home', 'users', 1__ + MAX_llx_menu__,
        '/user/home.php?mainmenu=home&amp;leftmenu=users', 'MenuUsersAndGroups', 0, 'users', '', '', 2, 4, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="users"', __ HANDLER__, 'left', 401__ + MAX_llx_menu__, 'home', '', 400__ + MAX_llx_menu__,
        '/user/list.php?mainmenu=home&amp;leftmenu=users', 'Users', 1, 'users',
        '$user->rights->user->user->lire || $user->admin', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="users"', __ HANDLER__, 'left', 402__ + MAX_llx_menu__, 'home', '', 401__ + MAX_llx_menu__,
        '/user/card.php?mainmenu=home&amp;leftmenu=users&amp;action=create', 'NewUser', 2, 'users',
        '($user->rights->user->user->creer || $user->admin) && !(! empty($conf->multicompany->enabled) && $conf->entity > 1 && $conf->global->MULTICOMPANY_TRANSVERSE_MODE)',
        '', 2, 0, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="users"', __ HANDLER__, 'left', 404__ + MAX_llx_menu__, 'home', '', 401__ + MAX_llx_menu__,
        '/user/hierarchy.php?mainmenu=home&amp;leftmenu=users', 'HierarchicView', 1, 'users',
        '$user->rights->user->user->lire || $user->admin', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="users"', __ HANDLER__, 'left', 405__ + MAX_llx_menu__, 'home', '', 401__ + MAX_llx_menu__,
        '/categories/index.php?mainmenu=home&amp;leftmenu=users&type=7', 'UsersCategoriesShort', 1, 'categories',
        '$user->rights->user->user->lire || $user->admin', '', 2, 0, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="users"', __ HANDLER__, 'left', 407__ + MAX_llx_menu__, 'home', '', 400__ + MAX_llx_menu__,
        '/user/group/list.php?mainmenu=home&amp;leftmenu=users', 'Groups', 1, 'users',
        '(($conf->global->MAIN_USE_ADVANCED_PERMS?$user->rights->user->group_advance->read:$user->rights->user->user->lire) || $user->admin) && !(! empty($conf->multicompany->enabled) && $conf->entity > 1 && $conf->global->MULTICOMPANY_TRANSVERSE_MODE)',
        '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$leftmenu=="users"', __ HANDLER__, 'left', 408__ + MAX_llx_menu__, 'home', '', 407__ + MAX_llx_menu__,
        '/user/group/card.php?mainmenu=home&amp;leftmenu=users&amp;action=create', 'NewGroup', 2, 'users',
        '(($conf->global->MAIN_USE_ADVANCED_PERMS?$user->rights->user->group_advance->write:$user->rights->user->user->creer) || $user->admin) && !(! empty($conf->multicompany->enabled) && $conf->entity > 1 && $conf->global->MULTICOMPANY_TRANSVERSE_MODE)',
        '', 2, 0, __ ENTITY__);

-- Third parties
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 500__ + MAX_llx_menu__, 'companies', 'thirdparties',
        2__ + MAX_llx_menu__, '/societe/index.php?mainmenu=companies&amp;leftmenu=thirdparties', 'ThirdParty', 0,
        'companies', '$user->rights->societe->lire', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 501__ + MAX_llx_menu__, 'companies', '',
        500__ + MAX_llx_menu__, '/societe/card.php?mainmenu=companies&amp;action=create', 'MenuNewThirdParty', 1,
        'companies', '$user->rights->societe->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 502__ + MAX_llx_menu__, 'companies', '',
        500__ + MAX_llx_menu__, '/societe/list.php?mainmenu=companies&amp;leftmenu=thirdparties', 'List', 1,
        'companies', '$user->rights->societe->lire', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->societe->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled))', __
        HANDLER__, 'left', 503__ + MAX_llx_menu__, 'companies', '', 500__ + MAX_llx_menu__,
        '/societe/list.php?mainmenu=companies&amp;type=f&leftmenu=suppliers', 'ListSuppliersShort', 1, 'suppliers',
        '$user->rights->societe->lire && $user->rights->fournisseur->lire', '', 2, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->societe->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled))', __
        HANDLER__, 'left', 504__ + MAX_llx_menu__, 'companies', '', 503__ + MAX_llx_menu__,
        '/societe/card.php?mainmenu=companies&amp;leftmenu=supplier&amp;action=create&amp;type=f', 'NewSupplier', 2,
        'suppliers', '$user->rights->societe->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 506__ + MAX_llx_menu__, 'companies', '',
        500__ + MAX_llx_menu__, '/societe/list.php?mainmenu=companies&amp;type=p&leftmenu=prospects',
        'ListProspectsShort', 1, 'companies', '$user->rights->societe->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 507__ + MAX_llx_menu__, 'companies', '',
        506__ + MAX_llx_menu__,
        '/societe/card.php?mainmenu=companies&amp;leftmenu=prospects&amp;action=create&amp;type=p', 'MenuNewProspect',
        2, 'companies', '$user->rights->societe->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 509__ + MAX_llx_menu__, 'companies', '',
        500__ + MAX_llx_menu__, '/societe/list.php?mainmenu=companies&amp;type=c&leftmenu=customers',
        'ListCustomersShort', 1, 'companies', '$user->rights->societe->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 510__ + MAX_llx_menu__, 'companies', '',
        509__ + MAX_llx_menu__,
        '/societe/card.php?mainmenu=companies&amp;leftmenu=customers&amp;action=create&amp;type=c', 'MenuNewCustomer',
        2, 'companies', '$user->rights->societe->creer', '', 2, 0, __ ENTITY__);
-- Third parties - Contacts
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 600__ + MAX_llx_menu__, 'companies', 'contacts',
        2__ + MAX_llx_menu__, '/contact/list.php?mainmenu=companies&amp;leftmenu=contacts', 'ContactsAddresses', 0,
        'companies', '$user->rights->societe->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 601__ + MAX_llx_menu__, 'companies', '',
        600__ + MAX_llx_menu__, '/contact/card.php?mainmenu=companies&amp;leftmenu=contacts&amp;action=create',
        'NewContactAddress', 1, 'companies', '$user->rights->societe->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 602__ + MAX_llx_menu__, 'companies', '',
        600__ + MAX_llx_menu__, '/contact/list.php?mainmenu=companies&amp;leftmenu=contacts', 'List', 1, 'companies',
        '$user->rights->societe->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 604__ + MAX_llx_menu__, 'companies', '',
        602__ + MAX_llx_menu__, '/contact/list.php?mainmenu=companies&amp;leftmenu=contacts&amp;type=p',
        'ThirdPartyProspects', 2, 'companies', '$user->rights->societe->contact->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 605__ + MAX_llx_menu__, 'companies', '',
        602__ + MAX_llx_menu__, '/contact/list.php?mainmenu=companies&amp;leftmenu=contacts&amp;type=c',
        'ThirdPartyCustomers', 2, 'companies', '$user->rights->societe->contact->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->societe->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled))', __
        HANDLER__, 'left', 606__ + MAX_llx_menu__, 'companies', '', 602__ + MAX_llx_menu__,
        '/contact/list.php?mainmenu=companies&amp;leftmenu=contacts&amp;type=f', 'ThirdPartySuppliers', 2, 'companies',
        '$user->rights->societe->contact->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled', __ HANDLER__, 'left', 607__ + MAX_llx_menu__, 'companies', '',
        602__ + MAX_llx_menu__, '/contact/list.php?mainmenu=companies&amp;leftmenu=contacts&amp;type=o', 'Others', 2,
        'companies', '$user->rights->societe->contact->lire', '', 2, 4, __ ENTITY__);
-- Third parties - Category customer
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled && $conf->categorie->enabled', __ HANDLER__, 'left', 650__ + MAX_llx_menu__,
        'companies', 'cat', 2__ + MAX_llx_menu__,
        '/categories/index.php?mainmenu=companies&amp;leftmenu=cat&amp;type=1', 'SuppliersCategoriesShort', 0,
        'categories', '$user->rights->categorie->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled && $conf->categorie->enabled', __ HANDLER__, 'left', 651__ + MAX_llx_menu__,
        'companies', '', 650__ + MAX_llx_menu__, '/categories/card.php?mainmenu=companies&amp;action=create&amp;type=1',
        'NewCategory', 1, 'categories', '$user->rights->categorie->creer', '', 2, 0, __ ENTITY__);
-- Third parties - Category supplier
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '(!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled)) && $conf->categorie->enabled', __
        HANDLER__, 'left', 660__ + MAX_llx_menu__, 'companies', 'cat', 2__ + MAX_llx_menu__,
        '/categories/index.php?mainmenu=companies&amp;leftmenu=cat&amp;type=2', 'CustomersProspectsCategoriesShort', 0,
        'categories', '$user->rights->categorie->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '(!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled)) && $conf->categorie->enabled', __
        HANDLER__, 'left', 661__ + MAX_llx_menu__, 'companies', '', 660__ + MAX_llx_menu__,
        '/categories/card.php?mainmenu=companies&amp;action=create&amp;type=2', 'NewCategory', 1, 'categories',
        '$user->rights->categorie->creer', '', 2, 0, __ ENTITY__);
-- Third parties - Category contact
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled && $conf->categorie->enabled', __ HANDLER__, 'left', 670__ + MAX_llx_menu__,
        'companies', 'cat', 2__ + MAX_llx_menu__,
        '/categories/index.php?mainmenu=companies&amp;leftmenu=cat&amp;type=4', 'ContactCategoriesShort', 0,
        'categories', '$user->rights->categorie->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->societe->enabled && $conf->categorie->enabled', __ HANDLER__, 'left', 671__ + MAX_llx_menu__,
        'companies', '', 670__ + MAX_llx_menu__, '/categories/card.php?mainmenu=companies&amp;action=create&amp;type=4',
        'NewCategory', 1, 'categories', '$user->rights->categorie->creer', '', 2, 0, __ ENTITY__);
-- Product - Product
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->product->enabled', __ HANDLER__, 'left', 2800__ + MAX_llx_menu__, 'products', 'product',
        3__ + MAX_llx_menu__, '/product/index.php?mainmenu=products&amp;leftmenu=product&amp;type=0', 'Products', 0,
        'products', '$user->rights->produit->lire', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->product->enabled', __ HANDLER__, 'left', 2801__ + MAX_llx_menu__, 'products', '',
        2800__ + MAX_llx_menu__,
        '/product/card.php?mainmenu=products&amp;leftmenu=product&amp;action=create&amp;type=0', 'NewProduct', 1,
        'products', '$user->rights->produit->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->product->enabled', __ HANDLER__, 'left', 2802__ + MAX_llx_menu__, 'products', '',
        2800__ + MAX_llx_menu__, '/product/list.php?mainmenu=products&amp;leftmenu=product&amp;type=0', 'List', 1,
        'products', '$user->rights->produit->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->product->enabled', __ HANDLER__, 'left', 2803__ + MAX_llx_menu__, 'products', '',
        2800__ + MAX_llx_menu__, '/product/reassort.php?mainmenu=products&amp;type=0', 'MenuStocks', 1, 'products',
        '$user->rights->produit->lire && $user->rights->stock->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->productbatch->enabled', __ HANDLER__, 'left', 2805__ + MAX_llx_menu__, 'products', '',
        2800__ + MAX_llx_menu__, '/product/reassortlot.php?mainmenu=products&amp;type=0', 'StocksByLotSerial', 1,
        'products', '$user->rights->produit->lire && $user->rights->stock->lire', '', 2, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->productbatch->enabled', __ HANDLER__, 'left', 2806__ + MAX_llx_menu__, 'products', '',
        2800__ + MAX_llx_menu__, '/product/stock/productlot_list.php?mainmenu=products', 'LotSerial', 1, 'products',
        '$user->rights->produit->lire && $user->rights->stock->lire', '', 2, 6, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->variants->enabled', __ HANDLER__, 'left', 2807__ + MAX_llx_menu__, 'products', '',
        2800__ + MAX_llx_menu__, '/variants/list.php?mainmenu=products', 'VariantAttributes', 1, 'products',
        '$user->rights->produit->lire', '', 2, 7, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->propal->enabled', __ HANDLER__, 'left', 2804__ + MAX_llx_menu__, 'products', '',
        2800__ + MAX_llx_menu__, '/product/stats/card.php?mainmenu=products&amp;id=all&amp;leftmenu=stats&amp;type=0',
        'Statistics', 1, 'main', '$user->rights->produit->lire', '', 2, 8, __ ENTITY__);
-- Product - Services
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->service->enabled', __ HANDLER__, 'left', 2900__ + MAX_llx_menu__, 'products', 'service',
        3__ + MAX_llx_menu__, '/product/index.php?mainmenu=products&amp;leftmenu=service&amp;type=1', 'Services', 0,
        'products', '$user->rights->service->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->service->enabled', __ HANDLER__, 'left', 2901__ + MAX_llx_menu__, 'products', '',
        2900__ + MAX_llx_menu__,
        '/product/card.php?mainmenu=products&amp;leftmenu=service&amp;action=create&amp;type=1', 'NewService', 1,
        'products', '$user->rights->service->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->service->enabled', __ HANDLER__, 'left', 2902__ + MAX_llx_menu__, 'products', '',
        2900__ + MAX_llx_menu__, '/product/list.php?mainmenu=products&amp;leftmenu=service&amp;type=1', 'List', 1,
        'products', '$user->rights->service->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->propal->enabled', __ HANDLER__, 'left', 2903__ + MAX_llx_menu__, 'products', '',
        2900__ + MAX_llx_menu__, '/product/stats/card.php?mainmenu=products&amp;id=all&amp;leftmenu=stats&amp;type=1',
        'Statistics', 1, 'main', '$user->rights->service->lire', '', 2, 5, __ ENTITY__);
-- Product - Stocks
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->stock->enabled', __ HANDLER__, 'left', 3100__ + MAX_llx_menu__, 'products', 'stock',
        3__ + MAX_llx_menu__, '/product/stock/index.php?mainmenu=products&amp;leftmenu=stock', 'Stock', 0, 'stocks',
        '$user->rights->stock->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->stock->enabled', __ HANDLER__, 'left', 3101__ + MAX_llx_menu__, 'products', '',
        3100__ + MAX_llx_menu__, '/product/stock/card.php?mainmenu=products&amp;action=create', 'MenuNewWarehouse', 1,
        'stocks', '$user->rights->stock->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->stock->enabled', __ HANDLER__, 'left', 3102__ + MAX_llx_menu__, 'products', '',
        3100__ + MAX_llx_menu__, '/product/stock/list.php?mainmenu=products', 'List', 1, 'stocks',
        '$user->rights->stock->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->stock->enabled', __ HANDLER__, 'left', 3104__ + MAX_llx_menu__, 'products', '',
        3100__ + MAX_llx_menu__, '/product/stock/movement_list.php?mainmenu=products', 'Movements', 1, 'stocks',
        '$user->rights->stock->mouvement->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->stock->enabled && $conf->supplier_order->enabled', __ HANDLER__, 'left', 3105__ + MAX_llx_menu__,
        'products', '', 3100__ + MAX_llx_menu__, '/product/stock/replenish.php?mainmenu=products', 'Replenishments', 1,
        'stocks', '$user->rights->stock->mouvement->creer && $user->rights->fournisseur->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->stock->enabled', __ HANDLER__, 'left', 3106__ + MAX_llx_menu__, 'products', '',
        3100__ + MAX_llx_menu__, '/product/stock/massstockmove.php?mainmenu=products', 'MassStockTransferShort', 1,
        'stocks', '$user->rights->stock->mouvement->creer', '', 2, 5, __ ENTITY__);

-- Product - Categories
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->categorie->enabled', __ HANDLER__, 'left', 3200__ + MAX_llx_menu__, 'products', 'cat',
        3__ + MAX_llx_menu__, '/categories/index.php?mainmenu=products&amp;leftmenu=cat&amp;type=0', 'Categories', 0,
        'categories', '$user->rights->categorie->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->categorie->enabled', __ HANDLER__, 'left', 3201__ + MAX_llx_menu__, 'products', '',
        3200__ + MAX_llx_menu__, '/categories/card.php?mainmenu=products&amp;action=create&amp;type=0', 'NewCategory',
        1, 'categories', '$user->rights->categorie->creer', '', 2, 0, __ ENTITY__);
-- Product - Shipment
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->expedition->enabled', __ HANDLER__, 'left', 1300__ + MAX_llx_menu__, 'commercial', 'sendings',
        3__ + MAX_llx_menu__, '/expedition/index.php?mainmenu=commercial&amp;leftmenu=sendings', 'Shipments', 0,
        'sendings', '$user->rights->expedition->lire', '', 2, 6, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->expedition->enabled && $leftmenu=="sendings"', __ HANDLER__, 'left', 1301__ + MAX_llx_menu__,
        'commercial', '', 1300__ + MAX_llx_menu__,
        '/expedition/card.php?mainmenu=commercial&amp;action=create2&leftmenu=sendings', 'NewSending', 1, 'sendings',
        '$user->rights->expedition->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->expedition->enabled && $leftmenu=="sendings"', __ HANDLER__, 'left', 1302__ + MAX_llx_menu__,
        'commercial', '', 1300__ + MAX_llx_menu__, '/expedition/list.php?mainmenu=commercial&amp;leftmenu=sendings',
        'List', 1, 'sendings', '$user->rights->expedition->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->expedition->enabled && $leftmenu=="sendings"', __ HANDLER__, 'left', 1303__ + MAX_llx_menu__,
        'commercial', '', 1300__ + MAX_llx_menu__,
        '/expedition/stats/index.php?mainmenu=commercial&amp;leftmenu=sendings', 'Statistics', 1, 'sendings',
        '$user->rights->expedition->lire', '', 2, 2, __ ENTITY__);
-- Product - Reception
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->reception->enabled', __ HANDLER__, 'left', 1350__ + MAX_llx_menu__, 'commercial', 'receptions',
        3__ + MAX_llx_menu__, '/reception/index.php?mainmenu=commercial&amp;leftmenu=receptions', 'Receptions', 0,
        'receptions', '$user->rights->reception->lire', '', 2, 6, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->reception->enabled && $leftmenu=="receptions"', __ HANDLER__, 'left', 1351__ + MAX_llx_menu__,
        'commercial', '', 1350__ + MAX_llx_menu__,
        '/reception/card.php?mainmenu=commercial&amp;action=create2&leftmenu=receptions', 'NewSending', 1, 'receptions',
        '$user->rights->reception->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->reception->enabled && $leftmenu=="receptions"', __ HANDLER__, 'left', 1352__ + MAX_llx_menu__,
        'commercial', '', 1350__ + MAX_llx_menu__, '/reception/list.php?mainmenu=commercial&amp;leftmenu=receptions',
        'List', 1, 'receptions', '$user->rights->reception->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->reception->enabled && $leftmenu=="receptions"', __ HANDLER__, 'left', 1353__ + MAX_llx_menu__,
        'commercial', '', 1350__ + MAX_llx_menu__,
        '/reception/stats/index.php?mainmenu=commercial&amp;leftmenu=receptions', 'Statistics', 1, 'receptions',
        '$user->rights->reception->lire', '', 2, 2, __ ENTITY__);

-- Commercial - Proposals
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->propal->enabled', __ HANDLER__, 'left', 1100__ + MAX_llx_menu__, 'commercial', 'propals',
        5__ + MAX_llx_menu__, '/comm/propal/index.php?mainmenu=commercial&amp;leftmenu=propals', 'Proposals', 0,
        'propal', '$user->rights->propale->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->propal->enabled', __ HANDLER__, 'left', 1101__ + MAX_llx_menu__, 'commercial', '',
        1100__ + MAX_llx_menu__, '/comm/propal/card.php?mainmenu=commercial&amp;action=create&amp;leftmenu=propals',
        'NewPropal', 1, 'propal', '$user->rights->propale->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->propal->enabled', __ HANDLER__, 'left', 1102__ + MAX_llx_menu__, 'commercial', '',
        1100__ + MAX_llx_menu__, '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals', 'List', 1, 'propal',
        '$user->rights->propale->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->propal->enabled && $leftmenu=="propals"', __ HANDLER__, 'left', 1103__ + MAX_llx_menu__,
        'commercial', '', 1102__ + MAX_llx_menu__,
        '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals&amp;search_status=0', 'PropalsDraft', 1,
        'propal', '$user->rights->propale->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->propal->enabled && $leftmenu=="propals"', __ HANDLER__, 'left', 1104__ + MAX_llx_menu__,
        'commercial', '', 1102__ + MAX_llx_menu__,
        '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals&amp;search_status=1', 'PropalsOpened', 1,
        'propal', '$user->rights->propale->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->propal->enabled && $leftmenu=="propals"', __ HANDLER__, 'left', 1105__ + MAX_llx_menu__,
        'commercial', '', 1102__ + MAX_llx_menu__,
        '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals&amp;search_status=2', 'PropalStatusSigned', 1,
        'propal', '$user->rights->propale->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->propal->enabled && $leftmenu=="propals"', __ HANDLER__, 'left', 1106__ + MAX_llx_menu__,
        'commercial', '', 1102__ + MAX_llx_menu__,
        '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals&amp;search_status=3', 'PropalStatusNotSigned',
        1, 'propal', '$user->rights->propale->lire', '', 2, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->propal->enabled && $leftmenu=="propals"', __ HANDLER__, 'left', 1107__ + MAX_llx_menu__,
        'commercial', '', 1102__ + MAX_llx_menu__,
        '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals&amp;search_status=4', 'PropalStatusBilled', 1,
        'propal', '$user->rights->propale->lire', '', 2, 6, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->propal->enabled', __ HANDLER__, 'left', 1110__ + MAX_llx_menu__, 'commercial', '',
        1100__ + MAX_llx_menu__, '/comm/propal/stats/index.php?mainmenu=commercial&amp;leftmenu=propals', 'Statistics',
        1, 'propal', '$user->rights->propale->lire', '', 2, 4, __ ENTITY__);
-- Commercial - Customer's orders
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->commande->enabled', __ HANDLER__, 'left', 1200__ + MAX_llx_menu__, 'commercial', 'orders',
        5__ + MAX_llx_menu__, '/commande/index.php?mainmenu=commercial&amp;leftmenu=orders', 'CustomersOrders', 0,
        'orders', '$user->rights->commande->lire', '', 2, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->commande->enabled', __ HANDLER__, 'left', 1201__ + MAX_llx_menu__, 'commercial', '',
        1200__ + MAX_llx_menu__, '/commande/card.php?mainmenu=commercial&amp;action=create&amp;leftmenu=orders',
        'NewOrder', 1, 'orders', '$user->rights->commande->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->commande->enabled', __ HANDLER__, 'left', 1202__ + MAX_llx_menu__, 'commercial', '',
        1200__ + MAX_llx_menu__, '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders', 'List', 1, 'orders',
        '$user->rights->commande->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->commande->enabled && $leftmenu=="orders"', __ HANDLER__, 'left', 1203__ + MAX_llx_menu__,
        'commercial', '', 1202__ + MAX_llx_menu__,
        '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=0', 'StatusOrderDraftShort', 1,
        'orders', '$user->rights->commande->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->commande->enabled && $leftmenu=="orders"', __ HANDLER__, 'left', 1204__ + MAX_llx_menu__,
        'commercial', '', 1202__ + MAX_llx_menu__,
        '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=1', 'StatusOrderValidated', 1,
        'orders', '$user->rights->commande->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->commande->enabled && $leftmenu=="orders"', __ HANDLER__, 'left', 1205__ + MAX_llx_menu__,
        'commercial', '', 1202__ + MAX_llx_menu__,
        '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=2', 'StatusOrderOnProcessShort',
        1, 'orders', '$user->rights->commande->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->commande->enabled && $leftmenu=="orders"', __ HANDLER__, 'left', 1206__ + MAX_llx_menu__,
        'commercial', '', 1202__ + MAX_llx_menu__,
        '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=3', 'StatusOrderToBill', 1,
        'orders', '$user->rights->commande->lire', '', 2, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->commande->enabled && $leftmenu=="orders"', __ HANDLER__, 'left', 1207__ + MAX_llx_menu__,
        'commercial', '', 1202__ + MAX_llx_menu__,
        '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=4', 'StatusOrderProcessed', 1,
        'orders', '$user->rights->commande->lire', '', 2, 6, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->commande->enabled && $leftmenu=="orders"', __ HANDLER__, 'left', 1208__ + MAX_llx_menu__,
        'commercial', '', 1202__ + MAX_llx_menu__,
        '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=-1', 'StatusOrderCanceledShort',
        1, 'orders', '$user->rights->commande->lire', '', 2, 7, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->commande->enabled', __ HANDLER__, 'left', 1209__ + MAX_llx_menu__, 'commercial', '',
        1200__ + MAX_llx_menu__, '/commande/stats/index.php?mainmenu=commercial&amp;leftmenu=orders', 'Statistics', 1,
        'orders', '$user->rights->commande->lire', '', 2, 4, __ ENTITY__);
-- Commercial - Supplier's proposals
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_proposal->enabled', __ HANDLER__, 'left', 1650__ + MAX_llx_menu__, 'commercial',
        'propals_supplier', 3__ + MAX_llx_menu__, '/supplier_proposal/index.php?leftmenu=propals_supplier',
        'SupplierProposalsShort', 0, 'supplier_proposal', '$user->rights->supplier_proposal->lire', '', 2, 4, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_proposal->enabled', __ HANDLER__, 'left', 1651__ + MAX_llx_menu__, 'commercial', '',
        1650__ + MAX_llx_menu__, '/supplier_proposal/card.php?action=create&amp;leftmenu=supplier_proposals',
        'SupplierProposalNew', 1, 'supplier_proposal', '$user->rights->supplier_proposal->creer', '', 2, 0, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_proposal->enabled', __ HANDLER__, 'left', 1652__ + MAX_llx_menu__, 'commercial', '',
        1650__ + MAX_llx_menu__, '/supplier_proposal/list.php?leftmenu=supplier_proposals', 'List', 1,
        'supplier_proposal', '$user->rights->supplier_proposal->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_proposal->enabled', __ HANDLER__, 'left', 1653__ + MAX_llx_menu__, 'commercial', '',
        1650__ + MAX_llx_menu__, '/comm/propal/stats/index.php?leftmenu=supplier_proposals&amp;mode=supplier',
        'Statistics', 1, 'supplier_proposal', '$user->rights->supplier_proposal->lire', '', 2, 2, __ ENTITY__);
-- Commercial - Supplier's orders
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled', __ HANDLER__, 'left', 5100__ + MAX_llx_menu__, 'commercial',
        'orders_suppliers', 5__ + MAX_llx_menu__,
        '/fourn/commande/index.php?mainmenu=commercial&amp;leftmenu=orders_suppliers', 'SuppliersOrders', 0, 'orders',
        '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '', 2, 6, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled', __ HANDLER__, 'left', 5101__ + MAX_llx_menu__, 'commercial', '',
        5100__ + MAX_llx_menu__,
        '/fourn/commande/card.php?mainmenu=commercial&amp;action=create&amp;leftmenu=orders_suppliers',
        'NewSupplierOrderShort', 1, 'orders',
        '($user->rights->fournisseur->commande->creer || $user->rights->supplier_order->creer)', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled', __ HANDLER__, 'left', 5102__ + MAX_llx_menu__, 'commercial', '',
        5100__ + MAX_llx_menu__, '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers', 'List',
        1, 'orders', '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '', 2, 1, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled && $leftmenu=="orders_suppliers"', __ HANDLER__, 'left',
        5103__ + MAX_llx_menu__, 'commercial', '', 5102__ + MAX_llx_menu__,
        '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers&amp;statut=0',
        'StatusOrderDraftShort', 1, 'orders',
        '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled && $leftmenu=="orders_suppliers"', __ HANDLER__, 'left',
        5104__ + MAX_llx_menu__, 'commercial', '', 5102__ + MAX_llx_menu__,
        '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers&amp;statut=1',
        'StatusOrderValidated', 1, 'orders',
        '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled && $leftmenu=="orders_suppliers"', __ HANDLER__, 'left',
        5105__ + MAX_llx_menu__, 'commercial', '', 5102__ + MAX_llx_menu__,
        '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers&amp;statut=2',
        'StatusOrderApprovedShort', 1, 'orders',
        '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled && $leftmenu=="orders_suppliers"', __ HANDLER__, 'left',
        5106__ + MAX_llx_menu__, 'commercial', '', 5102__ + MAX_llx_menu__,
        '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers&amp;statut=3',
        'StatusOrderOnProcessShort', 1, 'orders',
        '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '', 2, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled && $leftmenu=="orders_suppliers"', __ HANDLER__, 'left',
        5107__ + MAX_llx_menu__, 'commercial', '', 5102__ + MAX_llx_menu__,
        '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers&amp;statut=4',
        'StatusOrderReceivedPartiallyShort', 1, 'orders',
        '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->creer)', '', 2, 6, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled && $leftmenu=="orders_suppliers"', __ HANDLER__, 'left',
        5108__ + MAX_llx_menu__, 'commercial', '', 5102__ + MAX_llx_menu__,
        '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers&amp;statut=5',
        'StatusOrderReceivedAll', 1, 'orders',
        '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '', 2, 7, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled && $leftmenu=="orders_suppliers"', __ HANDLER__, 'left',
        5109__ + MAX_llx_menu__, 'commercial', '', 5102__ + MAX_llx_menu__,
        '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers&amp;statut=6,7',
        'StatusOrderCanceled', 1, 'orders',
        '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '', 2, 8, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled && $leftmenu=="orders_suppliers"', __ HANDLER__, 'left',
        5110__ + MAX_llx_menu__, 'commercial', '', 5102__ + MAX_llx_menu__,
        '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers&amp;statut=9', 'StatusOrderRefused',
        1, 'orders', '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '', 2, 9, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_order->enabled', __ HANDLER__, 'left', 5111__ + MAX_llx_menu__, 'commercial', '',
        5100__ + MAX_llx_menu__,
        '/commande/stats/index.php?mainmenu=commercial&amp;leftmenu=orders_suppliers&amp;mode=supplier', 'Statistics',
        1, 'orders', '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '', 2, 7, __
        ENTITY__);
-- Commercial - Contracts
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->contrat->enabled', __ HANDLER__, 'left', 1400__ + MAX_llx_menu__, 'commercial', 'contracts',
        5__ + MAX_llx_menu__, '/contrat/index.php?mainmenu=commercial&amp;leftmenu=contracts', 'Contracts', 0,
        'contracts', '$user->rights->contrat->lire', '', 2, 7, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->contrat->enabled', __ HANDLER__, 'left', 1401__ + MAX_llx_menu__, 'commercial', '',
        1400__ + MAX_llx_menu__, '/contrat/card.php?mainmenu=commercial&amp;action=create&amp;leftmenu=contracts',
        'NewContract', 1, 'contracts', '$user->rights->contrat->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->contrat->enabled', __ HANDLER__, 'left', 1402__ + MAX_llx_menu__, 'commercial', '',
        1400__ + MAX_llx_menu__, '/contrat/list.php?mainmenu=commercial&amp;leftmenu=contracts', 'List', 1, 'contracts',
        '$user->rights->contrat->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->contrat->enabled', __ HANDLER__, 'left', 1403__ + MAX_llx_menu__, 'commercial', '',
        1400__ + MAX_llx_menu__, '/contrat/services_list.php?mainmenu=commercial&amp;leftmenu=contracts',
        'MenuServices', 1, 'contracts', '$user->rights->contrat->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->contrat->enabled && $leftmenu=="contracts"', __ HANDLER__, 'left', 1404__ + MAX_llx_menu__,
        'commercial', '', 1403__ + MAX_llx_menu__,
        '/contrat/services_list.php?mainmenu=commercial&amp;leftmenu=contracts&amp;mode=0', 'MenuInactiveServices', 2,
        'contracts', '$user->rights->contrat->lire', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->contrat->enabled && $leftmenu=="contracts"', __ HANDLER__, 'left', 1405__ + MAX_llx_menu__,
        'commercial', '', 1403__ + MAX_llx_menu__,
        '/contrat/services_list.php?mainmenu=commercial&amp;leftmenu=contracts&amp;mode=4', 'MenuRunningServices', 2,
        'contracts', '$user->rights->contrat->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->contrat->enabled && $leftmenu=="contracts"', __ HANDLER__, 'left', 1406__ + MAX_llx_menu__,
        'commercial', '', 1403__ + MAX_llx_menu__,
        '/contrat/services_list.php?mainmenu=commercial&amp;leftmenu=contracts&amp;mode=4&amp;filter=expired',
        'MenuExpiredServices', 2, 'contracts', '$user->rights->contrat->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->contrat->enabled && $leftmenu=="contracts"', __ HANDLER__, 'left', 1407__ + MAX_llx_menu__,
        'commercial', '', 1403__ + MAX_llx_menu__,
        '/contrat/services_list.php?mainmenu=commercial&amp;leftmenu=contracts&amp;mode=5', 'MenuClosedServices', 2,
        'contracts', '$user->rights->contrat->lire', '', 2, 3, __ ENTITY__);
-- Commercial - Interventions
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->ficheinter->enabled', __ HANDLER__, 'left', 1500__ + MAX_llx_menu__, 'commercial', 'ficheinter',
        5__ + MAX_llx_menu__, '/fichinter/list.php?mainmenu=commercial&amp;leftmenu=ficheinter', 'Interventions', 0,
        'interventions', '$user->rights->ficheinter->lire', '', 2, 8, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->ficheinter->enabled', __ HANDLER__, 'left', 1501__ + MAX_llx_menu__, 'commercial', '',
        1500__ + MAX_llx_menu__, '/fichinter/card.php?mainmenu=commercial&amp;action=create&amp;leftmenu=ficheinter',
        'NewIntervention', 1, 'interventions', '$user->rights->ficheinter->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->ficheinter->enabled', __ HANDLER__, 'left', 1502__ + MAX_llx_menu__, 'commercial', '',
        1500__ + MAX_llx_menu__, '/fichinter/list.php?mainmenu=commercial&amp;leftmenu=ficheinter', 'List', 1,
        'interventions', '$user->rights->ficheinter->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->ficheinter->enabled', __ HANDLER__, 'left', 1503__ + MAX_llx_menu__, 'commercial', '',
        1500__ + MAX_llx_menu__, '/fichinter/stats/index.php?mainmenu=commercial&amp;leftmenu=ficheinter', 'Statistics',
        1, 'interventions', '$user->rights->ficheinter->lire', '', 2, 2, __ ENTITY__);
-- Billing - Supplier invoice
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_invoice->enabled', __ HANDLER__, 'left', 1600__ + MAX_llx_menu__, 'billing',
        'supplier_bills', 6__ + MAX_llx_menu__, '/fourn/facture/list.php?mainmenu=billing&amp;leftmenu=suppliers_bills',
        'BillsSuppliers', 0, 'bills', '$user->rights->fournisseur->facture->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_invoice->enabled', __ HANDLER__, 'left', 1601__ + MAX_llx_menu__, 'billing', '',
        1600__ + MAX_llx_menu__,
        '/fourn/facture/card.php?mainmenu=billing&amp;action=create&amp;leftmenu=suppliers_bills', 'NewBill', 1,
        'bills', '$user->rights->fournisseur->facture->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_invoice->enabled', __ HANDLER__, 'left', 1602__ + MAX_llx_menu__, 'billing', '',
        1600__ + MAX_llx_menu__, '/fourn/facture/list.php?mainmenu=billing&amp;leftmenu=suppliers_bills', 'List', 1,
        'bills', '$user->rights->fournisseur->facture->lire', '', 2, 1, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_invoice->enabled', __ HANDLER__, 'left', 1603__ + MAX_llx_menu__, 'billing',
        'suppliers_bills_payment', 1600__ + MAX_llx_menu__,
        '/fourn/facture/paiement.php?mainmenu=billing&amp;leftmenu=suppliers_bills_payment', 'Payments', 1, 'bills',
        '$user->rights->fournisseur->facture->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_invoice->enabled', __ HANDLER__, 'left', 1605__ + MAX_llx_menu__, 'billing',
        'suppliers_bills_reports', 1603__ + MAX_llx_menu__,
        '/fourn/facture/rapport.php?mainmenu=billing&amp;leftmenu=suppliers_bills_reports', 'Reporting', 2, 'bills',
        '$user->rights->fournisseur->facture->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->supplier_invoice->enabled', __ HANDLER__, 'left', 1604__ + MAX_llx_menu__, 'billing',
        'customers_bills_stats', 1600__ + MAX_llx_menu__,
        '/compta/facture/stats/index.php?mainmenu=billing&amp;leftmenu=customers_bills_stats&mode=supplier',
        'Statistics', 1, 'bills', '$user->rights->fournisseur->facture->lire', '', 2, 8, __ ENTITY__);
-- Billing - Customer invoice
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->facture->enabled', __ HANDLER__, 'left', 1700__ + MAX_llx_menu__, 'billing', 'customer_bills',
        6__ + MAX_llx_menu__, '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills',
        'BillsCustomers', 0, 'bills', '$user->rights->facture->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->facture->enabled', __ HANDLER__, 'left', 1701__ + MAX_llx_menu__, 'billing', '',
        1700__ + MAX_llx_menu__,
        '/compta/facture/card.php?mainmenu=billing&amp;action=create&amp;leftmenu=customers_bills', 'NewBill', 1,
        'bills', '$user->rights->facture->creer', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->facture->enabled', __ HANDLER__, 'left', 1705__ + MAX_llx_menu__, 'billing', '',
        1700__ + MAX_llx_menu__, '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills', 'List', 1,
        'bills', '$user->rights->facture->lire', '', 2, 4, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->facture->enabled', __ HANDLER__, 'left', 1720__ + MAX_llx_menu__, 'billing', '',
        1705__ + MAX_llx_menu__,
        '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills_draft&amp;search_status=0',
        'BillShortStatusDraft', 2, 'bills', '$user->rights->facture->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->facture->enabled', __ HANDLER__, 'left', 1721__ + MAX_llx_menu__, 'billing', '',
        1705__ + MAX_llx_menu__,
        '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills_notpaid&amp;search_status=1',
        'BillShortStatusNotPaid', 2, 'bills', '$user->rights->facture->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->facture->enabled', __ HANDLER__, 'left', 1722__ + MAX_llx_menu__, 'billing', '',
        1705__ + MAX_llx_menu__,
        '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills_paid&amp;search_status=2',
        'BillShortStatusPaid', 2, 'bills', '$user->rights->facture->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->facture->enabled', __ HANDLER__, 'left', 1723__ + MAX_llx_menu__, 'billing', '',
        1705__ + MAX_llx_menu__,
        '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills_canceled&amp;search_status=3',
        'BillShortStatusCanceled', 2, 'bills', '$user->rights->facture->lire', '', 2, 4, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->facture->enabled', __ HANDLER__, 'left', 1702__ + MAX_llx_menu__, 'billing', '',
        1700__ + MAX_llx_menu__,
        '/compta/facture/invoicetemplate_list.php?mainmenu=billing&amp;leftmenu=customers_bills', 'ListOfTemplates', 1,
        'bills', '$user->rights->facture->lire', '', 2, 5, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->facture->enabled', __ HANDLER__, 'left', 1704__ + MAX_llx_menu__, 'billing',
        'customers_bills_payment', 1700__ + MAX_llx_menu__,
        '/compta/paiement/list.php?mainmenu=billing&amp;leftmenu=customers_bills_payment', 'Payments', 1, 'bills',
        '$user->rights->facture->lire', '', 2, 6, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->facture->enabled', __ HANDLER__, 'left', 1710__ + MAX_llx_menu__, 'billing',
        'customers_bills_reports', 1704__ + MAX_llx_menu__,
        '/compta/paiement/rapport.php?mainmenu=billing&amp;leftmenu=customers_bills_reports', 'Reportings', 2, 'bills',
        '$user->rights->facture->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->facture->enabled', __ HANDLER__, 'left', 1714__ + MAX_llx_menu__, 'billing',
        'customers_bills_stats', 1700__ + MAX_llx_menu__,
        '/compta/facture/stats/index.php?mainmenu=billing&amp;leftmenu=customers_bills_stats', 'Statistics', 1, 'bills',
        '$user->rights->facture->lire', '', 2, 8, __ ENTITY__);
-- Billing - Orders to bill
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->commande->enabled', __ HANDLER__, 'left', 1900__ + MAX_llx_menu__, 'billing', 'orders',
        6__ + MAX_llx_menu__, '/commande/list.php?mainmenu=billing&amp;leftmenu=orders&amp;search_status=3',
        'MenuOrdersToBill', 0, 'orders', '$user->rights->commande->lire', '', 0, 3, __ ENTITY__);
-- Donations
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->don->enabled', __ HANDLER__, 'left', 2000__ + MAX_llx_menu__, 'billing', 'donations',
        6__ + MAX_llx_menu__, '/don/index.php?mainmenu=billing&amp;leftmenu=donations', 'Donations', 0, 'donations',
        '$user->rights->don->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->don->enabled && $leftmenu=="donations"', __ HANDLER__, 'left', 2001__ + MAX_llx_menu__, 'billing',
        '', 2000__ + MAX_llx_menu__, '/don/card.php?mainmenu=billing&amp;leftmenu=donations&amp;action=create',
        'NewDonation', 1, 'donations', '$user->rights->don->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->don->enabled && $leftmenu=="donations"', __ HANDLER__, 'left', 2002__ + MAX_llx_menu__, 'billing',
        '', 2000__ + MAX_llx_menu__, '/don/list.php?mainmenu=billing&amp;leftmenu=donations', 'List', 1, 'donations',
        '$user->rights->don->lire', '', 2, 1, __ ENTITY__);
-- insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs, perms, target, usertype, position, entity) values ('', '$conf->don->enabled && $leftmenu=="donations"', __HANDLER__, 'left', 2003__+MAX_llx_menu__, 'billing', '', 2000__+MAX_llx_menu__, '/don/stats/index.php?mainmenu=billing&amp;leftmenu=donations', 'Statistics', 1, 'donations', '$user->rights->don->lire', '', 2, 2, __ENTITY__);
-- Special expenses
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->tax->enabled || $conf->salaries->enabled || $conf->loan->enabled || $conf->banque->enabled', __
        HANDLER__, 'left', 2200__ + MAX_llx_menu__, 'billing', 'tax', 6__ + MAX_llx_menu__,
        '/compta/charges/index.php?mainmenu=billing&amp;leftmenu=tax', 'MenuTaxesAndSpecialExpenses', 0, 'compta',
        '(! empty($conf->tax->enabled) && $user->rights->tax->charges->lire) || (! empty($conf->salaries->enabled) && ! empty($user->rights->salaries->read)) || (! empty($conf->loan->enabled) && $user->rights->loan->read) || (! empty($conf->banque->enabled) && $user->rights->banque->lire)',
        '', 0, 6, __ ENTITY__);
-- Social contributions
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->tax->enabled', __ HANDLER__, 'left', 2250__ + MAX_llx_menu__, 'billing', 'tax_social',
        2200__ + MAX_llx_menu__, '/compta/sociales/list.php?mainmenu=billing&amp;leftmenu=tax_social',
        'SocialContributions', 1, '', '$user->rights->tax->charges->lire', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->tax->enabled && $leftmenu=="tax_social"', __ HANDLER__, 'left', 2251__ + MAX_llx_menu__, 'billing',
        '', 2250__ + MAX_llx_menu__,
        '/compta/sociales/card.php?mainmenu=billing&amp;leftmenu=tax_social&amp;action=create',
        'MenuNewSocialContribution', 2, '', '$user->rights->tax->charges->creer', '', 0, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->tax->enabled && $leftmenu=="tax_social"', __ HANDLER__, 'left', 2252__ + MAX_llx_menu__, 'billing',
        '', 2250__ + MAX_llx_menu__, '/compta/sociales/payments.php?mainmenu=billing&amp;leftmenu=tax_social',
        'Payments', 2, '', '$user->rights->tax->charges->lire', '', 0, 3, __ ENTITY__);
-- VAT
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS)', __ HANDLER__, 'left',
        2300__ + MAX_llx_menu__, 'billing', 'tax_vat', 2200__ + MAX_llx_menu__,
        '/compta/tva/list.php?mainmenu=billing&amp;leftmenu=tax_vat', 'VAT', 1, 'companies',
        '$user->rights->tax->charges->lire', '', 0, 7, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS) && $leftmenu=="tax_vat"', __ HANDLER__,
        'left', 2301__ + MAX_llx_menu__, 'billing', '', 2300__ + MAX_llx_menu__,
        '/compta/tva/card.php?mainmenu=billing&amp;leftmenu=tax_vat&amp;action=create', 'New', 2, 'companies',
        '$user->rights->tax->charges->creer', '', 0, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS) && $leftmenu=="tax_vat"', __ HANDLER__,
        'left', 2302__ + MAX_llx_menu__, 'billing', '', 2300__ + MAX_llx_menu__,
        '/compta/tva/list.php?mainmenu=billing&amp;leftmenu=tax_vat', 'List', 2, 'companies',
        '$user->rights->tax->charges->lire', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS) && $leftmenu=="tax_vat"', __ HANDLER__,
        'left', 2303__ + MAX_llx_menu__, 'billing', '', 2300__ + MAX_llx_menu__,
        '/compta/tva/index.php?mainmenu=billing&amp;leftmenu=tax_vat', 'ReportByMonth', 2, 'companies',
        '$user->rights->tax->charges->lire', '', 0, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS) && $leftmenu=="tax_vat"', __ HANDLER__,
        'left', 2304__ + MAX_llx_menu__, 'billing', '', 2300__ + MAX_llx_menu__,
        '/compta/tva/clients.php?mainmenu=billing&amp;leftmenu=tax_vat', 'ReportByThirdparties', 2, 'companies',
        '$user->rights->tax->charges->lire', '', 0, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS) && $leftmenu=="tax_vat"', __ HANDLER__,
        'left', 2305__ + MAX_llx_menu__, 'billing', '', 2300__ + MAX_llx_menu__,
        '/compta/tva/quadri_detail.php?mainmenu=billing&amp;leftmenu=tax_vat', 'ReportByQuarter', 2, 'companies',
        '$user->rights->tax->charges->lire', '', 0, 4, __ ENTITY__);
-- Salary
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->salaries->enabled', __ HANDLER__, 'left', 2210__ + MAX_llx_menu__, 'billing', 'tax_sal',
        6__ + MAX_llx_menu__, '/salaries/list.php?mainmenu=billing&amp;leftmenu=tax_salary', 'Salaries', 0, 'salaries',
        '$user->rights->salaries->read', '', 0, 10, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->salaries->enabled && $leftmenu=="tax_salary"', __ HANDLER__, 'left', 2211__ + MAX_llx_menu__,
        'billing', '', 2210__ + MAX_llx_menu__,
        '/salaries/card.php?mainmenu=billing&amp;leftmenu=tax_salary&amp;action=create', 'NewPayment', 1, 'companies',
        '$user->rights->salaries->write', '', 0, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->salaries->enabled && $leftmenu=="tax_salary"', __ HANDLER__, 'left', 2212__ + MAX_llx_menu__,
        'billing', '', 2210__ + MAX_llx_menu__, '/salaries/list.php?mainmenu=billing&amp;leftmenu=tax_salary',
        'Payments', 1, 'companies', '$user->rights->salaries->read', '', 0, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->salaries->enabled && $leftmenu=="tax_salary"', __ HANDLER__, 'left', 2213__ + MAX_llx_menu__,
        'billing', '', 2210__ + MAX_llx_menu__, '/salaries/stats/index.php?mainmenu=billing&amp;leftmenu=tax_salary',
        'Statistics', 1, 'companies', '$user->rights->salaries->read', '', 0, 4, __ ENTITY__);
-- Loan
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->loan->enabled', __ HANDLER__, 'left', 2220__ + MAX_llx_menu__, 'billing', 'tax_loan',
        6__ + MAX_llx_menu__, '/loan/list.php?mainmenu=billing&amp;leftmenu=tax_loan', 'Loans', 0, 'loan',
        '$user->rights->loan->read', '', 0, 20, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->loan->enabled && $leftmenu=="tax_loan"', __ HANDLER__, 'left', 2221__ + MAX_llx_menu__, 'billing',
        '', 2220__ + MAX_llx_menu__, '/loan/card.php?mainmenu=billing&amp;leftmenu=tax_loan&amp;action=create',
        'NewLoan', 1, 'loan', '$user->rights->loan->write', '', 0, 2, __ ENTITY__);
--insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs, perms, target, usertype, position, entity) values ('', '$conf->loan->enabled && $leftmenu=="tax_loan"', __HANDLER__, 'left', 2222__+MAX_llx_menu__, 'billing', '', 2220__+MAX_llx_menu__, '/loan/payment/list.php?mainmenu=billing&amp;leftmenu=tax_loan', 'Payments', 1, 'companies', '$user->rights->loan->read', '', 0, 3, __ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->loan->enabled && $leftmenu=="tax_loan" && ! empty($conf->global->LOAN_SHOW_CALCULATOR)', __
        HANDLER__, 'left', 2223__ + MAX_llx_menu__, 'billing', '', 2220__ + MAX_llx_menu__,
        '/loan/calc.php?mainmenu=billing&amp;leftmenu=tax_loan', 'Calculator', 1, 'companies',
        '$user->rights->loan->calc', '', 0, 4, __ ENTITY__);
-- Various payments
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->banque->enabled && empty($conf->global->BANK_USE_OLD_VARIOUS_PAYMENT)', __ HANDLER__, 'left',
        2350__ + MAX_llx_menu__, 'billing', 'tax_various', 6__ + MAX_llx_menu__,
        '/compta/bank/various_payment/list.php?mainmenu=billing&amp;leftmenu=tax_various', 'MenuVariousPayment', 0,
        'banks', '$user->rights->banque->lire', '', 0, 30, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->banque->enabled && $leftmenu=="tax_various"', __ HANDLER__, 'left', 2351__ + MAX_llx_menu__,
        'billing', '', 2350__ + MAX_llx_menu__,
        '/compta/bank/various_payment/card.php?mainmenu=billing&amp;leftmenu=tax_various&amp;action=create', 'New', 1,
        'various_payment', '$user->rights->banque->modifier', '', 0, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->banque->enabled && $leftmenu=="tax_various"', __ HANDLER__, 'left', 2352__ + MAX_llx_menu__,
        'billing', '', 2350__ + MAX_llx_menu__,
        '/compta/bank/various_payment/list.php?mainmenu=billing&amp;leftmenu=tax_various', 'List', 1, 'various_payment',
        '$user->rights->banque->lire', '', 0, 3, __ ENTITY__);
-- Accounting (Double entries)
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled', __ HANDLER__, 'left', 2400__ + MAX_llx_menu__, 'accountancy', 'accountancy',
        9__ + MAX_llx_menu__, '/accountancy/index.php?mainmenu=accountancy&amp;leftmenu=accountancy', 'MenuAccountancy',
        0, 'main',
        '! empty($conf->accounting->enabled) || $user->rights->accounting->bind->write || $user->rights->accounting->bind->write || $user->rights->compta->resultat->lire',
        '', 0, 7, __ ENTITY__);
-- Setup
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled', __ HANDLER__, 'left', 2451__ + MAX_llx_menu__, 'accountancy',
        'accountancy_admin', 2400__ + MAX_llx_menu__,
        '/accountancy/index.php?mainmenu=accountancy&leftmenu=accountancy_admin', 'Setup', 1, 'accountancy',
        '$user->rights->accounting->chartofaccount', '', 0, 1, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2453__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_general', 2451__ + MAX_llx_menu__,
        '/accountancy/admin/index.php?mainmenu=accountancy&leftmenu=accountancy_admin', 'General', 2, 'accountancy',
        '$user->rights->accounting->chartofaccount', '', 0, 10, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2454__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_journal', 2451__ + MAX_llx_menu__,
        '/accountancy/admin/journals_list.php?id=35&mainmenu=accountancy&leftmenu=accountancy_admin',
        'AccountingJournals', 2, 'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 20, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2455__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_chartmodel', 2451__ + MAX_llx_menu__,
        '/accountancy/admin/account.php?mainmenu=accountancy&leftmenu=accountancy_admin', 'Pcg_version', 2,
        'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 30, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2456__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_chart', 2451__ + MAX_llx_menu__,
        '/accountancy/admin/account.php?mainmenu=accountancy&leftmenu=accountancy_admin', 'Chartofaccounts', 2,
        'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 40, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2457__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_chartsubledger', 2451__ + MAX_llx_menu__,
        '/accountancy/admin/subaccount.php?mainmenu=accountancy&leftmenu=accountancy_admin', 'ChartOfSubaccounts', 2,
        'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 41, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2458__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_chart_group', 2451__ + MAX_llx_menu__,
        '/accountancy/admin/categories_list.php?id=32&mainmenu=accountancy&leftmenu=accountancy_admin',
        'AccountingCategory', 2, 'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 45, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2459__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_default', 2451__ + MAX_llx_menu__,
        '/accountancy/admin/defaultaccounts.php?mainmenu=accountancy&leftmenu=accountancy_admin', 'MenuDefaultAccounts',
        2, 'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 50, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2460__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_vat', 2451__ + MAX_llx_menu__,
        '/compta/bank/list.php?mainmenu=accountancy&leftmenu=accountancy_admin', 'MenuBankAccounts', 2, 'accountancy',
        '$user->rights->accounting->chartofaccount', '', 0, 51, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2461__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_vat', 2451__ + MAX_llx_menu__,
        '/admin/dict.php?id=10&from=accountancy&search_country_id=__MYCOUNTRYID__&mainmenu=accountancy&leftmenu=accountancy_admin',
        'MenuVatAccounts', 2, 'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 52, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2462__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_tax', 2451__ + MAX_llx_menu__,
        '/admin/dict.php?id=7&from=accountancy&search_country_id=__MYCOUNTRYID__&mainmenu=accountancy&leftmenu=accountancy_admin',
        'MenuTaxAccounts', 2, 'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 53, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $conf->expensereport->enabled && $leftmenu=="accountancy_admin"', __
        HANDLER__, 'left', 2463__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_expensereport',
        2451__ + MAX_llx_menu__,
        '/admin/dict.php?id=17&from=accountancy&mainmenu=accountancy&leftmenu=accountancy_admin',
        'MenuExpenseReportAccounts', 2, 'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 54, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2464__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_product', 2451__ + MAX_llx_menu__,
        '/accountancy/admin/productaccount.php?mainmenu=accountancy&leftmenu=accountancy_admin', 'MenuProductsAccounts',
        2, 'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 55, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin"', __ HANDLER__, 'left',
        2465__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_export', 2451__ + MAX_llx_menu__,
        '/accountancy/admin/export.php?mainmenu=accountancy&leftmenu=accountancy_admin', 'ExportOptions', 2,
        'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 60, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin" && $conf->global->MAIN_FEATURES_LEVEL > 1', __
        HANDLER__, 'left', 2466__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_closure', 2451__ + MAX_llx_menu__,
        '/accountancy/admin/closure.php?mainmenu=accountancy&leftmenu=accountancy_admin', 'MenuClosureAccounts', 2,
        'accountancy', '$user->rights->accounting->chartofaccount', '', 0, 70, __ ENTITY__);
-- Accounting period
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_admin" && $conf->global->MAIN_FEATURES_LEVEL > 0', __
        HANDLER__, 'left', 2450__ + MAX_llx_menu__, 'accountancy', 'accountancy_admin_period', 2451__ + MAX_llx_menu__,
        '/accountancy/admin/fiscalyear.php?mainmenu=accountancy&leftmenu=accountancy_admin', 'FiscalPeriod', 1, 'admin',
        '', '', 2, 80, __ ENTITY__);
-- Binding
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->accounting->enabled && $conf->facture->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_SALES)', __
        HANDLER__, 'left', 2401__ + MAX_llx_menu__, 'accountancy', 'accountancy_dispatch_customer',
        2400__ + MAX_llx_menu__,
        '/accountancy/customer/index.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_customer',
        'CustomersVentilation', 1, 'accountancy', '$user->rights->accounting->bind->write', '', 0, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->accounting->enabled && $conf->facture->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_SALES) && $leftmenu=="accountancy_dispatch_customer"', __
        HANDLER__, 'left', 2402__ + MAX_llx_menu__, 'accountancy', '', 2401__ + MAX_llx_menu__,
        '/accountancy/customer/list.php?mainmenu=accountancy', 'ToDispatch', 2, 'accountancy',
        '$user->rights->accounting->bind->write', '', 0, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->accounting->enabled && $conf->facture->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_SALES) && $leftmenu=="accountancy_dispatch_customer"', __
        HANDLER__, 'left', 2403__ + MAX_llx_menu__, 'accountancy', '', 2401__ + MAX_llx_menu__,
        '/accountancy/customer/lines.php?mainmenu=accountancy', 'Dispatched', 2, 'accountancy',
        '$user->rights->accounting->bind->write', '', 0, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->accounting->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_invoice->enabled)) && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_PURCHASES)', __
        HANDLER__, 'left', 2410__ + MAX_llx_menu__, 'accountancy', 'accountancy_dispatch_supplier',
        2400__ + MAX_llx_menu__,
        '/accountancy/supplier/index.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_supplier',
        'SuppliersVentilation', 1, 'accountancy', '$user->rights->accounting->bind->write', '', 0, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->accounting->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_invoice->enabled)) && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_PURCHASES) && $leftmenu=="accountancy_dispatch_supplier"', __
        HANDLER__, 'left', 2411__ + MAX_llx_menu__, 'accountancy', '', 2410__ + MAX_llx_menu__,
        '/accountancy/supplier/list.php?mainmenu=accountancy', 'ToDispatch', 2, 'accountancy',
        '$user->rights->accounting->bind->write', '', 0, 6, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->accounting->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_invoice->enabled)) && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_PURCHASES) && $leftmenu=="accountancy_dispatch_supplier"', __
        HANDLER__, 'left', 2412__ + MAX_llx_menu__, 'accountancy', '', 2410__ + MAX_llx_menu__,
        '/accountancy/supplier/lines.php?mainmenu=accountancy', 'Dispatched', 2, 'accountancy',
        '$user->rights->accounting->bind->write', '', 0, 7, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->accounting->enabled && $conf->expensereport->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_EXPENSEREPORTS)', __
        HANDLER__, 'left', 2420__ + MAX_llx_menu__, 'accountancy', 'accountancy_dispatch_expensereport',
        2400__ + MAX_llx_menu__,
        '/accountancy/expensereport/index.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_expensereport',
        'ExpenseReportsVentilation', 1, 'accountancy', '$user->rights->accounting->bind->write', '', 0, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->accounting->enabled && $conf->expensereport->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_EXPENSEREPORTS) && $leftmenu=="accountancy_dispatch_expensereport"', __
        HANDLER__, 'left', 2421__ + MAX_llx_menu__, 'accountancy', '', 2420__ + MAX_llx_menu__,
        '/accountancy/expensereport/list.php?mainmenu=accountancy', 'ToDispatch', 2, 'accountancy',
        '$user->rights->accounting->bind->write', '', 0, 6, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        '$conf->accounting->enabled && $conf->expensereport->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_EXPENSEREPORTS) && $leftmenu=="accountancy_dispatch_expensereport"', __
        HANDLER__, 'left', 2422__ + MAX_llx_menu__, 'accountancy', '', 2420__ + MAX_llx_menu__,
        '/accountancy/expensereport/lines.php?mainmenu=accountancy', 'Dispatched', 2, 'accountancy',
        '$user->rights->accounting->bind->write', '', 0, 7, __ ENTITY__);
-- Journals
--insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs, perms, target, usertype, position, entity) values ('', '$conf->accounting->enabled', __HANDLER__, 'left', 2705__+MAX_llx_menu__, 'accountancy', '', 2400__+MAX_llx_menu__, '', 'Journalization', 1, 'main', '$user->rights->accounting->comptarapport->lire', '', 0, 1, __ENTITY__);
--insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs, perms, target, usertype, position, entity) values ('', '$conf->accounting->enabled', __HANDLER__, 'left', 2707__+MAX_llx_menu__, 'accountancy', '', 2705__+MAX_llx_menu__, '/accountancy/journal/bankjournal.php?mainmenu=accountancy&leftmenu=accountancy_journal&id_journal=3', 'BankJournal', 2, 'main', '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 1, __ENTITY__);
--insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs, perms, target, usertype, position, entity) values ('', '$conf->accounting->enabled', __HANDLER__, 'left', 2708__+MAX_llx_menu__, 'accountancy', '', 2705__+MAX_llx_menu__, '/accountancy/journal/expensereportsjournal.php?mainmenu=accountancy&leftmenu=accountancy_journal&id_journal=6', 'ExpenseReportJournal', 2, 'main', '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 2, __ENTITY__);
--insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs, perms, target, usertype, position, entity) values ('', '$conf->accounting->enabled', __HANDLER__, 'left', 2709__+MAX_llx_menu__, 'accountancy', '', 2705__+MAX_llx_menu__, '/accountancy/journal/purchasesjournal.php?mainmenu=accountancy&leftmenu=accountancy_journal&id_journal=2', 'PurchasesJournal', 2, 'main', '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 3, __ENTITY__);
--insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs, perms, target, usertype, position, entity) values ('', '$conf->accounting->enabled', __HANDLER__, 'left', 2706__+MAX_llx_menu__, 'accountancy', '', 2705__+MAX_llx_menu__, '/accountancy/journal/sellsjournal.php?mainmenu=accountancy&leftmenu=accountancy_journal&id_journal=1', 'SellsJournal', 2, 'main', '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 4, __ENTITY__);
-- Balance
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled', __ HANDLER__, 'left', 2430__ + MAX_llx_menu__, 'accountancy', 'balance',
        2400__ + MAX_llx_menu__,
        '/accountancy/bookkeeping/balance.php?mainmenu=accountancy&leftmenu=accountancy_balance', 'AccountBalance', 1,
        'accountancy', '$user->rights->accounting->mouvements->lire', '', 0, 10, __ ENTITY__);
-- General Ledger
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled', __ HANDLER__, 'left', 2432__ + MAX_llx_menu__, 'accountancy', 'bookkeeping',
        2400__ + MAX_llx_menu__,
        '/accountancy/bookkeeping/listbyaccount.php?mainmenu=accountancy&leftmenu=accountancy_bookeeping',
        'Bookkeeping', 1, 'accountancy', '$user->rights->accounting->mouvements->lire', '', 0, 12, __ ENTITY__);
-- Journals
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled', __ HANDLER__, 'left', 2434__ + MAX_llx_menu__, 'accountancy', 'bookkeeping',
        2400__ + MAX_llx_menu__,
        '/accountancy/bookkeeping/list.php?mainmenu=accountancy&leftmenu=accountancy_bookeeping', 'Journals', 1,
        'accountancy', '$user->rights->accounting->mouvements->lire', '', 0, 15, __ ENTITY__);
-- Export accounting documents
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->comptabilite->enabled || $conf->accounting->enabled', __ HANDLER__, 'left', 2436__ + MAX_llx_menu__,
        'accountancy', 'accountancy_files', 2400__ + MAX_llx_menu__,
        '/compta/accounting-files.php?mainmenu=accountancy&leftmenu=accountancy_files', 'AccountantFiles', 1,
        'accountancy', '$user->rights->compta->resultat->lire || $user->rights->accounting->mouvements->lire', '', 0,
        16, __ ENTITY__);
-- Closure
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled', __ HANDLER__, 'left', 2437__ + MAX_llx_menu__, 'accountancy',
        'accountancy_closure', 2400__ + MAX_llx_menu__,
        '/accountancy/closure/index.php?mainmenu=accountancy&leftmenu=accountancy_closure', 'MenuAccountancyClosure', 1,
        'accountancy', '$user->rights->accounting->fiscalyear->write', '', 0, 17, __ ENTITY__);
-- Reports
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled', __ HANDLER__, 'left', 2440__ + MAX_llx_menu__, 'accountancy',
        'accountancy_report', 2400__ + MAX_llx_menu__,
        '/compta/resultat/index.php?mainmenu=accountancy&leftmenu=accountancy_report', 'Reportings', 1, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 17, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_report"', __ HANDLER__, 'left',
        2441__ + MAX_llx_menu__, 'accountancy', 'accountancy_report', 2440__ + MAX_llx_menu__,
        '/compta/resultat/index.php?mainmenu=accountancy&leftmenu=accountancy_report', 'MenuReportInOut', 2, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 18, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_report"', __ HANDLER__, 'left',
        2443__ + MAX_llx_menu__, 'accountancy', 'accountancy_report', 2441__ + MAX_llx_menu__,
        '/compta/resultat/clientfourn.php?mainmenu=accountancy&leftmenu=accountancy_report',
        'ByPredefinedAccountGroups', 3, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 19, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_report"', __ HANDLER__, 'left',
        2442__ + MAX_llx_menu__, 'accountancy', 'accountancy_report', 2441__ + MAX_llx_menu__,
        '/compta/resultat/result.php?mainmenu=accountancy&leftmenu=accountancy_report', 'ByPersonalizedAccountGroups',
        3, 'main', '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0,
        20, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_report"', __ HANDLER__, 'left',
        2444__ + MAX_llx_menu__, 'accountancy', 'accountancy_report', 2440__ + MAX_llx_menu__,
        '/compta/stats/index.php?mainmenu=accountancy&leftmenu=accountancy_report', 'ReportTurnover', 2, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 21, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_report"', __ HANDLER__, 'left',
        2445__ + MAX_llx_menu__, 'accountancy', 'accountancy_report', 2444__ + MAX_llx_menu__,
        '/compta/stats/casoc.php?mainmenu=accountancy&leftmenu=accountancy_report', 'ByCompanies', 3, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 22, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_report"', __ HANDLER__, 'left',
        2446__ + MAX_llx_menu__, 'accountancy', 'accountancy_report', 2444__ + MAX_llx_menu__,
        '/compta/stats/cabyuser.php?mainmenu=accountancy&leftmenu=accountancy_report', 'ByUsers', 3, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 23, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->accounting->enabled && $leftmenu=="accountancy_report"', __ HANDLER__, 'left',
        2447__ + MAX_llx_menu__, 'accountancy', 'accountancy_report', 2444__ + MAX_llx_menu__,
        '/compta/stats/cabyprodserv.php?mainmenu=accountancy&leftmenu=accountancy_report', 'ByProductsAndServices', 3,
        'main', '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 24, __
        ENTITY__);
-- Accounting simple
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->comptabilite->enabled', __ HANDLER__, 'left', 2700__ + MAX_llx_menu__, 'accountancy', 'ca',
        9__ + MAX_llx_menu__, '/compta/resultat/index.php?mainmenu=accountancy&amp;leftmenu=ca', 'Reportings', 0,
        'main', '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 11, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->comptabilite->enabled && $leftmenu=="ca"', __ HANDLER__, 'left', 2711__ + MAX_llx_menu__,
        'accountancy', '', 2700__ + MAX_llx_menu__, '/compta/resultat/index.php?mainmenu=accountancy&amp;leftmenu=ca',
        'MenuReportInOut', 1, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 0, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->comptabilite->enabled && $leftmenu=="ca"', __ HANDLER__, 'left', 2712__ + MAX_llx_menu__,
        'accountancy', '', 2701__ + MAX_llx_menu__,
        '/compta/resultat/clientfourn.php?mainmenu=accountancy&amp;leftmenu=ca', 'ByCompanies', 2, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 0, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->comptabilite->enabled && $leftmenu=="ca"', __ HANDLER__, 'left', 2713__ + MAX_llx_menu__,
        'accountancy', '', 2700__ + MAX_llx_menu__, '/compta/stats/index.php?mainmenu=accountancy&amp;leftmenu=ca',
        'ReportTurnover', 1, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 1, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->comptabilite->enabled && $leftmenu=="ca"', __ HANDLER__, 'left', 2714__ + MAX_llx_menu__,
        'accountancy', '', 2703__ + MAX_llx_menu__, '/compta/stats/casoc.php?mainmenu=accountancy&amp;leftmenu=ca',
        'ByCompanies', 2, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 0, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->comptabilite->enabled && $leftmenu=="ca"', __ HANDLER__, 'left', 2715__ + MAX_llx_menu__,
        'accountancy', '', 2703__ + MAX_llx_menu__, '/compta/stats/cabyuser.php?mainmenu=accountancy&amp;leftmenu=ca',
        'ByUsers', 2, 'main', '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire',
        '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->comptabilite->enabled && $leftmenu=="ca"', __ HANDLER__, 'left', 2716__ + MAX_llx_menu__,
        'accountancy', '', 2703__ + MAX_llx_menu__,
        '/compta/stats/cabyprodserv.php?mainmenu=accountancy&amp;leftmenu=ca', 'ByProductsAndServices', 2, 'main',
        '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '', 0, 1, __
        ENTITY__);
-- Assets
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->asset->enabled', __ HANDLER__, 'left', 3000__ + MAX_llx_menu__, 'accountancy', 'asset',
        9__ + MAX_llx_menu__, '/asset/list.php?mainmenu=accountancy&amp;leftmenu=asset', 'MenuAssets', 1, 'assets',
        '$user->rights->asset->read', '', 0, 20, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->asset->enabled && $leftmenu=="asset"', __ HANDLER__, 'left', 3001__ + MAX_llx_menu__, 'asset', '',
        3000__ + MAX_llx_menu__, '/asset/card.php?mainmenu=accountancy&amp;leftmenu=asset&amp;action=create',
        'MenuNewAsset', 2, 'assets', '$user->rights->asset->write', '', 0, 21, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->asset->enabled && $leftmenu=="asset"', __ HANDLER__, 'left', 3003__ + MAX_llx_menu__, 'asset', '',
        3000__ + MAX_llx_menu__, '/asset/list.php?mainmenu=accountancy&amp;leftmenu=asset', 'MenuListAssets', 2,
        'assets', '$user->rights->asset->read', '', 0, 22, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->asset->enabled && $leftmenu=="asset"', __ HANDLER__, 'left', 3004__ + MAX_llx_menu__, 'asset',
        'asset_type', 3000__ + MAX_llx_menu__, '/asset/type.php?mainmenu=accountancy&amp;leftmenu=asset',
        'MenuTypeAssets', 2, 'assets', '$user->rights->asset->read', '', 0, 23, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->asset->enabled && $leftmenu=="asset"', __ HANDLER__, 'left', 3005__ + MAX_llx_menu__, 'asset', '',
        3004__ + MAX_llx_menu__, '/asset/type.php?mainmenu=accountancy&amp;action=create', 'MenuNewTypeAssets', 3,
        'assets', '$user->rights->asset->setup_advance', '', 0, 24, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->asset->enabled && $leftmenu=="asset"', __ HANDLER__, 'left', 3006__ + MAX_llx_menu__, 'asset', '',
        3004__ + MAX_llx_menu__, '/asset/type.php?mainmenu=accountancy', 'MenuListTypeAssets', 3, 'assets',
        '$user->rights->asset->read', '', 0, 25, __ ENTITY__);
-- Check deposit
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        'empty($conf->global->BANK_DISABLE_CHECK_DEPOSIT) && ! empty($conf->banque->enabled) && (! empty($conf->facture->enabled) || ! empty($conf->global->MAIN_MENU_CHEQUE_DEPOSIT_ON))', __
        HANDLER__, 'left', 1711__ + MAX_llx_menu__, 'accountancy', 'checks', 14__ + MAX_llx_menu__,
        '/compta/paiement/cheque/index.php?mainmenu=bank&amp;leftmenu=checks', 'MenuChequeDeposits', 0, 'bills',
        '$user->rights->banque->lire', '', 2, 9, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        'empty($conf->global->BANK_DISABLE_CHECK_DEPOSIT) && ! empty($conf->banque->enabled) && (! empty($conf->facture->enabled) || ! empty($conf->global->MAIN_MENU_CHEQUE_DEPOSIT_ON))', __
        HANDLER__, 'left', 1712__ + MAX_llx_menu__, 'accountancy', '', 1711__ + MAX_llx_menu__,
        '/compta/paiement/cheque/card.php?mainmenu=bank&amp;leftmenu=checks&amp;action=new', 'NewCheckDeposit', 1,
        'compta', '$user->rights->banque->lire', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('',
        'empty($conf->global->BANK_DISABLE_CHECK_DEPOSIT) && ! empty($conf->banque->enabled) && (! empty($conf->facture->enabled) || ! empty($conf->global->MAIN_MENU_CHEQUE_DEPOSIT_ON))', __
        HANDLER__, 'left', 1713__ + MAX_llx_menu__, 'accountancy', '', 1711__ + MAX_llx_menu__,
        '/compta/paiement/cheque/list.php?mainmenu=bank&amp;leftmenu=checks', 'List', 1, 'bills',
        '$user->rights->banque->lire', '', 2, 1, __ ENTITY__);
-- PaymentByDirectDebit
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled', __ HANDLER__, 'left', 2500__ + MAX_llx_menu__, 'accountancy', 'withdraw',
        14__ + MAX_llx_menu__, '/compta/prelevement/index.php?mainmenu=bank&amp;leftmenu=withdraw',
        'PaymentByDirectDebit', 0, 'withdrawals', '$user->rights->prelevement->bons->lire', '', 2, 9, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled && $leftmenu=="withdraw"', __ HANDLER__, 'left', 2502__ + MAX_llx_menu__,
        'accountancy', '', 2500__ + MAX_llx_menu__,
        '/compta/prelevement/create.php?mainmenu=bank&amp;leftmenu=withdraw', 'NewStandingOrder', 1, 'withdrawals',
        '$user->rights->prelevement->bons->lire', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled && $leftmenu=="withdraw"', __ HANDLER__, 'left', 2503__ + MAX_llx_menu__,
        'accountancy', '', 2500__ + MAX_llx_menu__,
        '/compta/prelevement/orders_list.php?mainmenu=bank&amp;leftmenu=withdraw', 'WithdrawalsReceipts', 1,
        'withdrawals', '$user->rights->prelevement->bons->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled && $leftmenu=="withdraw"', __ HANDLER__, 'left', 2504__ + MAX_llx_menu__,
        'accountancy', '', 2500__ + MAX_llx_menu__, '/compta/prelevement/list.php?mainmenu=bank&amp;leftmenu=withdraw',
        'WithdrawalsLines', 1, 'withdrawals', '$user->rights->prelevement->bons->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled && $leftmenu=="withdraw"', __ HANDLER__, 'left', 2506__ + MAX_llx_menu__,
        'accountancy', '', 2500__ + MAX_llx_menu__,
        '/compta/prelevement/rejets.php?mainmenu=bank&amp;leftmenu=withdraw', 'Rejects', 1, 'withdrawals',
        '$user->rights->prelevement->bons->lire', '', 2, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled && $leftmenu=="withdraw"', __ HANDLER__, 'left', 2507__ + MAX_llx_menu__,
        'accountancy', '', 2500__ + MAX_llx_menu__, '/compta/prelevement/stats.php?mainmenu=bank&amp;leftmenu=withdraw',
        'Statistics', 1, 'withdrawals', '$user->rights->prelevement->bons->lire', '', 2, 6, __ ENTITY__);
-- PaymentByCreditTransfer
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled', __ HANDLER__, 'left', 2510__ + MAX_llx_menu__, 'accountancy', 'banktransfer',
        14__ + MAX_llx_menu__,
        '/compta/prelevement/index.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer',
        'PaymentByBankTransfer', 0, 'withdrawals', '$user->rights->prelevement->bons->lire', '', 2, 9, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled && $leftmenu=="banktransfer"', __ HANDLER__, 'left', 2512__ + MAX_llx_menu__,
        'accountancy', '', 2510__ + MAX_llx_menu__,
        '/compta/prelevement/create.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer',
        'NewStandingOrder', 1, 'withdrawals', '$user->rights->prelevement->bons->lire', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled && $leftmenu=="banktransfer"', __ HANDLER__, 'left', 2513__ + MAX_llx_menu__,
        'accountancy', '', 2510__ + MAX_llx_menu__,
        '/compta/prelevement/orders_list.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer',
        'WithdrawalsReceipts', 1, 'withdrawals', '$user->rights->prelevement->bons->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled && $leftmenu=="banktransfer"', __ HANDLER__, 'left', 2514__ + MAX_llx_menu__,
        'accountancy', '', 2510__ + MAX_llx_menu__,
        '/compta/prelevement/list.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer',
        'WithdrawalsLines', 1, 'withdrawals', '$user->rights->prelevement->bons->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled && $leftmenu=="banktransfer"', __ HANDLER__, 'left', 2516__ + MAX_llx_menu__,
        'accountancy', '', 2510__ + MAX_llx_menu__,
        '/compta/prelevement/rejets.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer', 'Rejects', 1,
        'withdrawals', '$user->rights->prelevement->bons->lire', '', 2, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->prelevement->enabled && $leftmenu=="banktransfer"', __ HANDLER__, 'left', 2517__ + MAX_llx_menu__,
        'accountancy', '', 2510__ + MAX_llx_menu__,
        '/compta/prelevement/stats.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer', 'Statistics', 1,
        'withdrawals', '$user->rights->prelevement->bons->lire', '', 2, 6, __ ENTITY__);
-- Bank
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->banque->enabled', __ HANDLER__, 'left', 2600__ + MAX_llx_menu__, 'accountancy', 'bank',
        14__ + MAX_llx_menu__, '/compta/bank/list.php?mainmenu=bank&amp;leftmenu=bank', 'MenuBankCash', 0, 'banks',
        '$user->rights->banque->lire', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->banque->enabled && ($leftmenu=="bank" || $leftmenu=="checks" || $leftmenu=="withdraw")', __
        HANDLER__, 'left', 2601__ + MAX_llx_menu__, 'accountancy', '', 2600__ + MAX_llx_menu__,
        '/compta/bank/card.php?mainmenu=bank&amp;action=create&amp;leftmenu=bank', 'MenuNewFinancialAccount', 1,
        'banks', '$user->rights->banque->configurer', '', 0, 0, __ ENTITY__);
-- insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs, perms, target, usertype, position, entity) values ('', '$conf->banque->enabled && ($leftmenu=="bank" || $leftmenu=="checks" || $leftmenu=="withdraw")', __HANDLER__, 'left', 2602__+MAX_llx_menu__, 'accountancy', '', 2600__+MAX_llx_menu__, '/compta/bank/categ.php?mainmenu=bank&amp;leftmenu=bank', 'Rubriques', 1, 'categories', '$user->rights->banque->configurer', '', 0, 1, __ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->banque->enabled && ($leftmenu=="bank" || $leftmenu=="checks" || $leftmenu=="withdraw")', __
        HANDLER__, 'left', 2603__ + MAX_llx_menu__, 'accountancy', '', 2600__ + MAX_llx_menu__,
        '/compta/bank/bankentries_list.php?mainmenu=bank&amp;leftmenu=bank', 'ListTransactions', 1, 'banks',
        '$user->rights->banque->lire', '', 0, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->banque->enabled && ($leftmenu=="bank" || $leftmenu=="checks" || $leftmenu=="withdraw")', __
        HANDLER__, 'left', 2604__ + MAX_llx_menu__, 'accountancy', '', 2600__ + MAX_llx_menu__,
        '/compta/bank/budget.php?mainmenu=bank&amp;leftmenu=bank', 'ListTransactionsByCategory', 1, 'banks',
        '$user->rights->banque->lire', '', 0, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->banque->enabled && ($leftmenu=="bank" || $leftmenu=="checks" || $leftmenu=="withdraw")', __
        HANDLER__, 'left', 2606__ + MAX_llx_menu__, 'accountancy', '', 2600__ + MAX_llx_menu__,
        '/compta/bank/transfer.php?mainmenu=bank&amp;leftmenu=bank', 'BankTransfers', 1, 'banks',
        '$user->rights->banque->transfer', '', 0, 5, __ ENTITY__);
-- Bank - Categories
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->categorie->enabled', __ HANDLER__, 'left', 2650__ + MAX_llx_menu__, 'accountancy', 'cat',
        14__ + MAX_llx_menu__, '/categories/index.php?mainmenu=bank&amp;leftmenu=bank&amp;type=5', 'Categories', 0,
        'categories', '$user->rights->categorie->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->categorie->enabled', __ HANDLER__, 'left', 2651__ + MAX_llx_menu__, 'accountancy', '',
        2650__ + MAX_llx_menu__, '/categories/card.php?mainmenu=bank&amp;leftmenu=bank&amp;action=create&amp;type=5',
        'NewCategory', 1, 'categories', '$user->rights->categorie->creer', '', 2, 0, __ ENTITY__);
-- Project
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->projet->enabled', __ HANDLER__, 'left', 3600__ + MAX_llx_menu__, 'project', 'projects',
        7__ + MAX_llx_menu__, '/projet/index.php?mainmenu=project&amp;leftmenu=projects', 'LeadsOrProjects', 0,
        'projects', '$user->rights->projet->lire', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->projet->enabled', __ HANDLER__, 'left', 3601__ + MAX_llx_menu__, 'project', '',
        3600__ + MAX_llx_menu__, '/projet/card.php?mainmenu=project&amp;leftmenu=projects&amp;action=create', 'New', 1,
        'projects', '$user->rights->projet->creer', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->projet->enabled', __ HANDLER__, 'left', 3602__ + MAX_llx_menu__, 'project', '',
        3600__ + MAX_llx_menu__, '/projet/list.php?mainmenu=project&amp;leftmenu=projects', 'List', 1, 'projects',
        '$user->rights->projet->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->projet->enabled && $conf->global->PROJECT_USE_OPPORTUNITIES != 0', __ HANDLER__, 'left',
        3603__ + MAX_llx_menu__, 'project', '', 3600__ + MAX_llx_menu__,
        '/projet/list.php?mainmenu=project&amp;leftmenu=projects&search_opp_status=openedopp&search_status=99',
        'ListOpenLeads', 1, 'projects', '$user->rights->projet->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->projet->enabled && $conf->global->PROJECT_USE_OPPORTUNITIES != 2', __ HANDLER__, 'left',
        3604__ + MAX_llx_menu__, 'project', '', 3600__ + MAX_llx_menu__,
        '/projet/list.php?mainmenu=project&amp;leftmenu=projects&search_opp_status=notopenedopp&search_status=99',
        'ListOpenProjects', 1, 'projects', '$user->rights->projet->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->projet->enabled', __ HANDLER__, 'left', 3605__ + MAX_llx_menu__, 'project', '',
        3600__ + MAX_llx_menu__, '/projet/stats/index.php?mainmenu=project&amp;leftmenu=projects', 'Statistics', 1,
        'projects', '$user->rights->projet->lire', '', 2, 3, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->projet->enabled && !$conf->global->PROJECT_HIDE_TASKS', __ HANDLER__, 'left',
        3700__ + MAX_llx_menu__, 'project', '', 7__ + MAX_llx_menu__,
        '/projet/activity/index.php?mainmenu=project&amp;leftmenu=projects', 'Activities', 0, 'projects',
        '$user->rights->projet->lire', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->projet->enabled && !$conf->global->PROJECT_HIDE_TASKS', __ HANDLER__, 'left',
        3701__ + MAX_llx_menu__, 'project', '', 3700__ + MAX_llx_menu__,
        '/projet/tasks.php?mainmenu=project&amp;leftmenu=projects&amp;action=create', 'NewTask', 1, 'projects',
        '$user->rights->projet->creer', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->projet->enabled && !$conf->global->PROJECT_HIDE_TASKS', __ HANDLER__, 'left',
        3702__ + MAX_llx_menu__, 'project', '', 3700__ + MAX_llx_menu__,
        '/projet/tasks/list.php?mainmenu=project&amp;leftmenu=projects', 'List', 1, 'projects',
        '$user->rights->projet->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->projet->enabled && !$conf->global->PROJECT_HIDE_TASKS', __ HANDLER__, 'left',
        3704__ + MAX_llx_menu__, 'project', '', 3700__ + MAX_llx_menu__,
        '/projet/tasks/stats/index.php?mainmenu=project&amp;leftmenu=projects', 'Statistics', 1, 'projects',
        '$user->rights->projet->lire', '', 2, 4, __ ENTITY__);

insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->projet->enabled && !$conf->global->PROJECT_HIDE_TASKS', __ HANDLER__, 'left',
        3400__ + MAX_llx_menu__, 'project', '', 7__ + MAX_llx_menu__,
        '/projet/activity/perweek.php?mainmenu=project&amp;leftmenu=projects', 'NewTimeSpent', 0, 'projects',
        '$user->rights->projet->lire', '', 2, 3, __ ENTITY__);

-- BOM
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->bom->enabled', __ HANDLER__, 'left', 5400__ + MAX_llx_menu__, 'mrp', 'bom', 16__ + MAX_llx_menu__,
        '/bom/bom_list.php?mainmenu=mrp&amp;leftmenu=bom', 'MenuBOM', 1, 'mrp', '$user->rights->bom->read', '', 0, 20, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->bom->enabled', __ HANDLER__, 'left', 5401__ + MAX_llx_menu__, 'mrp', '', 5400__ + MAX_llx_menu__,
        '/bom/bom_card.php?mainmenu=mrp&amp;leftmenu=bom&amp;action=create', 'NewBOM', 2, 'mrp',
        '$user->rights->bom->write', '', 0, 21, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->bom->enabled', __ HANDLER__, 'left', 5403__ + MAX_llx_menu__, 'mrp', '', 5400__ + MAX_llx_menu__,
        '/bom/bom_list.php?mainmenu=mrp&amp;leftmenu=bom', 'List', 2, 'mrp', '$user->rights->bom->read', '', 0, 22, __
        ENTITY__);
-- MRP
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->bom->enabled', __ HANDLER__, 'left', 5450__ + MAX_llx_menu__, 'mrp', 'mrp', 16__ + MAX_llx_menu__,
        '/mrp/mo_list.php?mainmenu=mrp&amp;leftmenu=mrp', 'MenuMRP', 1, 'mrp', '$user->rights->mrp->read', '', 0, 20, __
        ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->bom->enabled', __ HANDLER__, 'left', 5451__ + MAX_llx_menu__, 'mrp', '', 5450__ + MAX_llx_menu__,
        '/mrp/mo_card.php?mainmenu=mrp&amp;leftmenu=mrp&amp;action=create', 'NewMO', 2, 'mrp',
        '$user->rights->mrp->write', '', 0, 21, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->bom->enabled', __ HANDLER__, 'left', 5453__ + MAX_llx_menu__, 'mrp', '', 5450__ + MAX_llx_menu__,
        '/mrp/mo_list.php?mainmenu=mrp&amp;leftmenu=mrp', 'List', 2, 'mrp', '$user->rights->mrp->read', '', 0, 22, __
        ENTITY__);


-- Project - Categories
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->categorie->enabled', __ HANDLER__, 'left', 3804__ + MAX_llx_menu__, 'project', 'cat',
        7__ + MAX_llx_menu__, '/categories/index.php?mainmenu=project&amp;leftmenu=cat&amp;type=6', 'Categories', 0,
        'categories', '$user->rights->categorie->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->categorie->enabled', __ HANDLER__, 'left', 3805__ + MAX_llx_menu__, 'project', '',
        3804__ + MAX_llx_menu__, '/categories/card.php?mainmenu=project&amp;action=create&amp;type=6', 'NewCategory', 1,
        'categories', '$user->rights->categorie->creer', '', 2, 0, __ ENTITY__);
-- Tools
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', 'empty($user->socid)', __ HANDLER__, 'left', 3900__ + MAX_llx_menu__, 'tools', 'email_templates',
        8__ + MAX_llx_menu__, '/admin/mails_templates.php?mainmenu=tools&amp;leftmenu=email_templates',
        'EMailTemplates', 0, '', '', '', 0, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->mailing->enabled', __ HANDLER__, 'left', 3910__ + MAX_llx_menu__, 'tools', 'mailing',
        8__ + MAX_llx_menu__, '/comm/mailing/index.php?mainmenu=tools&amp;leftmenu=mailing', 'EMailings', 0, 'mails',
        '$user->rights->mailing->lire', '', 0, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->mailing->enabled', __ HANDLER__, 'left', 3911__ + MAX_llx_menu__, 'tools', '',
        3910__ + MAX_llx_menu__, '/comm/mailing/card.php?mainmenu=tools&amp;leftmenu=mailing&amp;action=create',
        'NewMailing', 1, 'mails', '$user->rights->mailing->creer', '', 0, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->mailing->enabled', __ HANDLER__, 'left', 3912__ + MAX_llx_menu__, 'tools', '',
        3910__ + MAX_llx_menu__, '/comm/mailing/list.php?mainmenu=tools&amp;leftmenu=mailing', 'List', 1, 'mails',
        '$user->rights->mailing->lire', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->export->enabled', __ HANDLER__, 'left', 4100__ + MAX_llx_menu__, 'tools', 'export',
        8__ + MAX_llx_menu__, '/exports/index.php?mainmenu=tools&amp;leftmenu=export', 'FormatedExport', 0, 'exports',
        '$user->rights->export->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->export->enabled', __ HANDLER__, 'left', 4101__ + MAX_llx_menu__, 'tools', '',
        4100__ + MAX_llx_menu__, '/exports/export.php?mainmenu=tools&amp;leftmenu=export', 'NewExport', 1, 'exports',
        '$user->rights->export->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->import->enabled', __ HANDLER__, 'left', 4130__ + MAX_llx_menu__, 'tools', 'import',
        8__ + MAX_llx_menu__, '/imports/index.php?mainmenu=tools&amp;leftmenu=import', 'FormatedImport', 0, 'exports',
        '$user->rights->import->run', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->import->enabled', __ HANDLER__, 'left', 4131__ + MAX_llx_menu__, 'tools', '',
        4130__ + MAX_llx_menu__, '/imports/import.php?mainmenu=tools&amp;leftmenu=import', 'NewImport', 1, 'exports',
        '$user->rights->import->run', '', 2, 0, __ ENTITY__);
-- Members
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4200__ + MAX_llx_menu__, 'members', 'members',
        13__ + MAX_llx_menu__, '/adherents/index.php?mainmenu=members&amp;leftmenu=members', 'Members', 0, 'members',
        '$user->rights->adherent->lire', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4201__ + MAX_llx_menu__, 'members', '',
        4200__ + MAX_llx_menu__, '/adherents/card.php?mainmenu=members&amp;leftmenu=members&amp;action=create',
        'NewMember', 1, 'members', '$user->rights->adherent->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4202__ + MAX_llx_menu__, 'members', '',
        4200__ + MAX_llx_menu__, '/adherents/list.php', 'List', 1, 'members', '$user->rights->adherent->lire', '', 2,
        1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4203__ + MAX_llx_menu__, 'members', '',
        4202__ + MAX_llx_menu__, '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=-1',
        'MenuMembersToValidate', 2, 'members', '$user->rights->adherent->lire', '', 2, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4204__ + MAX_llx_menu__, 'members', '',
        4202__ + MAX_llx_menu__, '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=1',
        'MenuMembersValidated', 2, 'members', '$user->rights->adherent->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4205__ + MAX_llx_menu__, 'members', '',
        4204__ + MAX_llx_menu__,
        '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=1&amp;filter=withoutsubscription',
        'WithoutSubscription', 2, 'members', '$user->rights->adherent->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4206__ + MAX_llx_menu__, 'members', '',
        4204__ + MAX_llx_menu__,
        '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=1&amp;filter=outofdate', 'UpToDate', 2,
        'members', '$user->rights->adherent->lire', '', 2, 4, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4207__ + MAX_llx_menu__, 'members', '',
        4204__ + MAX_llx_menu__,
        '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=1&amp;filter=uptodate', 'OutOfDate', 2,
        'members', '$user->rights->adherent->lire', '', 2, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4208__ + MAX_llx_menu__, 'members', '',
        4202__ + MAX_llx_menu__, '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=0',
        'MenuMembersResiliated', 2, 'members', '$user->rights->adherent->lire', '', 2, 6, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4209__ + MAX_llx_menu__, 'members', '',
        4200__ + MAX_llx_menu__,
        '/adherents/stats/geo.php?mainmenu=members&amp;leftmenu=members&amp;mode=memberbycountry', 'MenuMembersStats',
        1, 'members', '$user->rights->adherent->lire', '', 2, 7, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '! empty($conf->global->MEMBER_LINK_TO_HTPASSWDFILE) && $conf->adherent->enabled', __ HANDLER__, 'left',
        4502__ + MAX_llx_menu__, 'members', '', 4200__ + MAX_llx_menu__,
        '/adherents/htpasswd.php?mainmenu=members&amp;leftmenu=export', 'Filehtpasswd', 1, 'members',
        '$user->rights->adherent->export', '', 2, 9, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4503__ + MAX_llx_menu__, 'members', '',
        4200__ + MAX_llx_menu__, '/adherents/cartes/carte.php?mainmenu=members&amp;leftmenu=export', 'MembersCards', 1,
        'members', '$user->rights->adherent->export', '', 2, 10, __ ENTITY__);
-- Members - Subscriptions
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4300__ + MAX_llx_menu__, 'members', '',
        13__ + MAX_llx_menu__, '/adherents/index.php?mainmenu=members&amp;leftmenu=members', 'Subscriptions', 0,
        'compta', '$user->rights->adherent->cotisation->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4301__ + MAX_llx_menu__, 'members', '',
        4300__ + MAX_llx_menu__, '/adherents/list.php?mainmenu=members&amp;statut=-1&amp;leftmenu=accountancy',
        'NewSubscription', 1, 'compta', '$user->rights->adherent->cotisation->creer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4302__ + MAX_llx_menu__, 'members', '',
        4300__ + MAX_llx_menu__, '/adherents/subscription/list.php?mainmenu=members&amp;leftmenu=members', 'List', 1,
        'compta', '$user->rights->adherent->cotisation->lire', '', 2, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4303__ + MAX_llx_menu__, 'members', '',
        4300__ + MAX_llx_menu__, '/adherents/stats/index.php?mainmenu=members&amp;leftmenu=members', 'MenuMembersStats',
        1, 'members', '$user->rights->adherent->lire', '', 2, 7, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4700__ + MAX_llx_menu__, 'members', 'setup',
        13__ + MAX_llx_menu__, '/adherents/type.php?mainmenu=members&amp;leftmenu=setup', 'MembersTypes', 0, 'members',
        '$user->rights->adherent->configurer', '', 2, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4701__ + MAX_llx_menu__, 'members', '',
        4700__ + MAX_llx_menu__, '/adherents/type.php?mainmenu=members&amp;leftmenu=setup&amp;action=create', 'New', 1,
        'members', '$user->rights->adherent->configurer', '', 2, 0, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled', __ HANDLER__, 'left', 4702__ + MAX_llx_menu__, 'members', '',
        4700__ + MAX_llx_menu__, '/adherents/type.php?mainmenu=members&amp;leftmenu=setup', 'List', 1, 'members',
        '$user->rights->adherent->configurer', '', 2, 1, __ ENTITY__);
-- Members - Category member
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled && $conf->categorie->enabled', __ HANDLER__, 'left', 5200__ + MAX_llx_menu__,
        'members', 'cat', 13__ + MAX_llx_menu__, '/categories/index.php?mainmenu=members&amp;leftmenu=cat&amp;type=3',
        'MembersCategoriesShort', 0, 'categories', '$user->rights->categorie->lire', '', 2, 3, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->adherent->enabled && $conf->categorie->enabled', __ HANDLER__, 'left', 5201__ + MAX_llx_menu__,
        'members', '', 5200__ + MAX_llx_menu__, '/categories/card.php?mainmenu=members&amp;action=create&amp;type=3',
        'NewCategory', 1, 'categories', '$user->rights->categorie->creer', '', 2, 0, __ ENTITY__);
-- HRM - Employee
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->hrm->enabled', __ HANDLER__, 'left', 4600__ + MAX_llx_menu__, 'hrm', 'hrm', 15__ + MAX_llx_menu__,
        '/user/list.php?mainmenu=hrm&amp;leftmenu=hrm&mode=employee', 'Employees', 0, 'hrm',
        '$user->rights->user->user->lire', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->hrm->enabled', __ HANDLER__, 'left', 4601__ + MAX_llx_menu__, 'hrm', '', 4600__ + MAX_llx_menu__,
        '/user/card.php?mainmenu=hrm&amp;action=create&employee=1', 'NewEmployee', 1, 'hrm',
        '$user->rights->user->user->creer', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->hrm->enabled', __ HANDLER__, 'left', 4602__ + MAX_llx_menu__, 'hrm', '', 4600__ + MAX_llx_menu__,
        '/user/list.php?mainmenu=hrm&amp;leftmenu=hrm&mode=employee&contextpage=employeelist', 'List', 1, 'hrm',
        '$user->rights->user->user->lire', '', 0, 2, __ ENTITY__);
-- HRM - Holiday
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->holiday->enabled', __ HANDLER__, 'left', 5000__ + MAX_llx_menu__, 'hrm', 'hrm',
        15__ + MAX_llx_menu__, '/holiday/list.php?mainmenu=hrm&amp;leftmenu=hrm', 'CPTitreMenu', 0, 'holiday',
        '$user->rights->holiday->read', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->holiday->enabled', __ HANDLER__, 'left', 5001__ + MAX_llx_menu__, 'hrm', '',
        5000__ + MAX_llx_menu__, '/holiday/card.php?mainmenu=hrm&amp;action=create', 'MenuAddCP', 1, 'holiday',
        '$user->rights->holiday->write', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->holiday->enabled', __ HANDLER__, 'left', 5002__ + MAX_llx_menu__, 'hrm', '',
        5000__ + MAX_llx_menu__, '/holiday/list.php?mainmenu=hrm&amp;leftmenu=hrm', 'List', 1, 'holiday',
        '$user->rights->holiday->read', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->holiday->enabled', __ HANDLER__, 'left', 5003__ + MAX_llx_menu__, 'hrm', '',
        5002__ + MAX_llx_menu__, '/holiday/list.php?mainmenu=hrm&amp;search_statut=2&leftmenu=hrm', 'ListToApprove', 2,
        'trips', '$user->rights->holiday->read', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->holiday->enabled', __ HANDLER__, 'left', 5004__ + MAX_llx_menu__, 'hrm', '',
        5000__ + MAX_llx_menu__, '/holiday/define_holiday.php?mainmenu=hrm&amp;action=request', 'MenuConfCP', 1,
        'holiday', '$user->rights->holiday->define_holiday', '', 0, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->holiday->enabled', __ HANDLER__, 'left', 5005__ + MAX_llx_menu__, 'hrm', '',
        5000__ + MAX_llx_menu__, '/holiday/view_log.php?mainmenu=hrm&amp;action=request', 'MenuLogCP', 1, 'holiday',
        '$user->rights->holiday->define_holiday', '', 0, 3, __ ENTITY__);
-- HRM - Trips and expenses (old module)
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->deplacement->enabled', __ HANDLER__, 'left', 2100__ + MAX_llx_menu__, 'accountancy',
        'tripsandexpenses', 15__ + MAX_llx_menu__,
        '/compta/deplacement/index.php?mainmenu=accountancy&amp;leftmenu=tripsandexpenses', 'TripsAndExpenses', 0,
        'trips', '$user->rights->deplacement->lire', '', 0, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->deplacement->enabled', __ HANDLER__, 'left', 2101__ + MAX_llx_menu__, 'accountancy', '',
        2100__ + MAX_llx_menu__,
        '/compta/deplacement/card.php?mainmenu=accountancy&amp;action=create&amp;leftmenu=tripsandexpenses', 'New', 1,
        'trips', '$user->rights->deplacement->creer', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->deplacement->enabled', __ HANDLER__, 'left', 2102__ + MAX_llx_menu__, 'accountancy', '',
        2100__ + MAX_llx_menu__, '/compta/deplacement/list.php?mainmenu=accountancy&amp;leftmenu=tripsandexpenses',
        'List', 1, 'trips', '$user->rights->deplacement->lire', '', 0, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->deplacement->enabled', __ HANDLER__, 'left', 2103__ + MAX_llx_menu__, 'accountancy', '',
        2100__ + MAX_llx_menu__,
        '/compta/deplacement/stats/index.php?mainmenu=accountancy&amp;leftmenu=tripsandexpenses', 'Statistics', 1,
        'trips', '$user->rights->deplacement->lire', '', 0, 2, __ ENTITY__);
-- HRM - Expense reports
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->expensereport->enabled', __ HANDLER__, 'left', 5300__ + MAX_llx_menu__, 'hrm', 'expensereport',
        15__ + MAX_llx_menu__, '/expensereport/index.php?mainmenu=hrm&amp;leftmenu=expensereport', 'TripsAndExpenses',
        0, 'trips', '$user->rights->expensereport->lire', '', 0, 5, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->expensereport->enabled', __ HANDLER__, 'left', 5301__ + MAX_llx_menu__, 'hrm', '',
        5300__ + MAX_llx_menu__, '/expensereport/card.php?mainmenu=hrm&amp;action=create&amp;leftmenu=expensereport',
        'New', 1, 'trips', '$user->rights->expensereport->creer', '', 0, 1, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->expensereport->enabled', __ HANDLER__, 'left', 5302__ + MAX_llx_menu__, 'hrm', '',
        5300__ + MAX_llx_menu__, '/expensereport/list.php?mainmenu=hrm&amp;leftmenu=expensereport', 'List', 1, 'trips',
        '$user->rights->expensereport->lire', '', 0, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->expensereport->enabled', __ HANDLER__, 'left', 5303__ + MAX_llx_menu__, 'hrm', '',
        5302__ + MAX_llx_menu__, '/expensereport/list.php?mainmenu=hrm&amp;search_status=2&amp;leftmenu=expensereport',
        'ListToApprove', 2, 'trips', '$user->rights->expensereport->approve', '', 0, 2, __ ENTITY__);
insert into llx_menu (module, enabled, menu_handler, type, rowid, mainmenu, leftmenu, fk_menu, url, titre, level, langs,
                      perms, target, usertype, position, entity)
values ('', '$conf->expensereport->enabled', __ HANDLER__, 'left', 5304__ + MAX_llx_menu__, 'hrm', '',
        5300__ + MAX_llx_menu__, '/expensereport/stats/index.php?mainmenu=hrm&amp;leftmenu=expensereport', 'Statistics',
        1, 'trips', '$user->rights->expensereport->lire', '', 0, 2, __ ENTITY__);
