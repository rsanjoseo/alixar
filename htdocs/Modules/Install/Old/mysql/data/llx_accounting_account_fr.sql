-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2009 Regis Houssin        <regis.houssin@inodbox.com>
-- Copyright (C) 2007      Patrick Raguin       <patrick.raguin@gmail.com>
-- Copyright (C) 2011-2017 Alexandre Spangaro   <aspangaro@open-dsi.fr>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <https://www.gnu.org/licenses/>.
--

--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l''install et tous les sigles '--' sont supprimés.
-- Note: To replace a string thas is '__, 0' into an increasing number, you can use vi with comment
-- :let @a=1 | %s/__, 0/\='__, '.(@a+setreg('a',@a+1))/g
--                                                         

-- ID    0 - 438
-- ID 1501 - 5999
-- ID 7000 - 7208
-- ID 8000 - 9120
-- ADD 100000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1401, 'PCG99-ABREGE', 'CAPIT', '1', '0',
         'Fonds propres, provisions pour risques et charges et dettes à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1402, 'PCG99-ABREGE', 'IMMO', '2', '0',
         'Frais d''établissement. Actifs immobilisés et créances à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1403, 'PCG99-ABREGE', 'STOCK', '3', '0', 'Stock et commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1404, 'PCG99-ABREGE', 'THIRDPARTY', '4', '0', 'Créances et dettes à un an au plus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1405, 'PCG99-ABREGE', 'FINAN', '5', '0', 'Placement de trésorerie et de valeurs disponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1406, 'PCG99-ABREGE', 'EXPENSE', '6', '0', 'Charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1407, 'PCG99-ABREGE', 'INCOME', '7', '0', 'Produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1, 'PCG99-ABREGE', 'CAPIT', '101', '1401', 'Capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 2, 'PCG99-ABREGE', 'CAPIT', '105', '1401', 'Ecarts de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 3, 'PCG99-ABREGE', 'CAPIT', '1061', '1401', 'Réserve légale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4, 'PCG99-ABREGE', 'CAPIT', '1063', '1401', 'Réserves statutaires ou contractuelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5, 'PCG99-ABREGE', 'CAPIT', '1064', '1401', 'Réserves réglementées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 6, 'PCG99-ABREGE', 'CAPIT', '1068', '1401', 'Autres réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7, 'PCG99-ABREGE', 'CAPIT', '108', '1401', 'Compte de l''exploitant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8, 'PCG99-ABREGE', 'CAPIT', '12', '1401', 'Résultat de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9, 'PCG99-ABREGE', 'CAPIT', '145', '1401', 'Amortissements dérogatoires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 10, 'PCG99-ABREGE', 'CAPIT', '146', '1401', 'Provision spéciale de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11, 'PCG99-ABREGE', 'CAPIT', '147', '1401', 'Plus-values réinvesties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12, 'PCG99-ABREGE', 'CAPIT', '148', '1401', 'Autres provisions réglementées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 13, 'PCG99-ABREGE', 'CAPIT', '15', '1401', 'Provisions pour risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 14, 'PCG99-ABREGE', 'CAPIT', '16', '1401', 'Emprunts et dettes assimilees', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 15, 'PCG99-ABREGE', 'IMMO', '20', '1402', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 16, 'PCG99-ABREGE', 'IMMO', '201', '15', 'Frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 17, 'PCG99-ABREGE', 'IMMO', '206', '15', 'Droit au bail', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 18, 'PCG99-ABREGE', 'IMMO', '207', '15', 'Fonds commercial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 19, 'PCG99-ABREGE', 'IMMO', '208', '15', 'Autres immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 20, 'PCG99-ABREGE', 'IMMO', '21', '1402', 'Immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 21, 'PCG99-ABREGE', 'IMMO', '23', '1402', 'Immobilisations en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 22, 'PCG99-ABREGE', 'IMMO', '27', '1402', 'Autres immobilisations financieres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 23, 'PCG99-ABREGE', 'IMMO', '280', '1402', 'Amortissements des immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 24, 'PCG99-ABREGE', 'IMMO', '281', '1402', 'Amortissements des immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 25, 'PCG99-ABREGE', 'IMMO', '290', '1402',
         'Provisions pour dépréciation des immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 26, 'PCG99-ABREGE', 'IMMO', '291', '1402',
         'Provisions pour dépréciation des immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 27, 'PCG99-ABREGE', 'IMMO', '297', '1402',
         'Provisions pour dépréciation des autres immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 28, 'PCG99-ABREGE', 'STOCK', '31', '1403', 'Matieres premières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 29, 'PCG99-ABREGE', 'STOCK', '32', '1403', 'Autres approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 30, 'PCG99-ABREGE', 'STOCK', '33', '1403', 'En-cours de production de biens', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 31, 'PCG99-ABREGE', 'STOCK', '34', '1403', 'En-cours de production de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 32, 'PCG99-ABREGE', 'STOCK', '35', '1403', 'Stocks de produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 33, 'PCG99-ABREGE', 'STOCK', '37', '1403', 'Stocks de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 34, 'PCG99-ABREGE', 'STOCK', '391', '1403', 'Provisions pour dépréciation des matières premières',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 35, 'PCG99-ABREGE', 'STOCK', '392', '1403',
         'Provisions pour dépréciation des autres approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 36, 'PCG99-ABREGE', 'STOCK', '393', '1403',
         'Provisions pour dépréciation des en-cours de production de biens', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 37, 'PCG99-ABREGE', 'STOCK', '394', '1403',
         'Provisions pour dépréciation des en-cours de production de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 38, 'PCG99-ABREGE', 'STOCK', '395', '1403', 'Provisions pour dépréciation des stocks de produits',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 39, 'PCG99-ABREGE', 'STOCK', '397', '1403',
         'Provisions pour dépréciation des stocks de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 40, 'PCG99-ABREGE', 'THIRDPARTY', '400', '1404', 'Fournisseurs et Comptes rattachés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 41, 'PCG99-ABREGE', 'THIRDPARTY', '409', '1404', 'Fournisseurs débiteurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 42, 'PCG99-ABREGE', 'THIRDPARTY', '410', '1404', 'Clients et Comptes rattachés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 43, 'PCG99-ABREGE', 'THIRDPARTY', '419', '1404', 'Clients créditeurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 44, 'PCG99-ABREGE', 'THIRDPARTY', '421', '1404', 'Personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 45, 'PCG99-ABREGE', 'THIRDPARTY', '428', '1404', 'Personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 46, 'PCG99-ABREGE', 'THIRDPARTY', '43', '1404', 'Sécurité sociale et autres organismes sociaux',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 47, 'PCG99-ABREGE', 'THIRDPARTY', '444', '1404', 'Etat - impôts sur bénéfice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 48, 'PCG99-ABREGE', 'THIRDPARTY', '445', '1404', 'Etat - Taxes sur chiffre affaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 49, 'PCG99-ABREGE', 'THIRDPARTY', '447', '1404', 'Autres impôts, taxes et versements assimilés',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 50, 'PCG99-ABREGE', 'THIRDPARTY', '45', '1404', 'Groupe et associes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 51, 'PCG99-ABREGE', 'THIRDPARTY', '455', '50', 'Associés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 52, 'PCG99-ABREGE', 'THIRDPARTY', '46', '1404', 'Débiteurs divers et créditeurs divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 53, 'PCG99-ABREGE', 'THIRDPARTY', '47', '1404', 'Comptes transitoires ou d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 54, 'PCG99-ABREGE', 'THIRDPARTY', '481', '1404', 'Charges à répartir sur plusieurs exercices', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 55, 'PCG99-ABREGE', 'THIRDPARTY', '486', '1404', 'Charges constatées d''avance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 56, 'PCG99-ABREGE', 'THIRDPARTY', '487', '1404', 'Produits constatés d''avance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 57, 'PCG99-ABREGE', 'THIRDPARTY', '491', '1404',
         'Provisions pour dépréciation des comptes de clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 58, 'PCG99-ABREGE', 'THIRDPARTY', '496', '1404',
         'Provisions pour dépréciation des comptes de débiteurs divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 59, 'PCG99-ABREGE', 'FINAN', '50', '1405', 'Valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 60, 'PCG99-ABREGE', 'FINAN', '51', '1405', 'Banques, établissements financiers et assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 61, 'PCG99-ABREGE', 'FINAN', '53', '1405', 'Caisse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 62, 'PCG99-ABREGE', 'FINAN', '54', '1405', 'Régies d''avance et accréditifs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 63, 'PCG99-ABREGE', 'FINAN', '58', '1405', 'Virements internes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 64, 'PCG99-ABREGE', 'FINAN', '590', '1405',
         'Provisions pour dépréciation des valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 65, 'PCG99-ABREGE', 'EXPENSE', '60', '1406', 'Achats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 66, 'PCG99-ABREGE', 'EXPENSE', '603', '65', 'Variations des stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 67, 'PCG99-ABREGE', 'EXPENSE', '61', '1406', 'Services extérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 68, 'PCG99-ABREGE', 'EXPENSE', '62', '1406', 'Autres services extérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 69, 'PCG99-ABREGE', 'EXPENSE', '63', '1406', 'Impôts, taxes et versements assimiles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 70, 'PCG99-ABREGE', 'EXPENSE', '641', '1406', 'Rémunérations du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 71, 'PCG99-ABREGE', 'EXPENSE', '644', '1406', 'Rémunération du travail de l''exploitant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 72, 'PCG99-ABREGE', 'EXPENSE', '645', '1406', 'Charges de sécurité sociale et de prévoyance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 73, 'PCG99-ABREGE', 'EXPENSE', '646', '1406', 'Cotisations sociales personnelles de l''exploitant',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 74, 'PCG99-ABREGE', 'EXPENSE', '65', '1406', 'Autres charges de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 75, 'PCG99-ABREGE', 'EXPENSE', '66', '1406', 'Charges financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 76, 'PCG99-ABREGE', 'EXPENSE', '67', '1406', 'Charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 77, 'PCG99-ABREGE', 'EXPENSE', '681', '1406', 'Dotations aux amortissements et aux provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 78, 'PCG99-ABREGE', 'EXPENSE', '686', '1406', 'Dotations aux amortissements et aux provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 79, 'PCG99-ABREGE', 'EXPENSE', '687', '1406', 'Dotations aux amortissements et aux provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 80, 'PCG99-ABREGE', 'EXPENSE', '691', '1406', 'Participation des salariés aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 81, 'PCG99-ABREGE', 'EXPENSE', '695', '1406', 'Impôts sur les bénéfices', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 82, 'PCG99-ABREGE', 'EXPENSE', '697', '1406', 'Imposition forfaitaire annuelle des sociétés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 83, 'PCG99-ABREGE', 'EXPENSE', '699', '1406', 'Produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 84, 'PCG99-ABREGE', 'INCOME', '701', '1407', 'Ventes de produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 85, 'PCG99-ABREGE', 'INCOME', '706', '1407', 'Prestations de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 86, 'PCG99-ABREGE', 'INCOME', '707', '1407', 'Ventes de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 87, 'PCG99-ABREGE', 'INCOME', '708', '1407', 'Produits des activités annexes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 88, 'PCG99-ABREGE', 'INCOME', '709', '1407',
         'Rabais, remises et ristournes accordés par l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 89, 'PCG99-ABREGE', 'INCOME', '713', '1407', 'Variation des stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 90, 'PCG99-ABREGE', 'INCOME', '72', '1407', 'Production immobilisée', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 91, 'PCG99-ABREGE', 'INCOME', '73', '1407', 'Produits nets partiels sur opérations à long terme',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 92, 'PCG99-ABREGE', 'INCOME', '74', '1407', 'Subventions d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 93, 'PCG99-ABREGE', 'INCOME', '75', '1407', 'Autres produits de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 94, 'PCG99-ABREGE', 'INCOME', '753', '93',
         'Jetons de présence et rémunérations d''administrateurs, gérants,...', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 95, 'PCG99-ABREGE', 'INCOME', '754', '93', 'Ristournes perçues des coopératives', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 96, 'PCG99-ABREGE', 'INCOME', '755', '93',
         'Quotes-parts de résultat sur opérations faites en commun', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 97, 'PCG99-ABREGE', 'INCOME', '76', '1407', 'Produits financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 98, 'PCG99-ABREGE', 'INCOME', '77', '1407', 'Produits exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 99, 'PCG99-ABREGE', 'INCOME', '781', '1407', 'Reprises sur amortissements et provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 100, 'PCG99-ABREGE', 'INCOME', '786', '1407', 'Reprises sur provisions pour risques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 101, 'PCG99-ABREGE', 'INCOME', '787', '1407', 'Reprises sur provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 102, 'PCG99-ABREGE', 'INCOME', '79', '1407', 'Transferts de charges', 1);

--
-- Descriptif des plans comptables FR PCG99-BASE
--

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1501, 'PCG99-BASE', 'CAPIT', '1', '0',
         'Fonds propres, provisions pour risques et charges et dettes à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1502, 'PCG99-BASE', 'IMMO', '2', '0',
         'Frais d''établissement. Actifs immobilisés et créances à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1503, 'PCG99-BASE', 'STOCK', '3', '0', 'Stock et commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1504, 'PCG99-BASE', 'THIRDPARTY', '4', '0', 'Créances et dettes à un an au plus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1505, 'PCG99-BASE', 'FINAN', '5', '0', 'Placement de trésorerie et de valeurs disponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1506, 'PCG99-BASE', 'EXPENSE', '6', '0', 'Charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1507, 'PCG99-BASE', 'INCOME', '7', '0', 'Produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 103, 'PCG99-BASE', 'CAPIT', '10', '1501', 'Capital  et réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 104, 'PCG99-BASE', 'CAPIT', '101', '103', 'Capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 105, 'PCG99-BASE', 'CAPIT', '104', '103', 'Primes liées au capital social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 106, 'PCG99-BASE', 'CAPIT', '105', '103', 'Ecarts de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 107, 'PCG99-BASE', 'CAPIT', '106', '103', 'Réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 108, 'PCG99-BASE', 'CAPIT', '107', '103', 'Ecart d''equivalence', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 109, 'PCG99-BASE', 'CAPIT', '108', '103', 'Compte de l''exploitant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 110, 'PCG99-BASE', 'CAPIT', '109', '103', 'Actionnaires : capital souscrit - non appelé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 111, 'PCG99-BASE', 'CAPIT', '11', '1501', 'Report à nouveau (solde créditeur ou débiteur)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 112, 'PCG99-BASE', 'CAPIT', '110', '111', 'Report à nouveau (solde créditeur)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 113, 'PCG99-BASE', 'CAPIT', '119', '111', 'Report à nouveau (solde débiteur)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 114, 'PCG99-BASE', 'CAPIT', '12', '1501', 'Résultat de l''exercice (bénéfice ou perte)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 115, 'PCG99-BASE', 'CAPIT', '120', '114', 'Résultat de l''exercice (bénéfice)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 116, 'PCG99-BASE', 'CAPIT', '129', '114', 'Résultat de l''exercice (perte)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 117, 'PCG99-BASE', 'CAPIT', '13', '1501', 'Subventions d''investissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 118, 'PCG99-BASE', 'CAPIT', '131', '117', 'Subventions d''équipement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 119, 'PCG99-BASE', 'CAPIT', '138', '117', 'Autres subventions d''investissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 120, 'PCG99-BASE', 'CAPIT', '139', '117',
         'Subventions d''investissement inscrites au compte de résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 121, 'PCG99-BASE', 'CAPIT', '14', '1501', 'Provisions réglementées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 122, 'PCG99-BASE', 'CAPIT', '142', '121', 'Provisions réglementées relatives aux immobilisations',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 123, 'PCG99-BASE', 'CAPIT', '143', '121', 'Provisions réglementées relatives aux stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 124, 'PCG99-BASE', 'CAPIT', '144', '121',
         'Provisions réglementées relatives aux autres éléments de l''actif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 125, 'PCG99-BASE', 'CAPIT', '145', '121', 'Amortissements dérogatoires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 126, 'PCG99-BASE', 'CAPIT', '146', '121', 'Provision spéciale de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 127, 'PCG99-BASE', 'CAPIT', '147', '121', 'Plus-values réinvesties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 128, 'PCG99-BASE', 'CAPIT', '148', '121', 'Autres provisions réglementées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 129, 'PCG99-BASE', 'CAPIT', '15', '1501', 'Provisions pour risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 130, 'PCG99-BASE', 'CAPIT', '151', '129', 'Provisions pour risques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 131, 'PCG99-BASE', 'CAPIT', '153', '129', 'Provisions pour pensions et obligations similaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 132, 'PCG99-BASE', 'CAPIT', '154', '129', 'Provisions pour restructurations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 133, 'PCG99-BASE', 'CAPIT', '155', '129', 'Provisions pour impôts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 134, 'PCG99-BASE', 'CAPIT', '156', '129',
         'Provisions pour renouvellement des immobilisations (entreprises concessionnaires)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 135, 'PCG99-BASE', 'CAPIT', '157', '129',
         'Provisions pour charges à répartir sur plusieurs exercices', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 136, 'PCG99-BASE', 'CAPIT', '158', '129', 'Autres provisions pour charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 137, 'PCG99-BASE', 'CAPIT', '16', '1501', 'Emprunts et dettes assimilees', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 138, 'PCG99-BASE', 'CAPIT', '161', '137', 'Emprunts obligataires convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 139, 'PCG99-BASE', 'CAPIT', '163', '137', 'Autres emprunts obligataires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 140, 'PCG99-BASE', 'CAPIT', '164', '137', 'Emprunts auprès des établissements de crédit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 141, 'PCG99-BASE', 'CAPIT', '165', '137', 'Dépôts et cautionnements reçus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 142, 'PCG99-BASE', 'CAPIT', '166', '137', 'Participation des salariés aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 143, 'PCG99-BASE', 'CAPIT', '167', '137',
         'Emprunts et dettes assortis de conditions particulières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 144, 'PCG99-BASE', 'CAPIT', '168', '137', 'Autres emprunts et dettes assimilées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 145, 'PCG99-BASE', 'CAPIT', '169', '137', 'Primes de remboursement des obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 146, 'PCG99-BASE', 'CAPIT', '17', '1501', 'Dettes rattachées à des participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 147, 'PCG99-BASE', 'CAPIT', '171', '146', 'Dettes rattachées à des participations (groupe)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 148, 'PCG99-BASE', 'CAPIT', '174', '146', 'Dettes rattachées à des participations (hors groupe)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 149, 'PCG99-BASE', 'CAPIT', '178', '146', 'Dettes rattachées à des sociétés en participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 150, 'PCG99-BASE', 'CAPIT', '18', '1501',
         'Comptes de liaison des établissements et sociétés en participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 151, 'PCG99-BASE', 'CAPIT', '181', '150', 'Comptes de liaison des établissements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 152, 'PCG99-BASE', 'CAPIT', '186', '150',
         'Biens et prestations de services échangés entre établissements (charges)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 153, 'PCG99-BASE', 'CAPIT', '187', '150',
         'Biens et prestations de services échangés entre établissements (produits)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 154, 'PCG99-BASE', 'CAPIT', '188', '150', 'Comptes de liaison des sociétés en participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 155, 'PCG99-BASE', 'IMMO', '20', '1502', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 156, 'PCG99-BASE', 'IMMO', '201', '155', 'Frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 157, 'PCG99-BASE', 'IMMO', '203', '155', 'Frais de recherche et de développement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 158, 'PCG99-BASE', 'IMMO', '205', '155',
         'Concessions et droits similaires, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 159, 'PCG99-BASE', 'IMMO', '206', '155', 'Droit au bail', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 160, 'PCG99-BASE', 'IMMO', '207', '155', 'Fonds commercial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 161, 'PCG99-BASE', 'IMMO', '208', '155', 'Autres immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 162, 'PCG99-BASE', 'IMMO', '21', '1502', 'Immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 163, 'PCG99-BASE', 'IMMO', '211', '162', 'Terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 164, 'PCG99-BASE', 'IMMO', '212', '162', 'Agencements et aménagements de terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 165, 'PCG99-BASE', 'IMMO', '213', '162', 'Constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 166, 'PCG99-BASE', 'IMMO', '214', '162', 'Constructions sur sol d''autrui', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 167, 'PCG99-BASE', 'IMMO', '215', '162',
         'Installations techniques, matériels et outillage industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 168, 'PCG99-BASE', 'IMMO', '218', '162', 'Autres immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 169, 'PCG99-BASE', 'IMMO', '22', '1502', 'Immobilisations mises en concession', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 170, 'PCG99-BASE', 'IMMO', '23', '1502', 'Immobilisations en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 171, 'PCG99-BASE', 'IMMO', '231', '170', 'Immobilisations corporelles en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 172, 'PCG99-BASE', 'IMMO', '232', '170', 'Immobilisations incorporelles en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 173, 'PCG99-BASE', 'IMMO', '237', '170',
         'Avances et acomptes versés sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 174, 'PCG99-BASE', 'IMMO', '238', '170',
         'Avances et acomptes versés sur commandes d''immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 175, 'PCG99-BASE', 'IMMO', '25', '1502',
         'Parts dans des entreprises liées et créances sur des entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 176, 'PCG99-BASE', 'IMMO', '26', '1502',
         'Participations et créances rattachées à des participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 177, 'PCG99-BASE', 'IMMO', '261', '176', 'Titres de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 178, 'PCG99-BASE', 'IMMO', '266', '176', 'Autres formes de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 179, 'PCG99-BASE', 'IMMO', '267', '176', 'Créances rattachées à des participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 180, 'PCG99-BASE', 'IMMO', '268', '176', 'Créances rattachées à des sociétés en participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 181, 'PCG99-BASE', 'IMMO', '269', '176',
         'Versements restant à effectuer sur titres de participation non libérés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 182, 'PCG99-BASE', 'IMMO', '27', '1502', 'Autres immobilisations financieres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 183, 'PCG99-BASE', 'IMMO', '271', '183',
         'Titres immobilisés autres que les titres immobilisés de l''activité de portefeuille (droit de propriété)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 184, 'PCG99-BASE', 'IMMO', '272', '183', 'Titres immobilisés (droit de créance)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 185, 'PCG99-BASE', 'IMMO', '273', '183', 'Titres immobilisés de l''activité de portefeuille', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 186, 'PCG99-BASE', 'IMMO', '274', '183', 'Prêts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 187, 'PCG99-BASE', 'IMMO', '275', '183', 'Dépôts et cautionnements versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 188, 'PCG99-BASE', 'IMMO', '276', '183', 'Autres créances immobilisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 189, 'PCG99-BASE', 'IMMO', '277', '183', '(Actions propres ou parts propres)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 190, 'PCG99-BASE', 'IMMO', '279', '183',
         'Versements restant à effectuer sur titres immobilisés non libérés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 191, 'PCG99-BASE', 'IMMO', '28', '1502', 'Amortissements des immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 192, 'PCG99-BASE', 'IMMO', '280', '191', 'Amortissements des immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 193, 'PCG99-BASE', 'IMMO', '281', '191', 'Amortissements des immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 194, 'PCG99-BASE', 'IMMO', '282', '191', 'Amortissements des immobilisations mises en concession',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 195, 'PCG99-BASE', 'IMMO', '29', '1502', 'Dépréciations des immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 196, 'PCG99-BASE', 'IMMO', '290', '195', 'Dépréciations des immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 197, 'PCG99-BASE', 'IMMO', '291', '195', 'Dépréciations des immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 198, 'PCG99-BASE', 'IMMO', '292', '195', 'Dépréciations des immobilisations mises en concession',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 199, 'PCG99-BASE', 'IMMO', '293', '195', 'Dépréciations des immobilisations en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 200, 'PCG99-BASE', 'IMMO', '296', '195',
         'Provisions pour dépréciation des participations et créances rattachées à des participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 201, 'PCG99-BASE', 'IMMO', '297', '195',
         'Provisions pour dépréciation des autres immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 202, 'PCG99-BASE', 'STOCK', '31', '1503', 'Matières premières (et fournitures)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 203, 'PCG99-BASE', 'STOCK', '311', '202', 'Matières (ou groupe) A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 204, 'PCG99-BASE', 'STOCK', '312', '202', 'Matières (ou groupe) B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 205, 'PCG99-BASE', 'STOCK', '317', '202', 'Fournitures A, B, C,', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 206, 'PCG99-BASE', 'STOCK', '32', '1503', 'Autres approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 207, 'PCG99-BASE', 'STOCK', '321', '206', 'Matières consommables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 208, 'PCG99-BASE', 'STOCK', '322', '206', 'Fournitures consommables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 209, 'PCG99-BASE', 'STOCK', '326', '206', 'Emballages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 210, 'PCG99-BASE', 'STOCK', '33', '1503', 'En-cours de production de biens', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 211, 'PCG99-BASE', 'STOCK', '331', '210', 'Produits en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 212, 'PCG99-BASE', 'STOCK', '335', '210', 'Travaux en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 213, 'PCG99-BASE', 'STOCK', '34', '1503', 'En-cours de production de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 214, 'PCG99-BASE', 'STOCK', '341', '213', 'Etudes en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 215, 'PCG99-BASE', 'STOCK', '345', '213', 'Prestations de services en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 216, 'PCG99-BASE', 'STOCK', '35', '1503', 'Stocks de produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 217, 'PCG99-BASE', 'STOCK', '351', '216', 'Produits intermédiaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 218, 'PCG99-BASE', 'STOCK', '355', '216', 'Produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 219, 'PCG99-BASE', 'STOCK', '358', '216', 'Produits résiduels (ou matières de récupération)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 220, 'PCG99-BASE', 'STOCK', '37', '1503', 'Stocks de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 221, 'PCG99-BASE', 'STOCK', '371', '220', 'Marchandises (ou groupe) A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 222, 'PCG99-BASE', 'STOCK', '372', '220', 'Marchandises (ou groupe) B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 223, 'PCG99-BASE', 'STOCK', '39', '1503', 'Provisions pour dépréciation des stocks et en-cours',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 224, 'PCG99-BASE', 'STOCK', '391', '223', 'Provisions pour dépréciation des matières premières',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 225, 'PCG99-BASE', 'STOCK', '392', '223',
         'Provisions pour dépréciation des autres approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 226, 'PCG99-BASE', 'STOCK', '393', '223',
         'Provisions pour dépréciation des en-cours de production de biens', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 227, 'PCG99-BASE', 'STOCK', '394', '223',
         'Provisions pour dépréciation des en-cours de production de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 228, 'PCG99-BASE', 'STOCK', '395', '223', 'Provisions pour dépréciation des stocks de produits',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 229, 'PCG99-BASE', 'STOCK', '397', '223',
         'Provisions pour dépréciation des stocks de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 230, 'PCG99-BASE', 'THIRDPARTY', '40', '1504', 'Fournisseurs et Comptes rattachés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 231, 'PCG99-BASE', 'THIRDPARTY', '400', '230', 'Fournisseurs et Comptes rattachés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 232, 'PCG99-BASE', 'THIRDPARTY', '401', '230', 'Fournisseurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 233, 'PCG99-BASE', 'THIRDPARTY', '403', '230', 'Fournisseurs - Effets à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 234, 'PCG99-BASE', 'THIRDPARTY', '404', '230', 'Fournisseurs d''immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 235, 'PCG99-BASE', 'THIRDPARTY', '405', '230', 'Fournisseurs d''immobilisations - Effets à payer',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 236, 'PCG99-BASE', 'THIRDPARTY', '408', '230', 'Fournisseurs - Factures non parvenues', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 237, 'PCG99-BASE', 'THIRDPARTY', '409', '230', 'Fournisseurs débiteurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 238, 'PCG99-BASE', 'THIRDPARTY', '41', '1504', 'Clients et comptes rattachés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 239, 'PCG99-BASE', 'THIRDPARTY', '410', '238', 'Clients et Comptes rattachés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 240, 'PCG99-BASE', 'THIRDPARTY', '411', '238', 'Clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 241, 'PCG99-BASE', 'THIRDPARTY', '413', '238', 'Clients - Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 242, 'PCG99-BASE', 'THIRDPARTY', '416', '238', 'Clients douteux ou litigieux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 243, 'PCG99-BASE', 'THIRDPARTY', '418', '238', 'Clients - Produits non encore facturés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 244, 'PCG99-BASE', 'THIRDPARTY', '419', '238', 'Clients créditeurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 245, 'PCG99-BASE', 'THIRDPARTY', '42', '1504', 'Personnel et comptes rattachés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 246, 'PCG99-BASE', 'THIRDPARTY', '421', '245', 'Personnel - Rémunérations dues', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 247, 'PCG99-BASE', 'THIRDPARTY', '422', '245', 'Comités d''entreprises, d''établissement, ...', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 248, 'PCG99-BASE', 'THIRDPARTY', '424', '245', 'Participation des salariés aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 249, 'PCG99-BASE', 'THIRDPARTY', '425', '245', 'Personnel - Avances et acomptes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 250, 'PCG99-BASE', 'THIRDPARTY', '426', '245', 'Personnel - Dépôts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 251, 'PCG99-BASE', 'THIRDPARTY', '427', '245', 'Personnel - Oppositions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 252, 'PCG99-BASE', 'THIRDPARTY', '428', '245',
         'Personnel - Charges à payer et produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 253, 'PCG99-BASE', 'THIRDPARTY', '43', '1504', 'Sécurité sociale et autres organismes sociaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 254, 'PCG99-BASE', 'THIRDPARTY', '431', '253', 'Sécurité sociale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 255, 'PCG99-BASE', 'THIRDPARTY', '437', '253', 'Autres organismes sociaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 256, 'PCG99-BASE', 'THIRDPARTY', '438', '253',
         'Organismes sociaux - Charges à payer et produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 257, 'PCG99-BASE', 'THIRDPARTY', '44', '1504', 'État et autres collectivités publiques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 258, 'PCG99-BASE', 'THIRDPARTY', '441', '257', 'État - Subventions à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 259, 'PCG99-BASE', 'THIRDPARTY', '442', '257', 'Etat - Impôts et taxes recouvrables sur des tiers',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 260, 'PCG99-BASE', 'THIRDPARTY', '443', '257',
         'Opérations particulières avec l''Etat, les collectivités publiques, les organismes internationaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 261, 'PCG99-BASE', 'THIRDPARTY', '444', '257', 'Etat - Impôts sur les bénéfices', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 262, 'PCG99-BASE', 'THIRDPARTY', '445', '257', 'Etat - Taxes sur le chiffre d''affaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 263, 'PCG99-BASE', 'THIRDPARTY', '446', '257', 'Obligations cautionnées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 264, 'PCG99-BASE', 'THIRDPARTY', '447', '257', 'Autres impôts, taxes et versements assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 265, 'PCG99-BASE', 'THIRDPARTY', '448', '257', 'Etat - Charges à payer et produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 266, 'PCG99-BASE', 'THIRDPARTY', '449', '257', 'Quotas d''émission à restituer à l''Etat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 267, 'PCG99-BASE', 'THIRDPARTY', '45', '1504', 'Groupe et associes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 268, 'PCG99-BASE', 'THIRDPARTY', '451', '267', 'Groupe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 269, 'PCG99-BASE', 'THIRDPARTY', '455', '267', 'Associés - Comptes courants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 270, 'PCG99-BASE', 'THIRDPARTY', '456', '267', 'Associés - Opérations sur le capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 271, 'PCG99-BASE', 'THIRDPARTY', '457', '267', 'Associés - Dividendes à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 272, 'PCG99-BASE', 'THIRDPARTY', '458', '267',
         'Associés - Opérations faites en commun et en G.I.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 273, 'PCG99-BASE', 'THIRDPARTY', '46', '1504', 'Débiteurs divers et créditeurs divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 274, 'PCG99-BASE', 'THIRDPARTY', '462', '273', 'Créances sur cessions d''immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 275, 'PCG99-BASE', 'THIRDPARTY', '464', '273',
         'Dettes sur acquisitions de valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 276, 'PCG99-BASE', 'THIRDPARTY', '465', '273',
         'Créances sur cessions de valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 277, 'PCG99-BASE', 'THIRDPARTY', '467', '273', 'Autres comptes débiteurs ou créditeurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 278, 'PCG99-BASE', 'THIRDPARTY', '468', '273', 'Divers - Charges à payer et produits à recevoir',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 279, 'PCG99-BASE', 'THIRDPARTY', '47', '1504', 'Comptes transitoires ou d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 280, 'PCG99-BASE', 'THIRDPARTY', '471', '279', 'Comptes d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 281, 'PCG99-BASE', 'THIRDPARTY', '476', '279', 'Différence de conversion - Actif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 282, 'PCG99-BASE', 'THIRDPARTY', '477', '279', 'Différences de conversion - Passif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 283, 'PCG99-BASE', 'THIRDPARTY', '478', '279', 'Autres comptes transitoires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 284, 'PCG99-BASE', 'THIRDPARTY', '48', '1504', 'Comptes de régularisation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 285, 'PCG99-BASE', 'THIRDPARTY', '481', '284', 'Charges à répartir sur plusieurs exercices', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 286, 'PCG99-BASE', 'THIRDPARTY', '486', '284', 'Charges constatées d''avance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 287, 'PCG99-BASE', 'THIRDPARTY', '487', '284', 'Produits constatés d''avance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 288, 'PCG99-BASE', 'THIRDPARTY', '488', '284',
         'Comptes de répartition périodique des charges et des produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 289, 'PCG99-BASE', 'THIRDPARTY', '489', '284', 'Quotas d''émission alloués par l''Etat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 290, 'PCG99-BASE', 'THIRDPARTY', '49', '1504', 'Provisions pour dépréciation des comptes de tiers',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 291, 'PCG99-BASE', 'THIRDPARTY', '491', '290',
         'Provisions pour dépréciation des comptes de clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 292, 'PCG99-BASE', 'THIRDPARTY', '495', '290',
         'Provisions pour dépréciation des comptes du groupe et des associés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 293, 'PCG99-BASE', 'THIRDPARTY', '496', '290',
         'Provisions pour dépréciation des comptes de débiteurs divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 294, 'PCG99-BASE', 'FINAN', '50', '1505', 'Valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 295, 'PCG99-BASE', 'FINAN', '501', '294', 'Parts dans des entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 296, 'PCG99-BASE', 'FINAN', '502', '294', 'Actions propres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 297, 'PCG99-BASE', 'FINAN', '503', '294', 'Actions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 298, 'PCG99-BASE', 'FINAN', '504', '294', 'Autres titres conférant un droit de propriété', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 299, 'PCG99-BASE', 'FINAN', '505', '294',
         'Obligations et bons émis par la société et rachetés par elle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 300, 'PCG99-BASE', 'FINAN', '506', '294', 'Obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 301, 'PCG99-BASE', 'FINAN', '507', '294', 'Bons du Trésor et bons de caisse à court terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 302, 'PCG99-BASE', 'FINAN', '508', '294',
         'Autres valeurs mobilières de placement et autres créances assimilées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 303, 'PCG99-BASE', 'FINAN', '509', '294',
         'Versements restant à effectuer sur valeurs mobilières de placement non libérées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 304, 'PCG99-BASE', 'FINAN', '51', '1505', 'Banques, établissements financiers et assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 305, 'PCG99-BASE', 'FINAN', '511', '304', 'Valeurs à l''encaissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 306, 'PCG99-BASE', 'FINAN', '512', '304', 'Banques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 307, 'PCG99-BASE', 'FINAN', '514', '304', 'Chèques postaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 308, 'PCG99-BASE', 'FINAN', '515', '304', 'Caisses du Trésor et des établissements publics', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 309, 'PCG99-BASE', 'FINAN', '516', '304', 'Sociétés de bourse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 310, 'PCG99-BASE', 'FINAN', '517', '304', 'Autres organismes financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 311, 'PCG99-BASE', 'FINAN', '518', '304', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 312, 'PCG99-BASE', 'FINAN', '519', '304', 'Concours bancaires courants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 313, 'PCG99-BASE', 'FINAN', '52', '1505', 'Instruments de trésorerie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 314, 'PCG99-BASE', 'FINAN', '53', '1505', 'Caisse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 315, 'PCG99-BASE', 'FINAN', '531', '314', 'Caisse siège social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 316, 'PCG99-BASE', 'FINAN', '532', '314', 'Caisse succursale (ou usine) A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 317, 'PCG99-BASE', 'FINAN', '533', '314', 'Caisse succursale (ou usine) B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 318, 'PCG99-BASE', 'FINAN', '54', '1505', 'Régies d''avance et accréditifs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 319, 'PCG99-BASE', 'FINAN', '58', '1505', 'Virements internes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 320, 'PCG99-BASE', 'FINAN', '59', '1505', 'Provisions pour dépréciation des comptes financiers',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 321, 'PCG99-BASE', 'FINAN', '590', '320',
         'Provisions pour dépréciation des valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 322, 'PCG99-BASE', 'EXPENSE', '60', '1506', 'Achats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 323, 'PCG99-BASE', 'EXPENSE', '601', '322', 'Achats stockés - Matières premières (et fournitures)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 324, 'PCG99-BASE', 'EXPENSE', '602', '322', 'Achats stockés - Autres approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 325, 'PCG99-BASE', 'EXPENSE', '603', '322',
         'Variations des stocks (approvisionnements et marchandises)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 326, 'PCG99-BASE', 'EXPENSE', '604', '322', 'Achats études et prestation de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 327, 'PCG99-BASE', 'EXPENSE', '605', '322', 'Achats de matériel, équipements et travaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 328, 'PCG99-BASE', 'EXPENSE', '606', '322', 'Achats non stockés de matière et fournitures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 329, 'PCG99-BASE', 'EXPENSE', '607', '322', 'Achats de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 330, 'PCG99-BASE', 'EXPENSE', '608', '322',
         '(Compte réservé, le cas échéant, à la récapitulation des frais accessoires incorporés aux achats)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 331, 'PCG99-BASE', 'EXPENSE', '609', '322', 'Rabais, remises et ristournes obtenus sur achats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 332, 'PCG99-BASE', 'EXPENSE', '61', '1506', 'Services extérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 333, 'PCG99-BASE', 'EXPENSE', '611', '332', 'Sous-traitance générale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 334, 'PCG99-BASE', 'EXPENSE', '612', '332', 'Redevances de crédit-bail', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 335, 'PCG99-BASE', 'EXPENSE', '613', '332', 'Locations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 336, 'PCG99-BASE', 'EXPENSE', '614', '332', 'Charges locatives et de copropriété', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 337, 'PCG99-BASE', 'EXPENSE', '615', '332', 'Entretien et réparations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 338, 'PCG99-BASE', 'EXPENSE', '616', '332', 'Primes d''assurances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 339, 'PCG99-BASE', 'EXPENSE', '617', '332', 'Etudes et recherches', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 340, 'PCG99-BASE', 'EXPENSE', '618', '332', 'Divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 341, 'PCG99-BASE', 'EXPENSE', '619', '332',
         'Rabais, remises et ristournes obtenus sur services extérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 342, 'PCG99-BASE', 'EXPENSE', '62', '1506', 'Autres services extérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 343, 'PCG99-BASE', 'EXPENSE', '621', '342', 'Personnel extérieur à l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 344, 'PCG99-BASE', 'EXPENSE', '622', '342', 'Rémunérations d''intermédiaires et honoraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 345, 'PCG99-BASE', 'EXPENSE', '623', '342', 'Publicité, publications, relations publiques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 346, 'PCG99-BASE', 'EXPENSE', '624', '342',
         'Transports de biens et transports collectifs du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 347, 'PCG99-BASE', 'EXPENSE', '625', '342', 'Déplacements, missions et réceptions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 348, 'PCG99-BASE', 'EXPENSE', '626', '342', 'Frais postaux et de télécommunications', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 349, 'PCG99-BASE', 'EXPENSE', '627', '342', 'Services bancaires et assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 350, 'PCG99-BASE', 'EXPENSE', '628', '342', 'Divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 351, 'PCG99-BASE', 'EXPENSE', '629', '342',
         'Rabais, remises et ristournes obtenus sur autres services extérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 352, 'PCG99-BASE', 'EXPENSE', '63', '1506', 'Impôts, taxes et versements assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 353, 'PCG99-BASE', 'EXPENSE', '631', '352',
         'Impôts, taxes et versements assimilés sur rémunérations (administrations des impôts)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 354, 'PCG99-BASE', 'EXPENSE', '633', '352',
         'Impôts, taxes et versements assimilés sur rémunérations (autres organismes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 355, 'PCG99-BASE', 'EXPENSE', '635', '352',
         'Autres impôts, taxes et versements assimilés (administrations des impôts)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 356, 'PCG99-BASE', 'EXPENSE', '637', '352',
         'Autres impôts, taxes et versements assimilés (autres organismes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 357, 'PCG99-BASE', 'EXPENSE', '64', '1506', 'Charges de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 358, 'PCG99-BASE', 'EXPENSE', '641', '357', 'Rémunérations du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 359, 'PCG99-BASE', 'EXPENSE', '644', '357', 'Rémunération du travail de l''exploitant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 360, 'PCG99-BASE', 'EXPENSE', '645', '357', 'Charges de sécurité sociale et de prévoyance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 361, 'PCG99-BASE', 'EXPENSE', '646', '357', 'Cotisations sociales personnelles de l''exploitant',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 362, 'PCG99-BASE', 'EXPENSE', '647', '357', 'Autres charges sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 363, 'PCG99-BASE', 'EXPENSE', '648', '357', 'Autres charges de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 364, 'PCG99-BASE', 'EXPENSE', '65', '1506', 'Autres charges de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 365, 'PCG99-BASE', 'EXPENSE', '651', '364',
         'Redevances pour concessions, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 366, 'PCG99-BASE', 'EXPENSE', '653', '364', 'Jetons de présence', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 367, 'PCG99-BASE', 'EXPENSE', '654', '364', 'Pertes sur créances irrécouvrables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 368, 'PCG99-BASE', 'EXPENSE', '655', '364',
         'Quote-part de résultat sur opérations faites en commun', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 369, 'PCG99-BASE', 'EXPENSE', '658', '364', 'Charges diverses de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 370, 'PCG99-BASE', 'EXPENSE', '66', '1506', 'Charges financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 371, 'PCG99-BASE', 'EXPENSE', '661', '370', 'Charges d''intérêts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 372, 'PCG99-BASE', 'EXPENSE', '664', '370', 'Pertes sur créances liées à des participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 373, 'PCG99-BASE', 'EXPENSE', '665', '370', 'Escomptes accordés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 374, 'PCG99-BASE', 'EXPENSE', '666', '370', 'Pertes de change', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 375, 'PCG99-BASE', 'EXPENSE', '667', '370',
         'Charges nettes sur cessions de valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 376, 'PCG99-BASE', 'EXPENSE', '668', '370', 'Autres charges financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 377, 'PCG99-BASE', 'EXPENSE', '67', '1506', 'Charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 378, 'PCG99-BASE', 'EXPENSE', '671', '377', 'Charges exceptionnelles sur opérations de gestion',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 379, 'PCG99-BASE', 'EXPENSE', '672', '377',
         '(Compte à la disposition des entités pour enregistrer, en cours d''exercice, les charges sur exercices antérieurs)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 380, 'PCG99-BASE', 'EXPENSE', '675', '377', 'Valeurs comptables des éléments d''actif cédés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 381, 'PCG99-BASE', 'EXPENSE', '678', '377', 'Autres charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 382, 'PCG99-BASE', 'EXPENSE', '68', '1506', 'Dotations aux amortissements et aux provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 383, 'PCG99-BASE', 'EXPENSE', '681', '382',
         'Dotations aux amortissements et aux provisions - Charges d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 384, 'PCG99-BASE', 'EXPENSE', '686', '382',
         'Dotations aux amortissements et aux provisions - Charges financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 385, 'PCG99-BASE', 'EXPENSE', '687', '382',
         'Dotations aux amortissements et aux provisions - Charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 386, 'PCG99-BASE', 'EXPENSE', '69', '1506',
         'Participation des salariés - impôts sur les bénéfices et assimiles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 387, 'PCG99-BASE', 'EXPENSE', '691', '386', 'Participation des salariés aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 388, 'PCG99-BASE', 'EXPENSE', '695', '386', 'Impôts sur les bénéfices', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 389, 'PCG99-BASE', 'EXPENSE', '696', '386',
         'Suppléments d''impôt sur les sociétés liés aux distributions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 390, 'PCG99-BASE', 'EXPENSE', '697', '386', 'Imposition forfaitaire annuelle des sociétés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 391, 'PCG99-BASE', 'EXPENSE', '698', '386', 'Intégration fiscale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 392, 'PCG99-BASE', 'EXPENSE', '699', '386', 'Produits - Reports en arrière des déficits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 393, 'PCG99-BASE', 'INCOME', '70', '1507',
         'Ventes de produits fabriqués, prestations de services, marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 394, 'PCG99-BASE', 'INCOME', '701', '393', 'Ventes de produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 395, 'PCG99-BASE', 'INCOME', '702', '393', 'Ventes de produits intermédiaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 396, 'PCG99-BASE', 'INCOME', '703', '393', 'Ventes de produits résiduels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 397, 'PCG99-BASE', 'INCOME', '704', '393', 'Travaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 398, 'PCG99-BASE', 'INCOME', '705', '393', 'Etudes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 399, 'PCG99-BASE', 'INCOME', '706', '393', 'Prestations de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 400, 'PCG99-BASE', 'INCOME', '707', '393', 'Ventes de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 401, 'PCG99-BASE', 'INCOME', '708', '393', 'Produits des activités annexes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 402, 'PCG99-BASE', 'INCOME', '709', '393',
         'Rabais, remises et ristournes accordés par l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 403, 'PCG99-BASE', 'INCOME', '71', '1507', 'Production stockée (ou déstockage)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 404, 'PCG99-BASE', 'INCOME', '713', '403',
         'Variation des stocks (en-cours de production, produits)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 405, 'PCG99-BASE', 'INCOME', '72', '1507', 'Production immobilisée', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 406, 'PCG99-BASE', 'INCOME', '721', '405', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 407, 'PCG99-BASE', 'INCOME', '722', '405', 'Immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 408, 'PCG99-BASE', 'INCOME', '74', '1507', 'Subventions d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 409, 'PCG99-BASE', 'INCOME', '75', '1507', 'Autres produits de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 410, 'PCG99-BASE', 'INCOME', '751', '409',
         'Redevances pour concessions, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 411, 'PCG99-BASE', 'INCOME', '752', '409',
         'Revenus des immeubles non affectés à des activités professionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 412, 'PCG99-BASE', 'INCOME', '753', '409',
         'Jetons de présence et rémunérations d''administrateurs, gérants,...', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 413, 'PCG99-BASE', 'INCOME', '754', '409',
         'Ristournes perçues des coopératives (provenant des excédents)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 414, 'PCG99-BASE', 'INCOME', '755', '409',
         'Quotes-parts de résultat sur opérations faites en commun', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 415, 'PCG99-BASE', 'INCOME', '758', '409', 'Produits divers de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 416, 'PCG99-BASE', 'INCOME', '76', '1507', 'Produits financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 417, 'PCG99-BASE', 'INCOME', '761', '416', 'Produits de participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 418, 'PCG99-BASE', 'INCOME', '762', '416', 'Produits des autres immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 419, 'PCG99-BASE', 'INCOME', '763', '416', 'Revenus des autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 420, 'PCG99-BASE', 'INCOME', '764', '416', 'Revenus des valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 421, 'PCG99-BASE', 'INCOME', '765', '416', 'Escomptes obtenus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 422, 'PCG99-BASE', 'INCOME', '766', '416', 'Gains de change', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 423, 'PCG99-BASE', 'INCOME', '767', '416',
         'Produits nets sur cessions de valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 424, 'PCG99-BASE', 'INCOME', '768', '416', 'Autres produits financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 425, 'PCG99-BASE', 'INCOME', '77', '1507', 'Produits exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 426, 'PCG99-BASE', 'INCOME', '771', '425', 'Produits exceptionnels sur opérations de gestion', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 427, 'PCG99-BASE', 'INCOME', '772', '425',
         '(Compte à la disposition des entités pour enregistrer, en cours d''exercice, les produits sur exercices antérieurs)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 428, 'PCG99-BASE', 'INCOME', '775', '425', 'Produits des cessions d''éléments d''actif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 429, 'PCG99-BASE', 'INCOME', '777', '425',
         'Quote-part des subventions d''investissement virée au résultat de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 430, 'PCG99-BASE', 'INCOME', '778', '425', 'Autres produits exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 431, 'PCG99-BASE', 'INCOME', '78', '1507', 'Reprises sur amortissements et provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 432, 'PCG99-BASE', 'INCOME', '781', '431',
         'Reprises sur amortissements et provisions (à inscrire dans les produits d''exploitation)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 433, 'PCG99-BASE', 'INCOME', '786', '431',
         'Reprises sur provisions pour risques (à inscrire dans les produits financiers)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 434, 'PCG99-BASE', 'INCOME', '787', '431',
         'Reprises sur provisions (à inscrire dans les produits exceptionnels)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 435, 'PCG99-BASE', 'INCOME', '79', '1507', 'Transferts de charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 436, 'PCG99-BASE', 'INCOME', '791', '435', 'Transferts de charges d''exploitation ', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 437, 'PCG99-BASE', 'INCOME', '796', '435', 'Transferts de charges financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 438, 'PCG99-BASE', 'INCOME', '797', '435', 'Transferts de charges exceptionnelles', 1);


-- PCG14-DEV


INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5967, 'PCG14-DEV', 'CAPIT', '1', 0, 'Comptes de capitaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5968, 'PCG14-DEV', 'IMMO', '2', 0, 'Comptes d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5969, 'PCG14-DEV', 'STOCK', '3', 0, 'Comptes de stocks et en-cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5970, 'PCG14-DEV', 'THIRDPARTY', '4', 0, 'Comptes de tiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5971, 'PCG14-DEV', 'FINAN', '5', 0, 'Comptes financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5972, 'PCG14-DEV', 'EXPENSE', '6', 0, 'Comptes de charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5973, 'PCG14-DEV', 'INCOME', '7', 0, 'Comptes de produits', '1');

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5000, 'PCG14-DEV', 'CAPIT', '10', 5967, 'Capital et réserves', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5001, 'PCG14-DEV', 'CAPIT', '101', 5000, 'Capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5002, 'PCG14-DEV', 'CAPIT', '1011', 5001, 'Capital souscrit - non appelé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5003, 'PCG14-DEV', 'CAPIT', '1012', 5001, 'Capital souscrit - appelé, non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5004, 'PCG14-DEV', 'CAPIT', '1013', 5001, 'Capital souscrit - appelé, versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5005, 'PCG14-DEV', 'CAPIT', '10131', 5004, 'Capital non amorti', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5006, 'PCG14-DEV', 'CAPIT', '10132', 5004, 'Capital amorti', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5007, 'PCG14-DEV', 'CAPIT', '1018', 5001,
         'Capital souscrit soumis à des réglementations particulières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5008, 'PCG14-DEV', 'CAPIT', '102', 5000, 'Fonds fiduciaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5009, 'PCG14-DEV', 'CAPIT', '104', 5000, 'Primes liées au capital social', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5010, 'PCG14-DEV', 'CAPIT', '1041', 5009, 'Primes d''émission', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5011, 'PCG14-DEV', 'CAPIT', '1042', 5009, 'Primes de fusion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5012, 'PCG14-DEV', 'CAPIT', '1043', 5009, 'Primes d''apport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5013, 'PCG14-DEV', 'CAPIT', '1044', 5009, 'Primes de conversion d''obligations en actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5014, 'PCG14-DEV', 'CAPIT', '1045', 5009, 'Bons de souscription d''actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5015, 'PCG14-DEV', 'CAPIT', '105', 5000, 'Ecarts de réévaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5016, 'PCG14-DEV', 'CAPIT', '1051', 5015, 'Réserve spéciale de réévaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5017, 'PCG14-DEV', 'CAPIT', '1052', 5015, 'Ecart de réévaluation libre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5018, 'PCG14-DEV', 'CAPIT', '1053', 5015, 'Réserve de réévaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5019, 'PCG14-DEV', 'CAPIT', '1055', 5015, 'Ecarts de réévaluation (autres opérations légales)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5020, 'PCG14-DEV', 'CAPIT', '1057', 5015, 'Autres écarts de réévaluation en France', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5021, 'PCG14-DEV', 'CAPIT', '1058', 5015, 'Autres écarts de réévaluation à l''Etranger', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5022, 'PCG14-DEV', 'CAPIT', '106', 5000, 'Réserves', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5023, 'PCG14-DEV', 'CAPIT', '1061', 5022, 'Réserve légale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5024, 'PCG14-DEV', 'CAPIT', '10611', 5023, 'Réserve légale proprement dite', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5025, 'PCG14-DEV', 'CAPIT', '10612', 5023, 'Plus-values nettes à long terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5026, 'PCG14-DEV', 'CAPIT', '1062', 5022, 'Réserves indisponibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5027, 'PCG14-DEV', 'CAPIT', '1063', 5022, 'Réserves statutaires ou contractuelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5028, 'PCG14-DEV', 'CAPIT', '1064', 5022, 'Réserves réglementées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5029, 'PCG14-DEV', 'CAPIT', '10641', 5028, 'Plus-values nettes à long terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5030, 'PCG14-DEV', 'CAPIT', '10643', 5028,
         'Réserves consécutives à l''octroi de subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5031, 'PCG14-DEV', 'CAPIT', '10648', 5028, 'Autres réserves réglementées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5032, 'PCG14-DEV', 'CAPIT', '1068', 5022, 'Autres réserves', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5033, 'PCG14-DEV', 'CAPIT', '10681', 5032, 'Réserve de propre assureur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5034, 'PCG14-DEV', 'CAPIT', '10688', 5032, 'Réserves diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5035, 'PCG14-DEV', 'CAPIT', '107', 5000, 'Ecart d''équivalence', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5036, 'PCG14-DEV', 'CAPIT', '108', 5000, 'Compte de l''exploitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5037, 'PCG14-DEV', 'CAPIT', '109', 5000, 'Actionnaires : Capital souscrit - non appelé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5038, 'PCG14-DEV', 'CAPIT', '11', 5967, 'Report à nouveau (solde créditeur ou débiteur)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5039, 'PCG14-DEV', 'CAPIT', '110', 5038, 'Report à nouveau (solde créditeur)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5040, 'PCG14-DEV', 'CAPIT', '119', 5038, 'Report à nouveau (solde débiteur)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5041, 'PCG14-DEV', 'CAPIT', '12', 5967, 'Résultat de l''exercice (bénéfice ou perte)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5042, 'PCG14-DEV', 'CAPIT', '120', 5041, 'Résultat de l''exercice (bénéfice)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5043, 'PCG14-DEV', 'CAPIT', '129', 5041, 'Résultat de l''exercice (perte)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5044, 'PCG14-DEV', 'CAPIT', '13', 5967, 'Subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5045, 'PCG14-DEV', 'CAPIT', '131', 5044, 'Subventions d''équipement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5046, 'PCG14-DEV', 'CAPIT', '1311', 5045, 'Etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5047, 'PCG14-DEV', 'CAPIT', '1312', 5045, 'Régions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5048, 'PCG14-DEV', 'CAPIT', '1313', 5045, 'Départements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5049, 'PCG14-DEV', 'CAPIT', '1314', 5045, 'Communes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5050, 'PCG14-DEV', 'CAPIT', '1315', 5045, 'Collectivités publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5051, 'PCG14-DEV', 'CAPIT', '1316', 5045, 'Entreprises publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5052, 'PCG14-DEV', 'CAPIT', '1317', 5045, 'Entreprises et organismes privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5053, 'PCG14-DEV', 'CAPIT', '1318', 5045, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5054, 'PCG14-DEV', 'CAPIT', '138', 5044,
         'Autres subventions d''investissement (même ventilation que celle du compte 131)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5055, 'PCG14-DEV', 'CAPIT', '139', 5044,
         'Subventions d''investissement inscrites au compte de résultat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5056, 'PCG14-DEV', 'CAPIT', '1391', 5055, 'Subventions d''équipement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5057, 'PCG14-DEV', 'CAPIT', '13911', 5056, 'Etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5058, 'PCG14-DEV', 'CAPIT', '13912', 5056, 'Régions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5059, 'PCG14-DEV', 'CAPIT', '13913', 5056, 'Départements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5060, 'PCG14-DEV', 'CAPIT', '13914', 5056, 'Communes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5061, 'PCG14-DEV', 'CAPIT', '13915', 5056, 'Collectivités publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5062, 'PCG14-DEV', 'CAPIT', '13916', 5056, 'Entreprises publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5063, 'PCG14-DEV', 'CAPIT', '13917', 5056, 'Entreprises et organismes privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5064, 'PCG14-DEV', 'CAPIT', '13918', 5056, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5065, 'PCG14-DEV', 'CAPIT', '1398', 5055,
         'Autres subventions d''investissement (même ventilation que celle du compte 1391)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5066, 'PCG14-DEV', 'CAPIT', '14', 5967, 'Provisions réglementées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5067, 'PCG14-DEV', 'CAPIT', '142', 5066, 'Provisions réglementées relatives aux immobilisations',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5068, 'PCG14-DEV', 'CAPIT', '1423', 5067,
         'Provisions pour reconstitution des gisements miniers et pétroliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5069, 'PCG14-DEV', 'CAPIT', '1424', 5067,
         'Provisions pour investissement (participation des salariés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5070, 'PCG14-DEV', 'CAPIT', '143', 5066, 'Provisions réglementées relatives aux stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5071, 'PCG14-DEV', 'CAPIT', '1431', 5070, 'Hausse des prix', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5072, 'PCG14-DEV', 'CAPIT', '1432', 5070, 'Fluctuation des cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5073, 'PCG14-DEV', 'CAPIT', '144', 5066,
         'Provisions réglementées relatives aux autres éléments de l''actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5074, 'PCG14-DEV', 'CAPIT', '145', 5066, 'Amortissements dérogatoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5075, 'PCG14-DEV', 'CAPIT', '146', 5066, 'Provision spéciale de réévaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5076, 'PCG14-DEV', 'CAPIT', '147', 5066, 'Plus-values réinvesties', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5077, 'PCG14-DEV', 'CAPIT', '148', 5066, 'Autres provisions réglementées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5078, 'PCG14-DEV', 'CAPIT', '15', 5967, 'Provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5079, 'PCG14-DEV', 'CAPIT', '151', 5078, 'Provisions pour risques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5080, 'PCG14-DEV', 'CAPIT', '1511', 5079, 'Provisions pour litiges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5081, 'PCG14-DEV', 'CAPIT', '1512', 5079, 'Provisions pour garanties données aux clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5082, 'PCG14-DEV', 'CAPIT', '1513', 5079, 'Provisions pour pertes sur marchés à terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5083, 'PCG14-DEV', 'CAPIT', '1514', 5079, 'Provisions pour amendes et pénalités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5084, 'PCG14-DEV', 'CAPIT', '1515', 5079, 'Provisions pour pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5085, 'PCG14-DEV', 'CAPIT', '1516', 5079, 'Provisions pour pertes sur contrats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5086, 'PCG14-DEV', 'CAPIT', '1518', 5079, 'Autres provisions pour risques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5087, 'PCG14-DEV', 'CAPIT', '153', 5078, 'Provisions pour pensions et obligations similaires',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5088, 'PCG14-DEV', 'CAPIT', '154', 5078, 'Provisions pour restructurations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5089, 'PCG14-DEV', 'CAPIT', '155', 5078, 'Provisions pour impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5090, 'PCG14-DEV', 'CAPIT', '156', 5078,
         'Provisions pour renouvellement des immobilisations (entreprises concessionnaires)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5091, 'PCG14-DEV', 'CAPIT', '157', 5078,
         'Provisions pour charges à répartir sur plusieurs exercices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5092, 'PCG14-DEV', 'CAPIT', '1572', 5091, 'Provisions pour gros entretien ou grandes révisions',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5093, 'PCG14-DEV', 'CAPIT', '158', 5078, 'Autres provisions pour charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5094, 'PCG14-DEV', 'CAPIT', '1581', 5093, 'Provisions pour remises en état', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5095, 'PCG14-DEV', 'CAPIT', '16', 5967, 'Emprunts et dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5096, 'PCG14-DEV', 'CAPIT', '161', 5095, 'Emprunts obligataires convertibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5097, 'PCG14-DEV', 'CAPIT', '162', 5095,
         'Obligations représentatives de passifs nets remis en fiducie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5098, 'PCG14-DEV', 'CAPIT', '163', 5095, 'Autres emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5099, 'PCG14-DEV', 'CAPIT', '164', 5095, 'Emprunts auprès des établissements de crédit', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5100, 'PCG14-DEV', 'CAPIT', '165', 5095, 'Dépôts et cautionnements reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5101, 'PCG14-DEV', 'CAPIT', '1651', 5100, 'Dépôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5102, 'PCG14-DEV', 'CAPIT', '1655', 5100, 'Cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5103, 'PCG14-DEV', 'CAPIT', '166', 5095, 'Participation des salariés aux résultats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5104, 'PCG14-DEV', 'CAPIT', '1661', 5103, 'Comptes bloqués', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5105, 'PCG14-DEV', 'CAPIT', '1662', 5013, 'Fonds de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5106, 'PCG14-DEV', 'CAPIT', '167', 5095, 'Emprunts et dettes assortis de conditions particulières',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5107, 'PCG14-DEV', 'CAPIT', '1671', 5106, 'Emissions de titres participatifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5108, 'PCG14-DEV', 'CAPIT', '1674', 5106, 'Avances conditionnées de l''Etat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5109, 'PCG14-DEV', 'CAPIT', '1675', 5106, 'Emprunts participatifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5110, 'PCG14-DEV', 'CAPIT', '168', 5095, 'Autres emprunts et dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5111, 'PCG14-DEV', 'CAPIT', '1681', 5110, 'Autres emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5112, 'PCG14-DEV', 'CAPIT', '1685', 5110, 'Rentes viagères capitalisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5113, 'PCG14-DEV', 'CAPIT', '1687', 5110, 'Autres dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5114, 'PCG14-DEV', 'CAPIT', '1688', 5110, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5115, 'PCG14-DEV', 'CAPIT', '16881', 5114, 'sur emprunts obligataires convertibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5116, 'PCG14-DEV', 'CAPIT', '16883', 5114, 'sur autres emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5117, 'PCG14-DEV', 'CAPIT', '16684', 5114, 'sur emprunts auprès des établissements de crédit',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5118, 'PCG14-DEV', 'CAPIT', '16885', 5114, 'sur dépôts et cautionnements reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5119, 'PCG14-DEV', 'CAPIT', '16886', 5114, 'sur participation des salariés aux résultats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5120, 'PCG14-DEV', 'CAPIT', '16887', 5114,
         'sur emprunts et dettes assortis de conditions particulières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5121, 'PCG14-DEV', 'CAPIT', '16888', 5114, 'sur autres emprunts et dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5122, 'PCG14-DEV', 'CAPIT', '169', 5095, 'Primes de remboursement des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5123, 'PCG14-DEV', 'CAPIT', '17', 5967, 'Dettes rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5124, 'PCG14-DEV', 'CAPIT', '171', 5123, 'Dettes rattachées à des participations (groupe)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5125, 'PCG14-DEV', 'CAPIT', '174', 5123, 'Dettes rattachées à des participations (hors groupe)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5126, 'PCG14-DEV', 'CAPIT', '178', 5123, 'Dettes rattachées à des sociétés en participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5127, 'PCG14-DEV', 'CAPIT', '1781', 5126, 'Principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5128, 'PCG14-DEV', 'CAPIT', '1788', 5126, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5129, 'PCG14-DEV', 'CAPIT', '18', 5967,
         'Comptes de liaison des établissements et sociétés en participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5130, 'PCG14-DEV', 'CAPIT', '181', 5129, 'Comptes de liaison des établissements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5131, 'PCG14-DEV', 'CAPIT', '186', 5129,
         'Biens et prestations de services échangés entre établissements (charges)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5132, 'PCG14-DEV', 'CAPIT', '187', 5129,
         'Biens et prestations de services échangés entre établissements (produits)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5133, 'PCG14-DEV', 'CAPIT', '188', 5129, 'Comptes de liaison des sociétés en participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5134, 'PCG14-DEV', 'IMMO', '20', 5968, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5135, 'PCG14-DEV', 'IMMO', '201', 5134, 'Frais d''établissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5136, 'PCG14-DEV', 'IMMO', '2011', 5135, 'Frais de constitution', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5137, 'PCG14-DEV', 'IMMO', '2012', 5135, 'Frais de premier établissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5138, 'PCG14-DEV', 'IMMO', '20121', 5137, 'Frais de prospection', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5139, 'PCG14-DEV', 'IMMO', '20122', 5137, 'Frais de publicité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5140, 'PCG14-DEV', 'IMMO', '2013', 5135,
         'Frais d''augmentation de capital et d''opérations diverses (fusions, scissions, transformations)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5141, 'PCG14-DEV', 'IMMO', '203', 5134, 'Frais de recherche et de développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5142, 'PCG14-DEV', 'IMMO', '205', 5134,
         'Concessions et droits similaires, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5143, 'PCG14-DEV', 'IMMO', '206', 5134, 'Droit au bail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5144, 'PCG14-DEV', 'IMMO', '207', 5134, 'Fonds commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5145, 'PCG14-DEV', 'IMMO', '208', 5134, 'Autres immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5146, 'PCG14-DEV', 'IMMO', '21', 5968, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5147, 'PCG14-DEV', 'IMMO', '211', 5146, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5148, 'PCG14-DEV', 'IMMO', '2111', 5147, 'Terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5149, 'PCG14-DEV', 'IMMO', '2112', 5147, 'Terrains aménagés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5150, 'PCG14-DEV', 'IMMO', '2113', 5147, 'Sous - sols et sursols', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5151, 'PCG14-DEV', 'IMMO', '2114', 5147, 'Terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5152, 'PCG14-DEV', 'IMMO', '21141', 5151, 'Carrières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5153, 'PCG14-DEV', 'IMMO', '2115', 5147, 'Terrains bâtis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5154, 'PCG14-DEV', 'IMMO', '21151', 5153, 'Ensembles immobiliers industriels (A, B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5155, 'PCG14-DEV', 'IMMO', '21155', 5153,
         'Ensembles immobiliers administratifs et commerciaux (A, B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5156, 'PCG14-DEV', 'IMMO', '21158', 5153, 'Autres ensembles immobiliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5157, 'PCG14-DEV', 'IMMO', '211581', 5156, 'affectés aux opérations professionnelles (A, B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5158, 'PCG14-DEV', 'IMMO', '211588', 5156, 'affectés aux opérations non professionnelles (A, B)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5159, 'PCG14-DEV', 'IMMO', '2116', 5147, 'Compte d''ordre sur immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5160, 'PCG14-DEV', 'IMMO', '212', 5146,
         'Agencements et aménagements de terrains (même ventilation que celle du compte 211)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5161, 'PCG14-DEV', 'IMMO', '213', 5146, 'Constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5162, 'PCG14-DEV', 'IMMO', '2131', 5161, 'Bâtiments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5163, 'PCG14-DEV', 'IMMO', '21311', 5162, 'Ensembles immobiliers industriels (A, B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5164, 'PCG14-DEV', 'IMMO', '21315', 5162,
         'Ensembles immobiliers administratifs et commerciaux (A, B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5165, 'PCG14-DEV', 'IMMO', '21318', 5162, 'Autres ensembles immobiliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5166, 'PCG14-DEV', 'IMMO', '213181', 5165, 'affectés aux opérations professionnelles (A, B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5167, 'PCG14-DEV', 'IMMO', '213188', 5165, 'affectés aux opérations non professionnelles (A, B)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5168, 'PCG14-DEV', 'IMMO', '2135', 5161,
         'Installations générales - agencements - aménagements des constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5169, 'PCG14-DEV', 'IMMO', '21351', 5168, 'Ensembles immobiliers industriels (A, B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5170, 'PCG14-DEV', 'IMMO', '21355', 5168,
         'Ensembles immobiliers administratifs et commerciaux (A, B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5171, 'PCG14-DEV', 'IMMO', '21358', 5168, 'Autres ensembles immobiliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5172, 'PCG14-DEV', 'IMMO', '213581', 5171, 'affectés aux opérations professionnelles (A, B)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5173, 'PCG14-DEV', 'IMMO', '213588', 5171, 'affectés aux opérations non professionnelles (A, B)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5174, 'PCG14-DEV', 'IMMO', '2138', 5161, 'Ouvrages d''infrastructure', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5175, 'PCG14-DEV', 'IMMO', '21381', 5174, 'Voies de terre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5176, 'PCG14-DEV', 'IMMO', '21382', 5174, 'Voies de fer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5177, 'PCG14-DEV', 'IMMO', '21383', 5174, 'Voies d''eau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5178, 'PCG14-DEV', 'IMMO', '21384', 5174, 'Barrages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5179, 'PCG14-DEV', 'IMMO', '21385', 5174, 'Pistes d''aérodromes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5180, 'PCG14-DEV', 'IMMO', '214', 5146,
         'Constructions sur sol d''autrui (même ventilation que celle du compte 213)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5181, 'PCG14-DEV', 'IMMO', '215', 5146,
         'Installations techniques, matériels et outillage industriels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5182, 'PCG14-DEV', 'IMMO', '2151', 5181, 'Installations complexes spécialisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5183, 'PCG14-DEV', 'IMMO', '21511', 5182, 'sur sol propre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5184, 'PCG14-DEV', 'IMMO', '21514', 5182, 'sur sol d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5185, 'PCG14-DEV', 'IMMO', '2153', 5181, 'Installations à caractère spécifique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5186, 'PCG14-DEV', 'IMMO', '21531', 5185, 'sur sol propre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5187, 'PCG14-DEV', 'IMMO', '21534', 5185, 'sur sol d''autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5188, 'PCG14-DEV', 'IMMO', '2154', 5181, 'Matériel industriel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5189, 'PCG14-DEV', 'IMMO', '2155', 5181, 'Outillage industriel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5190, 'PCG14-DEV', 'IMMO', '2157', 5181,
         'Agencements et aménagements du matériel et outillage industriels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5191, 'PCG14-DEV', 'IMMO', '218', 5146, 'Autres immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5192, 'PCG14-DEV', 'IMMO', '2181', 5191,
         'Installations générales, agencements, aménagements divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5193, 'PCG14-DEV', 'IMMO', '2182', 5191, 'Matériel de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5194, 'PCG14-DEV', 'IMMO', '2183', 5191, 'Matériel de bureau et matériel informatique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5195, 'PCG14-DEV', 'IMMO', '2184', 5191, 'Mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5196, 'PCG14-DEV', 'IMMO', '2185', 5191, 'Cheptel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5197, 'PCG14-DEV', 'IMMO', '2186', 5191, 'Emballages récupérables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5198, 'PCG14-DEV', 'IMMO', '22', 5968, 'Immobilisations mises en concession', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5199, 'PCG14-DEV', 'IMMO', '23', 5968, 'Immobilisations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5200, 'PCG14-DEV', 'IMMO', '231', 5199, 'Immobilisations corporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5201, 'PCG14-DEV', 'IMMO', '2312', 5200, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5202, 'PCG14-DEV', 'IMMO', '2313', 5200, 'Constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5203, 'PCG14-DEV', 'IMMO', '2315', 5200,
         'Installations techniques, matériel et outillage industriels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5204, 'PCG14-DEV', 'IMMO', '2318', 5200, 'Autres immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5205, 'PCG14-DEV', 'IMMO', '232', 5199, 'Immobilisations incorporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5206, 'PCG14-DEV', 'IMMO', '237', 5199,
         'Avances et acomptes versés sur immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5207, 'PCG14-DEV', 'IMMO', '238', 5199,
         'Avances et acomptes versés sur commandes d''immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5208, 'PCG14-DEV', 'IMMO', '2382', 5207, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5209, 'PCG14-DEV', 'IMMO', '2383', 5207, 'Constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5210, 'PCG14-DEV', 'IMMO', '2385', 5207,
         'Installations techniques, matériel et outillage industriels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5211, 'PCG14-DEV', 'IMMO', '2388', 5207, 'Autres immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5212, 'PCG14-DEV', 'IMMO', '25', 5968,
         'Parts dans des entreprises liées et créances sur des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5213, 'PCG14-DEV', 'IMMO', '26', 5968,
         'Participations et créances rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5214, 'PCG14-DEV', 'IMMO', '261', 5213, 'Titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5215, 'PCG14-DEV', 'IMMO', '2611', 5214, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5216, 'PCG14-DEV', 'IMMO', '2618', 5214, 'Autres titres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5217, 'PCG14-DEV', 'IMMO', '266', 5213, 'Autres formes de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5218, 'PCG14-DEV', 'IMMO', '2661', 5217, 'Droits représentatifs d''actifs nets remis en fiducie',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5219, 'PCG14-DEV', 'IMMO', '267', 5213, 'Créances rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5220, 'PCG14-DEV', 'IMMO', '2671', 5219, 'Créances rattachées à des participations (groupe)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5221, 'PCG14-DEV', 'IMMO', '2674', 5219, 'Créances rattachées à des participations (hors groupe)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5222, 'PCG14-DEV', 'IMMO', '2675', 5219,
         'Versements représentatifs d''apports non capitalisés (appel de fonds)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5223, 'PCG14-DEV', 'IMMO', '2676', 5219, 'Avances consolidables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5224, 'PCG14-DEV', 'IMMO', '2677', 5219, 'Autres créances rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5225, 'PCG14-DEV', 'IMMO', '2678', 5219, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5226, 'PCG14-DEV', 'IMMO', '268', 5213, 'Créances rattachées à des sociétés en participation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5227, 'PCG14-DEV', 'IMMO', '2681', 5226, 'Principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5228, 'PCG14-DEV', 'IMMO', '2688', 5226, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5229, 'PCG14-DEV', 'IMMO', '269', 5213,
         'Versements restant à effectuer sur titres de participation non libérés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5230, 'PCG14-DEV', 'IMMO', '27', 5968, 'Autres immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5231, 'PCG14-DEV', 'IMMO', '271', 5230,
         'Titres immobilisés autres que les titres immobilisés de l''activité de portefeuille (droit de propriété)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5232, 'PCG14-DEV', 'IMMO', '2711', 5231, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5233, 'PCG14-DEV', 'IMMO', '2718', 5231, 'Autres titres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5234, 'PCG14-DEV', 'IMMO', '272', 5230, 'Titres immobilisés (droit de créance)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5235, 'PCG14-DEV', 'IMMO', '2721', 5234, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5236, 'PCG14-DEV', 'IMMO', '2722', 5234, 'Bons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5237, 'PCG14-DEV', 'IMMO', '273', 5230, 'Titres immobilisés de l''activité de portefeuille', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5238, 'PCG14-DEV', 'IMMO', '274', 5230, 'Prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5239, 'PCG14-DEV', 'IMMO', '2741', 5238, 'Prêts participatifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5240, 'PCG14-DEV', 'IMMO', '2742', 5238, 'Prêts aux associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5241, 'PCG14-DEV', 'IMMO', '2743', 5238, 'Prêts au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5242, 'PCG14-DEV', 'IMMO', '2748', 5238, 'Autres prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5243, 'PCG14-DEV', 'IMMO', '275', 5230, 'Dépôts et cautionnements versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5244, 'PCG14-DEV', 'IMMO', '2751', 5243, 'Dépôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5245, 'PCG14-DEV', 'IMMO', '2755', 5243, 'Cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5246, 'PCG14-DEV', 'IMMO', '276', 5230, 'Autres créances immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5247, 'PCG14-DEV', 'IMMO', '2761', 5246, 'Créances diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5248, 'PCG14-DEV', 'IMMO', '2768', 5246, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5249, 'PCG14-DEV', 'IMMO', '27682', 5248, 'sur titres immobilisés (droit de créance)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5250, 'PCG14-DEV', 'IMMO', '27684', 5248, 'sur prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5251, 'PCG14-DEV', 'IMMO', '27685', 5248, 'sur dépôts et cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5252, 'PCG14-DEV', 'IMMO', '27688', 5248, 'sur créances diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5253, 'PCG14-DEV', 'IMMO', '277', 5230, '(Actions propres ou parts propres)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5254, 'PCG14-DEV', 'IMMO', '2771', 5253, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5255, 'PCG14-DEV', 'IMMO', '2772', 5253, 'Actions propres ou parts propres en voie d''annulation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5256, 'PCG14-DEV', 'IMMO', '279', 5230,
         'Versements restant à effectuer sur titres immobilisés non libérés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5257, 'PCG14-DEV', 'IMMO', '28', 5968, 'Amortissements des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5258, 'PCG14-DEV', 'IMMO', '280', 5257, 'Amortissements des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5259, 'PCG14-DEV', 'IMMO', '2801', 5258,
         'Frais d''établissement (même ventilation que celle du compte 201)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5260, 'PCG14-DEV', 'IMMO', '2803', 5258, 'Frais de recherche et de développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5261, 'PCG14-DEV', 'IMMO', '2805', 5258,
         'Concessions et droits similaires, brevets, licences, logiciels, droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5262, 'PCG14-DEV', 'IMMO', '2807', 5258, 'Fonds commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5263, 'PCG14-DEV', 'IMMO', '2808', 5258, 'Autres immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5264, 'PCG14-DEV', 'IMMO', '281', 5257, 'Amortissements des immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5265, 'PCG14-DEV', 'IMMO', '2811', 5264, 'Terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5266, 'PCG14-DEV', 'IMMO', '2812', 5264,
         'Agencements, aménagements de terrains (même ventilation que celle du compte 212)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5267, 'PCG14-DEV', 'IMMO', '2813', 5264,
         'Constructions (même ventilation que celle du compte 213)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5268, 'PCG14-DEV', 'IMMO', '2814', 5264,
         'Constructions sur sol d''autrui (même ventilation que celle du compte 214)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5269, 'PCG14-DEV', 'IMMO', '2815', 5264,
         'Installations, matériel et outillage industriels (même ventilation que celle du compte 215)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5270, 'PCG14-DEV', 'IMMO', '2818', 5264,
         'Autres immobilisations corporelles (même ventilation que celle du compte 218)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5271, 'PCG14-DEV', 'IMMO', '282', 5257, 'Amortissements des immobilisations mises en concession',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5272, 'PCG14-DEV', 'IMMO', '29', 5968, 'Dépréciations des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5273, 'PCG14-DEV', 'IMMO', '290', 5272, 'Dépréciations des immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5274, 'PCG14-DEV', 'IMMO', '2905', 5273, 'Marques, procédés, droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5275, 'PCG14-DEV', 'IMMO', '2906', 5273, 'Droit au bail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5276, 'PCG14-DEV', 'IMMO', '2907', 5273, 'Fonds commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5277, 'PCG14-DEV', 'IMMO', '2908', 5273, 'Autres immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5278, 'PCG14-DEV', 'IMMO', '291', 5272,
         'Dépréciations des immobilisations corporelles (même ventilation que celle du compte 21)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5279, 'PCG14-DEV', 'IMMO', '2911', 5278, 'Terrains (autres que terrains de gisement)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5280, 'PCG14-DEV', 'IMMO', '292', 5272, 'Dépréciations des immobilisations mises en concession',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5281, 'PCG14-DEV', 'IMMO', '293', 5272, 'Dépréciations des immobilisations en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5282, 'PCG14-DEV', 'IMMO', '2931', 5281, 'Immobilisations corporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5283, 'PCG14-DEV', 'IMMO', '2932', 5281, 'Immobilisations incorporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5284, 'PCG14-DEV', 'IMMO', '296', 5272,
         'Dépréciations des participations et créances rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5285, 'PCG14-DEV', 'IMMO', '2961', 5284, 'Titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5286, 'PCG14-DEV', 'IMMO', '2966', 5284, 'Autres formes de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5287, 'PCG14-DEV', 'IMMO', '2967', 5284,
         'Créances rattachées à des participations (même ventilation que celle du compte 267)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5288, 'PCG14-DEV', 'IMMO', '2968', 5284,
         'Créances rattachées à des sociétés en participation (même ventilation que celle du compte 268)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5289, 'PCG14-DEV', 'IMMO', '297', 5272, 'Dépréciations des autres immobilisations financières',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5290, 'PCG14-DEV', 'IMMO', '2971', 5289,
         'Titres immobilisés autres que les titres immobilisés de l''activité de portefeuille - droit de propriété (même ventilation que celle du compte 271)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5291, 'PCG14-DEV', 'IMMO', '2972', 5289,
         'Droit de créance (même ventilation que celle du compte 272)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5292, 'PCG14-DEV', 'IMMO', '2973', 5289, 'Titres immobilisés de l''activité de portefeuille', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5293, 'PCG14-DEV', 'IMMO', '2974', 5289, 'Prêts (même ventilation que celle du compte 274)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5294, 'PCG14-DEV', 'IMMO', '2975', 5289,
         'Dépôts et cautionnements versés (même ventilation que celle du compte 275)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5295, 'PCG14-DEV', 'IMMO', '2976', 5289,
         'Autres créances immobilisées (même ventilation que celle du compte 276)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5296, 'PCG14-DEV', 'STOCK', '31', 5969, 'Matières premières (et fournitures)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5297, 'PCG14-DEV', 'STOCK', '311', 5296, 'Matières (ou groupe) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5298, 'PCG14-DEV', 'STOCK', '312', 5296, 'Matières (ou groupe) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5299, 'PCG14-DEV', 'STOCK', '317', 5296, 'Fournitures A, B, C,', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5300, 'PCG14-DEV', 'STOCK', '32', 5969, 'Autres approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5301, 'PCG14-DEV', 'STOCK', '321', 5300, 'Matières consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5302, 'PCG14-DEV', 'STOCK', '3211', 5301, 'Matières (ou groupe) C', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5303, 'PCG14-DEV', 'STOCK', '3212', 5301, 'Matières (ou groupe) d', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5304, 'PCG14-DEV', 'STOCK', '322', 5300, 'Fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5305, 'PCG14-DEV', 'STOCK', '3221', 5304, 'Combustibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5306, 'PCG14-DEV', 'STOCK', '3222', 5304, 'Produits d''entretien', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5307, 'PCG14-DEV', 'STOCK', '3223', 5304, 'Fournitures d''atelier et d''usine', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5308, 'PCG14-DEV', 'STOCK', '3224', 5304, 'Fournitures de magasin', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5309, 'PCG14-DEV', 'STOCK', '3225', 5304, 'Fournitures de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5310, 'PCG14-DEV', 'STOCK', '326', 5300, 'Emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5311, 'PCG14-DEV', 'STOCK', '3261', 5310, 'Emballages perdus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5312, 'PCG14-DEV', 'STOCK', '3265', 5310, 'Emballages récupérables non identifiables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5313, 'PCG14-DEV', 'STOCK', '3267', 5310, 'Emballages à usage mixte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5314, 'PCG14-DEV', 'STOCK', '33', 5969, 'En-cours de production de biens', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5315, 'PCG14-DEV', 'STOCK', '331', 5314, 'Produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5316, 'PCG14-DEV', 'STOCK', '3311', 5315, 'Produits en cours P 1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5317, 'PCG14-DEV', 'STOCK', '3312', 5315, 'Produits en cours P 2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5318, 'PCG14-DEV', 'STOCK', '335', 5314, 'Travaux en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5319, 'PCG14-DEV', 'STOCK', '3351', 5318, 'Travaux en cours T 1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5320, 'PCG14-DEV', 'STOCK', '3552', 5318, 'Travaux en cours T 2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5321, 'PCG14-DEV', 'STOCK', '34', 5969, 'En-cours de production de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5322, 'PCG14-DEV', 'STOCK', '341', 5321, 'Etudes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5323, 'PCG14-DEV', 'STOCK', '3411', 5322, 'Etudes en cours E 1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5324, 'PCG14-DEV', 'STOCK', '3412', 5322, 'Etudes en cours E 2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5325, 'PCG14-DEV', 'STOCK', '345', 5321, 'Prestations de services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5326, 'PCG14-DEV', 'STOCK', '3451', 5325, 'Prestations de services S 1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5327, 'PCG14-DEV', 'STOCK', '3452', 5325, 'Prestations de services S 2', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5328, 'PCG14-DEV', 'STOCK', '35', 5969, 'Stocks de produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5329, 'PCG14-DEV', 'STOCK', '351', 5328, 'Produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5330, 'PCG14-DEV', 'STOCK', '3511', 5329, 'Produits intermédiaires (ou groupe) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5331, 'PCG14-DEV', 'STOCK', '3512', 5329, 'Produits intermédiaires (ou groupe) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5332, 'PCG14-DEV', 'STOCK', '355', 5328, 'Produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5333, 'PCG14-DEV', 'STOCK', '3551', 5333, 'Produits finis (ou groupe) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5334, 'PCG14-DEV', 'STOCK', '3552', 5333, 'Produits finis (ou groupe) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5335, 'PCG14-DEV', 'STOCK', '358', 5328, 'Produits résiduels (ou matières de récupération)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5336, 'PCG14-DEV', 'STOCK', '3581', 5335, 'Déchets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5337, 'PCG14-DEV', 'STOCK', '3585', 5335, 'Rebuts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5338, 'PCG14-DEV', 'STOCK', '3586', 5335, 'Matières de récupération', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5339, 'PCG14-DEV', 'STOCK', '36', 5969,
         '(compte à ouvrir, le cas échéant, sous l''intitulé ''Stocks provenant d''immobilisations'')', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5340, 'PCG14-DEV', 'STOCK', '37', 5969, 'Stocks de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5341, 'PCG14-DEV', 'STOCK', '371', 5341, 'Marchandises (ou groupe) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5342, 'PCG14-DEV', 'STOCK', '372', 5341, 'Marchandises (ou groupe) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5343, 'PCG14-DEV', 'STOCK', '38', 5969,
         '(lorsque l''entité tient un inventaire permanent en comptabilité générale, le compte 38 peut être utilisé pour comptabiliser les stocks en voie d''acheminement, mis en dépôt ou donnés en consignation)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5344, 'PCG14-DEV', 'STOCK', '39', 5969, 'Dépréciations des stocks et en-cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5345, 'PCG14-DEV', 'STOCK', '391', 5344, 'Dépréciations des matières premières (et fournitures)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5346, 'PCG14-DEV', 'STOCK', '3911', 5345, 'Matières (ou groupe) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5347, 'PCG14-DEV', 'STOCK', '3912', 5345, 'Matières (ou groupe) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5348, 'PCG14-DEV', 'STOCK', '3917', 5345, 'Fournitures A, B, C,', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5349, 'PCG14-DEV', 'STOCK', '392', 5344, 'Dépréciations des autres approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5350, 'PCG14-DEV', 'STOCK', '3921', 5349,
         'Matières consommables (même ventilation que celle du compte 321)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5351, 'PCG14-DEV', 'STOCK', '3922', 5349,
         'Fournitures consommables (même ventilation que celle du compte 322)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5352, 'PCG14-DEV', 'STOCK', '3926', 5349, 'Emballages (même ventilation que celle du compte 326)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5353, 'PCG14-DEV', 'STOCK', '393', 5344, 'Dépréciations des en-cours de production de biens', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5354, 'PCG14-DEV', 'STOCK', '3931', 5353,
         'Produits en cours (même ventilation que celle du compte 331)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5355, 'PCG14-DEV', 'STOCK', '3935', 5353,
         'Travaux en cours (même ventilation que celle du compte 335)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5356, 'PCG14-DEV', 'STOCK', '394', 5344, 'Dépréciations des en-cours de production de services',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5357, 'PCG14-DEV', 'STOCK', '3941', 5356,
         'Etudes en cours (même ventilation que celle du compte 341)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5358, 'PCG14-DEV', 'STOCK', '3945', 5356,
         'Prestations de services en cours (même ventilation que celle du compte 345)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5359, 'PCG14-DEV', 'STOCK', '395', 5344, 'Dépréciations des stocks de produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5360, 'PCG14-DEV', 'STOCK', '3951', 5359,
         'Produits intermédiaires (même ventilation que celle du compte 351)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5361, 'PCG14-DEV', 'STOCK', '3955', 5359,
         'Produits finis (même ventilation que celle du compte 355)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5362, 'PCG14-DEV', 'STOCK', '397', 5344, 'Dépréciations des stocks de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5363, 'PCG14-DEV', 'STOCK', '3971', 5362, 'Marchandise (ou groupe) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5364, 'PCG14-DEV', 'STOCK', '3972', 5362, 'Marchandise (ou groupe) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5365, 'PCG14-DEV', 'THIRDPARTY', '40', 5970, 'Fournisseurs et comptes rattachés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5366, 'PCG14-DEV', 'THIRDPARTY', '400', 5365, 'Fournisseurs et comptes rattachés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5367, 'PCG14-DEV', 'THIRDPARTY', '401', 5365, 'Fournisseurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5368, 'PCG14-DEV', 'THIRDPARTY', '4011', 5367,
         'Fournisseurs - Achats de biens et prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5369, 'PCG14-DEV', 'THIRDPARTY', '4017', 5367, 'Fournisseurs - Retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5370, 'PCG14-DEV', 'THIRDPARTY', '403', 5365, 'Fournisseurs - Effets à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5371, 'PCG14-DEV', 'THIRDPARTY', '404', 5365, 'Fournisseurs d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5372, 'PCG14-DEV', 'THIRDPARTY', '4041', 5371, 'Fournisseurs - Achats d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5373, 'PCG14-DEV', 'THIRDPARTY', '4047', 5371,
         'Fournisseurs d''immobilisations - Retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5374, 'PCG14-DEV', 'THIRDPARTY', '405', 5365, 'Fournisseurs d''immobilisations - Effets à payer',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5375, 'PCG14-DEV', 'THIRDPARTY', '408', 5365, 'Fournisseurs - Factures non parvenues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5376, 'PCG14-DEV', 'THIRDPARTY', '4081', 5375, 'Fournisseurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5377, 'PCG14-DEV', 'THIRDPARTY', '4084', 5375, 'Fournisseurs d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5378, 'PCG14-DEV', 'THIRDPARTY', '4088', 5375, 'Fournisseurs - Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5379, 'PCG14-DEV', 'THIRDPARTY', '409', 5365, 'Fournisseurs débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5380, 'PCG14-DEV', 'THIRDPARTY', '4091', 5379,
         'Fournisseurs - Avances et acomptes versés sur commandes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5381, 'PCG14-DEV', 'THIRDPARTY', '4096', 5379,
         'Fournisseurs - Créances pour emballages et matériel à rendre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5382, 'PCG14-DEV', 'THIRDPARTY', '4097', 5379, 'Fournisseurs - Autres avoirs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5383, 'PCG14-DEV', 'THIRDPARTY', '40971', 5382, 'Fournisseurs d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5384, 'PCG14-DEV', 'THIRDPARTY', '40974', 5382, 'Fournisseurs d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5385, 'PCG14-DEV', 'THIRDPARTY', '4098', 5379,
         'Rabais, remises, ristournes à obtenir et autres avoirs non encore reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5386, 'PCG14-DEV', 'THIRDPARTY', '41', 5970, 'Clients et comptes rattachés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5387, 'PCG14-DEV', 'THIRDPARTY', '410', 5386, 'Clients et comptes rattachés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5388, 'PCG14-DEV', 'THIRDPARTY', '411', 5386, 'Clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5389, 'PCG14-DEV', 'THIRDPARTY', '4111', 5388,
         'Clients - Ventes de biens ou de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5390, 'PCG14-DEV', 'THIRDPARTY', '4117', 5388, 'Clients - Retenues de garantie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5391, 'PCG14-DEV', 'THIRDPARTY', '413', 5386, 'Clients - Effets à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5392, 'PCG14-DEV', 'THIRDPARTY', '416', 5386, 'Clients douteux ou litigieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5393, 'PCG14-DEV', 'THIRDPARTY', '418', 5386, 'Clients - Produits non encore facturés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5394, 'PCG14-DEV', 'THIRDPARTY', '4181', 5393, 'Clients - Factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5395, 'PCG14-DEV', 'THIRDPARTY', '4188', 5393, 'Clients - Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5396, 'PCG14-DEV', 'THIRDPARTY', '419', 5386, 'Clients créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5397, 'PCG14-DEV', 'THIRDPARTY', '4191', 5396, 'Clients - Avances et acomptes reçus sur commandes',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5398, 'PCG14-DEV', 'THIRDPARTY', '4196', 5396,
         'Clients - Dettes sur emballages et matériels consignés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5399, 'PCG14-DEV', 'THIRDPARTY', '4197', 5396, 'Clients - Autres avoirs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5400, 'PCG14-DEV', 'THIRDPARTY', '4198', 5396,
         'Rabais, remises, ristournes à accorder et autres avoirs à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5401, 'PCG14-DEV', 'THIRDPARTY', '42', 5970, 'Personnel et comptes rattachés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5402, 'PCG14-DEV', 'THIRDPARTY', '421', 5401, 'Personnel - Rémunérations dues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5403, 'PCG14-DEV', 'THIRDPARTY', '422', 5401, 'Comités d''entreprises, d''établissement, …', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5404, 'PCG14-DEV', 'THIRDPARTY', '424', 5401, 'Participation des salariés aux résultats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5405, 'PCG14-DEV', 'THIRDPARTY', '4246', 5404, 'Réserve spéciale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5406, 'PCG14-DEV', 'THIRDPARTY', '4248', 5404, 'Comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5407, 'PCG14-DEV', 'THIRDPARTY', '425', 5401, 'Personnel - Avances et acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5408, 'PCG14-DEV', 'THIRDPARTY', '426', 5401, 'Personnel - Dépôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5409, 'PCG14-DEV', 'THIRDPARTY', '427', 5401, 'Personnel - Oppositions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5410, 'PCG14-DEV', 'THIRDPARTY', '428', 5401, 'Personnel - Charges à payer et produits à recevoir',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5411, 'PCG14-DEV', 'THIRDPARTY', '4282', 5410, 'Dettes provisionnées pour congés à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5412, 'PCG14-DEV', 'THIRDPARTY', '4284', 5410,
         'Dettes provisionnées pour participation des salariés aux résultats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5413, 'PCG14-DEV', 'THIRDPARTY', '4286', 5410, 'Autres charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5414, 'PCG14-DEV', 'THIRDPARTY', '4287', 5410, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5415, 'PCG14-DEV', 'THIRDPARTY', '43', 5970, 'Sécurité sociale et autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5416, 'PCG14-DEV', 'THIRDPARTY', '431', 5415, 'Sécurité sociale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5417, 'PCG14-DEV', 'THIRDPARTY', '437', 5415, 'Autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5418, 'PCG14-DEV', 'THIRDPARTY', '438', 5415,
         'Organismes sociaux - Charges à payer et produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5419, 'PCG14-DEV', 'THIRDPARTY', '4382', 5418, 'Charges sociales sur congés à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5420, 'PCG14-DEV', 'THIRDPARTY', '4386', 5418, 'Autres charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5421, 'PCG14-DEV', 'THIRDPARTY', '4387', 5418, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5422, 'PCG14-DEV', 'THIRDPARTY', '44', 5970, 'Etat et autres collectivités publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5423, 'PCG14-DEV', 'THIRDPARTY', '441', 5422, 'Etat - Subventions à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5424, 'PCG14-DEV', 'THIRDPARTY', '4411', 5423, 'Subventions d''investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5425, 'PCG14-DEV', 'THIRDPARTY', '4417', 5423, 'Subventions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5426, 'PCG14-DEV', 'THIRDPARTY', '4418', 5423, 'Subventions d''équilibre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5427, 'PCG14-DEV', 'THIRDPARTY', '4419', 5423, 'Avances sur subventions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5428, 'PCG14-DEV', 'THIRDPARTY', '442', 5422, 'Etat - Impôts et taxes recouvrables sur des tiers',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5429, 'PCG14-DEV', 'THIRDPARTY', '4424', 5428, 'Obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5430, 'PCG14-DEV', 'THIRDPARTY', '4425', 5428, 'Associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5431, 'PCG14-DEV', 'THIRDPARTY', '443', 5422,
         'Opérations particulières avec l''Etat les collectivités publiques, les organismes internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5432, 'PCG14-DEV', 'THIRDPARTY', '4431', 5431,
         'Créances sur l''Etat résultant de la suppression de la règle du décalage d''un mois en matière de TVA', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5433, 'PCG14-DEV', 'THIRDPARTY', '4438', 5431, 'Intérêts courus sur créances figurant au 4431',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5434, 'PCG14-DEV', 'THIRDPARTY', '444', 5422, 'Etat - Impôts sur les bénéfices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5435, 'PCG14-DEV', 'THIRDPARTY', '445', 5422, 'Etat - Taxes sur le chiffre d''affaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5436, 'PCG14-DEV', 'THIRDPARTY', '4452', 5435, 'TVA due intracommunautaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5437, 'PCG14-DEV', 'THIRDPARTY', '4455', 5435, 'Taxes sur le chiffre d''affaires à décaisser',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5438, 'PCG14-DEV', 'THIRDPARTY', '44551', 5437, 'TVA à décaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5439, 'PCG14-DEV', 'THIRDPARTY', '44558', 5437, 'Taxes assimilées à la TVA', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5440, 'PCG14-DEV', 'THIRDPARTY', '4456', 5435, 'Taxes sur le chiffre d''affaires déductibles',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5441, 'PCG14-DEV', 'THIRDPARTY', '44562', 5440, 'TVA sur immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5442, 'PCG14-DEV', 'THIRDPARTY', '44563', 5440, 'TVA transférée par d''autres entreprises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5443, 'PCG14-DEV', 'THIRDPARTY', '44566', 5440, 'TVA sur autres biens et services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5444, 'PCG14-DEV', 'THIRDPARTY', '44567', 5440, 'Crédit de TVA à reporter', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5445, 'PCG14-DEV', 'THIRDPARTY', '44568', 5440, 'Taxes assimilées à la TVA', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5446, 'PCG14-DEV', 'THIRDPARTY', '4457', 5435,
         'Taxes sur le chiffre d''affaires collectées par l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5447, 'PCG14-DEV', 'THIRDPARTY', '44571', 5446, 'TVA collectée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5448, 'PCG14-DEV', 'THIRDPARTY', '44578', 5446, 'Taxes assimilées à la TVA', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5449, 'PCG14-DEV', 'THIRDPARTY', '4458', 5435,
         'Taxes sur le chiffre d''affaires à régulariser ou en attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5450, 'PCG14-DEV', 'THIRDPARTY', '44581', 5449, 'Acomptes - Régime simplifié d''imposition', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5451, 'PCG14-DEV', 'THIRDPARTY', '44582', 5449, 'Acomptes - Régime de forfait', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5452, 'PCG14-DEV', 'THIRDPARTY', '44583', 5449,
         'Remboursement de taxes sur le chiffre d''affaires demandé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5453, 'PCG14-DEV', 'THIRDPARTY', '44584', 5449, 'TVA récupérée d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5454, 'PCG14-DEV', 'THIRDPARTY', '44586', 5449,
         'Taxes sur le chiffre d''affaires sur factures non parvenues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5455, 'PCG14-DEV', 'THIRDPARTY', '44587', 5449,
         'Taxes sur le chiffre d''affaires sur factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5456, 'PCG14-DEV', 'THIRDPARTY', '446', 5422, 'Obligations cautionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5457, 'PCG14-DEV', 'THIRDPARTY', '447', 5422, 'Autres impôts, taxes et versements assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5458, 'PCG14-DEV', 'THIRDPARTY', '448', 5422, 'Etat - Charges à payer et produits à recevoir',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5459, 'PCG14-DEV', 'THIRDPARTY', '4482', 5458, 'Charges fiscales sur congés à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5460, 'PCG14-DEV', 'THIRDPARTY', '4486', 5458, 'Charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5461, 'PCG14-DEV', 'THIRDPARTY', '4487', 5458, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5462, 'PCG14-DEV', 'THIRDPARTY', '449', 5422, 'Quotas d''émission à acquérir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5463, 'PCG14-DEV', 'THIRDPARTY', '45', 5970, 'Groupe et associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5464, 'PCG14-DEV', 'THIRDPARTY', '451', 5463, 'Groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5465, 'PCG14-DEV', 'THIRDPARTY', '455', 5463, 'Associés - Comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5466, 'PCG14-DEV', 'THIRDPARTY', '4551', 5465, 'Principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5467, 'PCG14-DEV', 'THIRDPARTY', '4558', 5465, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5468, 'PCG14-DEV', 'THIRDPARTY', '456', 5463, 'Associés - Opérations sur le capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5469, 'PCG14-DEV', 'THIRDPARTY', '4561', 5468, 'Associés - Comptes d''apport en société', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5470, 'PCG14-DEV', 'THIRDPARTY', '45611', 5469, 'Apports en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5471, 'PCG14-DEV', 'THIRDPARTY', '45615', 5469, 'Apports en numéraire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5472, 'PCG14-DEV', 'THIRDPARTY', '4562', 5468, 'Apporteurs - Capital appelé, non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5473, 'PCG14-DEV', 'THIRDPARTY', '45621', 5472,
         'Actionnaires - Capital souscrit et appelé, non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5474, 'PCG14-DEV', 'THIRDPARTY', '45625', 5472, 'Associés - Capital appelé, non versé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5475, 'PCG14-DEV', 'THIRDPARTY', '4563', 5468,
         'Associés - Versements reçus sur augmentation de capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5476, 'PCG14-DEV', 'THIRDPARTY', '4564', 5468, 'Associés - Versements anticipés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5477, 'PCG14-DEV', 'THIRDPARTY', '4566', 5468, 'Actionnaires défaillants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5478, 'PCG14-DEV', 'THIRDPARTY', '4567', 5468, 'Associés - Capital à rembourser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5479, 'PCG14-DEV', 'THIRDPARTY', '457', 5463, 'Associés - Dividendes à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5480, 'PCG14-DEV', 'THIRDPARTY', '458', 5463, 'Associés - Opérations faites en commun et en GIE',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5481, 'PCG14-DEV', 'THIRDPARTY', '4581', 5480, 'Opérations courantes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5482, 'PCG14-DEV', 'THIRDPARTY', '4588', 5480, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5483, 'PCG14-DEV', 'THIRDPARTY', '46', 5970, 'Débiteurs divers et créditeurs divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5484, 'PCG14-DEV', 'THIRDPARTY', '462', 5483, 'Créances sur cessions d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5485, 'PCG14-DEV', 'THIRDPARTY', '464', 5483,
         'Dettes sur acquisitions de valeurs mobilières de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5486, 'PCG14-DEV', 'THIRDPARTY', '465', 5483,
         'Créances sur cessions de valeurs mobilières de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5487, 'PCG14-DEV', 'THIRDPARTY', '467', 5483, 'Autres comptes débiteurs ou créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5488, 'PCG14-DEV', 'THIRDPARTY', '468', 5483, 'Divers - Charges à payer et produits à recevoir',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5489, 'PCG14-DEV', 'THIRDPARTY', '4686', 5488, 'Charges à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5490, 'PCG14-DEV', 'THIRDPARTY', '4687', 5488, 'Produits à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5491, 'PCG14-DEV', 'THIRDPARTY', '47', 5970, 'Comptes transitoires ou d''attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5492, 'PCG14-DEV', 'THIRDPARTY', '471', 5491, 'Comptes d''attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5493, 'PCG14-DEV', 'THIRDPARTY', '472', 5491, 'Comptes d''attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5494, 'PCG14-DEV', 'THIRDPARTY', '473', 5491, 'Comptes d''attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5495, 'PCG14-DEV', 'THIRDPARTY', '474', 5491, 'Comptes d''attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5496, 'PCG14-DEV', 'THIRDPARTY', '475', 5491, 'Comptes d''attente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5497, 'PCG14-DEV', 'THIRDPARTY', '476', 5491, 'Différence de conversion - Actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5498, 'PCG14-DEV', 'THIRDPARTY', '4761', 5497, 'Diminution des créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5499, 'PCG14-DEV', 'THIRDPARTY', '4762', 5497, 'Augmentation des dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5500, 'PCG14-DEV', 'THIRDPARTY', '4768', 5497, 'Différences compensées par couverture de change',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5501, 'PCG14-DEV', 'THIRDPARTY', '477', 5491, 'Différences de conversion - Passif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5502, 'PCG14-DEV', 'THIRDPARTY', '4771', 5501, 'Augmentation des créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5503, 'PCG14-DEV', 'THIRDPARTY', '4772', 5501, 'Diminution des dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5504, 'PCG14-DEV', 'THIRDPARTY', '4778', 5501, 'Différences compensées par couverture de change',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5505, 'PCG14-DEV', 'THIRDPARTY', '478', 5491, 'Autres comptes transitoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5506, 'PCG14-DEV', 'THIRDPARTY', '48', 5970, 'Comptes de régularisation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5507, 'PCG14-DEV', 'THIRDPARTY', '481', 5506, 'Charges à répartir sur plusieurs exercices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5508, 'PCG14-DEV', 'THIRDPARTY', '4816', 5507, 'Frais d''émission des emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5509, 'PCG14-DEV', 'THIRDPARTY', '486', 5506, 'Charges constatées d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5510, 'PCG14-DEV', 'THIRDPARTY', '487', 5506, 'Produits constatés d''avance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5511, 'PCG14-DEV', 'THIRDPARTY', '488', 5506,
         'Comptes de répartition périodique des charges et des produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5512, 'PCG14-DEV', 'THIRDPARTY', '4886', 5511, 'Charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5513, 'PCG14-DEV', 'THIRDPARTY', '4887', 5511, 'Produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5514, 'PCG14-DEV', 'THIRDPARTY', '49', 5970, 'Dépréciations des comptes de tiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5515, 'PCG14-DEV', 'THIRDPARTY', '491', 5514, 'Dépréciations des comptes de clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5516, 'PCG14-DEV', 'THIRDPARTY', '495', 5514,
         'Dépréciations des comptes du groupe et des associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5517, 'PCG14-DEV', 'THIRDPARTY', '4951', 5516, 'Comptes du groupe', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5518, 'PCG14-DEV', 'THIRDPARTY', '4955', 5516, 'Comptes courants des associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5519, 'PCG14-DEV', 'THIRDPARTY', '4958', 5516, 'Opérations faites en commun et en GIE', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5520, 'PCG14-DEV', 'THIRDPARTY', '496', 5514, 'Dépréciations des comptes de débiteurs divers',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5521, 'PCG14-DEV', 'THIRDPARTY', '4962', 5520, 'Créances sur cessions d''immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5522, 'PCG14-DEV', 'THIRDPARTY', '4965', 5520,
         'Créances sur cessions de valeurs mobilières de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5523, 'PCG14-DEV', 'THIRDPARTY', '4967', 5520, 'Autres comptes débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5524, 'PCG14-DEV', 'FINAN', '50', 5524, 'Parts dans des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5526, 'PCG14-DEV', 'FINAN', '502', 5524, 'Actions propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5527, 'PCG14-DEV', 'FINAN', '5021', 5526,
         'Actons destinées à être attribuées aux employés et affectées à des plans déterminés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5528, 'PCG14-DEV', 'FINAN', '5022', 5526,
         'Actons disponibles pour être attribuées aux employés ou pour la régularisation des cours de bourse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5529, 'PCG14-DEV', 'FINAN', '503', 5524, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5530, 'PCG14-DEV', 'FINAN', '5031', 5529, 'Titres cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5531, 'PCG14-DEV', 'FINAN', '5035', 5529, 'Titres non cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5532, 'PCG14-DEV', 'FINAN', '504', 5524, 'Autres titres conférant un droit de propriété', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5533, 'PCG14-DEV', 'FINAN', '505', 5524,
         'Obligations et bons émis par la société et rachetés par elle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5534, 'PCG14-DEV', 'FINAN', '506', 5524, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5535, 'PCG14-DEV', 'FINAN', '5061', 5534, 'Titres cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5536, 'PCG14-DEV', 'FINAN', '5065', 5534, 'Titres non cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5537, 'PCG14-DEV', 'FINAN', '507', 5524, 'Bons du Trésor et bons de caisse à court terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5538, 'PCG14-DEV', 'FINAN', '508', 5524,
         'Autres valeurs mobilières de placement et autres créances assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5539, 'PCG14-DEV', 'FINAN', '5081', 5538, 'Autres valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5540, 'PCG14-DEV', 'FINAN', '5082', 5538, 'Bons de souscription', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5541, 'PCG14-DEV', 'FINAN', '5088', 5538,
         'Intérêts courus sur obligations, bons et valeurs assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5542, 'PCG14-DEV', 'FINAN', '509', 5524,
         'Versements restant à effectuer sur valeurs mobilières de placement non libérées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5543, 'PCG14-DEV', 'FINAN', '51', 5971, 'Banques, établissements financiers et assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5544, 'PCG14-DEV', 'FINAN', '511', 5543, 'Valeurs à l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5545, 'PCG14-DEV', 'FINAN', '5111', 5544, 'Coupons échus à l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5546, 'PCG14-DEV', 'FINAN', '5112', 5544, 'Chèques à encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5547, 'PCG14-DEV', 'FINAN', '5113', 5544, 'Effets à l''encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5548, 'PCG14-DEV', 'FINAN', '5114', 5544, 'Effets à l''escompte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5549, 'PCG14-DEV', 'FINAN', '512', 5543, 'Banques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5550, 'PCG14-DEV', 'FINAN', '5121', 5549, 'Comptes en monnaie nationale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5551, 'PCG14-DEV', 'FINAN', '5124', 5549, 'Comptes en devises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5552, 'PCG14-DEV', 'FINAN', '514', 5543, 'Chèques postaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5553, 'PCG14-DEV', 'FINAN', '515', 5543, 'Caisses du Trésor et des établissements publics', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5554, 'PCG14-DEV', 'FINAN', '516', 5543, 'Sociétés de bourse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5555, 'PCG14-DEV', 'FINAN', '517', 5543, 'Autres organismes financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5556, 'PCG14-DEV', 'FINAN', '518', 5543, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5557, 'PCG14-DEV', 'FINAN', '5181', 5556, 'Intérêts courus à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5558, 'PCG14-DEV', 'FINAN', '5188', 5556, 'Intérêts courus à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5559, 'PCG14-DEV', 'FINAN', '519', 5543, 'Concours bancaires courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5560, 'PCG14-DEV', 'FINAN', '5191', 5559, 'Crédit de mobilisation de créances commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5561, 'PCG14-DEV', 'FINAN', '5193', 5559, 'Mobilisation de créances nées à l''étranger', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5562, 'PCG14-DEV', 'FINAN', '5198', 5559, 'Intérêts courus sur concours bancaires courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5563, 'PCG14-DEV', 'FINAN', '52', 5971, 'Instruments de trésorerie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5564, 'PCG14-DEV', 'FINAN', '53', 5971, 'Caisse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5565, 'PCG14-DEV', 'FINAN', '531', 5564, 'Caisse siège social', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5566, 'PCG14-DEV', 'FINAN', '5311', 5565, 'Caisse en monnaie nationale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5567, 'PCG14-DEV', 'FINAN', '5314', 5565, 'Caisse en devises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5568, 'PCG14-DEV', 'FINAN', '532', 5564, 'Caisse succursale (ou usine) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5569, 'PCG14-DEV', 'FINAN', '533', 5564, 'Caisse succursale (ou usine) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5570, 'PCG14-DEV', 'FINAN', '54', 5971, 'Régies d''avance et accréditifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5571, 'PCG14-DEV', 'FINAN', '58', 5971, 'Virements internes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5572, 'PCG14-DEV', 'FINAN', '59', 5971, 'Dépréciations des comptes financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5573, 'PCG14-DEV', 'FINAN', '590', 5572, 'Dépréciations des valeurs mobilières de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5574, 'PCG14-DEV', 'FINAN', '5903', 5573, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5575, 'PCG14-DEV', 'FINAN', '5904', 5573, 'Autres titres conférant un droit de propriété', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5576, 'PCG14-DEV', 'FINAN', '5906', 5573, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5577, 'PCG14-DEV', 'FINAN', '5908', 5573,
         'Autres valeurs mobilières de placement et créances assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5578, 'PCG14-DEV', 'EXPENSE', '60', 5972, 'Achats (sauf 603)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5579, 'PCG14-DEV', 'EXPENSE', '601', 5578, 'Achats stockés - Matières premières (et fournitures)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5580, 'PCG14-DEV', 'EXPENSE', '6011', 5579, 'Matières (ou groupe) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5581, 'PCG14-DEV', 'EXPENSE', '6012', 5579, 'Matières (ou groupe) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5582, 'PCG14-DEV', 'EXPENSE', '6017', 5579, 'Fournitures A, B, C,', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5583, 'PCG14-DEV', 'EXPENSE', '602', 5578, 'Achats stockés - Autres approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5584, 'PCG14-DEV', 'EXPENSE', '6201', 5583, 'Matières consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5585, 'PCG14-DEV', 'EXPENSE', '60211', 5584, 'Matières (ou groupe) C', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5586, 'PCG14-DEV', 'EXPENSE', '60212', 5584, 'Matières (ou groupe) D', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5587, 'PCG14-DEV', 'EXPENSE', '6022', 5583, 'Fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5588, 'PCG14-DEV', 'EXPENSE', '60221', 5587, 'Combustibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5589, 'PCG14-DEV', 'EXPENSE', '60222', 5587, 'Produits d''entretien', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5590, 'PCG14-DEV', 'EXPENSE', '60223', 5587, 'Fournitures d''atelier et d''usine', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5591, 'PCG14-DEV', 'EXPENSE', '60224', 5587, 'Fournitures de magasin', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5592, 'PCG14-DEV', 'EXPENSE', '60225', 5587, 'Fourniture de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5593, 'PCG14-DEV', 'EXPENSE', '6026', 5583, 'Emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5594, 'PCG14-DEV', 'EXPENSE', '60261', 5593, 'Emballages perdus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5595, 'PCG14-DEV', 'EXPENSE', '60265', 5593, 'Emballages récupérables non identifiables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5596, 'PCG14-DEV', 'EXPENSE', '60267', 5593, 'Emballages à usage mixte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5597, 'PCG14-DEV', 'EXPENSE', '604', 5578, 'Achats d''études et prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5598, 'PCG14-DEV', 'EXPENSE', '605', 5578, 'Achats de matériel, équipements et travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5599, 'PCG14-DEV', 'EXPENSE', '606', 5578, 'Achats non stockés de matière et fournitures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5600, 'PCG14-DEV', 'EXPENSE', '6061', 5599, 'Fournitures non stockables (eau, énergie, …)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5601, 'PCG14-DEV', 'EXPENSE', '6063', 5599, 'Fournitures d''entretien et de petit équipement',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5602, 'PCG14-DEV', 'EXPENSE', '6064', 5599, 'Fournitures administratives', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5603, 'PCG14-DEV', 'EXPENSE', '6068', 5599, 'Autres matières et fournitures', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5604, 'PCG14-DEV', 'EXPENSE', '607', 5578, 'Achats de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5605, 'PCG14-DEV', 'EXPENSE', '6071', 5605, 'Marchandise (ou groupe) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5606, 'PCG14-DEV', 'EXPENSE', '6072', 5605, 'Marchandise (ou groupe) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5607, 'PCG14-DEV', 'EXPENSE', '608', 5578,
         '(Compte réservé, le cas échéant, à la récapitulation des frais accessoires incorporés aux achats)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5608, 'PCG14-DEV', 'EXPENSE', '609', 5578, 'Rabais, remises et ristournes obtenus sur achats',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5609, 'PCG14-DEV', 'EXPENSE', '6091', 5608, 'de matières premières (et fournitures)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5610, 'PCG14-DEV', 'EXPENSE', '6092', 5608, 'd''autres approvisionnements stockés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5611, 'PCG14-DEV', 'EXPENSE', '6094', 5608, 'd''études et prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5612, 'PCG14-DEV', 'EXPENSE', '6095', 5608, 'de matériel, équipements et travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5613, 'PCG14-DEV', 'EXPENSE', '6096', 5608, 'd''approvisionnements non stockés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5614, 'PCG14-DEV', 'EXPENSE', '6097', 5608, 'de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5615, 'PCG14-DEV', 'EXPENSE', '6098', 5608, 'Rabais, remises et ristournes non affectés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5616, 'PCG14-DEV', 'EXPENSE', '603', 5578,
         'Variations des stocks (approvisionnements et marchandises)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5617, 'PCG14-DEV', 'EXPENSE', '6031', 5616,
         'Variation des stocks de matières premières (et fournitures)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5618, 'PCG14-DEV', 'EXPENSE', '6032', 5616, 'Variation des stocks des autres approvisionnements',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5619, 'PCG14-DEV', 'EXPENSE', '6037', 5616, 'Variation des stocks de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5620, 'PCG14-DEV', 'EXPENSE', '61', 5972, 'Services extérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5621, 'PCG14-DEV', 'EXPENSE', '611', 5620, 'Sous-traitance générale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5622, 'PCG14-DEV', 'EXPENSE', '612', 5620, 'Redevances de crédit-bail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5623, 'PCG14-DEV', 'EXPENSE', '6122', 5622, 'Crédit-bail mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5624, 'PCG14-DEV', 'EXPENSE', '6125', 5622, 'Crédit-bail immobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5625, 'PCG14-DEV', 'EXPENSE', '613', 5620, 'Locations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5626, 'PCG14-DEV', 'EXPENSE', '6132', 5625, 'Locations immobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5627, 'PCG14-DEV', 'EXPENSE', '6135', 5625, 'Locations mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5628, 'PCG14-DEV', 'EXPENSE', '6136', 5625, 'Malis sur emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5629, 'PCG14-DEV', 'EXPENSE', '614', 5620, 'Charges locatives et de copropriété', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5630, 'PCG14-DEV', 'EXPENSE', '615', 5620, 'Entretien et réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5631, 'PCG14-DEV', 'EXPENSE', '6152', 5630, 'sur biens immobiliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5632, 'PCG14-DEV', 'EXPENSE', '6155', 5630, 'sur biens mobiliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5633, 'PCG14-DEV', 'EXPENSE', '6156', 5630, 'Maintenance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5634, 'PCG14-DEV', 'EXPENSE', '616', 5620, 'Primes d''assurances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5635, 'PCG14-DEV', 'EXPENSE', '6161', 5634, 'Multirisques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5636, 'PCG14-DEV', 'EXPENSE', '6162', 5634, 'Assurance obligatoire dommage construction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5637, 'PCG14-DEV', 'EXPENSE', '6163', 5634, 'Assurance - transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5638, 'PCG14-DEV', 'EXPENSE', '61636', 5637, 'sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5639, 'PCG14-DEV', 'EXPENSE', '61637', 5637, 'sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5640, 'PCG14-DEV', 'EXPENSE', '61638', 5637, 'sur autres biens', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5641, 'PCG14-DEV', 'EXPENSE', '6164', 5634, 'Risques d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5642, 'PCG14-DEV', 'EXPENSE', '6165', 5634, 'Insolvabilité clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5643, 'PCG14-DEV', 'EXPENSE', '617', 5620, 'Etudes et recherches', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5644, 'PCG14-DEV', 'EXPENSE', '618', 5620, 'Divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5645, 'PCG14-DEV', 'EXPENSE', '6181', 5644, 'Documentation générale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5646, 'PCG14-DEV', 'EXPENSE', '6183', 5644, 'Documentation technique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5647, 'PCG14-DEV', 'EXPENSE', '6185', 5644, 'Frais de colloques, séminaires, conférences', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5648, 'PCG14-DEV', 'EXPENSE', '619', 5620,
         'Rabais, remises et ristournes obtenus sur services extérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5649, 'PCG14-DEV', 'EXPENSE', '62', 5972, 'Autres services extérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5650, 'PCG14-DEV', 'EXPENSE', '621', 5649, 'Personnel extérieur à l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5651, 'PCG14-DEV', 'EXPENSE', '6211', 5650, 'Personnel intérimaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5652, 'PCG14-DEV', 'EXPENSE', '6214', 5650, 'Personnel détaché ou prêté à l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5653, 'PCG14-DEV', 'EXPENSE', '622', 5649, 'Rémunérations d''intermédiaires et honoraires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5654, 'PCG14-DEV', 'EXPENSE', '6221', 5653, 'Commissions et courtages sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5655, 'PCG14-DEV', 'EXPENSE', '6222', 5653, 'Commissions et courtages sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5656, 'PCG14-DEV', 'EXPENSE', '6224', 5653, 'Rémunérations des transitaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5657, 'PCG14-DEV', 'EXPENSE', '6225', 5653, 'Rémunérations d''affacturage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5658, 'PCG14-DEV', 'EXPENSE', '6226', 5653, 'Honoraires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5659, 'PCG14-DEV', 'EXPENSE', '6227', 5653, 'Frais d''actes et de contentieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5660, 'PCG14-DEV', 'EXPENSE', '6228', 5653, 'Divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5661, 'PCG14-DEV', 'EXPENSE', '623', 5649, 'Publicité, publications, relations publiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5662, 'PCG14-DEV', 'EXPENSE', '6231', 5661, 'Annonces et insertions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5663, 'PCG14-DEV', 'EXPENSE', '6232', 5661, 'Echantillons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5664, 'PCG14-DEV', 'EXPENSE', '6233', 5661, 'Foires et expositions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5665, 'PCG14-DEV', 'EXPENSE', '6234', 5661, 'Cadeaux à la clientèle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5666, 'PCG14-DEV', 'EXPENSE', '6235', 5661, 'Primes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5667, 'PCG14-DEV', 'EXPENSE', '6236', 5661, 'Catalogues et imprimés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5668, 'PCG14-DEV', 'EXPENSE', '6237', 5661, 'Publications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5669, 'PCG14-DEV', 'EXPENSE', '6238', 5661, 'Divers (pourboires, dons courants, …)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5670, 'PCG14-DEV', 'EXPENSE', '624', 5649,
         'Transports de biens et transports collectifs du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5671, 'PCG14-DEV', 'EXPENSE', '6241', 5670, 'Transports sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5672, 'PCG14-DEV', 'EXPENSE', '6242', 5670, 'Transports sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5673, 'PCG14-DEV', 'EXPENSE', '6243', 5670, 'Transports entre établissements ou chantiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5674, 'PCG14-DEV', 'EXPENSE', '6244', 5670, 'Transports administratifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5675, 'PCG14-DEV', 'EXPENSE', '6247', 5670, 'Transports collectifs du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5676, 'PCG14-DEV', 'EXPENSE', '6248', 5670, 'Divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5677, 'PCG14-DEV', 'EXPENSE', '625', 5649, 'Déplacements, missions et réceptions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5678, 'PCG14-DEV', 'EXPENSE', '6251', 5677, 'Voyages et déplacements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5679, 'PCG14-DEV', 'EXPENSE', '6255', 5677, 'Frais de déménagement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5680, 'PCG14-DEV', 'EXPENSE', '6256', 5677, 'Missions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5681, 'PCG14-DEV', 'EXPENSE', '6257', 5677, 'Réceptions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5682, 'PCG14-DEV', 'EXPENSE', '626', 5649, 'Frais postaux et de télécommunications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5683, 'PCG14-DEV', 'EXPENSE', '627', 5649, 'Services bancaires et assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5684, 'PCG14-DEV', 'EXPENSE', '6271', 5683, 'Frais sur titres (achat, vente, garde)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5685, 'PCG14-DEV', 'EXPENSE', '6272', 5683, 'Commissions et frais sur émission d''emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5686, 'PCG14-DEV', 'EXPENSE', '6275', 5683, 'Frais sur effets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5687, 'PCG14-DEV', 'EXPENSE', '6276', 5683, 'Location de coffres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5688, 'PCG14-DEV', 'EXPENSE', '6278', 5683,
         'Autres frais et commissions sur prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5689, 'PCG14-DEV', 'EXPENSE', '628', 5649, 'Divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5690, 'PCG14-DEV', 'EXPENSE', '6281', 5689, 'Concours divers (cotisations,)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5691, 'PCG14-DEV', 'EXPENSE', '6284', 5689, 'Frais de recrutement de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5692, 'PCG14-DEV', 'EXPENSE', '629', 5649,
         'Rabais, remises et ristournes obtenus sur autres services extérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5693, 'PCG14-DEV', 'EXPENSE', '63', 5972, 'Impôts, taxes et versements assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5694, 'PCG14-DEV', 'EXPENSE', '631', 5693,
         'Impôts, taxes et versements assimilés sur rémunérations (administrations des impôts)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5695, 'PCG14-DEV', 'EXPENSE', '6311', 5694, 'Taxe sur les salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5696, 'PCG14-DEV', 'EXPENSE', '6312', 5694, 'Taxe d''apprentissage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5697, 'PCG14-DEV', 'EXPENSE', '6313', 5694,
         'Participation des employeurs à la formation professionnelle continue', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5698, 'PCG14-DEV', 'EXPENSE', '6314', 5694,
         'Cotisation pour défaut d''investissement obligatoire dans la construction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5699, 'PCG14-DEV', 'EXPENSE', '6318', 5694, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5700, 'PCG14-DEV', 'EXPENSE', '633', 5693,
         'Impôts, taxes et versements assimilés sur rémunérations (autres organismes)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5701, 'PCG14-DEV', 'EXPENSE', '6331', 5700, 'Versement de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5702, 'PCG14-DEV', 'EXPENSE', '6332', 5700, 'Allocations logement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5703, 'PCG14-DEV', 'EXPENSE', '6333', 5700,
         'Participation des employeurs à la formation professionnelle continue', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5704, 'PCG14-DEV', 'EXPENSE', '6334', 5700,
         'Participation des employeurs à l''effort de construction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5705, 'PCG14-DEV', 'EXPENSE', '6335', 5700,
         'Versements libératoires ouvrant droit à l''exonération de la taxe d''apprentissage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5706, 'PCG14-DEV', 'EXPENSE', '6338', 5700, 'Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5707, 'PCG14-DEV', 'EXPENSE', '635', 5693,
         'Autres impôts, taxes et versements assimilés (administrations des impôts)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5708, 'PCG14-DEV', 'EXPENSE', '6351', 5707, 'Impôts directs (sauf impôts sur les bénéfices)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5709, 'PCG14-DEV', 'EXPENSE', '63511', 5708, 'Contribution économique territoriale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5710, 'PCG14-DEV', 'EXPENSE', '63512', 5708, 'Taxes foncières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5711, 'PCG14-DEV', 'EXPENSE', '63513', 5708, 'Autres impôts locaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5712, 'PCG14-DEV', 'EXPENSE', '63514', 5708, 'Taxe sur les véhicules des sociétés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5713, 'PCG14-DEV', 'EXPENSE', '6352', 5707, 'Taxe sur le chiffre d''affaires non récupérables',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5714, 'PCG14-DEV', 'EXPENSE', '6353', 5707, 'Impôts indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5715, 'PCG14-DEV', 'EXPENSE', '6354', 5707, 'Droits d''enregistrement et de timbre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5716, 'PCG14-DEV', 'EXPENSE', '63541', 5715, 'Droits de mutation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5717, 'PCG14-DEV', 'EXPENSE', '6358', 5707, 'Autres droits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5718, 'PCG14-DEV', 'EXPENSE', '637', 5693,
         'Autres impôts, taxes et versements assimilés (autres organismes)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5719, 'PCG14-DEV', 'EXPENSE', '6371', 5718,
         'Contribution sociale de solidarité à la charge des sociétés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5720, 'PCG14-DEV', 'EXPENSE', '6372', 5718,
         'Taxes perçues par les organismes publics internationaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5721, 'PCG14-DEV', 'EXPENSE', '6374', 5718, 'Impôts et taxes exigibles à l''Etranger', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5722, 'PCG14-DEV', 'EXPENSE', '6378', 5718, 'Taxes diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5723, 'PCG14-DEV', 'EXPENSE', '64', 5972, 'Charges de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5724, 'PCG14-DEV', 'EXPENSE', '641', 5723, 'Rémunérations du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5725, 'PCG14-DEV', 'EXPENSE', '6411', 5724, 'Salaires, appointements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5726, 'PCG14-DEV', 'EXPENSE', '6412', 5724, 'Congés payés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5727, 'PCG14-DEV', 'EXPENSE', '6413', 5724, 'Primes et gratifications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5728, 'PCG14-DEV', 'EXPENSE', '6414', 5724, 'Indemnités et avantages divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5729, 'PCG14-DEV', 'EXPENSE', '6415', 5724, 'Supplément familial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5730, 'PCG14-DEV', 'EXPENSE', '644', 5723, 'Rémunération du travail de l''exploitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5731, 'PCG14-DEV', 'EXPENSE', '645', 5723, 'Charges de sécurité sociale et de prévoyance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5732, 'PCG14-DEV', 'EXPENSE', '6451', 5731, 'Cotisations à l''URSSAF', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5733, 'PCG14-DEV', 'EXPENSE', '6452', 5731, 'Cotisations aux mutuelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5734, 'PCG14-DEV', 'EXPENSE', '6453', 5731, 'Cotisations aux caisses de retraites', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5735, 'PCG14-DEV', 'EXPENSE', '6454', 5731, 'Cotisations aux ASSEDIC', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5736, 'PCG14-DEV', 'EXPENSE', '6458', 5731, 'Cotisations aux autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5737, 'PCG14-DEV', 'EXPENSE', '646', 5723, 'Cotisations sociales personnelles de l''exploitant',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5738, 'PCG14-DEV', 'EXPENSE', '647', 5723, 'Autres charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5739, 'PCG14-DEV', 'EXPENSE', '6471', 5738, 'Prestations directes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5740, 'PCG14-DEV', 'EXPENSE', '6472', 5738,
         'Versements aux comités d''entreprise et d''établissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5741, 'PCG14-DEV', 'EXPENSE', '6473', 5738, 'Versements aux comités d''hygiène et de sécurité',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5742, 'PCG14-DEV', 'EXPENSE', '6474', 5738, 'Versements aux autres œuvres sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5743, 'PCG14-DEV', 'EXPENSE', '6475', 5738, 'Médecine du travail, pharmacie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5744, 'PCG14-DEV', 'EXPENSE', '648', 5723, 'Autres charges de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5745, 'PCG14-DEV', 'EXPENSE', '65', 5972, 'Autres charges de gestion courante', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5746, 'PCG14-DEV', 'EXPENSE', '651', 5745,
         'Redevances pour concessions, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5747, 'PCG14-DEV', 'EXPENSE', '6511', 5746,
         'Redevances pour concessions, brevets, licences, marques, procédés, logiciels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5748, 'PCG14-DEV', 'EXPENSE', '6516', 5746, 'Droits d''auteur et de reproduction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5749, 'PCG14-DEV', 'EXPENSE', '6518', 5746, 'Autres droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5750, 'PCG14-DEV', 'EXPENSE', '653', 5745, 'Jetons de présence', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5751, 'PCG14-DEV', 'EXPENSE', '654', 5745, 'Pertes sur créances irrécouvrables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5752, 'PCG14-DEV', 'EXPENSE', '6541', 5751, 'Créances de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5753, 'PCG14-DEV', 'EXPENSE', '6544', 5751, 'Créances des exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5754, 'PCG14-DEV', 'EXPENSE', '655', 5745,
         'Quote-part de résultat sur opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5755, 'PCG14-DEV', 'EXPENSE', '6551', 5754,
         'Quote-part de bénéfice transférée (comptabilité du gérant)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5756, 'PCG14-DEV', 'EXPENSE', '6555', 5754,
         'Quote-part de perte supportée (comptabilité des associés non gérants)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5757, 'PCG14-DEV', 'EXPENSE', '658', 5745, 'Charges diverses de gestion courante', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5758, 'PCG14-DEV', 'EXPENSE', '66', 5972, 'Charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5759, 'PCG14-DEV', 'EXPENSE', '661', 5758, 'Charges d''intérêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5760, 'PCG14-DEV', 'EXPENSE', '6611', 5759, 'Intérêts des emprunts et dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5761, 'PCG14-DEV', 'EXPENSE', '66116', 5760, 'des emprunts et dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5762, 'PCG14-DEV', 'EXPENSE', '66117', 5760, 'des dettes rattachées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5763, 'PCG14-DEV', 'EXPENSE', '6612', 5759, 'Charges de la fiducie, résultat de la période', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5764, 'PCG14-DEV', 'EXPENSE', '6615', 5759,
         'Intérêts des comptes courants et des dépôts créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5765, 'PCG14-DEV', 'EXPENSE', '6616', 5759,
         'Intérêts bancaires et sur opérations de financement (escompte,…)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5766, 'PCG14-DEV', 'EXPENSE', '6617', 5759, 'Intérêts des obligations cautionnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5767, 'PCG14-DEV', 'EXPENSE', '6618', 5759, 'Intérêts des autres dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5768, 'PCG14-DEV', 'EXPENSE', '66181', 5767, 'des dettes commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5769, 'PCG14-DEV', 'EXPENSE', '66188', 5767, 'des dettes diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5770, 'PCG14-DEV', 'EXPENSE', '664', 5758, 'Pertes sur créances liées à des participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5771, 'PCG14-DEV', 'EXPENSE', '665', 5758, 'Escomptes accordés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5772, 'PCG14-DEV', 'EXPENSE', '666', 5758, 'Pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5773, 'PCG14-DEV', 'EXPENSE', '667', 5758,
         'Charges nettes sur cessions de valeurs mobilières de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5774, 'PCG14-DEV', 'EXPENSE', '668', 5758, 'Autres charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5775, 'PCG14-DEV', 'EXPENSE', '67', 5972, 'Charges exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5776, 'PCG14-DEV', 'EXPENSE', '671', 5775, 'Charges exceptionnelles sur opérations de gestion',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5777, 'PCG14-DEV', 'EXPENSE', '6711', 5776,
         'Pénalités sur marchés (et dédits payés sur achats et ventes)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5778, 'PCG14-DEV', 'EXPENSE', '6712', 5776, 'Pénalités, amendes fiscales et pénales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5779, 'PCG14-DEV', 'EXPENSE', '6713', 5776, 'Dons, libéralités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5780, 'PCG14-DEV', 'EXPENSE', '6714', 5776, 'Créances devenues irrécouvrables dans l''exercice',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5781, 'PCG14-DEV', 'EXPENSE', '6715', 5776, 'Subventions accordées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5782, 'PCG14-DEV', 'EXPENSE', '6717', 5776,
         'Rappel d''impôts (autres qu''impôts sur les bénéfices)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5783, 'PCG14-DEV', 'EXPENSE', '6718', 5776,
         'Autres charges exceptionnelles sur opérations de gestion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5784, 'PCG14-DEV', 'EXPENSE', '672', 5775,
         '(Compte à la disposition des entités pour enregistrer, en cours d''exercice, les charges sur exercices antérieurs)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5785, 'PCG14-DEV', 'EXPENSE', '674', 5775,
         'Opérations de constitution ou liquidation des fiducies', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5786, 'PCG14-DEV', 'EXPENSE', '6741', 5785,
         'Opérations liées à la constitution de fiducie - Transfert des éléments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5787, 'PCG14-DEV', 'EXPENSE', '6742', 5785, 'Opérations liées à la liquidation de la fiducie',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5788, 'PCG14-DEV', 'EXPENSE', '675', 5775, 'Valeurs comptables des éléments d''actif cédés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5789, 'PCG14-DEV', 'EXPENSE', '6751', 5788, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5790, 'PCG14-DEV', 'EXPENSE', '6752', 5788, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5791, 'PCG14-DEV', 'EXPENSE', '6756', 5788, 'Immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5792, 'PCG14-DEV', 'EXPENSE', '6758', 5788, 'Autres éléments d''actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5793, 'PCG14-DEV', 'EXPENSE', '678', 5775, 'Autres charges exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5794, 'PCG14-DEV', 'EXPENSE', '6781', 5793, 'Malis provenant de clauses d''indexation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5795, 'PCG14-DEV', 'EXPENSE', '6782', 5793, 'Lots', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5796, 'PCG14-DEV', 'EXPENSE', '6783', 5793,
         'Malis provenant du rachat par l''entreprise d''actions et obligations émises par elle-même', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5797, 'PCG14-DEV', 'EXPENSE', '6788', 5793, 'Charges exceptionnelles diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5798, 'PCG14-DEV', 'EXPENSE', '68', 5972,
         'Dotations aux amortissements, aux dépréciations et aux provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5799, 'PCG14-DEV', 'EXPENSE', '681', 5798,
         'Dotations aux amortissements, aux dépréciations et aux provisions - Charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5800, 'PCG14-DEV', 'EXPENSE', '6811', 5799,
         'Dotations aux amortissements sur immobilisations incorporelles et corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5801, 'PCG14-DEV', 'EXPENSE', '68111', 5800, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5802, 'PCG14-DEV', 'EXPENSE', '68112', 5800, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5803, 'PCG14-DEV', 'EXPENSE', '6812', 5799,
         'Dotations aux amortissements des charges d''exploitation à répartir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5804, 'PCG14-DEV', 'EXPENSE', '6815', 5799, 'Dotations aux provisions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5805, 'PCG14-DEV', 'EXPENSE', '6816', 5799,
         'Dotations pour dépréciations des immobilisations incorporelles et corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5806, 'PCG14-DEV', 'EXPENSE', '68161', 5805, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5807, 'PCG14-DEV', 'EXPENSE', '68162', 5805, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5808, 'PCG14-DEV', 'EXPENSE', '6817', 5799, 'Dotations pour dépréciations des actifs circulants',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5809, 'PCG14-DEV', 'EXPENSE', '68173', 5808, 'Stocks et en-cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5810, 'PCG14-DEV', 'EXPENSE', '68174', 5808, 'Créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5811, 'PCG14-DEV', 'EXPENSE', '686', 5798,
         'Dotations aux amortissements, aux dépréciations et aux provisions - Charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5812, 'PCG14-DEV', 'EXPENSE', '6861', 5811,
         'Dotations aux amortissements des primes de remboursement des obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5813, 'PCG14-DEV', 'EXPENSE', '6865', 5811, 'Dotations aux provisions financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5814, 'PCG14-DEV', 'EXPENSE', '6866', 5811, 'Dotations pour dépréciations des éléments financiers',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5815, 'PCG14-DEV', 'EXPENSE', '68662', 5814, 'Immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5816, 'PCG14-DEV', 'EXPENSE', '68665', 5814, 'Valeurs mobilières de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5817, 'PCG14-DEV', 'EXPENSE', '6868', 5811, 'Autres dotations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5818, 'PCG14-DEV', 'EXPENSE', '687', 5798,
         'Dotations aux amortissements, aux dépréciations et aux provisions - Charges exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5819, 'PCG14-DEV', 'EXPENSE', '6871', 5818,
         'Dotations aux amortissements exceptionnels des immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5820, 'PCG14-DEV', 'EXPENSE', '6872', 5818,
         'Dotations aux provisions réglementées (immobilisations)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5821, 'PCG14-DEV', 'EXPENSE', '68725', 5820, 'Amortissements dérogatoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5822, 'PCG14-DEV', 'EXPENSE', '6873', 5818, 'Dotations aux provisions réglementées (stocks)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5823, 'PCG14-DEV', 'EXPENSE', '6874', 5818, 'Dotations aux autres provisions réglementées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5824, 'PCG14-DEV', 'EXPENSE', '6875', 5818, 'Dotations aux provisions exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5825, 'PCG14-DEV', 'EXPENSE', '6876', 5818, 'Dotations pour dépréciations exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5826, 'PCG14-DEV', 'EXPENSE', '69', 5972,
         'Participation des salariés - Impôts sur les bénéfices et assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5827, 'PCG14-DEV', 'EXPENSE', '691', 5826, 'Participation des salariés aux résultats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5828, 'PCG14-DEV', 'EXPENSE', '695', 5826, 'Impôts sur les bénéfices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5829, 'PCG14-DEV', 'EXPENSE', '6951', 5828, 'Impôts dus en France', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5830, 'PCG14-DEV', 'EXPENSE', '6952', 5828,
         'Contribution additionnelle à l''impôt sur les bénéfices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5831, 'PCG14-DEV', 'EXPENSE', '6954', 5828, 'Impôts dus à l''étranger', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5832, 'PCG14-DEV', 'EXPENSE', '696', 5826,
         'Suppléments d''impôt sur les sociétés liés aux distributions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5833, 'PCG14-DEV', 'EXPENSE', '698', 5826, 'Intégration fiscale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5834, 'PCG14-DEV', 'EXPENSE', '6981', 5833, 'Intégration fiscale - Charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5835, 'PCG14-DEV', 'EXPENSE', '6989', 5833, 'Intégration fiscale - Produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5836, 'PCG14-DEV', 'EXPENSE', '699', 5826, 'Produits - Reports en arrière des déficits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5837, 'PCG14-DEV', 'INCOME', '70', 5973,
         'Ventes de produits fabriqués, prestations de services, marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5838, 'PCG14-DEV', 'INCOME', '701', 5837, 'Ventes de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5839, 'PCG14-DEV', 'INCOME', '7011', 5838, 'Produits finis (ou groupe) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5840, 'PCG14-DEV', 'INCOME', '7012', 5838, 'Produits finis (ou groupe) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5841, 'PCG14-DEV', 'INCOME', '702', 5837, 'Ventes de produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5842, 'PCG14-DEV', 'INCOME', '703', 5837, 'Ventes de produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5843, 'PCG14-DEV', 'INCOME', '704', 5837, 'Travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5844, 'PCG14-DEV', 'INCOME', '7041', 5843, 'Travaux de catégorie (ou activité) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5845, 'PCG14-DEV', 'INCOME', '7042', 5843, 'Travaux de catégorie (ou activité) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5846, 'PCG14-DEV', 'INCOME', '705', 5837, 'Etudes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5847, 'PCG14-DEV', 'INCOME', '706', 5837, 'Prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5848, 'PCG14-DEV', 'INCOME', '707', 5837, 'Ventes de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5849, 'PCG14-DEV', 'INCOME', '7071', 5848, 'Marchandises (ou groupe) A', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5850, 'PCG14-DEV', 'INCOME', '7072', 5848, 'Marchandises (ou groupe) B', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5851, 'PCG14-DEV', 'INCOME', '708', 5837, 'Produits des activités annexes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5852, 'PCG14-DEV', 'INCOME', '7081', 5851,
         'Produits des services exploités dans l''intérêt du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5853, 'PCG14-DEV', 'INCOME', '7082', 5851, 'Commissions et courtages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5854, 'PCG14-DEV', 'INCOME', '7083', 5851, 'Locations diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5855, 'PCG14-DEV', 'INCOME', '7084', 5851, 'Mise à disposition de personnel facturée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5856, 'PCG14-DEV', 'INCOME', '7085', 5851, 'Ports et frais accessoires facturés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5857, 'PCG14-DEV', 'INCOME', '7086', 5851, 'Bonis sur reprises d''emballages consignés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5858, 'PCG14-DEV', 'INCOME', '7087', 5851,
         'Bonifications obtenues des clients et primes sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5859, 'PCG14-DEV', 'INCOME', '7088', 5851,
         'Autres produits d''activités annexes (cessions d''approvisionnements,)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5860, 'PCG14-DEV', 'INCOME', '709', 5837,
         'Rabais, remises et ristournes accordés par l''entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5861, 'PCG14-DEV', 'INCOME', '7091', 5860, 'sur ventes de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5862, 'PCG14-DEV', 'INCOME', '7092', 5860, 'sur ventes de produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5863, 'PCG14-DEV', 'INCOME', '7094', 5860, 'sur travaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5864, 'PCG14-DEV', 'INCOME', '7095', 5860, 'sur études', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5865, 'PCG14-DEV', 'INCOME', '7096', 5860, 'sur prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5866, 'PCG14-DEV', 'INCOME', '7097', 5860, 'sur ventes de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5867, 'PCG14-DEV', 'INCOME', '7098', 5860, 'sur produits des activités annexes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5868, 'PCG14-DEV', 'INCOME', '71', 5973, 'Production stockée (ou déstockage)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5869, 'PCG14-DEV', 'INCOME', '713', 5868,
         'Variation des stocks (en-cours de production, produits)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5870, 'PCG14-DEV', 'INCOME', '7133', 5869, 'Variation des en-cours de production de biens', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5871, 'PCG14-DEV', 'INCOME', '71331', 5870, 'Produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5872, 'PCG14-DEV', 'INCOME', '71335', 5870, 'Travaux en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5873, 'PCG14-DEV', 'INCOME', '7134', 5869, 'Variation des en-cours de production de services',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5874, 'PCG14-DEV', 'INCOME', '71341', 5873, 'Etudes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5875, 'PCG14-DEV', 'INCOME', '71345', 5873, 'Prestations de services en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5876, 'PCG14-DEV', 'INCOME', '7135', 5869, 'Variation des stocks de produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5877, 'PCG14-DEV', 'INCOME', '71351', 5876, 'Produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5878, 'PCG14-DEV', 'INCOME', '71355', 5876, 'Produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5879, 'PCG14-DEV', 'INCOME', '71358', 5876, 'Produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5880, 'PCG14-DEV', 'INCOME', '72', 5973, 'Production immobilisée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5881, 'PCG14-DEV', 'INCOME', '721', 5880, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5882, 'PCG14-DEV', 'INCOME', '722', 5880, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5883, 'PCG14-DEV', 'INCOME', '74', 5973, 'Subventions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5884, 'PCG14-DEV', 'INCOME', '75', 5973, 'Autres produits de gestion courante', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5885, 'PCG14-DEV', 'INCOME', '751', 5884,
         'Redevances pour concessions, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5886, 'PCG14-DEV', 'INCOME', '7511', 5885,
         'Redevances pour concessions, brevets, licences, marques, procédés, logiciels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5887, 'PCG14-DEV', 'INCOME', '7516', 5885, 'Droits d''auteur et de reproduction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5888, 'PCG14-DEV', 'INCOME', '7518', 5885, 'Autres droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5889, 'PCG14-DEV', 'INCOME', '752', 5884,
         'Revenus des immeubles non affectés à des activités professionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5890, 'PCG14-DEV', 'INCOME', '753', 5884,
         'Jetons de présence et rémunérations d''administrateurs, gérants,', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5891, 'PCG14-DEV', 'INCOME', '754', 5884,
         'Ristournes perçues des coopératives (provenant des excédents)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5892, 'PCG14-DEV', 'INCOME', '755', 5884,
         'Quote-parts de résultat sur opérations faites en commun', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5893, 'PCG14-DEV', 'INCOME', '7551', 5892,
         'Quote-part de perte transférée (comptabilité du gérant)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5894, 'PCG14-DEV', 'INCOME', '7555', 5892,
         'Quote-part de bénéfice attribuée (comptabilité des associés non - gérants)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5895, 'PCG14-DEV', 'INCOME', '758', 5884, 'Produits divers de gestion courante', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5896, 'PCG14-DEV', 'INCOME', '76', 5973, 'Produits financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5897, 'PCG14-DEV', 'INCOME', '761', 5896, 'Produits de participations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5898, 'PCG14-DEV', 'INCOME', '7611', 5897, 'Revenus des titres de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5899, 'PCG14-DEV', 'INCOME', '7612', 5897, 'Produits de la fiducie, résultat de la période', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5900, 'PCG14-DEV', 'INCOME', '7616', 5897, 'Revenus sur autres formes de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5901, 'PCG14-DEV', 'INCOME', '7617', 5897, 'Revenus des créances rattachées à des participations',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5902, 'PCG14-DEV', 'INCOME', '762', 5896, 'Produits des autres immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5903, 'PCG14-DEV', 'INCOME', '7621', 5902, 'Revenus des titres immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5904, 'PCG14-DEV', 'INCOME', '7626', 5902, 'Revenus des prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5905, 'PCG14-DEV', 'INCOME', '7627', 5902, 'Revenus des créances immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5906, 'PCG14-DEV', 'INCOME', '763', 5896, 'Revenus des autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5907, 'PCG14-DEV', 'INCOME', '7631', 5906, 'Revenus des créances commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5908, 'PCG14-DEV', 'INCOME', '7638', 5906, 'Revenus des créances diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5909, 'PCG14-DEV', 'INCOME', '764', 5896, 'Revenus des valeurs mobilières de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5910, 'PCG14-DEV', 'INCOME', '765', 5896, 'Escomptes obtenus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5911, 'PCG14-DEV', 'INCOME', '766', 5896, 'Gains de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5912, 'PCG14-DEV', 'INCOME', '767', 5896,
         'Produits nets sur cessions de valeurs mobilières de placement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5913, 'PCG14-DEV', 'INCOME', '768', 5896, 'Autres produits financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5914, 'PCG14-DEV', 'INCOME', '77', 5973, 'Produits exceptionnels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5915, 'PCG14-DEV', 'INCOME', '771', 5914, 'Produits exceptionnels sur opérations de gestion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5916, 'PCG14-DEV', 'INCOME', '7711', 5915, 'Dédits et pénalités perçus sur achats et sur ventes',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5917, 'PCG14-DEV', 'INCOME', '7713', 5915, 'Libéralités reçues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5918, 'PCG14-DEV', 'INCOME', '7714', 5915, 'Rentrées sur créances amorties', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5919, 'PCG14-DEV', 'INCOME', '7715', 5915, 'Subventions d''équilibre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5920, 'PCG14-DEV', 'INCOME', '7717', 5915,
         'Dégrèvements d''impôts autres qu''impôts sur les bénéfices', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5921, 'PCG14-DEV', 'INCOME', '7718', 5915,
         'Autres produits exceptionnels sur opérations de gestion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5922, 'PCG14-DEV', 'INCOME', '772', 5914,
         '(Compte à la disposition des entités pour enregistrer, en cours d''exercice, les produits sur exercices antérieurs)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5923, 'PCG14-DEV', 'INCOME', '774', 5914, 'Opérations de constitution ou liquidation des fiducies',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5924, 'PCG14-DEV', 'INCOME', '7741', 5923,
         'Opérations liées à la constitution de fiducie - Transfert des éléments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5925, 'PCG14-DEV', 'INCOME', '7742', 5923, 'Opérations liées à la liquidation de la fiducie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5926, 'PCG14-DEV', 'INCOME', '775', 5914, 'Produits des cessions d''éléments d''actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5927, 'PCG14-DEV', 'INCOME', '7751', 5926, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5928, 'PCG14-DEV', 'INCOME', '7752', 5926, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5929, 'PCG14-DEV', 'INCOME', '7756', 5926, 'Immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5930, 'PCG14-DEV', 'INCOME', '7758', 5926, 'Autres éléments d''actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5931, 'PCG14-DEV', 'INCOME', '777', 5914,
         'Quote-part des subventions d''investissement virée au résultat de l''exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5932, 'PCG14-DEV', 'INCOME', '778', 5914, 'Autres produits exceptionnels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5933, 'PCG14-DEV', 'INCOME', '7781', 5932, 'Bonis provenant de clauses d''indexation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5934, 'PCG14-DEV', 'INCOME', '7782', 5932, 'Lots', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5935, 'PCG14-DEV', 'INCOME', '7783', 5932,
         'Bonis provenant du rachat par l''entreprise d''actions et d''obligations émises par elle - même', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5936, 'PCG14-DEV', 'INCOME', '7788', 5932, 'Produits exceptionnels divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5937, 'PCG14-DEV', 'INCOME', '78', 5973,
         'Reprises sur amortissements, dépréciations et provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5938, 'PCG14-DEV', 'INCOME', '781', 5937,
         'Reprises sur amortissements, dépréciations et provisions (à inscrire dans les produits d''exploitation)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5939, 'PCG14-DEV', 'INCOME', '7811', 5938,
         'Reprises sur amortissements des immobilisations incorporelles et corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5940, 'PCG14-DEV', 'INCOME', '78111', 5939, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5941, 'PCG14-DEV', 'INCOME', '78112', 5939, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5942, 'PCG14-DEV', 'INCOME', '7815', 5938, 'Reprises sur provisions d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5943, 'PCG14-DEV', 'INCOME', '7816', 5938,
         'Reprises sur dépréciations des immobilisations incorporelles et corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5944, 'PCG14-DEV', 'INCOME', '78161', 5943, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5945, 'PCG14-DEV', 'INCOME', '78162', 5943, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5946, 'PCG14-DEV', 'INCOME', '7817', 5938, 'Reprises sur dépréciations des actifs circulants',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5947, 'PCG14-DEV', 'INCOME', '78173', 5946, 'Stocks et en-cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5948, 'PCG14-DEV', 'INCOME', '78174', 5946, 'Créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5949, 'PCG14-DEV', 'INCOME', '786', 5937,
         'Reprises sur provisions pour risques et dépréciations (à inscrire dans les produits financiers)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5950, 'PCG14-DEV', 'INCOME', '7865', 5949, 'Reprises sur provisions financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5951, 'PCG14-DEV', 'INCOME', '7866', 5949, 'Reprises sur dépréciations des éléments financiers',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5952, 'PCG14-DEV', 'INCOME', '78662', 5951, 'Immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5953, 'PCG14-DEV', 'INCOME', '78665', 5951, 'Valeurs mobilières de placements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5954, 'PCG14-DEV', 'INCOME', '787', 5937,
         'Reprises sur provisions et dépréciations (à inscrire dans les produits exceptionnels)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5955, 'PCG14-DEV', 'INCOME', '7872', 5954,
         'Reprises sur provisions réglementées (immobilisations)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5956, 'PCG14-DEV', 'INCOME', '78725', 5955, 'Amortissements dérogatoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5957, 'PCG14-DEV', 'INCOME', '78726', 5955, 'Provision spéciale de réévaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5958, 'PCG14-DEV', 'INCOME', '78727', 5955, 'Plus-values réinvesties', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5959, 'PCG14-DEV', 'INCOME', '7873', 5954, 'Reprises sur provisions réglementées (stocks)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5960, 'PCG14-DEV', 'INCOME', '7874', 5954, 'Reprises sur autres provisions réglementées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5961, 'PCG14-DEV', 'INCOME', '7875', 5954, 'Reprises sur provisions exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5962, 'PCG14-DEV', 'INCOME', '7876', 5954, 'Reprises sur dépréciations exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5963, 'PCG14-DEV', 'INCOME', '79', 5973, 'Transferts de charges', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5964, 'PCG14-DEV', 'INCOME', '791', 5963, 'Transferts de charges d''exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5965, 'PCG14-DEV', 'INCOME', '796', 5963, 'Transferts de charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 5966, 'PCG14-DEV', 'INCOME', '797', 5963, 'Transferts de charges exceptionnelles', '1');

--
-- Descriptif des plans comptables FR PCG18-ASSOC
--

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7201, 'PCG18-ASSOC', 'CAPIT', '1', '0',
         'Fonds propres, emprunts et dettes assimilésFonds propres, provisions pour risques et charges et dettes à plus d''un an',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7202, 'PCG18-ASSOC', 'IMMO', '2', '0',
         'Frais d''établissement. Actifs immobilisés et créances à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7203, 'PCG18-ASSOC', 'STOCK', '3', '0', 'Stock et commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7204, 'PCG18-ASSOC', 'THIRDPARTY', '4', '0', 'Créances et dettes à un an au plus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7205, 'PCG18-ASSOC', 'FINAN', '5', '0', 'Placement de trésorerie et de valeurs disponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7206, 'PCG18-ASSOC', 'EXPENSE', '6', '0', 'Charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7207, 'PCG18-ASSOC', 'INCOME', '7', '0', 'Produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7208, 'PCG18-ASSOC', 'SPECIAL', '8', '0', 'Comptes spéciaux', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7000, 'PCG18-ASSOC', 'CAPIT', '10', '7201', 'Fonds propres et réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7001, 'PCG18-ASSOC', 'CAPIT', '102', '7000', 'Fonds propres sans droit de reprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7002, 'PCG18-ASSOC', 'CAPIT', '1021', '7001', 'Première situation nette établie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7003, 'PCG18-ASSOC', 'CAPIT', '1022', '7001',
         'Fonds statutaires (à subdiviser en fonction des statuts)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7004, 'PCG18-ASSOC', 'CAPIT', '1023', '7001', 'Dotations non consomptibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7005, 'PCG18-ASSOC', 'CAPIT', '10231', '7004', 'Dotations non consomptibles initiales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7006, 'PCG18-ASSOC', 'CAPIT', '10232', '7004', 'Dotations non consomptibles complémentaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7007, 'PCG18-ASSOC', 'CAPIT', '1024', '7001', 'Autres fonds propres sans droit de reprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7008, 'PCG18-ASSOC', 'CAPIT', '103', '7000', 'Fonds propres avec droit de reprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7009, 'PCG18-ASSOC', 'CAPIT', '1032', '7008',
         'Fonds statutaires (à subdiviser en fonction des statuts)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7010, 'PCG18-ASSOC', 'CAPIT', '1034', '7008', 'Autres fonds propres avec droit de reprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7011, 'PCG18-ASSOC', 'CAPIT', '105', '7000', 'Ecarts de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7012, 'PCG18-ASSOC', 'CAPIT', '1051', '7011',
         'Ecarts de réévaluation sur des biens sans droit de reprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7013, 'PCG18-ASSOC', 'CAPIT', '1052', '7011',
         'Ecarts de réévaluation sur des biens avec droit de reprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7014, 'PCG18-ASSOC', 'CAPIT', '106', '7000', 'Réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7015, 'PCG18-ASSOC', 'CAPIT', '1068', '7014', 'Réserves pour projet de l’entité', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7016, 'PCG18-ASSOC', 'CAPIT', '108', '7000', 'Dotations consomptibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7017, 'PCG18-ASSOC', 'CAPIT', '1081', '7016', 'Dotations consomptibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7018, 'PCG18-ASSOC', 'CAPIT', '1089', '7016',
         'Dotations consomptibles inscrites au compte de résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7019, 'PCG18-ASSOC', 'CAPIT', '15', '7201', 'Provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7020, 'PCG18-ASSOC', 'CAPIT', '152', '7019', 'Provisions pour charges sur legs ou donations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7021, 'PCG18-ASSOC', 'CAPIT', '16', '7201', 'Emprunts et dettes assimilées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7022, 'PCG18-ASSOC', 'CAPIT', '163', '7021', 'Autres emprunts obligataires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7023, 'PCG18-ASSOC', 'CAPIT', '1631', '7022', 'Titres associatifs et assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7024, 'PCG18-ASSOC', 'CAPIT', '19', '7201', 'Fonds dédiés ou reportés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7025, 'PCG18-ASSOC', 'CAPIT', '191', '7024', 'Fonds reportés liés aux legs ou donations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7026, 'PCG18-ASSOC', 'CAPIT', '1911', '7025', 'Legs ou donations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7027, 'PCG18-ASSOC', 'CAPIT', '1912', '7025', 'Donations temporaires d’usufruit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7028, 'PCG18-ASSOC', 'CAPIT', '194', '7024', 'Fonds dédiés sur subventions d’exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7029, 'PCG18-ASSOC', 'CAPIT', '195', '7024',
         'Fonds dédiés sur contributions financières d’autres organismes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7030, 'PCG18-ASSOC', 'CAPIT', '196', '7024',
         'Fonds dédiés sur ressources liées à la générosité du public', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7031, 'PCG18-ASSOC', 'IMMO', '20', '7202', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7032, 'PCG18-ASSOC', 'IMMO', '204', '7031', 'Donations temporaires d’usufruit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7033, 'PCG18-ASSOC', 'IMMO', '24', '7202',
         'Biens reçus par legs ou donations destinés à être cédés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7034, 'PCG18-ASSOC', 'IMMO', '27', '7202', 'Autres immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7035, 'PCG18-ASSOC', 'IMMO', '2742', '7034', 'Prêts aux partenaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7036, 'PCG18-ASSOC', 'IMMO', '28', '7202', 'Amortissements des immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7037, 'PCG18-ASSOC', 'IMMO', '280', '7036', 'Amortissements des immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7038, 'PCG18-ASSOC', 'IMMO', '2804', '7037', 'Donations temporaires d’usufruit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7039, 'PCG18-ASSOC', 'IMMO', '29', '7202', 'Dépréciations des immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7040, 'PCG18-ASSOC', 'IMMO', '294', '7039',
         'Dépréciationsdes biens reçus par legs ou donations destinés à être cédés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7041, 'PCG18-ASSOC', 'THIRDPARTY', '41', '7204',
         'Clients, adhérents, usagers et comptes rattachés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7042, 'PCG18-ASSOC', 'THIRDPARTY', '45', '7204',
         'Confédération, fédération, union, entités affiliées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7043, 'PCG18-ASSOC', 'THIRDPARTY', '455', '7042', 'Partenaires - comptes courants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7044, 'PCG18-ASSOC', 'THIRDPARTY', '46', '7204', 'Débiteurs et créditeurs divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7045, 'PCG18-ASSOC', 'THIRDPARTY', '461', '7044', 'Créances reçues par legs ou donations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7046, 'PCG18-ASSOC', 'THIRDPARTY', '466', '7044', 'Dettes des legs ou donations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7047, 'PCG18-ASSOC', 'THIRDPARTY', '468', '7044',
         'Divers – charges à payer et produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7048, 'PCG18-ASSOC', 'THIRDPARTY', '4681', '7047', 'Frais des bénévoles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7049, 'PCG18-ASSOC', 'EXPENSE', '62', '7206', 'Autres services extérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7050, 'PCG18-ASSOC', 'EXPENSE', '622', '7049', 'Rémunérations d’intermédiaires et honoraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7051, 'PCG18-ASSOC', 'EXPENSE', '6226', '7050', 'Honoraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7052, 'PCG18-ASSOC', 'EXPENSE', '62264', '7051',
         'Honoraires sur legs ou donations destinés à être cédés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7053, 'PCG18-ASSOC', 'EXPENSE', '65', '7206', 'Autres charges de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7054, 'PCG18-ASSOC', 'EXPENSE', '653', '7053', 'Charges de la générosité du public', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7055, 'PCG18-ASSOC', 'EXPENSE', '6531', '7054', 'Autres charges sur legs ou donations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7056, 'PCG18-ASSOC', 'EXPENSE', '657', '7053', 'Aides financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7057, 'PCG18-ASSOC', 'EXPENSE', '67', '7206', 'Charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7058, 'PCG18-ASSOC', 'EXPENSE', '673', '7057', 'Apports ou affectations en numéraire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7059, 'PCG18-ASSOC', 'EXPENSE', '675', '7057', 'Valeurs comptables des éléments d’actifs cédés',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7060, 'PCG18-ASSOC', 'EXPENSE', '6754', '7059', 'Immobilisations reçues par legs ou donations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7061, 'PCG18-ASSOC', 'EXPENSE', '68', '7206',
         'Dotations aux amortissements, provisions et engagements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7062, 'PCG18-ASSOC', 'EXPENSE', '6816', '7061',
         'Dotations pour dépréciations des immobilisations incorporelles et corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7063, 'PCG18-ASSOC', 'EXPENSE', '68164', '7062',
         'Dotations pour dépréciation d’actifs reçus par legs ou donations destinés à être cédés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7064, 'PCG18-ASSOC', 'EXPENSE', '689', '7061', 'Reports en fonds dédiés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7065, 'PCG18-ASSOC', 'EXPENSE', '6891', '7064', 'Reports en fonds reportés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7066, 'PCG18-ASSOC', 'EXPENSE', '6894', '7064',
         'Reports en fonds dédiés sur subventions d’exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7067, 'PCG18-ASSOC', 'EXPENSE', '6895', '7064',
         'Reports en fonds dédiés sur contributions financières d’autres organismes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7068, 'PCG18-ASSOC', 'EXPENSE', '6896', '7064',
         'Reports en fonds dédiés sur ressources liées à la générosité du public', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7069, 'PCG18-ASSOC', 'INCOME', '70', '7207',
         'Ventes de produits fabriqués, prestations de services, marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7070, 'PCG18-ASSOC', 'INCOME', '706', '7069', 'Ventes de prestations de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7071, 'PCG18-ASSOC', 'INCOME', '7063', '7070', 'Parrainages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7072, 'PCG18-ASSOC', 'INCOME', '707', '7069', 'Ventes de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7073, 'PCG18-ASSOC', 'INCOME', '7073', '7073', 'Ventes de dons en nature', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7074, 'PCG18-ASSOC', 'INCOME', '73', '7207', 'Concours publics', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7075, 'PCG18-ASSOC', 'INCOME', '75', '7207', 'Autres produits de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7076, 'PCG18-ASSOC', 'INCOME', '753', '7075',
         'Versements des fondateurs ou consommation de la dotation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7077, 'PCG18-ASSOC', 'INCOME', '7531', '7076', 'Versements des fondateurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7078, 'PCG18-ASSOC', 'INCOME', '7532', '7076',
         'Quotes-parts de dotation consomptible virée au compte de résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7079, 'PCG18-ASSOC', 'INCOME', '754', '7075', 'Ressources liées à la générosité du public', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7080, 'PCG18-ASSOC', 'INCOME', '7541', '7079', 'Dons manuels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7081, 'PCG18-ASSOC', 'INCOME', '75411', '7080', 'Dons manuels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7082, 'PCG18-ASSOC', 'INCOME', '75412', '7080', 'Abandons de frais par les bénévoles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7083, 'PCG18-ASSOC', 'INCOME', '7542', '7079', 'Mécénats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7084, 'PCG18-ASSOC', 'INCOME', '7543', '7079', 'Legs, donations et assurances-vie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7085, 'PCG18-ASSOC', 'INCOME', '75431', '7084', 'Assurances-vie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7086, 'PCG18-ASSOC', 'INCOME', '75432', '7084', 'Legs ou donations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7087, 'PCG18-ASSOC', 'INCOME', '75433', '7084', 'Autres produits sur legs ou donations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7088, 'PCG18-ASSOC', 'INCOME', '755', '7075', 'Contributions financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7089, 'PCG18-ASSOC', 'INCOME', '7551', '7088', 'Contributions financières d’autres organismes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7090, 'PCG18-ASSOC', 'INCOME', '7552', '7088', 'Quotes-parts de générosité reçues', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7091, 'PCG18-ASSOC', 'INCOME', '756', '7075', 'Cotisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7092, 'PCG18-ASSOC', 'INCOME', '7561', '7091', 'Cotisations sans contrepartie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7093, 'PCG18-ASSOC', 'INCOME', '7562', '7091', 'Cotisations avec contrepartie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7094, 'PCG18-ASSOC', 'INCOME', '757', '7075',
         'Gains de change sur créances et dettes d’exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7095, 'PCG18-ASSOC', 'INCOME', '77', '7207', 'Produits exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7096, 'PCG18-ASSOC', 'INCOME', '775', '7095', 'Produits des cessions d’éléments d’actifs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7097, 'PCG18-ASSOC', 'INCOME', '7754', '7096',
         'Immobilisations reçues en legs ou donations destinées à être cédées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7098, 'PCG18-ASSOC', 'INCOME', '78', '7207',
         'Reprises sur amortissements, dépréciations et provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7099, 'PCG18-ASSOC', 'INCOME', '781', '7098',
         'Reprises sur amortissements des immobilisations dépréciations et provisions (à inscrire dans les produits d’exploitation)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7100, 'PCG18-ASSOC', 'INCOME', '7816', '7099',
         'Reprises sur dépréciations des immobilisations incorporelles et corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7101, 'PCG18-ASSOC', 'INCOME', '78164', '7100',
         'Reprises sur dépréciations d’actifs reçus par legs ou donations destinés à être cédés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7102, 'PCG18-ASSOC', 'INCOME', '789', '7098', 'Utilisations de fonds reportés et de fonds dédiés',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7103, 'PCG18-ASSOC', 'INCOME', '7891', '7102', 'Utilisations de fonds reportés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7104, 'PCG18-ASSOC', 'INCOME', '7894', '7102',
         'Utilisations des fonds dédiés sur subventions d’exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7105, 'PCG18-ASSOC', 'INCOME', '7895', '7102',
         'Utilisations des fonds dédiés sur contributions financières d’autres organismes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7106, 'PCG18-ASSOC', 'INCOME', '7896', '7102',
         'Utilisations des fonds dédiés sur ressources liées à la générosité du public', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7107, 'PCG18-ASSOC', 'INCOME', '86', '7208', 'Emplois des contributions volontaires en nature', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7108, 'PCG18-ASSOC', 'INCOME', '860', '7107', 'Secours en nature', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7109, 'PCG18-ASSOC', 'INCOME', '861', '7107', 'Mises à disposition gratuite de biens', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7110, 'PCG18-ASSOC', 'INCOME', '862', '7107', 'Prestations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7111, 'PCG18-ASSOC', 'INCOME', '864', '7107', 'Personnel bénévole', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7112, 'PCG18-ASSOC', 'INCOME', '87', '7208', 'Contributions volontaires en nature', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7113, 'PCG18-ASSOC', 'INCOME', '870', '7112', 'Dons en nature', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7114, 'PCG18-ASSOC', 'INCOME', '871', '7112', 'Prestations en nature', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 7115, 'PCG18-ASSOC', 'INCOME', '875', '7112', 'Bénévolat', 1);

--
-- Descriptif des plans comptables FR PCGA14-DEV
--

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8000, 'PCGAFR14-DEV', 'CAPIT', '1', '0', 'Comptes de capitaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8001, 'PCGAFR14-DEV', 'CAPIT', '10', '8000', 'Capital et réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8002, 'PCGAFR14-DEV', 'CAPIT', '101', '8001', 'Capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8003, 'PCGAFR14-DEV', 'CAPIT', '1011', '8002', 'Capital individuel initial (au ../../../)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8004, 'PCGAFR14-DEV', 'CAPIT', '1012', '8002', 'Variations capital individuel initial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8005, 'PCGAFR14-DEV', 'CAPIT', '1013', '8002', 'Capital souscrit - non appelé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8006, 'PCGAFR14-DEV', 'CAPIT', '1014', '8002', 'Capital souscrit - appelé, versé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8007, 'PCGAFR14-DEV', 'CAPIT', '1015', '8002', 'Capital souscrit - appelé, non versé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8008, 'PCGAFR14-DEV', 'CAPIT', '10151', '8007', 'Capital non amorti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8009, 'PCGAFR14-DEV', 'CAPIT', '10152', '8007', 'Capital amorti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8010, 'PCGAFR14-DEV', 'CAPIT', '1018', '8002',
         'Capital souscrit soumis à des réglementations particulières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8011, 'PCGAFR14-DEV', 'CAPIT', '104', '8001', 'Primes liées au capital social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8012, 'PCGAFR14-DEV', 'CAPIT', '1041', '8011', 'Primes d''émission', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8013, 'PCGAFR14-DEV', 'CAPIT', '1042', '8011', 'Primes de fusion', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8014, 'PCGAFR14-DEV', 'CAPIT', '1043', '8011', 'Primes d''apport', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8015, 'PCGAFR14-DEV', 'CAPIT', '1044', '8011', 'Primes de conversion d''obligations en actions',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8016, 'PCGAFR14-DEV', 'CAPIT', '1045', '8011', 'Bons de souscription d''actions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8017, 'PCGAFR14-DEV', 'CAPIT', '105', '8001', 'Ecarts de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8018, 'PCGAFR14-DEV', 'CAPIT', '1051', '8017', 'Réserve spéciale de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8019, 'PCGAFR14-DEV', 'CAPIT', '1052', '8017', 'Ecart de réévaluation libre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8020, 'PCGAFR14-DEV', 'CAPIT', '1053', '8017', 'Réserve de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8021, 'PCGAFR14-DEV', 'CAPIT', '1055', '8017',
         'Ecarts de réévaluation (autres opérations légales)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8022, 'PCGAFR14-DEV', 'CAPIT', '1057', '8017', 'Autres écarts de réévaluation en France', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8023, 'PCGAFR14-DEV', 'CAPIT', '1058', '8017', 'Autres écarts de réévaluation à l''Etranger', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8024, 'PCGAFR14-DEV', 'CAPIT', '106', '8001', 'Réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8025, 'PCGAFR14-DEV', 'CAPIT', '1061', '8024', 'Réserve légale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8026, 'PCGAFR14-DEV', 'CAPIT', '10611', '8025', 'Réserve légale proprement dite', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8027, 'PCGAFR14-DEV', 'CAPIT', '10612', '8025', 'Plus-values nettes à long terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8028, 'PCGAFR14-DEV', 'CAPIT', '1062', '8024', 'Réserves indisponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8029, 'PCGAFR14-DEV', 'CAPIT', '1063', '8024', 'Réserves statutaires ou contractuelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8030, 'PCGAFR14-DEV', 'CAPIT', '1064', '8024', 'Réserves réglementées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8031, 'PCGAFR14-DEV', 'CAPIT', '10641', '8030', 'Plus-values nettes à long terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8032, 'PCGAFR14-DEV', 'CAPIT', '10643', '8030',
         'Réserves consécutives à l''octroi de subventions d''investissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8033, 'PCGAFR14-DEV', 'CAPIT', '10648', '8030', 'Autres réserves réglementées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8034, 'PCGAFR14-DEV', 'CAPIT', '1068', '8024', 'Autres réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8035, 'PCGAFR14-DEV', 'CAPIT', '10681', '8034', 'Réserve de propre assureur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8036, 'PCGAFR14-DEV', 'CAPIT', '10688', '8034', 'Réserves diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8037, 'PCGAFR14-DEV', 'CAPIT', '107', '8001', 'Ecart d''équivalence', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8038, 'PCGAFR14-DEV', 'CAPIT', '108', '8001', 'Compte de l''exploitant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8039, 'PCGAFR14-DEV', 'CAPIT', '109', '8001',
         'Actionnaires et associés : Capital souscrit - non appelé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8040, 'PCGAFR14-DEV', 'CAPIT', '1091', '8039', 'Actionnaires : Capital souscrit - non appelé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8041, 'PCGAFR14-DEV', 'CAPIT', '1092', '8039', 'Associés : Capital souscrit - non appelé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8042, 'PCGAFR14-DEV', 'CAPIT', '11', '8000', 'Report à nouveau (solde créditeur ou débiteur)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8043, 'PCGAFR14-DEV', 'CAPIT', '110', '8042', 'Report à nouveau (solde créditeur)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8044, 'PCGAFR14-DEV', 'CAPIT', '119', '8042', 'Report à nouveau (solde débiteur)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8045, 'PCGAFR14-DEV', 'CAPIT', '12', '8000', 'Résultat de l''exercice (bénéfice ou perte)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8046, 'PCGAFR14-DEV', 'CAPIT', '120', '8045', 'Résultat de l''exercice (bénéfice)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8047, 'PCGAFR14-DEV', 'CAPIT', '129', '8045', 'Résultat de l''exercice (perte)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8048, 'PCGAFR14-DEV', 'CAPIT', '13', '8000', 'Subventions d''investissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8049, 'PCGAFR14-DEV', 'CAPIT', '131', '8048', 'Subventions d''équipement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8050, 'PCGAFR14-DEV', 'CAPIT', '1311', '8049', 'Etat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8051, 'PCGAFR14-DEV', 'CAPIT', '1312', '8049', 'Régions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8052, 'PCGAFR14-DEV', 'CAPIT', '1313', '8049', 'Départements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8053, 'PCGAFR14-DEV', 'CAPIT', '1314', '8049', 'Communes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8054, 'PCGAFR14-DEV', 'CAPIT', '1315', '8049', 'Collectivités publiques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8055, 'PCGAFR14-DEV', 'CAPIT', '1316', '8049', 'Entreprises publiques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8056, 'PCGAFR14-DEV', 'CAPIT', '1317', '8049', 'Entreprises et organismes privés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8057, 'PCGAFR14-DEV', 'CAPIT', '1318', '8049', 'Autres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8058, 'PCGAFR14-DEV', 'CAPIT', '138', '8048', 'Autres subventions d''investissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8059, 'PCGAFR14-DEV', 'CAPIT', '139', '8048',
         'Subventions d''investissement inscrites au compte de résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8060, 'PCGAFR14-DEV', 'CAPIT', '1391', '8059',
         'Subventions d''équipement inscrites au compte de résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8061, 'PCGAFR14-DEV', 'CAPIT', '13911', '8060', 'Etat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8062, 'PCGAFR14-DEV', 'CAPIT', '13912', '8060', 'Régions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8063, 'PCGAFR14-DEV', 'CAPIT', '13913', '8060', 'Départements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8064, 'PCGAFR14-DEV', 'CAPIT', '13914', '8060', 'Communes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8065, 'PCGAFR14-DEV', 'CAPIT', '13915', '8060', 'Collectivités publiques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8066, 'PCGAFR14-DEV', 'CAPIT', '13916', '8060', 'Entreprises publiques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8067, 'PCGAFR14-DEV', 'CAPIT', '13917', '8060', 'Entreprises et organismes privés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8068, 'PCGAFR14-DEV', 'CAPIT', '13918', '8060', 'Autres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8069, 'PCGAFR14-DEV', 'CAPIT', '1398', '8059',
         'Autres subventions d''investissement inscrites au compte de résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8070, 'PCGAFR14-DEV', 'CAPIT', '14', '8000', 'Provisions réglementées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8071, 'PCGAFR14-DEV', 'CAPIT', '142', '8070',
         'Provisions réglementées relatives aux immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8072, 'PCGAFR14-DEV', 'CAPIT', '1424', '8071',
         'Provisions pour investissement (participation des salariés)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8073, 'PCGAFR14-DEV', 'CAPIT', '143', '8070', 'Provisions réglementées relatives aux stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8074, 'PCGAFR14-DEV', 'CAPIT', '1431', '8073', 'Hausse des prix', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8075, 'PCGAFR14-DEV', 'CAPIT', '1432', '8073', 'Fluctuation des cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8076, 'PCGAFR14-DEV', 'CAPIT', '144', '8070',
         'Provisions réglementées relatives aux autres éléments de l''actif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8077, 'PCGAFR14-DEV', 'CAPIT', '145', '8070', 'Amortissements dérogatoires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8078, 'PCGAFR14-DEV', 'CAPIT', '146', '8070', 'Provision spéciale de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8079, 'PCGAFR14-DEV', 'CAPIT', '147', '8070', 'Plus-values réinvesties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8080, 'PCGAFR14-DEV', 'CAPIT', '148', '8070', 'Autres provisions réglementées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8081, 'PCGAFR14-DEV', 'CAPIT', '15', '8000', 'Provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8082, 'PCGAFR14-DEV', 'CAPIT', '151', '8081', 'Provisions pour risques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8083, 'PCGAFR14-DEV', 'CAPIT', '1511', '8082', 'Provisions pour litiges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8084, 'PCGAFR14-DEV', 'CAPIT', '1512', '8082', 'Provisions pour garanties données aux clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8085, 'PCGAFR14-DEV', 'CAPIT', '1513', '8082', 'Provisions pour pertes sur marchés à terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8086, 'PCGAFR14-DEV', 'CAPIT', '1514', '8082', 'Provisions pour amendes et pénalités', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8087, 'PCGAFR14-DEV', 'CAPIT', '1515', '8082', 'Provisions pour pertes de change', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8088, 'PCGAFR14-DEV', 'CAPIT', '1516', '8082', 'Provisions pour pertes sur contrats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8089, 'PCGAFR14-DEV', 'CAPIT', '1518', '8082', 'Autres provisions pour risques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8090, 'PCGAFR14-DEV', 'CAPIT', '153', '8081', 'Provisions pour pensions et obligations similaires',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8091, 'PCGAFR14-DEV', 'CAPIT', '154', '8081', 'Provisions pour restructurations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8092, 'PCGAFR14-DEV', 'CAPIT', '155', '8081', 'Provisions pour impôts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8093, 'PCGAFR14-DEV', 'CAPIT', '156', '8081', 'Provisions pour renouvellement des immobilisations',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8094, 'PCGAFR14-DEV', 'CAPIT', '157', '8081',
         'Provisions pour charges à répartir sur plusieurs exercices', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8095, 'PCGAFR14-DEV', 'CAPIT', '1572', '8094',
         'Provisions pour gros entretien ou grandes révisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8096, 'PCGAFR14-DEV', 'CAPIT', '158', '8081', 'Autres provisions pour charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8097, 'PCGAFR14-DEV', 'CAPIT', '1581', '8096', 'Provisions pour remises en état', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8098, 'PCGAFR14-DEV', 'CAPIT', '16', '8000', 'Emprunts et dettes assimilées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8099, 'PCGAFR14-DEV', 'CAPIT', '161', '8098', 'Emprunts obligataires convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8100, 'PCGAFR14-DEV', 'CAPIT', '163', '8098', 'Autres emprunts obligataires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8101, 'PCGAFR14-DEV', 'CAPIT', '164', '8098', 'Emprunts auprès des établissements de crédit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8102, 'PCGAFR14-DEV', 'CAPIT', '1641', '8101', 'Emprunts fonciers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8103, 'PCGAFR14-DEV', 'CAPIT', '1642', '8101', 'Autres emprunts à moyen et long terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8104, 'PCGAFR14-DEV', 'CAPIT', '1643', '8101', 'Emprunts à court terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8105, 'PCGAFR14-DEV', 'CAPIT', '165', '8098', 'Dépôts et cautionnements reçus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8106, 'PCGAFR14-DEV', 'CAPIT', '1651', '8105', 'Dépôts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8107, 'PCGAFR14-DEV', 'CAPIT', '1655', '8105', 'Cautionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8108, 'PCGAFR14-DEV', 'CAPIT', '166', '8098', 'Participation des salariés aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8109, 'PCGAFR14-DEV', 'CAPIT', '1661', '8108', 'Comptes bloqués', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8110, 'PCGAFR14-DEV', 'CAPIT', '1662', '8108', 'Fonds de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8111, 'PCGAFR14-DEV', 'CAPIT', '167', '8098',
         'Emprunts et dettes assortis de conditions particulières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8112, 'PCGAFR14-DEV', 'CAPIT', '1671', '8111', 'Emissions de titres participatifs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8113, 'PCGAFR14-DEV', 'CAPIT', '1674', '8111', 'Avances conditionnées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8114, 'PCGAFR14-DEV', 'CAPIT', '1675', '8111', 'Emprunts participatifs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8115, 'PCGAFR14-DEV', 'CAPIT', '168', '8098', 'Autres emprunts et dettes assimilées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8116, 'PCGAFR14-DEV', 'CAPIT', '1681', '8115', 'Autres emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8117, 'PCGAFR14-DEV', 'CAPIT', '1685', '8115', 'Rentes viagères capitalisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8118, 'PCGAFR14-DEV', 'CAPIT', '1687', '8115', 'Autres dettes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8119, 'PCGAFR14-DEV', 'CAPIT', '1688', '8115', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8120, 'PCGAFR14-DEV', 'CAPIT', '16881', '8119', 'sur emprunts obligataires convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8121, 'PCGAFR14-DEV', 'CAPIT', '16883', '8119', 'sur autres emprunts obligataires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8122, 'PCGAFR14-DEV', 'CAPIT', '16884', '8119', 'sur emprunts auprès des établissements de crédit',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8123, 'PCGAFR14-DEV', 'CAPIT', '168841', '8122', 'Intérêts courus sur emprunts fonciers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8124, 'PCGAFR14-DEV', 'CAPIT', '168842', '8122', 'Intérêts courus sur autres emprunts MLT', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8125, 'PCGAFR14-DEV', 'CAPIT', '168843', '8122', 'Intérêts courus sur emprunts court terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8126, 'PCGAFR14-DEV', 'CAPIT', '16885', '8119', 'sur dépôts et cautionnements reçus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8127, 'PCGAFR14-DEV', 'CAPIT', '16886', '8119', 'sur participation des salariés aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8128, 'PCGAFR14-DEV', 'CAPIT', '16887', '8119',
         'sur emprunts et dettes assortis de conditions particulières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8129, 'PCGAFR14-DEV', 'CAPIT', '16888', '8119', 'sur autres emprunts et dettes assimilées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8130, 'PCGAFR14-DEV', 'CAPIT', '169', '8098', 'Primes de remboursement des obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8131, 'PCGAFR14-DEV', 'CAPIT', '17', '8000', 'Dettes rattachées à des participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8132, 'PCGAFR14-DEV', 'CAPIT', '171', '8131', 'Dettes rattachées à des participations (groupe)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8133, 'PCGAFR14-DEV', 'CAPIT', '1711', '8132', 'Principal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8134, 'PCGAFR14-DEV', 'CAPIT', '1712', '8132', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8135, 'PCGAFR14-DEV', 'CAPIT', '172', '8131',
         'Dettes rattachées à des participations à des organismes professionnels agricoles (autres que les établissements de crédit)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8136, 'PCGAFR14-DEV', 'CAPIT', '1721', '8135', 'Principal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8137, 'PCGAFR14-DEV', 'CAPIT', '1728', '8135', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8138, 'PCGAFR14-DEV', 'CAPIT', '174', '8131',
         'Dettes rattachées à des participations (hors groupe)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8139, 'PCGAFR14-DEV', 'CAPIT', '1741', '8138', 'Principal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8140, 'PCGAFR14-DEV', 'CAPIT', '1748', '8138', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8141, 'PCGAFR14-DEV', 'CAPIT', '178', '8131', 'Dettes rattachées à des sociétés en participation',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8142, 'PCGAFR14-DEV', 'CAPIT', '1781', '8141', 'Principal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8143, 'PCGAFR14-DEV', 'CAPIT', '1788', '8141', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8144, 'PCGAFR14-DEV', 'CAPIT', '18', '8000',
         'Comptes de liaison des établissements et sociétés en participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8145, 'PCGAFR14-DEV', 'CAPIT', '181', '8144', 'Comptes de liaison des établissements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8146, 'PCGAFR14-DEV', 'CAPIT', '186', '8144',
         'Biens et prestations de services échangés entre établissements (charges)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8147, 'PCGAFR14-DEV', 'CAPIT', '187', '8144',
         'Biens et prestations de services échangés entre établissements (produits)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8148, 'PCGAFR14-DEV', 'CAPIT', '188', '8144', 'Comptes de liaison des sociétés en participation',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8149, 'PCGAFR14-DEV', 'IMMO', '2', '0', 'Comptes d''immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8150, 'PCGAFR14-DEV', 'IMMO', '20', '8149', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8151, 'PCGAFR14-DEV', 'IMMO', '201', '8150', 'Frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8152, 'PCGAFR14-DEV', 'IMMO', '2011', '8151', 'Frais de constitution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8153, 'PCGAFR14-DEV', 'IMMO', '2012', '8151', 'Frais de premier établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8154, 'PCGAFR14-DEV', 'IMMO', '20121', '8153', 'Frais de prospection', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8155, 'PCGAFR14-DEV', 'IMMO', '20122', '8153', 'Frais de publicité', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8156, 'PCGAFR14-DEV', 'IMMO', '2013', '8151',
         'Frais d''augmentation de capital et d''opérations diverses (fusions, scissions, transformations)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8157, 'PCGAFR14-DEV', 'IMMO', '203', '8150', 'Frais de recherche et de développement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8158, 'PCGAFR14-DEV', 'IMMO', '205', '8150',
         'Concessions et droits similaires, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8159, 'PCGAFR14-DEV', 'IMMO', '206', '8150', 'Droit au bail', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8160, 'PCGAFR14-DEV', 'IMMO', '207', '8150', 'Fonds rural et commercial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8161, 'PCGAFR14-DEV', 'IMMO', '2071', '8160', 'Fonds agricole', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8162, 'PCGAFR14-DEV', 'IMMO', '2072', '8160', 'Fonds commercial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8163, 'PCGAFR14-DEV', 'IMMO', '208', '8150', 'Autres immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8164, 'PCGAFR14-DEV', 'IMMO', '2082', '8163', 'Usufruit temporaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8165, 'PCGAFR14-DEV', 'IMMO', '21', '8149', 'Immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8166, 'PCGAFR14-DEV', 'IMMO', '211', '8165', 'Terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8167, 'PCGAFR14-DEV', 'IMMO', '2111', '8166', 'Terrains nus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8168, 'PCGAFR14-DEV', 'IMMO', '21111', '8167', 'Terrains nus exploités en faire valoir direct', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8169, 'PCGAFR14-DEV', 'IMMO', '21112', '8167', 'Autres terrains nus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8170, 'PCGAFR14-DEV', 'IMMO', '2112', '8166', 'Terrains aménagés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8171, 'PCGAFR14-DEV', 'IMMO', '2113', '8166', 'Sous-sols et sur-sols', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8172, 'PCGAFR14-DEV', 'IMMO', '2114', '8166', 'Terrains de gisement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8173, 'PCGAFR14-DEV', 'IMMO', '21141', '8172', 'Carrières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8174, 'PCGAFR14-DEV', 'IMMO', '2115', '8166', 'Terrains bâtis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8175, 'PCGAFR14-DEV', 'IMMO', '21151', '8174', 'affectés à la production agricole', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8176, 'PCGAFR14-DEV', 'IMMO', '21155', '8174', 'affectés à une autre activité professionnelle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8177, 'PCGAFR14-DEV', 'IMMO', '21158', '8174', 'affectés à des opérations non professionnelles',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8178, 'PCGAFR14-DEV', 'IMMO', '2116', '8166',
         'Compte d''ordre sur immobilisations (art. 6 du décret 78.737 du 11-07-1978)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8179, 'PCGAFR14-DEV', 'IMMO', '212', '8165', 'Agencements et aménagements de terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8182, 'PCGAFR14-DEV', 'IMMO', '213', '8165', 'Constructions sur sol propre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8183, 'PCGAFR14-DEV', 'IMMO', '2131', '8182', 'Bâtiments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8184, 'PCGAFR14-DEV', 'IMMO', '21311', '8183', 'affectés à la production agricole', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8185, 'PCGAFR14-DEV', 'IMMO', '21315', '8183', 'affectés à une autre activité professionnelle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8186, 'PCGAFR14-DEV', 'IMMO', '21318', '8183', 'affectés à des opérations non professionnelles',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8187, 'PCGAFR14-DEV', 'IMMO', '2135', '8182',
         'Installations générales - agencements - aménagements des constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8188, 'PCGAFR14-DEV', 'IMMO', '21351', '8187', 'affectés à la production agricole', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8189, 'PCGAFR14-DEV', 'IMMO', '21355', '8187', 'affectés à une autre activité professionnelle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8190, 'PCGAFR14-DEV', 'IMMO', '21358', '8187', 'affectés à des opérations non professionnelles',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8191, 'PCGAFR14-DEV', 'IMMO', '2138', '8182', 'Ouvrages d''infrastructure', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8192, 'PCGAFR14-DEV', 'IMMO', '214', '8165', 'Constructions sur sol d''autrui', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8193, 'PCGAFR14-DEV', 'IMMO', '2141', '8192', 'Bâtiments', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8194, 'PCGAFR14-DEV', 'IMMO', '21411', '8193', 'affectés à la production agricole', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8195, 'PCGAFR14-DEV', 'IMMO', '21415', '8193', 'affectés à une autre activité professionnelle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8196, 'PCGAFR14-DEV', 'IMMO', '21418', '8193', 'affectés à des opérations non professionnelles',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8197, 'PCGAFR14-DEV', 'IMMO', '2145', '8192',
         'Installations générales - agencements - aménagements des constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8198, 'PCGAFR14-DEV', 'IMMO', '21451', '8197', 'affectés à la production agricole', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8199, 'PCGAFR14-DEV', 'IMMO', '21455', '8197', 'affectés à une autre activité professionnelle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8200, 'PCGAFR14-DEV', 'IMMO', '21458', '8197', 'affectés à des opérations non professionnelles',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8201, 'PCGAFR14-DEV', 'IMMO', '2148', '8192', 'Ouvrages d''infrastructure', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8202, 'PCGAFR14-DEV', 'IMMO', '215', '8165', 'Installations techniques, matériels et outillage',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8203, 'PCGAFR14-DEV', 'IMMO', '2151', '8202', 'Installations techniques sur sol propre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8204, 'PCGAFR14-DEV', 'IMMO', '2153', '8202', 'Installations techniques sur sol d''autrui', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8205, 'PCGAFR14-DEV', 'IMMO', '2154', '8202', 'Matériel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8206, 'PCGAFR14-DEV', 'IMMO', '2155', '8202', 'Outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8207, 'PCGAFR14-DEV', 'IMMO', '2157', '8202',
         'Agencements et aménagements du matériel et outillage industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8208, 'PCGAFR14-DEV', 'IMMO', '217', '8165', 'Améliorations du fonds', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8209, 'PCGAFR14-DEV', 'IMMO', '218', '8165',
         'Autres immobilisations corporelles (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8210, 'PCGAFR14-DEV', 'IMMO', '2181', '8209',
         'Installations générales, agencements, aménagements divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8211, 'PCGAFR14-DEV', 'IMMO', '2182', '8209', 'Matériel de transport', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8212, 'PCGAFR14-DEV', 'IMMO', '2183', '8209', 'Matériel de bureau et matériel informatique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8213, 'PCGAFR14-DEV', 'IMMO', '2184', '8209', 'Mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8214, 'PCGAFR14-DEV', 'IMMO', '2186', '8209', 'Emballages récupérables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8215, 'PCGAFR14-DEV', 'IMMO', '2188', '8209', 'Autres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8216, 'PCGAFR14-DEV', 'IMMO', '22', '8149', 'Immobilisations mises en concession', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8217, 'PCGAFR14-DEV', 'IMMO', '23', '8149', 'Immobilisations en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8218, 'PCGAFR14-DEV', 'IMMO', '231', '8217',
         'Immobilisations corporelles en cours (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8219, 'PCGAFR14-DEV', 'IMMO', '2311', '8218', 'Terrains (en cours)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8220, 'PCGAFR14-DEV', 'IMMO', '2312', '8218', 'Agencements et aménagements de terrains (en cours)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8221, 'PCGAFR14-DEV', 'IMMO', '2313', '8218', 'Constructions sur sol propre (en cours)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8222, 'PCGAFR14-DEV', 'IMMO', '2314', '8218', 'Constructions sur sol d''autrui (en cours)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8223, 'PCGAFR14-DEV', 'IMMO', '2315', '8218',
         'Installations techniques, matériel et outillage (en cours)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8224, 'PCGAFR14-DEV', 'IMMO', '2318', '8218',
         'Autres immobilisations corporelles - hors biens vivants (en cours)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8225, 'PCGAFR14-DEV', 'IMMO', '232', '8217', 'Immobilisations incorporelles en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8226, 'PCGAFR14-DEV', 'IMMO', '234', '8217',
         'Immobilisations corporelles en cours (biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8227, 'PCGAFR14-DEV', 'IMMO', '2341', '8226', 'Animaux reproducteurs (jeunes de renouvellement)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8228, 'PCGAFR14-DEV', 'IMMO', '2343', '8226', 'Animaux de services (en cours)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8229, 'PCGAFR14-DEV', 'IMMO', '2346', '8226', 'Plantations pérennes (en cours)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8230, 'PCGAFR14-DEV', 'IMMO', '2347', '8226', 'Autres végétaux immobilisés (en cours)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8231, 'PCGAFR14-DEV', 'IMMO', '237', '8217',
         'Avances et acomptes versés sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8232, 'PCGAFR14-DEV', 'IMMO', '238', '8217',
         'Avances et acomptes versés sur commandes d''immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8233, 'PCGAFR14-DEV', 'IMMO', '2381', '8232', 'Immobilisations corporelles (hors biens vivants)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8234, 'PCGAFR14-DEV', 'IMMO', '2384', '8232', 'Immobilisations corporelles (biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8235, 'PCGAFR14-DEV', 'IMMO', '24', '8149', 'Immobilisations en cours (biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8236, 'PCGAFR14-DEV', 'IMMO', '241', '8235', 'Animaux reproducteurs (adultes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8237, 'PCGAFR14-DEV', 'IMMO', '242', '8235', 'Animaux reproducteurs (jeunes de renouvellement)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8238, 'PCGAFR14-DEV', 'IMMO', '243', '8235', 'Animaux de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8239, 'PCGAFR14-DEV', 'IMMO', '246', '8235', 'Plantations pérennes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8240, 'PCGAFR14-DEV', 'IMMO', '2461', '8239', 'Plantations pérennes sur sol propre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8241, 'PCGAFR14-DEV', 'IMMO', '2465', '8239', 'Plantations pérennes sur sol d''autrui', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8242, 'PCGAFR14-DEV', 'IMMO', '2467', '8239', 'Aménagements des plantations pérennes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8243, 'PCGAFR14-DEV', 'IMMO', '247', '8235', 'Autres végétaux immobilisés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8244, 'PCGAFR14-DEV', 'IMMO', '2471', '8243', 'Autres végétaux immobilisés sur sol propre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8245, 'PCGAFR14-DEV', 'IMMO', '2475', '8243', 'Autres végétaux immobilisés sur sol d''autrui', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8246, 'PCGAFR14-DEV', 'IMMO', '2477', '8243', 'Aménagements des autres végétaux immobilisés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8247, 'PCGAFR14-DEV', 'IMMO', '25', '8149', 'Entreprises liées - parts et créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8248, 'PCGAFR14-DEV', 'IMMO', '26', '8149',
         'Participations et créances rattachées à des participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8249, 'PCGAFR14-DEV', 'IMMO', '261', '8248', 'Titres de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8250, 'PCGAFR14-DEV', 'IMMO', '2611', '8249', 'Actions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8251, 'PCGAFR14-DEV', 'IMMO', '2618', '8249', 'Autres titres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8252, 'PCGAFR14-DEV', 'IMMO', '262', '8248',
         'Participations à des organismes professionnels agricoles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8253, 'PCGAFR14-DEV', 'IMMO', '2621', '8252', 'Sociétés coopératives agricoles (sauf CUMA)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8254, 'PCGAFR14-DEV', 'IMMO', '2622', '8252', 'CUMA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8255, 'PCGAFR14-DEV', 'IMMO', '2624', '8252', 'SICA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8256, 'PCGAFR14-DEV', 'IMMO', '2628', '8252', 'Autres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8257, 'PCGAFR14-DEV', 'IMMO', '266', '8248', 'Autres formes de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8258, 'PCGAFR14-DEV', 'IMMO', '267', '8248', 'Créances rattachées à des participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8259, 'PCGAFR14-DEV', 'IMMO', '2671', '8258', 'Créances rattachées à des participations (groupe)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8260, 'PCGAFR14-DEV', 'IMMO', '2672', '8258',
         'Créances rattachées à des participations à des organismes professionnels agricoles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8261, 'PCGAFR14-DEV', 'IMMO', '26721', '8260', 'Sociétés coopératives agricoles (sauf CUMA)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8262, 'PCGAFR14-DEV', 'IMMO', '26722', '8260', 'CUMA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8263, 'PCGAFR14-DEV', 'IMMO', '26724', '8260', 'SICA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8264, 'PCGAFR14-DEV', 'IMMO', '26728', '8260', 'Autres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8265, 'PCGAFR14-DEV', 'IMMO', '2674', '8258', 'Créances rattachées à d''autres participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8266, 'PCGAFR14-DEV', 'IMMO', '2675', '8258',
         'Versements représentatifs d''apports non capitalisés (appel de fonds)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8267, 'PCGAFR14-DEV', 'IMMO', '2676', '8258', 'Avances consolidables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8268, 'PCGAFR14-DEV', 'IMMO', '2678', '8258', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8269, 'PCGAFR14-DEV', 'IMMO', '268', '8248', 'Créances rattachées à des sociétés en participation',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8270, 'PCGAFR14-DEV', 'IMMO', '2681', '8269', 'Principal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8271, 'PCGAFR14-DEV', 'IMMO', '2688', '8269', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8272, 'PCGAFR14-DEV', 'IMMO', '269', '8248',
         'Versements restant à effectuer sur titres de participation non libérés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8273, 'PCGAFR14-DEV', 'IMMO', '2691', '8272', 'sur titres de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8274, 'PCGAFR14-DEV', 'IMMO', '2692', '8272',
         'sur participations à des organismes professionnels agricoles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8275, 'PCGAFR14-DEV', 'IMMO', '2696', '8272', 'sur autres formes de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8276, 'PCGAFR14-DEV', 'IMMO', '27', '8149', 'Autres immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8277, 'PCGAFR14-DEV', 'IMMO', '271', '8276', 'Titres immobilisés (droit de propriété)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8278, 'PCGAFR14-DEV', 'IMMO', '2711', '8277', 'Actions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8279, 'PCGAFR14-DEV', 'IMMO', '2715', '8277', 'Parts dans les établissements de crédit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8280, 'PCGAFR14-DEV', 'IMMO', '2718', '8277', 'Autres titres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8281, 'PCGAFR14-DEV', 'IMMO', '272', '8276', 'Titres immobilisés (droit de créance)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8282, 'PCGAFR14-DEV', 'IMMO', '2721', '8281', 'Obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8283, 'PCGAFR14-DEV', 'IMMO', '2722', '8281', 'Bons', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8284, 'PCGAFR14-DEV', 'IMMO', '2723', '8281', 'Certificats de fonds de développement coopératifs',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8285, 'PCGAFR14-DEV', 'IMMO', '273', '8276', 'Titres immobilisés de l''activité de portefeuille',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8286, 'PCGAFR14-DEV', 'IMMO', '274', '8276', 'Prêts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8287, 'PCGAFR14-DEV', 'IMMO', '2741', '8286', 'Prêts participatifs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8288, 'PCGAFR14-DEV', 'IMMO', '2742', '8286', 'Prêts aux associés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8289, 'PCGAFR14-DEV', 'IMMO', '2743', '8286', 'Prêts au personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8290, 'PCGAFR14-DEV', 'IMMO', '2748', '8286', 'Autres prêts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8291, 'PCGAFR14-DEV', 'IMMO', '275', '8276', 'Dépôts et cautionnements versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8292, 'PCGAFR14-DEV', 'IMMO', '2751', '8291', 'Dépôts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8293, 'PCGAFR14-DEV', 'IMMO', '2755', '8291', 'Cautionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8294, 'PCGAFR14-DEV', 'IMMO', '276', '8276', 'Autres créances immobilisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8295, 'PCGAFR14-DEV', 'IMMO', '2761', '8294', 'Créances diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8296, 'PCGAFR14-DEV', 'IMMO', '2768', '8294', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8297, 'PCGAFR14-DEV', 'IMMO', '27682', '8296', 'sur titres immobilisés (droit de créance)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8298, 'PCGAFR14-DEV', 'IMMO', '27684', '8296', 'sur prêts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8299, 'PCGAFR14-DEV', 'IMMO', '27685', '8296', 'sur dépôts et cautionnements versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8300, 'PCGAFR14-DEV', 'IMMO', '27688', '8296', 'sur créances diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8301, 'PCGAFR14-DEV', 'IMMO', '277', '8276', 'Actions propres ou parts propres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8302, 'PCGAFR14-DEV', 'IMMO', '279', '8276',
         'Versements restant à effectuer sur titres immobilisés non libérés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8303, 'PCGAFR14-DEV', 'IMMO', '28', '8149', 'Amortissements des immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8304, 'PCGAFR14-DEV', 'IMMO', '280', '8303', 'Amortissements des immobilisations incorporelles',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8305, 'PCGAFR14-DEV', 'IMMO', '2801', '8304', 'Frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8306, 'PCGAFR14-DEV', 'IMMO', '2803', '8304', 'Frais de recherche et de développement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8307, 'PCGAFR14-DEV', 'IMMO', '2805', '8304',
         'Concessions et droits similaires, brevets, licences, logiciels, droits et valeurs similaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8308, 'PCGAFR14-DEV', 'IMMO', '2807', '8304', 'Fonds commercial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8309, 'PCGAFR14-DEV', 'IMMO', '2808', '8304', 'Autres immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8310, 'PCGAFR14-DEV', 'IMMO', '28082', '8309', 'Usufruit temporaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8311, 'PCGAFR14-DEV', 'IMMO', '281', '8303',
         'Amortissements des immobilisations corporelles (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8312, 'PCGAFR14-DEV', 'IMMO', '2811', '8311', 'Terrains de gisement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8313, 'PCGAFR14-DEV', 'IMMO', '2812', '8311',
         'Agencements, aménagements de terrains amortissables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8314, 'PCGAFR14-DEV', 'IMMO', '2813', '8311', 'Constructions sur sol propre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8315, 'PCGAFR14-DEV', 'IMMO', '2814', '8311', 'Constructions sur sol d''autrui', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8316, 'PCGAFR14-DEV', 'IMMO', '2815', '8311', 'Installations, matériel et outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8317, 'PCGAFR14-DEV', 'IMMO', '2818', '8311',
         'Autres immobilisations corporelles (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8318, 'PCGAFR14-DEV', 'IMMO', '282', '8303',
         'Amortissement des immobilisations mises en concession', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8319, 'PCGAFR14-DEV', 'IMMO', '284', '8303',
         'Amortissement des immobilisations corporelles (biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8320, 'PCGAFR14-DEV', 'IMMO', '2841', '8319', 'Animaux reproducteurs (adultes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8321, 'PCGAFR14-DEV', 'IMMO', '2843', '8319', 'Animaux de service', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8322, 'PCGAFR14-DEV', 'IMMO', '2846', '8319', 'Plantation pérennes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8323, 'PCGAFR14-DEV', 'IMMO', '2847', '8319', 'Autres végétaux immobilisés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8324, 'PCGAFR14-DEV', 'IMMO', '29', '8149', 'Dépréciations des immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8325, 'PCGAFR14-DEV', 'IMMO', '290', '8324', 'Dépréciations des immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8326, 'PCGAFR14-DEV', 'IMMO', '2905', '8325', 'Marques, procédés, droits et valeurs similaires',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8327, 'PCGAFR14-DEV', 'IMMO', '2906', '8325', 'Droit au bail', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8328, 'PCGAFR14-DEV', 'IMMO', '2907', '8325', 'Fonds rural et commercial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8329, 'PCGAFR14-DEV', 'IMMO', '2908', '8325', 'Autres immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8330, 'PCGAFR14-DEV', 'IMMO', '291', '8324',
         'Dépréciations des immobilisations corporelles (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8331, 'PCGAFR14-DEV', 'IMMO', '2911', '8330', 'Terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8332, 'PCGAFR14-DEV', 'IMMO', '2912', '8330', 'Agencements et aménagements de terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8333, 'PCGAFR14-DEV', 'IMMO', '2913', '8330', 'Constructions sur sol propre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8334, 'PCGAFR14-DEV', 'IMMO', '2914', '8330', 'Constructions sur sol d''autrui', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8335, 'PCGAFR14-DEV', 'IMMO', '2915', '8330', 'Installations techniques, matériel et outillage',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8336, 'PCGAFR14-DEV', 'IMMO', '2917', '8330', 'Améliorations du fonds', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8337, 'PCGAFR14-DEV', 'IMMO', '2918', '8330',
         'Autres immobilisations corporelles  (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8338, 'PCGAFR14-DEV', 'IMMO', '292', '8324',
         'Dépréciations des immobilisations mises en concession', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8339, 'PCGAFR14-DEV', 'IMMO', '293', '8324', 'Dépréciations des immobilisations en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8340, 'PCGAFR14-DEV', 'IMMO', '2931', '8339',
         'Immobilisations corporelles en cours (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8341, 'PCGAFR14-DEV', 'IMMO', '2932', '8339', 'Immobilisations incorporelles en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8342, 'PCGAFR14-DEV', 'IMMO', '2934', '8339',
         'Immobilisations corporelles en cours (biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8343, 'PCGAFR14-DEV', 'IMMO', '294', '8324', 'Autres immobilisations corporelles  (biens vivants)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8344, 'PCGAFR14-DEV', 'IMMO', '2941', '8343', 'Animaux reproducteurs (adultes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8345, 'PCGAFR14-DEV', 'IMMO', '2942', '8343', 'Animaux reproducteurs (jeunes de renouvellement)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8346, 'PCGAFR14-DEV', 'IMMO', '2943', '8343', 'Animaux de service', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8347, 'PCGAFR14-DEV', 'IMMO', '2946', '8343', 'Plantation pérennes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8348, 'PCGAFR14-DEV', 'IMMO', '2947', '8343', 'Autres végétaux immobilisés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8349, 'PCGAFR14-DEV', 'IMMO', '296', '8324',
         'Dépréciations des participations et créances rattachées à des participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8350, 'PCGAFR14-DEV', 'IMMO', '2961', '8349', 'Titres de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8351, 'PCGAFR14-DEV', 'IMMO', '2962', '8349',
         'Participations à des organismes professionnels agricoles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8352, 'PCGAFR14-DEV', 'IMMO', '2966', '8349', 'Autres formes de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8353, 'PCGAFR14-DEV', 'IMMO', '2967', '8349', 'Créances rattachées à des participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8354, 'PCGAFR14-DEV', 'IMMO', '2968', '8349',
         'Créances rattachées à des sociétés en participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8355, 'PCGAFR14-DEV', 'IMMO', '297', '8324',
         'Dépréciations des autres immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8356, 'PCGAFR14-DEV', 'IMMO', '2971', '8355', 'Titres immobilisés - droit de propriété', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8357, 'PCGAFR14-DEV', 'IMMO', '2972', '8355', 'Titres immobilisés - droit de créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8358, 'PCGAFR14-DEV', 'IMMO', '2973', '8355', 'Titres immobilisés de l''activité de portefeuille',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8359, 'PCGAFR14-DEV', 'IMMO', '2974', '8355', 'Prêts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8360, 'PCGAFR14-DEV', 'IMMO', '2975', '8355', 'Dépôts et cautionnements versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8361, 'PCGAFR14-DEV', 'IMMO', '2976', '8355', 'Autres créances immobilisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8362, 'PCGAFR14-DEV', 'STOCK', '3', '	0', 'Comptes de stocks et en-cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8363, 'PCGAFR14-DEV', 'STOCK', '30', '8362', 'Stocks et en-cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8364, 'PCGAFR14-DEV', 'STOCK', '301', '8363', 'Approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8365, 'PCGAFR14-DEV', 'STOCK', '3011', '8364', 'Engrais et amendements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8366, 'PCGAFR14-DEV', 'STOCK', '3012', '8364', 'Semences et plants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8367, 'PCGAFR14-DEV', 'STOCK', '3013', '8364', 'Produits de défense des végétaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8368, 'PCGAFR14-DEV', 'STOCK', '3014', '8364', 'Aliments du bétail', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8369, 'PCGAFR14-DEV', 'STOCK', '3015', '8364', 'Produits de défense des animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8370, 'PCGAFR14-DEV', 'STOCK', '3016', '8364', 'Produits de reproduction animale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8371, 'PCGAFR14-DEV', 'STOCK', '3017', '8364', 'Emballages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8372, 'PCGAFR14-DEV', 'STOCK', '30171', '8371', 'Emballages perdus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8373, 'PCGAFR14-DEV', 'STOCK', '30175', '8371', 'Emballages récupérables non identifiables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8374, 'PCGAFR14-DEV', 'STOCK', '30177', '8371', 'Emballages à usage mixte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8375, 'PCGAFR14-DEV', 'STOCK', '3018', '8364', 'Combustibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8376, 'PCGAFR14-DEV', 'STOCK', '302', '8363', 'Autres approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8377, 'PCGAFR14-DEV', 'STOCK', '3021', '8376', 'Carburants et lubrifiants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8378, 'PCGAFR14-DEV', 'STOCK', '3022', '8376', 'Produits d''entretien', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8379, 'PCGAFR14-DEV', 'STOCK', '3023', '8376', 'Fournitures d''atelier et de magasin', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8380, 'PCGAFR14-DEV', 'STOCK', '3024', '8376', 'Fournitures de bureau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8381, 'PCGAFR14-DEV', 'STOCK', '3025', '8376', 'Denrées et fournitures pour le personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8382, 'PCGAFR14-DEV', 'STOCK', '3026', '8376', 'Matériaux divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8383, 'PCGAFR14-DEV', 'STOCK', '3027', '8376', 'Autres fournitures consommables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8384, 'PCGAFR14-DEV', 'STOCK', '3028', '8376', 'Matières premières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8385, 'PCGAFR14-DEV', 'STOCK', '307', '8363', 'Marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8386, 'PCGAFR14-DEV', 'STOCK', '31', '8362', 'Animaux (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8387, 'PCGAFR14-DEV', 'STOCK', '311', '8386', 'Stocks d''animaux (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8388, 'PCGAFR14-DEV', 'STOCK', '32', '8362', 'Animaux (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8389, 'PCGAFR14-DEV', 'STOCK', '321', '8388', 'Stocks d''animaux (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8390, 'PCGAFR14-DEV', 'STOCK', '33', '8362', 'Végétaux en terre (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8391, 'PCGAFR14-DEV', 'STOCK', '331', '8390', 'Avances aux cultures (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8392, 'PCGAFR14-DEV', 'STOCK', '3311', '8391', 'Engrais et amendements en terre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8393, 'PCGAFR14-DEV', 'STOCK', '3312', '8391', 'Semences et plants en terre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8394, 'PCGAFR14-DEV', 'STOCK', '3313', '8391', 'Produit de défense des végétaux en terre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8395, 'PCGAFR14-DEV', 'STOCK', '3314', '8391', 'Autres approvisionnements en terre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8396, 'PCGAFR14-DEV', 'STOCK', '3315', '8391', 'Façons culturales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8397, 'PCGAFR14-DEV', 'STOCK', '3318', '8391', 'Autres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8398, 'PCGAFR14-DEV', 'STOCK', '34', '8362', 'Végétaux en terre (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8399, 'PCGAFR14-DEV', 'STOCK', '341', '8398', 'Avances aux cultures (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8400, 'PCGAFR14-DEV', 'STOCK', '3411', '8399', 'Engrais et amendements en terre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8401, 'PCGAFR14-DEV', 'STOCK', '3412', '8399', 'Semences et plants en terre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8402, 'PCGAFR14-DEV', 'STOCK', '3413', '8399', 'Produit de défense des végétaux en terre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8403, 'PCGAFR14-DEV', 'STOCK', '3414', '8399', 'Autres approvisionnements en terre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8404, 'PCGAFR14-DEV', 'STOCK', '3415', '8399', 'Façons culturales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8405, 'PCGAFR14-DEV', 'STOCK', '3418', '8399', 'Autres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8406, 'PCGAFR14-DEV', 'STOCK', '348', '8398', 'Autres végétaux en terre (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8407, 'PCGAFR14-DEV', 'STOCK', '35', '8362',
         'En-cours de production de biens et services (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8408, 'PCGAFR14-DEV', 'STOCK', '351', '8407', 'Biens (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8409, 'PCGAFR14-DEV', 'STOCK', '352', '8407', 'Biens (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8410, 'PCGAFR14-DEV', 'STOCK', '353', '8407', 'Biens (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8411, 'PCGAFR14-DEV', 'STOCK', '354', '8407', 'Biens (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8412, 'PCGAFR14-DEV', 'STOCK', '355', '8407', 'Biens (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8413, 'PCGAFR14-DEV', 'STOCK', '356', '8407', 'Autres biens (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8414, 'PCGAFR14-DEV', 'STOCK', '357', '8407', 'Travaux à façon (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8415, 'PCGAFR14-DEV', 'STOCK', '358', '8407', 'Autres services (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8416, 'PCGAFR14-DEV', 'STOCK', '36', '8362',
         'En-cours de production de biens et services (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8417, 'PCGAFR14-DEV', 'STOCK', '361', '8416', 'Biens (cycle court) - Produits végétaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8418, 'PCGAFR14-DEV', 'STOCK', '362', '8416', 'Biens (cycle court) - Produits animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8419, 'PCGAFR14-DEV', 'STOCK', '363', '8416', 'Biens (cycle court) - Vins', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8420, 'PCGAFR14-DEV', 'STOCK', '364', '8416', 'Biens (cycle court) - Alcools', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8421, 'PCGAFR14-DEV', 'STOCK', '365', '8416', 'Biens (cycle court) - Autres produits transformés',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8422, 'PCGAFR14-DEV', 'STOCK', '366', '8416', 'Autres biens (activités annexes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8423, 'PCGAFR14-DEV', 'STOCK', '367', '8416', 'Travaux à façon (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8424, 'PCGAFR14-DEV', 'STOCK', '368', '8416', 'Autres services (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8425, 'PCGAFR14-DEV', 'STOCK', '37', '8362', 'Stocks de Produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8426, 'PCGAFR14-DEV', 'STOCK', '371', '8425', 'Produits intermédiaires végétaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8427, 'PCGAFR14-DEV', 'STOCK', '372', '8425', 'Produits intermédiaires animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8428, 'PCGAFR14-DEV', 'STOCK', '373', '8425', 'Produits intermédiaires transformés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8429, 'PCGAFR14-DEV', 'STOCK', '374', '8425', 'Produits finis végétaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8430, 'PCGAFR14-DEV', 'STOCK', '375', '8425', 'Produits finis animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8431, 'PCGAFR14-DEV', 'STOCK', '376', '8425', 'Produits finis transformés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8432, 'PCGAFR14-DEV', 'STOCK', '377', '8425', 'Produits résiduels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8433, 'PCGAFR14-DEV', 'STOCK', '378', '8425', 'Produits (activités annexes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8434, 'PCGAFR14-DEV', 'STOCK', '38', '8362', 'Inventaire permanent', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8435, 'PCGAFR14-DEV', 'STOCK', '39', '8362', 'Dépréciations des stocks et en-cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8436, 'PCGAFR14-DEV', 'STOCK', '390', '8435',
         'Dépréciations des approvisionnements et marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8437, 'PCGAFR14-DEV', 'STOCK', '391', '8435', 'Dépréciations des animaux (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8438, 'PCGAFR14-DEV', 'STOCK', '392', '8435', 'Dépréciations des animaux (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8439, 'PCGAFR14-DEV', 'STOCK', '393', '8435', 'Dépréciations des végétaux en terre (cycle long)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8440, 'PCGAFR14-DEV', 'STOCK', '394', '8435', 'Dépréciations des végétaux en terre (cycle court)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8441, 'PCGAFR14-DEV', 'STOCK', '395', '8435',
         'Dépréciations des en-cours de production de biens et services (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8442, 'PCGAFR14-DEV', 'STOCK', '396', '8435',
         'Dépréciations des en-cours de production de biens et services (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8443, 'PCGAFR14-DEV', 'STOCK', '397', '8435', 'Dépréciations des produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8444, 'PCGAFR14-DEV', 'THIRDPARTY', '4', '   0', 'Comptes de tiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8445, 'PCGAFR14-DEV', 'THIRDPARTY', '40', '8444', 'Fournisseurs et comptes rattachés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8446, 'PCGAFR14-DEV', 'THIRDPARTY', '401', '8445', 'Fournisseurs d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8447, 'PCGAFR14-DEV', 'THIRDPARTY', '4011', '8446',
         'Fournisseurs - Achats de biens et de prestations de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8448, 'PCGAFR14-DEV', 'THIRDPARTY', '4017', '8446', 'Fournisseurs - Retenues de garantie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8449, 'PCGAFR14-DEV', 'THIRDPARTY', '402', '8445',
         'Fournisseurs d''exploitation - Soldes après compensation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8450, 'PCGAFR14-DEV', 'THIRDPARTY', '403', '8445', 'Fournisseurs - Effets à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8451, 'PCGAFR14-DEV', 'THIRDPARTY', '4031', '8450', 'Fournisseurs d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8452, 'PCGAFR14-DEV', 'THIRDPARTY', '4032', '8450',
         'Fournisseurs d''exploitation (conventions de compte courant)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8453, 'PCGAFR14-DEV', 'THIRDPARTY', '404', '8445', 'Fournisseurs d''immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8454, 'PCGAFR14-DEV', 'THIRDPARTY', '4041', '8453', 'Fournisseurs - Achats d''immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8455, 'PCGAFR14-DEV', 'THIRDPARTY', '4047', '8453',
         'Fournisseurs d''immobilisations - Retenues de garantie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8456, 'PCGAFR14-DEV', 'THIRDPARTY', '405', '8445',
         'Fournisseurs d''immobilisations - Effets à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8457, 'PCGAFR14-DEV', 'THIRDPARTY', '408', '8445', 'Fournisseurs - Factures non parvenues', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8458, 'PCGAFR14-DEV', 'THIRDPARTY', '4081', '8457', 'Fournisseurs d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8459, 'PCGAFR14-DEV', 'THIRDPARTY', '4082', '8457',
         'Fournisseurs d''exploitation (conventions de compte courant)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8460, 'PCGAFR14-DEV', 'THIRDPARTY', '4084', '8457', 'Fournisseurs d''immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8461, 'PCGAFR14-DEV', 'THIRDPARTY', '4088', '8457', 'Fournisseurs - Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8462, 'PCGAFR14-DEV', 'THIRDPARTY', '409', '8445', 'Fournisseurs débiteurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8463, 'PCGAFR14-DEV', 'THIRDPARTY', '4091', '8462',
         'Fournisseurs - Avances et acomptes versés sur commandes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8464, 'PCGAFR14-DEV', 'THIRDPARTY', '4096', '8462',
         'Fournisseurs - Créances pour emballages et matériel à rendre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8465, 'PCGAFR14-DEV', 'THIRDPARTY', '4097', '8462', 'Fournisseurs - Autres avoirs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8466, 'PCGAFR14-DEV', 'THIRDPARTY', '40971', '8465', 'Fournisseurs d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8467, 'PCGAFR14-DEV', 'THIRDPARTY', '40974', '8465', 'Fournisseurs d''immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8468, 'PCGAFR14-DEV', 'THIRDPARTY', '4098', '8462',
         'Rabais, remises, ristournes à obtenir et autres avoirs non encore reçus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8469, 'PCGAFR14-DEV', 'THIRDPARTY', '41', '8444', 'Clients et comptes rattachés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8470, 'PCGAFR14-DEV', 'THIRDPARTY', '411', '8469', 'Clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8471, 'PCGAFR14-DEV', 'THIRDPARTY', '4111', '8470',
         'Clients - Ventes de biens ou de prestations de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8472, 'PCGAFR14-DEV', 'THIRDPARTY', '4117', '8470', 'Clients - Retenues de garantie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8473, 'PCGAFR14-DEV', 'THIRDPARTY', '412', '8469', 'Clients - Soldes après compensation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8474, 'PCGAFR14-DEV', 'THIRDPARTY', '413', '8469', 'Clients - Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8475, 'PCGAFR14-DEV', 'THIRDPARTY', '4131', '8474', 'Clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8476, 'PCGAFR14-DEV', 'THIRDPARTY', '4132', '8474', 'Clients (conventions de compte courant)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8477, 'PCGAFR14-DEV', 'THIRDPARTY', '416', '8469', 'Clients douteux ou litigieux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8478, 'PCGAFR14-DEV', 'THIRDPARTY', '418', '8469', 'Clients - Produits non encore facturés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8479, 'PCGAFR14-DEV', 'THIRDPARTY', '4181', '8478', 'Clients - Factures à établir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8480, 'PCGAFR14-DEV', 'THIRDPARTY', '4182', '8478', 'Clients (conventions de compte courant)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8481, 'PCGAFR14-DEV', 'THIRDPARTY', '4188', '8478', 'Clients - Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8482, 'PCGAFR14-DEV', 'THIRDPARTY', '419', '8469', 'Clients créditeurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8483, 'PCGAFR14-DEV', 'THIRDPARTY', '4191', '8482',
         'Clients - Avances et acomptes reçus sur commandes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8484, 'PCGAFR14-DEV', 'THIRDPARTY', '4196', '8482',
         'Clients - Dettes sur emballages et matériels consignés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8485, 'PCGAFR14-DEV', 'THIRDPARTY', '4197', '8482', 'Clients - Autres avoirs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8486, 'PCGAFR14-DEV', 'THIRDPARTY', '4198', '8482',
         'Rabais, remises, ristournes à accorder et autres avoirs à établir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8487, 'PCGAFR14-DEV', 'THIRDPARTY', '42', '8444', 'Personnel et comptes rattachés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8488, 'PCGAFR14-DEV', 'THIRDPARTY', '421', '8487', 'Personnel - Rémunérations dues', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8489, 'PCGAFR14-DEV', 'THIRDPARTY', '422', '8487', 'Comités d''entreprises, d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8490, 'PCGAFR14-DEV', 'THIRDPARTY', '424', '8487', 'Participation des salariés aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8491, 'PCGAFR14-DEV', 'THIRDPARTY', '4246', '8490',
         'Réserve spéciale (art. L. 442-2 du Code du travail)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8492, 'PCGAFR14-DEV', 'THIRDPARTY', '4248', '8490', 'Comptes courants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8493, 'PCGAFR14-DEV', 'THIRDPARTY', '425', '8487', 'Personnel - Avances et acomptes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8494, 'PCGAFR14-DEV', 'THIRDPARTY', '426', '8487', 'Personnel - Dépôts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8495, 'PCGAFR14-DEV', 'THIRDPARTY', '427', '8487', 'Personnel - Oppositions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8496, 'PCGAFR14-DEV', 'THIRDPARTY', '428', '8487',
         'Personnel - Charges à payer et produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8497, 'PCGAFR14-DEV', 'THIRDPARTY', '4282', '8496', 'Dettes provisionnées pour congés à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8498, 'PCGAFR14-DEV', 'THIRDPARTY', '4284', '8496',
         'Dettes provisionnées pour participation des salariés aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8499, 'PCGAFR14-DEV', 'THIRDPARTY', '4286', '8496', 'Autres charges à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8500, 'PCGAFR14-DEV', 'THIRDPARTY', '4287', '8496', 'Produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8501, 'PCGAFR14-DEV', 'THIRDPARTY', '43', '8444',
         'Mutualité Sociale Agricole et autres organismes sociaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8502, 'PCGAFR14-DEV', 'THIRDPARTY', '431', '8501', 'Mutualité Sociale Agricole', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8503, 'PCGAFR14-DEV', 'THIRDPARTY', '437', '8501', 'Autres organismes sociaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8504, 'PCGAFR14-DEV', 'THIRDPARTY', '438', '8501',
         'Organismes sociaux - Charges à payer et produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8505, 'PCGAFR14-DEV', 'THIRDPARTY', '4382', '8504', 'Charges sociales sur congés à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8506, 'PCGAFR14-DEV', 'THIRDPARTY', '4386', '8504', 'Autres charges à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8507, 'PCGAFR14-DEV', 'THIRDPARTY', '4387', '8504', 'Produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8508, 'PCGAFR14-DEV', 'THIRDPARTY', '44', '8444', 'Etat et autres collectivités publiques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8509, 'PCGAFR14-DEV', 'THIRDPARTY', '441', '8508', 'Etat - Subventions à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8510, 'PCGAFR14-DEV', 'THIRDPARTY', '4411', '8509', 'Subventions d''investissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8511, 'PCGAFR14-DEV', 'THIRDPARTY', '4417', '8509', 'Subventions d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8512, 'PCGAFR14-DEV', 'THIRDPARTY', '4418', '8509', 'Subventions d''équilibre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8513, 'PCGAFR14-DEV', 'THIRDPARTY', '4419', '8509', 'Avances sur subventions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8514, 'PCGAFR14-DEV', 'THIRDPARTY', '442', '8508',
         'Etat - Impôts et taxes recouvrables sur des tiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8515, 'PCGAFR14-DEV', 'THIRDPARTY', '4424', '8514', 'Obligataires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8516, 'PCGAFR14-DEV', 'THIRDPARTY', '4425', '8514', 'Associés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8517, 'PCGAFR14-DEV', 'THIRDPARTY', '4428', '8514', 'Autres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8518, 'PCGAFR14-DEV', 'THIRDPARTY', '443', '8508',
         'Opérations particulières avec l''Etat, les collectivités publiques, les organismes internationaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8519, 'PCGAFR14-DEV', 'THIRDPARTY', '444', '8508', 'Etat - Impôts sur les bénéfices', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8520, 'PCGAFR14-DEV', 'THIRDPARTY', '445', '8508', 'Etat - Taxes sur le chiffre d''affaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8521, 'PCGAFR14-DEV', 'THIRDPARTY', '4452', '8520', 'TVA due intracommunautaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8522, 'PCGAFR14-DEV', 'THIRDPARTY', '44528', '8521',
         'TVA due intracommunautaire sur factures non parvenues', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8523, 'PCGAFR14-DEV', 'THIRDPARTY', '4455', '8520', 'Taxes sur le chiffre d''affaires à décaisser',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8524, 'PCGAFR14-DEV', 'THIRDPARTY', '44551', '8523', 'TVA à décaisser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8525, 'PCGAFR14-DEV', 'THIRDPARTY', '44552', '8523', 'TVA antérieurement déduite à reverser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8526, 'PCGAFR14-DEV', 'THIRDPARTY', '44558', '8523', 'Taxes assimilées à la TVA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8527, 'PCGAFR14-DEV', 'THIRDPARTY', '4456', '8520', 'Taxes sur le chiffre d''affaires déductibles',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8528, 'PCGAFR14-DEV', 'THIRDPARTY', '44562', '8527', 'TVA sur immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8529, 'PCGAFR14-DEV', 'THIRDPARTY', '445622', '8528',
         'TVA sur intracommunautaire sur immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8530, 'PCGAFR14-DEV', 'THIRDPARTY', '44563', '8527', 'TVA transférée par d''autres entreprises',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8531, 'PCGAFR14-DEV', 'THIRDPARTY', '44565', '8527', 'TVA sur achats à régulariser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8532, 'PCGAFR14-DEV', 'THIRDPARTY', '44566', '8527', 'TVA sur autres biens et services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8533, 'PCGAFR14-DEV', 'THIRDPARTY', '445662', '8532',
         'TVA sur intracommunautaire sur biens et services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8534, 'PCGAFR14-DEV', 'THIRDPARTY', '44567', '8527', 'Crédit de TVA à reporter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8535, 'PCGAFR14-DEV', 'THIRDPARTY', '44568', '8527', 'Taxes assimilées à la TVA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8536, 'PCGAFR14-DEV', 'THIRDPARTY', '4457', '8520',
         'Taxes sur le chiffre d''affaires collectées par l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8537, 'PCGAFR14-DEV', 'THIRDPARTY', '44571', '8536', 'TVA collectée', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8538, 'PCGAFR14-DEV', 'THIRDPARTY', '44575', '8536', 'TVA collectée à régulariser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8539, 'PCGAFR14-DEV', 'THIRDPARTY', '44578', '8536', 'Taxes assimilées à la TVA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8540, 'PCGAFR14-DEV', 'THIRDPARTY', '4458', '8520',
         'Taxes sur le chiffre d''affaires à régulariser ou en attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8541, 'PCGAFR14-DEV', 'THIRDPARTY', '44581', '8540', 'Acomptes - Régime simplifié d''imposition',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8542, 'PCGAFR14-DEV', 'THIRDPARTY', '44582', '8540', 'Acomptes - Régime du forfait', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8543, 'PCGAFR14-DEV', 'THIRDPARTY', '44583', '8540',
         'Remboursement de taxes sur le chiffre d''affaires demandé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8544, 'PCGAFR14-DEV', 'THIRDPARTY', '44584', '8540', 'TVA récupérée d''avance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8545, 'PCGAFR14-DEV', 'THIRDPARTY', '44586', '8540',
         'Taxes sur le chiffre d''affaires sur factures non parvenues', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8546, 'PCGAFR14-DEV', 'THIRDPARTY', '445862', '8545',
         'TVA sur intracommunautaire sur factures non parvenues', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8547, 'PCGAFR14-DEV', 'THIRDPARTY', '44587', '8540',
         'Taxes sur le chiffre d''affaires sur factures à établir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8548, 'PCGAFR14-DEV', 'THIRDPARTY', '446', '8508', 'Obligations cautionnées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8549, 'PCGAFR14-DEV', 'THIRDPARTY', '447', '8508', 'Autres impôts, taxes et versements assimilés',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8550, 'PCGAFR14-DEV', 'THIRDPARTY', '448', '8508', 'Etat - Charges à payer et produits à recevoir',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8551, 'PCGAFR14-DEV', 'THIRDPARTY', '4482', '8550', 'Charges fiscales sur congés à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8552, 'PCGAFR14-DEV', 'THIRDPARTY', '4486', '8550', 'Autres charges à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8553, 'PCGAFR14-DEV', 'THIRDPARTY', '4487', '8550', 'Produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8554, 'PCGAFR14-DEV', 'THIRDPARTY', '45', '8444',
         'Groupe, communautés d''exploitation et associés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8555, 'PCGAFR14-DEV', 'THIRDPARTY', '451', '8554', 'Groupe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8556, 'PCGAFR14-DEV', 'THIRDPARTY', '452', '8554',
         'Associés - Opérations faites en commun (GAEC partiels)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8557, 'PCGAFR14-DEV', 'THIRDPARTY', '4521', '8556', 'Opérations courantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8558, 'PCGAFR14-DEV', 'THIRDPARTY', '4528', '8556', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8559, 'PCGAFR14-DEV', 'THIRDPARTY', '453', '8554',
         'Associés - Opérations faites en commun et en GIE (banques de travail)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8560, 'PCGAFR14-DEV', 'THIRDPARTY', '4531', '8559', 'Opérations courantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8561, 'PCGAFR14-DEV', 'THIRDPARTY', '4538', '8559', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8562, 'PCGAFR14-DEV', 'THIRDPARTY', '454', '8554',
         'Associés - Opérations faites en commun (autres communautés d''exploitation à objets particuliers)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8563, 'PCGAFR14-DEV', 'THIRDPARTY', '4541', '8562', 'Opérations courantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8564, 'PCGAFR14-DEV', 'THIRDPARTY', '4548', '8562', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8565, 'PCGAFR14-DEV', 'THIRDPARTY', '455', '8554', 'Associés - Comptes courants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8566, 'PCGAFR14-DEV', 'THIRDPARTY', '4551', '8565', 'Associés - Comptes courants (principal)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8567, 'PCGAFR14-DEV', 'THIRDPARTY', '4553', '8565', 'Associés - Comptes bloqués (principal)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8568, 'PCGAFR14-DEV', 'THIRDPARTY', '4558', '8565',
         'Associés - Comptes courants (intérêts courus)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8569, 'PCGAFR14-DEV', 'THIRDPARTY', '45581', '8568',
         'Associés - Comptes courants (intérêts courus)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8570, 'PCGAFR14-DEV', 'THIRDPARTY', '45583', '8568',
         'Associés - Comptes bloqués (intérêts courus)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8571, 'PCGAFR14-DEV', 'THIRDPARTY', '456', '8554', 'Associés - Opérations sur le capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8572, 'PCGAFR14-DEV', 'THIRDPARTY', '4561', '8571', 'Associés - Comptes d''apport en société', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8573, 'PCGAFR14-DEV', 'THIRDPARTY', '45611', '8572', 'Apports en nature', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8574, 'PCGAFR14-DEV', 'THIRDPARTY', '45615', '8572', 'Apports en numéraire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8575, 'PCGAFR14-DEV', 'THIRDPARTY', '4562', '8571', 'Apporteurs - Capital appelé, non versé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8576, 'PCGAFR14-DEV', 'THIRDPARTY', '45621', '8575',
         'Actionnaires - Capital souscrit et appelé, non versé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8577, 'PCGAFR14-DEV', 'THIRDPARTY', '45625', '8575', 'Associés - Capital appelé, non versé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8578, 'PCGAFR14-DEV', 'THIRDPARTY', '4563', '8571',
         'Associés - Versements reçus sur augmentation de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8579, 'PCGAFR14-DEV', 'THIRDPARTY', '4564', '8571', 'Associés - Versements anticipés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8580, 'PCGAFR14-DEV', 'THIRDPARTY', '4566', '8571', 'Associés défaillants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8581, 'PCGAFR14-DEV', 'THIRDPARTY', '4567', '8571', 'Associés - Capital à rembourser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8582, 'PCGAFR14-DEV', 'THIRDPARTY', '457', '8554', 'Associés - Dividendes à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8583, 'PCGAFR14-DEV', 'THIRDPARTY', '458', '8554',
         'Associés - Opérations faites en commun et en GIE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8584, 'PCGAFR14-DEV', 'THIRDPARTY', '4581', '8583', 'Opérations courantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8585, 'PCGAFR14-DEV', 'THIRDPARTY', '4588', '8583', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8586, 'PCGAFR14-DEV', 'THIRDPARTY', '46', '8444', 'Débiteurs divers et créditeurs divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8587, 'PCGAFR14-DEV', 'THIRDPARTY', '461', '8586', 'Caisse de péréquation des prix', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8588, 'PCGAFR14-DEV', 'THIRDPARTY', '462', '8586', 'Créances sur cessions d''immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8589, 'PCGAFR14-DEV', 'THIRDPARTY', '464', '8586',
         'Dettes sur acquisitions de valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8590, 'PCGAFR14-DEV', 'THIRDPARTY', '465', '8586',
         'Créances sur cessions de valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8591, 'PCGAFR14-DEV', 'THIRDPARTY', '467', '8586', 'Autres comptes débiteurs ou créditeurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8592, 'PCGAFR14-DEV', 'THIRDPARTY', '4671', '8591', 'Autres comptes débiteurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8593, 'PCGAFR14-DEV', 'THIRDPARTY', '4672', '8591', 'Autres comptes créditeurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8594, 'PCGAFR14-DEV', 'THIRDPARTY', '468', '8586',
         'Divers - Charges à payer et produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8595, 'PCGAFR14-DEV', 'THIRDPARTY', '4686', '8594', 'Charges à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8596, 'PCGAFR14-DEV', 'THIRDPARTY', '4687', '8594', 'Produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8597, 'PCGAFR14-DEV', 'THIRDPARTY', '47', '8444', 'Comptes transitoires ou d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8598, 'PCGAFR14-DEV', 'THIRDPARTY', '471', '8597', 'Comptes d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8599, 'PCGAFR14-DEV', 'THIRDPARTY', '472', '8597',
         'Opérations de compensation (conventions de compte courant)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8600, 'PCGAFR14-DEV', 'THIRDPARTY', '473', '8597', 'Comptes d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8601, 'PCGAFR14-DEV', 'THIRDPARTY', '474', '8597', 'Comptes d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8602, 'PCGAFR14-DEV', 'THIRDPARTY', '475', '8597', 'Comptes d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8603, 'PCGAFR14-DEV', 'THIRDPARTY', '476', '8597', 'Différence de conversion - Actif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8604, 'PCGAFR14-DEV', 'THIRDPARTY', '4761', '8603', 'Diminution des créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8605, 'PCGAFR14-DEV', 'THIRDPARTY', '4762', '8603', 'Augmentation des dettes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8606, 'PCGAFR14-DEV', 'THIRDPARTY', '4768', '8603',
         'Différences compensées par couverture de change', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8607, 'PCGAFR14-DEV', 'THIRDPARTY', '477', '8597', 'Différences de conversion - Passif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8608, 'PCGAFR14-DEV', 'THIRDPARTY', '4771', '8607', 'Augmentation des créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8609, 'PCGAFR14-DEV', 'THIRDPARTY', '4772', '8607', 'Diminution des dettes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8610, 'PCGAFR14-DEV', 'THIRDPARTY', '4778', '8607',
         'Différences compensées par couverture de change', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8611, 'PCGAFR14-DEV', 'THIRDPARTY', '478', '8597', 'Autres comptes transitoires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8612, 'PCGAFR14-DEV', 'THIRDPARTY', '48', '8444', 'Comptes de régularisation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8613, 'PCGAFR14-DEV', 'THIRDPARTY', '481', '8612', 'Charges à répartir sur plusieurs exercices',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8614, 'PCGAFR14-DEV', 'THIRDPARTY', '4816', '8613', 'Frais d''émission des emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8615, 'PCGAFR14-DEV', 'THIRDPARTY', '486', '8612', 'Charges constatées d''avance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8616, 'PCGAFR14-DEV', 'THIRDPARTY', '487', '8612', 'Produits constatés d''avance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8617, 'PCGAFR14-DEV', 'THIRDPARTY', '488', '8612',
         'Comptes de répartition périodique des charges et des produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8618, 'PCGAFR14-DEV', 'THIRDPARTY', '4886', '8617', 'Charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8619, 'PCGAFR14-DEV', 'THIRDPARTY', '4887', '8617', 'Produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8620, 'PCGAFR14-DEV', 'THIRDPARTY', '49', '8444', 'Dépréciations des comptes de tiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8621, 'PCGAFR14-DEV', 'THIRDPARTY', '491', '8620', 'Dépréciations des comptes de clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8622, 'PCGAFR14-DEV', 'THIRDPARTY', '495', '8620',
         'Dépréciations des comptes du groupe, des communautés d''exploitation et des associés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8623, 'PCGAFR14-DEV', 'THIRDPARTY', '4951', '8622', 'Comptes du groupe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8624, 'PCGAFR14-DEV', 'THIRDPARTY', '4952', '8622', 'Opérations faites en commun (GAEC partiels)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8625, 'PCGAFR14-DEV', 'THIRDPARTY', '4953', '8622',
         'Opérations faites en commun et en GIE (banques de travail)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8626, 'PCGAFR14-DEV', 'THIRDPARTY', '4954', '8622',
         'Opérations faites en commun (autres communauté d''exploitation à objets particuliers)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8627, 'PCGAFR14-DEV', 'THIRDPARTY', '4955', '8622', 'Comptes courants des associés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8628, 'PCGAFR14-DEV', 'THIRDPARTY', '4958', '8622', 'Opérations faites en commun et en GIE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8629, 'PCGAFR14-DEV', 'THIRDPARTY', '496', '8620', 'Dépréciations des comptes de débiteurs divers',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8630, 'PCGAFR14-DEV', 'THIRDPARTY', '4961', '8629', 'Caisse de péréquation des prix', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8631, 'PCGAFR14-DEV', 'THIRDPARTY', '4962', '8629', 'Créances sur cessions d''immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8632, 'PCGAFR14-DEV', 'THIRDPARTY', '4965', '8629',
         'Créances sur cessions de valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8633, 'PCGAFR14-DEV', 'THIRDPARTY', '4967', '8629', 'Autres comptes débiteurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8634, 'PCGAFR14-DEV', 'FINAN', '5', '0', 'Comptes financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8635, 'PCGAFR14-DEV', 'FINAN', '50', '8634', 'Valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8636, 'PCGAFR14-DEV', 'FINAN', '501', '8635', 'Parts dans des entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8637, 'PCGAFR14-DEV', 'FINAN', '502', '8635', 'Actions propres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8638, 'PCGAFR14-DEV', 'FINAN', '503', '8635', 'Actions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8639, 'PCGAFR14-DEV', 'FINAN', '5031', '8638', 'Titres cotés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8640, 'PCGAFR14-DEV', 'FINAN', '5035', '8638', 'Titres non cotés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8641, 'PCGAFR14-DEV', 'FINAN', '504', '8635', 'Autres titres conférant un droit de propriété', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8642, 'PCGAFR14-DEV', 'FINAN', '505', '8635',
         'Obligations et bons émis par la société et rachetés par elle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8643, 'PCGAFR14-DEV', 'FINAN', '506', '8635', 'Obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8644, 'PCGAFR14-DEV', 'FINAN', '5061', '8643', 'Titres cotés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8645, 'PCGAFR14-DEV', 'FINAN', '5065', '8643', 'Titres non cotés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8646, 'PCGAFR14-DEV', 'FINAN', '507', '8635', 'Bons du Trésor et bons de caisse à court terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8647, 'PCGAFR14-DEV', 'FINAN', '508', '8635',
         'Autres valeurs mobilières de placement et autres créances assimilées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8648, 'PCGAFR14-DEV', 'FINAN', '5081', '8647', 'Autres valeurs mobilières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8649, 'PCGAFR14-DEV', 'FINAN', '5082', '8647', 'Bons de souscription', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8650, 'PCGAFR14-DEV', 'FINAN', '5088', '8647',
         'Intérêts courus sur obligations, bons et valeurs assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8651, 'PCGAFR14-DEV', 'FINAN', '509', '8635',
         'Versements restant à effectuer sur valeurs mobilières de placement non libérées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8652, 'PCGAFR14-DEV', 'FINAN', '51', '8634', 'Banques, établissements financiers et assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8653, 'PCGAFR14-DEV', 'FINAN', '511', '8652', 'Valeurs à l''encaissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8654, 'PCGAFR14-DEV', 'FINAN', '5111', '8653', 'Coupons échus à l''encaissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8655, 'PCGAFR14-DEV', 'FINAN', '5112', '8653', 'Chèques à encaisser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8656, 'PCGAFR14-DEV', 'FINAN', '5113', '8653', 'Effets à l''encaissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8657, 'PCGAFR14-DEV', 'FINAN', '5114', '8653', 'Effets à l''escompte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8658, 'PCGAFR14-DEV', 'FINAN', '512', '8652', 'Banques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8659, 'PCGAFR14-DEV', 'FINAN', '514', '8652', 'Chèques postaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8660, 'PCGAFR14-DEV', 'FINAN', '515', '8652', 'Caisses du Trésor et des établissements publics',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8661, 'PCGAFR14-DEV', 'FINAN', '516', '8652', 'Sociétés de Bourse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8662, 'PCGAFR14-DEV', 'FINAN', '517', '8652', 'Autres organismes financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8663, 'PCGAFR14-DEV', 'FINAN', '518', '8652', 'Intérêts courus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8664, 'PCGAFR14-DEV', 'FINAN', '5181', '8663', 'Intérêts courus à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8665, 'PCGAFR14-DEV', 'FINAN', '5188', '8663', 'Intérêts courus à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8666, 'PCGAFR14-DEV', 'FINAN', '519', '8652', 'Concours bancaires courants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8667, 'PCGAFR14-DEV', 'FINAN', '5191', '8666', 'Crédit bancaires de campagne', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8668, 'PCGAFR14-DEV', 'FINAN', '5193', '8666', 'Mobilisation de créances nées à l''étranger', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8669, 'PCGAFR14-DEV', 'FINAN', '5197', '8666', 'Crédits de mobilisation de créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8670, 'PCGAFR14-DEV', 'FINAN', '5198', '8666', 'Intérêts courus sur concours bancaires courants',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8671, 'PCGAFR14-DEV', 'FINAN', '52', '8634', 'Instruments de trésorerie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8672, 'PCGAFR14-DEV', 'FINAN', '53', '8634', 'Caisse', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8673, 'PCGAFR14-DEV', 'FINAN', '54', '8634', 'Régies d''avance et accréditifs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8674, 'PCGAFR14-DEV', 'FINAN', '58', '8634', 'Virements internes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8675, 'PCGAFR14-DEV', 'FINAN', '59', '8634', 'Dépréciations des comptes financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8676, 'PCGAFR14-DEV', 'FINAN', '590', '8675', 'Dépréciations des valeurs mobilières de placement',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8677, 'PCGAFR14-DEV', 'FINAN', '5903', '8676', 'Actions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8678, 'PCGAFR14-DEV', 'FINAN', '5904', '8676', 'Autres titres conférant un droit de propriété', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8679, 'PCGAFR14-DEV', 'FINAN', '5906', '8676', 'Obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8680, 'PCGAFR14-DEV', 'FINAN', '5908', '8676',
         'Autres valeurs mobilières de placement et créances assimilées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8681, 'PCGAFR14-DEV', 'EXPENSE', '6', '0', 'Comptes de charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8682, 'PCGAFR14-DEV', 'EXPENSE', '60', '8681', 'Achats (sauf 603)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8683, 'PCGAFR14-DEV', 'EXPENSE', '601', '8682', 'Achats stockés - approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8684, 'PCGAFR14-DEV', 'EXPENSE', '6011', '8683', 'Engrais et amendements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8685, 'PCGAFR14-DEV', 'EXPENSE', '6012', '8683', 'Semences et plants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8686, 'PCGAFR14-DEV', 'EXPENSE', '6013', '8683', 'Produits de défense des végétaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8687, 'PCGAFR14-DEV', 'EXPENSE', '6014', '8683', 'Aliments du bétail', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8688, 'PCGAFR14-DEV', 'EXPENSE', '6015', '8683', 'Produits de défense des animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8689, 'PCGAFR14-DEV', 'EXPENSE', '6016', '8683', 'Produits de reproduction animale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8690, 'PCGAFR14-DEV', 'EXPENSE', '6017', '8683', 'Emballages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8691, 'PCGAFR14-DEV', 'EXPENSE', '60171', '8690', 'Emballages perdus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8692, 'PCGAFR14-DEV', 'EXPENSE', '60172', '8690', 'Emballages récupérables non identifiables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8693, 'PCGAFR14-DEV', 'EXPENSE', '60173', '8690', 'Emballages à usage mixte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8694, 'PCGAFR14-DEV', 'EXPENSE', '6018', '8683', 'Combustibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8695, 'PCGAFR14-DEV', 'EXPENSE', '602', '8682', 'Achats stockés - Autres approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8696, 'PCGAFR14-DEV', 'EXPENSE', '6021', '8695', 'Carburants et lubrifiants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8697, 'PCGAFR14-DEV', 'EXPENSE', '6022', '8695', 'Produits d''entretien', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8698, 'PCGAFR14-DEV', 'EXPENSE', '6023', '8695', 'Fournitures d''atelier et de magasin', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8699, 'PCGAFR14-DEV', 'EXPENSE', '6024', '8695', 'Fournitures de bureau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8700, 'PCGAFR14-DEV', 'EXPENSE', '6025', '8695', 'Denrées et fournitures pour le personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8701, 'PCGAFR14-DEV', 'EXPENSE', '6026', '8695', 'Matériaux divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8702, 'PCGAFR14-DEV', 'EXPENSE', '6027', '8695', 'Autres fournitures consommables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8703, 'PCGAFR14-DEV', 'EXPENSE', '6028', '8695', 'Matières premières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8704, 'PCGAFR14-DEV', 'EXPENSE', '603', '8682',
         'Variations des stocks (approvisionnements et marchandises)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8705, 'PCGAFR14-DEV', 'EXPENSE', '6031', '8704', 'Variation des stocks d''approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8706, 'PCGAFR14-DEV', 'EXPENSE', '6032', '8704',
         'Variation des stocks d''autres approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8707, 'PCGAFR14-DEV', 'EXPENSE', '6037', '8704', 'Variation des stocks de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8708, 'PCGAFR14-DEV', 'EXPENSE', '604', '8682', 'Achats d''animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8709, 'PCGAFR14-DEV', 'EXPENSE', '6041', '8708', 'Animaux reproducteurs (adultes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8710, 'PCGAFR14-DEV', 'EXPENSE', '6042', '8708',
         'Animaux reproducteurs (jeunes de renouvellement)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8711, 'PCGAFR14-DEV', 'EXPENSE', '6045', '8708', 'Autres animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8712, 'PCGAFR14-DEV', 'EXPENSE', '605', '8682',
         'Achats de travaux et services incorporés aux produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8713, 'PCGAFR14-DEV', 'EXPENSE', '6051', '8712',
         'Achats de travaux et services incorporés pour productions végétales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8714, 'PCGAFR14-DEV', 'EXPENSE', '6054', '8712',
         'Achats de travaux et services incorporés pour productions animales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8715, 'PCGAFR14-DEV', 'EXPENSE', '6058', '8712', 'Autres achats de travaux et services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8716, 'PCGAFR14-DEV', 'EXPENSE', '606', '8682', 'Achats non stockés et fournitures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8717, 'PCGAFR14-DEV', 'EXPENSE', '6061', '8716', 'Eau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8718, 'PCGAFR14-DEV', 'EXPENSE', '6062', '8716', 'Gaz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8719, 'PCGAFR14-DEV', 'EXPENSE', '6063', '8716', 'Electricités', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8720, 'PCGAFR14-DEV', 'EXPENSE', '6064', '8716', 'Carburants et lubrifiants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8721, 'PCGAFR14-DEV', 'EXPENSE', '6065', '8716', 'Eau d''irrigation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8722, 'PCGAFR14-DEV', 'EXPENSE', '6066', '8716', 'Fournitures d''entretien et de petit équipement',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8723, 'PCGAFR14-DEV', 'EXPENSE', '6067', '8716', 'Fournitures pour productions immobilisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8724, 'PCGAFR14-DEV', 'EXPENSE', '6068', '8716', 'Autres fournitures non stockés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8725, 'PCGAFR14-DEV', 'EXPENSE', '607', '8682', 'Achats de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8726, 'PCGAFR14-DEV', 'EXPENSE', '608', '8682', 'Frais accessoires sur achats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8727, 'PCGAFR14-DEV', 'EXPENSE', '609', '8682', 'Rabais, remises et ristournes obtenus sur achats',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8728, 'PCGAFR14-DEV', 'EXPENSE', '6091', '8727', 'RRR sur achats d''autres approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8729, 'PCGAFR14-DEV', 'EXPENSE', '6092', '8727', 'RRR sur achats d''approvisionnements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8730, 'PCGAFR14-DEV', 'EXPENSE', '6094', '8727', 'RRR sur achats d''animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8731, 'PCGAFR14-DEV', 'EXPENSE', '6095', '8727',
         'RRR sur achats de travaux et services incorporés aux produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8732, 'PCGAFR14-DEV', 'EXPENSE', '6096', '8727', 'RRR sur achats de fournitures non stockés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8733, 'PCGAFR14-DEV', 'EXPENSE', '6097', '8727', 'RRR sur achats de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8734, 'PCGAFR14-DEV', 'EXPENSE', '6098', '8727', 'Rabais, remises et ristournes non affectés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8735, 'PCGAFR14-DEV', 'EXPENSE', '61', '8681', 'Services extérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8736, 'PCGAFR14-DEV', 'EXPENSE', '611', '8735', 'Sous-traitance générale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8737, 'PCGAFR14-DEV', 'EXPENSE', '612', '8735', 'Redevances de crédit-bail', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8738, 'PCGAFR14-DEV', 'EXPENSE', '6122', '8737', 'Redevances de crédit-bail mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8739, 'PCGAFR14-DEV', 'EXPENSE', '6125', '8737', 'Redevances de crédit-bail immobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8740, 'PCGAFR14-DEV', 'EXPENSE', '613', '8735', 'Locations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8741, 'PCGAFR14-DEV', 'EXPENSE', '6131', '8740', 'Fermages et loyers du foncier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8742, 'PCGAFR14-DEV', 'EXPENSE', '6132', '8740', 'Locations de matériel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8743, 'PCGAFR14-DEV', 'EXPENSE', '6134', '8740', 'Locations d''animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8744, 'PCGAFR14-DEV', 'EXPENSE', '6136', '8740', 'Malis sur emballages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8745, 'PCGAFR14-DEV', 'EXPENSE', '6138', '8740', 'Autres locations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8746, 'PCGAFR14-DEV', 'EXPENSE', '614', '8735', 'Charges locatives et de copropriété', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8747, 'PCGAFR14-DEV', 'EXPENSE', '6141', '8746', 'Charges locatives du foncier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8748, 'PCGAFR14-DEV', 'EXPENSE', '6142', '8746', 'Charges locatives du matériel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8749, 'PCGAFR14-DEV', 'EXPENSE', '6144', '8746', 'Charges locatives des animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8750, 'PCGAFR14-DEV', 'EXPENSE', '6148', '8746', 'Autres charges locatives et de copropriété', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8751, 'PCGAFR14-DEV', 'EXPENSE', '615', '8735', 'Entretien et réparations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8752, 'PCGAFR14-DEV', 'EXPENSE', '6151', '8751', 'Terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8753, 'PCGAFR14-DEV', 'EXPENSE', '6152', '8751', 'Agencements et aménagements de terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8754, 'PCGAFR14-DEV', 'EXPENSE', '6153', '8751', 'Constructions (sur sol propre)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8755, 'PCGAFR14-DEV', 'EXPENSE', '6154', '8751', 'Constructions (sur sol d''autrui)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8756, 'PCGAFR14-DEV', 'EXPENSE', '6155', '8751', 'Installations techniques, matériel et outillage',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8757, 'PCGAFR14-DEV', 'EXPENSE', '61551', '6155', 'Matériel et outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8758, 'PCGAFR14-DEV', 'EXPENSE', '61552', '6155', 'Maintenance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8759, 'PCGAFR14-DEV', 'EXPENSE', '6156', '8751', 'Plantations pérennes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8760, 'PCGAFR14-DEV', 'EXPENSE', '6157', '8751', 'Autres végétaux immobilisés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8761, 'PCGAFR14-DEV', 'EXPENSE', '6158', '8751',
         'Autres immobilisations corporelles (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8762, 'PCGAFR14-DEV', 'EXPENSE', '616', '8735', 'Primes d''assurances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8763, 'PCGAFR14-DEV', 'EXPENSE', '6161', '8762', 'Multirisques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8764, 'PCGAFR14-DEV', 'EXPENSE', '6162', '8762', 'Assurance obligatoire dommage construction', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8765, 'PCGAFR14-DEV', 'EXPENSE', '6163', '8762', 'Assurance - transport (sur achats)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8766, 'PCGAFR14-DEV', 'EXPENSE', '6164', '8762', 'Assurance - transport (sur ventes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8767, 'PCGAFR14-DEV', 'EXPENSE', '6165', '8762', 'Assurance - transport (sur autres biens)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8768, 'PCGAFR14-DEV', 'EXPENSE', '6166', '8762', 'Risques d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8769, 'PCGAFR14-DEV', 'EXPENSE', '6167', '8762', 'Insolvabilité clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8770, 'PCGAFR14-DEV', 'EXPENSE', '6168', '8762', 'Autres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8771, 'PCGAFR14-DEV', 'EXPENSE', '617', '8735', 'Etudes et recherches', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8772, 'PCGAFR14-DEV', 'EXPENSE', '618', '8735', 'Divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8773, 'PCGAFR14-DEV', 'EXPENSE', '6181', '8772', 'Documentation générale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8774, 'PCGAFR14-DEV', 'EXPENSE', '6183', '8772', 'Documentation technique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8775, 'PCGAFR14-DEV', 'EXPENSE', '6185', '8772', 'Frais de colloques, séminaires, conférences', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8776, 'PCGAFR14-DEV', 'EXPENSE', '619', '8735',
         'Rabais, remises et ristournes obtenus sur services extérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8777, 'PCGAFR14-DEV', 'EXPENSE', '62', '8681', 'Autres services extérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8778, 'PCGAFR14-DEV', 'EXPENSE', '621', '8777', 'Personnel extérieur à l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8779, 'PCGAFR14-DEV', 'EXPENSE', '6211', '8778', 'Personnel intérimaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8780, 'PCGAFR14-DEV', 'EXPENSE', '6214', '8778', 'Personnel détaché ou prêté à l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8781, 'PCGAFR14-DEV', 'EXPENSE', '622', '8777', 'Rémunérations d''intermédiaires et honoraires',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8782, 'PCGAFR14-DEV', 'EXPENSE', '6221', '8781', 'Commissions et courtages sur achats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8783, 'PCGAFR14-DEV', 'EXPENSE', '6222', '8781', 'Commissions et courtages sur ventes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8784, 'PCGAFR14-DEV', 'EXPENSE', '6223', '8781', 'Rémunérations des transitaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8785, 'PCGAFR14-DEV', 'EXPENSE', '6224', '8781', 'Rémunérations d''affacturage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8786, 'PCGAFR14-DEV', 'EXPENSE', '6225', '8781', 'Honoraires vétérinaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8787, 'PCGAFR14-DEV', 'EXPENSE', '6226', '8781', 'Autres honoraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8788, 'PCGAFR14-DEV', 'EXPENSE', '6227', '8781', 'Frais d''actes et de contentieux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8789, 'PCGAFR14-DEV', 'EXPENSE', '6228', '8781', 'Divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8790, 'PCGAFR14-DEV', 'EXPENSE', '623', '8777', 'Publicité, publications, relations publiques', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8791, 'PCGAFR14-DEV', 'EXPENSE', '6231', '8790', 'Annonces et insertions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8792, 'PCGAFR14-DEV', 'EXPENSE', '6232', '8790', 'Echantillons', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8793, 'PCGAFR14-DEV', 'EXPENSE', '6233', '8790', 'Emplacements foires et expositions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8794, 'PCGAFR14-DEV', 'EXPENSE', '6234', '8790', 'Cadeaux à la clientèle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8795, 'PCGAFR14-DEV', 'EXPENSE', '6235', '8790', 'Primes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8796, 'PCGAFR14-DEV', 'EXPENSE', '6236', '8790', 'Catalogues et imprimés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8797, 'PCGAFR14-DEV', 'EXPENSE', '6237', '8790', 'Publications', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8798, 'PCGAFR14-DEV', 'EXPENSE', '6238', '8790', 'Divers (pourboire, dons courants, etc)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8799, 'PCGAFR14-DEV', 'EXPENSE', '624', '8777',
         'Transports de biens et transports collectifs du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8800, 'PCGAFR14-DEV', 'EXPENSE', '6241', '8799', 'Transports sur achats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8801, 'PCGAFR14-DEV', 'EXPENSE', '6242', '8799', 'Transports sur ventes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8802, 'PCGAFR14-DEV', 'EXPENSE', '6243', '8799', 'Transports entre établissements ou chantiers',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8803, 'PCGAFR14-DEV', 'EXPENSE', '6244', '8799', 'Transports administratifs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8804, 'PCGAFR14-DEV', 'EXPENSE', '6247', '8799', 'Transports collectifs du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8805, 'PCGAFR14-DEV', 'EXPENSE', '6248', '8799', 'Autres transports', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8806, 'PCGAFR14-DEV', 'EXPENSE', '625', '8777', 'Déplacements, missions et réceptions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8807, 'PCGAFR14-DEV', 'EXPENSE', '6251', '8806', 'Voyages et déplacements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8808, 'PCGAFR14-DEV', 'EXPENSE', '6255', '8806', 'Frais de déménagement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8809, 'PCGAFR14-DEV', 'EXPENSE', '6256', '8806', 'Missions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8810, 'PCGAFR14-DEV', 'EXPENSE', '6257', '8806', 'Réceptions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8811, 'PCGAFR14-DEV', 'EXPENSE', '626', '8777', 'Frais postaux et de télécommunications', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8812, 'PCGAFR14-DEV', 'EXPENSE', '627', '8777', 'Services bancaires et assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8813, 'PCGAFR14-DEV', 'EXPENSE', '6271', '8812', 'Frais sur titres (achat, vente, garde)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8814, 'PCGAFR14-DEV', 'EXPENSE', '6272', '8812', 'Commissions et frais sur émission d''emprunts',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8815, 'PCGAFR14-DEV', 'EXPENSE', '6275', '8812', 'Frais sur effets (commissions d''endos…)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8816, 'PCGAFR14-DEV', 'EXPENSE', '6276', '8812', 'Location de coffres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8817, 'PCGAFR14-DEV', 'EXPENSE', '6278', '8812',
         'Autres frais et commissions sur prestations de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8818, 'PCGAFR14-DEV', 'EXPENSE', '628', '8777', 'Divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8819, 'PCGAFR14-DEV', 'EXPENSE', '6281', '8818',
         'Cotisations professionnelles (productions animales)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8820, 'PCGAFR14-DEV', 'EXPENSE', '6284', '8818',
         'Cotisations professionnelles (productions végétales)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8821, 'PCGAFR14-DEV', 'EXPENSE', '6286', '8818', 'Autres cotisations professionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8822, 'PCGAFR14-DEV', 'EXPENSE', '6287', '8818', 'Frais de recrutement de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8823, 'PCGAFR14-DEV', 'EXPENSE', '6288', '8818', 'Autres services extérieurs divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8824, 'PCGAFR14-DEV', 'EXPENSE', '629', '8777',
         'Rabais, remises et ristournes obtenus sur autres services extérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8825, 'PCGAFR14-DEV', 'EXPENSE', '63', '8681', 'Impôts, taxes et versements assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8826, 'PCGAFR14-DEV', 'EXPENSE', '631', '8825',
         'Impôts, taxes et versements assimilés sur rémunérations (administrations des impôts)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8827, 'PCGAFR14-DEV', 'EXPENSE', '6311', '8826', 'Taxe sur les salaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8828, 'PCGAFR14-DEV', 'EXPENSE', '6312', '8826', 'Taxe d''apprentissage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8829, 'PCGAFR14-DEV', 'EXPENSE', '6313', '8826',
         'Participation des employeurs à la formation professionnelle continue', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8830, 'PCGAFR14-DEV', 'EXPENSE', '6314', '8826',
         'Cotisation pour défaut d''investissement obligatoire dans la construction', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8831, 'PCGAFR14-DEV', 'EXPENSE', '6318', '8826', 'Autres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8832, 'PCGAFR14-DEV', 'EXPENSE', '633', '8825',
         'Impôts, taxes et versements assimilés sur rémunérations (autres organismes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8833, 'PCGAFR14-DEV', 'EXPENSE', '6331', '8832', 'Versement de transport', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8834, 'PCGAFR14-DEV', 'EXPENSE', '6332', '8832', 'Allocations logement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8835, 'PCGAFR14-DEV', 'EXPENSE', '6333', '8832',
         'Participation des employeurs à la formation professionnelle continue', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8836, 'PCGAFR14-DEV', 'EXPENSE', '6334', '8832',
         'Participation des employeurs à l''effort de construction', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8837, 'PCGAFR14-DEV', 'EXPENSE', '6335', '8832',
         'Versements libératoires ouvrant droit à l''exonération de la taxe d''apprentissage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8838, 'PCGAFR14-DEV', 'EXPENSE', '6338', '8832', 'Autres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8839, 'PCGAFR14-DEV', 'EXPENSE', '634', '8825',
         'Taxes spécifiques sur les produits de l''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8840, 'PCGAFR14-DEV', 'EXPENSE', '6341', '8839', 'Taxes spécifiques sur les produits végétaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8841, 'PCGAFR14-DEV', 'EXPENSE', '6342', '8839', 'Taxes spécifiques sur les produits animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8842, 'PCGAFR14-DEV', 'EXPENSE', '6343', '8839', 'Taxes spécifiques sur les produits transformés',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8843, 'PCGAFR14-DEV', 'EXPENSE', '6344', '8839', 'Taxes spécifiques sur les animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8844, 'PCGAFR14-DEV', 'EXPENSE', '6345', '8839', 'Pénalités sur productions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8845, 'PCGAFR14-DEV', 'EXPENSE', '6348', '8839', 'Taxes spécifiques sur autres produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8846, 'PCGAFR14-DEV', 'EXPENSE', '635', '8825',
         'Autres impôts, taxes et versements assimilés (administrations des impôts)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8847, 'PCGAFR14-DEV', 'EXPENSE', '6351', '8846', 'Taxe professionnelle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8848, 'PCGAFR14-DEV', 'EXPENSE', '6352', '8846', 'Taxes foncières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8849, 'PCGAFR14-DEV', 'EXPENSE', '6353', '8846', 'Autres impôts locaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8850, 'PCGAFR14-DEV', 'EXPENSE', '6354', '8846',
         'Autres impôts directs (sauf impôts sur les sociétés)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8851, 'PCGAFR14-DEV', 'EXPENSE', '6355', '8846',
         'Taxe sur le chiffre d''affaires non récupérables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8852, 'PCGAFR14-DEV', 'EXPENSE', '6356', '8846', 'Impôts indirects', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8853, 'PCGAFR14-DEV', 'EXPENSE', '6357', '8846', 'Droits d''enregistrement et de timbre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8854, 'PCGAFR14-DEV', 'EXPENSE', '6358', '8846', 'Autres droits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8855, 'PCGAFR14-DEV', 'EXPENSE', '637', '8825',
         'Autres impôts, taxes et versements assimilés (autres organismes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8856, 'PCGAFR14-DEV', 'EXPENSE', '6371', '8855',
         'Contribution sociale de solidarité à la charge des sociétés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8857, 'PCGAFR14-DEV', 'EXPENSE', '6372', '8855',
         'Taxes perçues par les organismes publics internationaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8858, 'PCGAFR14-DEV', 'EXPENSE', '6374', '8855', 'Impôts et taxes exigibles à l''étranger', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8859, 'PCGAFR14-DEV', 'EXPENSE', '6378', '8855', 'Taxes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8860, 'PCGAFR14-DEV', 'EXPENSE', '64', '8681', 'Charges de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8861, 'PCGAFR14-DEV', 'EXPENSE', '641', '8860', 'Rémunérations du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8862, 'PCGAFR14-DEV', 'EXPENSE', '6411', '8861', 'Salaires (personnel salarié)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8863, 'PCGAFR14-DEV', 'EXPENSE', '64111', '8862', 'Personnel permanent ou régulier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8864, 'PCGAFR14-DEV', 'EXPENSE', '64115', '8862', 'Personnel temporaire ou occasionnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8865, 'PCGAFR14-DEV', 'EXPENSE', '6412', '8861', 'Rémunérations (associés d''exploitation)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8866, 'PCGAFR14-DEV', 'EXPENSE', '6413', '8861',
         'Rémunérations (administrateurs, gérants, associés)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8867, 'PCGAFR14-DEV', 'EXPENSE', '6415', '8861', 'Congés payés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8868, 'PCGAFR14-DEV', 'EXPENSE', '6416', '8861', 'Primes et gratifications', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8869, 'PCGAFR14-DEV', 'EXPENSE', '6417', '8861', 'Indemnités et avantages en espèces divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8870, 'PCGAFR14-DEV', 'EXPENSE', '6418', '8861', 'Avantages en nature', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8871, 'PCGAFR14-DEV', 'EXPENSE', '644', '8860', 'Rémunération du travail de l''exploitant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8872, 'PCGAFR14-DEV', 'EXPENSE', '645', '8860', 'Charges de sécurité sociale et de prévoyance', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8873, 'PCGAFR14-DEV', 'EXPENSE', '6451', '8872', 'Cotisations à la Mutualité Sociale Agricole', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8874, 'PCGAFR14-DEV', 'EXPENSE', '6452', '8872', 'Cotisations aux mutuelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8875, 'PCGAFR14-DEV', 'EXPENSE', '6453', '8872', 'Cotisations aux caisses de retraites', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8876, 'PCGAFR14-DEV', 'EXPENSE', '6454', '8872', 'Cotisations aux caisses de chômages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8877, 'PCGAFR14-DEV', 'EXPENSE', '6458', '8872', 'Cotisations aux autres organismes sociaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8878, 'PCGAFR14-DEV', 'EXPENSE', '646', '8860',
         'Cotisations sociales personnelles de l''exploitant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8879, 'PCGAFR14-DEV', 'EXPENSE', '647', '8860', 'Autres charges sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8880, 'PCGAFR14-DEV', 'EXPENSE', '6472', '8879',
         'Versements aux comités d''entreprise et d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8881, 'PCGAFR14-DEV', 'EXPENSE', '6474', '8879', 'Versements aux autres œuvres sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8882, 'PCGAFR14-DEV', 'EXPENSE', '6475', '8879', 'Médecine du travail, pharmacie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8883, 'PCGAFR14-DEV', 'EXPENSE', '6478', '8879', 'Autres charges sociales diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8884, 'PCGAFR14-DEV', 'EXPENSE', '648', '8860', 'Autres charges de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8885, 'PCGAFR14-DEV', 'EXPENSE', '65', '8681', 'Autres charges de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8886, 'PCGAFR14-DEV', 'EXPENSE', '651', '8885',
         'Redevances pour concessions, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8887, 'PCGAFR14-DEV', 'EXPENSE', '653', '8885', 'Jetons de présence', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8888, 'PCGAFR14-DEV', 'EXPENSE', '654', '8885', 'Pertes sur créances irrécouvrables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8889, 'PCGAFR14-DEV', 'EXPENSE', '6541', '8888', 'Créances de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8890, 'PCGAFR14-DEV', 'EXPENSE', '6544', '8888', 'Créances des exercices antérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8891, 'PCGAFR14-DEV', 'EXPENSE', '655', '8885',
         'Quotes-parts de résultat sur opérations faites en commun', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8892, 'PCGAFR14-DEV', 'EXPENSE', '6551', '8891',
         'Quote-part de bénéfice transférée (comptabilité du gérant)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8893, 'PCGAFR14-DEV', 'EXPENSE', '6555', '8891',
         'Quote-part de perte supportée (comptabilité des associés non gérants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8894, 'PCGAFR14-DEV', 'EXPENSE', '656', '8885',
         'Valeurs comptables des éléments d''actif cédés (cessions courantes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8895, 'PCGAFR14-DEV', 'EXPENSE', '6561', '8894', 'Animaux reproducteurs adultes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8896, 'PCGAFR14-DEV', 'EXPENSE', '6562', '8894',
         'Animaux reproducteurs (jeunes de renouvellement)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8897, 'PCGAFR14-DEV', 'EXPENSE', '658', '8885', 'Charges diverses de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8898, 'PCGAFR14-DEV', 'EXPENSE', '66', '8681', 'Charges financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8899, 'PCGAFR14-DEV', 'EXPENSE', '661', '8898', 'Charges d''intérêts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8900, 'PCGAFR14-DEV', 'EXPENSE', '6611', '8899', 'Intérêts des emprunts fonciers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8901, 'PCGAFR14-DEV', 'EXPENSE', '6612', '8899',
         'Intérêts des autres emprunts à moyen et long terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8902, 'PCGAFR14-DEV', 'EXPENSE', '6613', '8899', 'Intérêts des emprunts à court terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8903, 'PCGAFR14-DEV', 'EXPENSE', '6614', '8899', 'Intérêts des crédits bancaires de campagne', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8904, 'PCGAFR14-DEV', 'EXPENSE', '6615', '8899',
         'Intérêts des dettes rattachées à des participations à des organismes professionnels agricoles (autres que les établissements de crédit)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8905, 'PCGAFR14-DEV', 'EXPENSE', '6616', '8899',
         'Intérêts des dettes rattachées à d''autres participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8906, 'PCGAFR14-DEV', 'EXPENSE', '6617', '8899', 'Intérêts du crédit fournisseur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8907, 'PCGAFR14-DEV', 'EXPENSE', '6618', '8899', 'Autres charges d''intérêt', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8908, 'PCGAFR14-DEV', 'EXPENSE', '66181', '8907', 'Autres intérêts bancaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8909, 'PCGAFR14-DEV', 'EXPENSE', '66182', '8907',
         'Intérêts des comptes courants et dépôts créditeurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8910, 'PCGAFR14-DEV', 'EXPENSE', '66183', '8907', 'Intérêts des obligations cautionnées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8911, 'PCGAFR14-DEV', 'EXPENSE', '66188', '8907', 'Intérêts des autres dettes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8912, 'PCGAFR14-DEV', 'EXPENSE', '664', '8898', 'Pertes sur créances liées à des participations',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8913, 'PCGAFR14-DEV', 'EXPENSE', '665', '8898', 'Escomptes accordés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8914, 'PCGAFR14-DEV', 'EXPENSE', '666', '8898', 'Pertes de change', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8915, 'PCGAFR14-DEV', 'EXPENSE', '667', '8898',
         'Charges nettes sur cessions de valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8916, 'PCGAFR14-DEV', 'EXPENSE', '668', '8898', 'Autres charges financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8917, 'PCGAFR14-DEV', 'EXPENSE', '67', '8681', 'Charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8918, 'PCGAFR14-DEV', 'EXPENSE', '671', '8917',
         'Charges exceptionnelles sur opérations de gestion', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8919, 'PCGAFR14-DEV', 'EXPENSE', '6711', '8918',
         'Pénalités sur marchés (et dédits payés sur achats et ventes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8920, 'PCGAFR14-DEV', 'EXPENSE', '6712', '8918', 'Pénalités, amendes fiscales et pénales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8921, 'PCGAFR14-DEV', 'EXPENSE', '6713', '8918', 'Dons, libéralités', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8922, 'PCGAFR14-DEV', 'EXPENSE', '6714', '8918',
         'Créances devenues irrécouvrables dans l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8923, 'PCGAFR14-DEV', 'EXPENSE', '6715', '8918', 'Subventions accordées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8924, 'PCGAFR14-DEV', 'EXPENSE', '6717', '8918',
         'Rappel d''impôts (autres qu''impôts sur les bénéfices)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8925, 'PCGAFR14-DEV', 'EXPENSE', '6718', '8918',
         'Autres charges exceptionnelles sur opérations de gestion', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8926, 'PCGAFR14-DEV', 'EXPENSE', '672', '8917', 'Charges sur exercices antérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8927, 'PCGAFR14-DEV', 'EXPENSE', '673', '8917',
         'Charges exeptionnelles relatives aux pénalités statutaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8928, 'PCGAFR14-DEV', 'EXPENSE', '6731', '8927', 'Indemnités compensatrices', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8929, 'PCGAFR14-DEV', 'EXPENSE', '6733', '8927', 'Pénalités subies en tant qu''associé défaillant',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8930, 'PCGAFR14-DEV', 'EXPENSE', '6735', '8927', 'Frais de poursuite', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8931, 'PCGAFR14-DEV', 'EXPENSE', '675', '8917', 'Valeurs comptables des éléments d''actif cédés',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8932, 'PCGAFR14-DEV', 'EXPENSE', '6751', '8931', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8933, 'PCGAFR14-DEV', 'EXPENSE', '6752', '8931',
         'Immobilisations corporelles (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8934, 'PCGAFR14-DEV', 'EXPENSE', '6754', '8931', 'Immobilisations corporelles (biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8935, 'PCGAFR14-DEV', 'EXPENSE', '6756', '8931', 'Immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8936, 'PCGAFR14-DEV', 'EXPENSE', '678', '8917', 'Autres charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8937, 'PCGAFR14-DEV', 'EXPENSE', '6781', '8936', 'Malis provenant de clauses d''indexation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8938, 'PCGAFR14-DEV', 'EXPENSE', '6782', '8936', 'Lots', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8939, 'PCGAFR14-DEV', 'EXPENSE', '6783', '8936',
         'Malis provenant du rachat par l''entreprise d''actions et obligations émises par elle-même', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8940, 'PCGAFR14-DEV', 'EXPENSE', '6788', '8936', 'Charges exceptionnelles diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8941, 'PCGAFR14-DEV', 'EXPENSE', '68', '8681',
         'Dotations aux amortissements, aux dépréciations et aux provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8942, 'PCGAFR14-DEV', 'EXPENSE', '681', '8941',
         'Dotations aux amortissements, aux dépréciations et aux provisions - Charges d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8943, 'PCGAFR14-DEV', 'EXPENSE', '6811', '8942',
         'Dotations aux amortissements sur immobilisations incorporelles et corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8944, 'PCGAFR14-DEV', 'EXPENSE', '68111', '8943', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8945, 'PCGAFR14-DEV', 'EXPENSE', '68112', '8943',
         'Immobilisations corporelles (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8946, 'PCGAFR14-DEV', 'EXPENSE', '68114', '8943', 'Immobilisations corporelles (biens vivants)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8947, 'PCGAFR14-DEV', 'EXPENSE', '6812', '8942',
         'Dotations aux amortissements des charges d''exploitation à répartir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8948, 'PCGAFR14-DEV', 'EXPENSE', '6815', '8942', 'Dotations aux provisions d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8949, 'PCGAFR14-DEV', 'EXPENSE', '6816', '8942',
         'Dotations pour dépréciations des immobilisations incorporelles et corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8950, 'PCGAFR14-DEV', 'EXPENSE', '68161', '8949', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8951, 'PCGAFR14-DEV', 'EXPENSE', '68162', '8949',
         'Immobilisations corporelles (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8952, 'PCGAFR14-DEV', 'EXPENSE', '68164', '8949', 'Immobilisations corporelles (biens vivants)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8953, 'PCGAFR14-DEV', 'EXPENSE', '6817', '8942',
         'Dotations pour dépréciations des actifs circulants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8954, 'PCGAFR14-DEV', 'EXPENSE', '68173', '8953', 'Stocks et en-cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8955, 'PCGAFR14-DEV', 'EXPENSE', '68174', '8953', 'Créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8956, 'PCGAFR14-DEV', 'EXPENSE', '686', '8941',
         'Dotations aux amortissements, aux dépréciations et aux provisions - Charges financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8957, 'PCGAFR14-DEV', 'EXPENSE', '6861', '8956',
         'Dotations aux amortissements des primes de remboursement des obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8958, 'PCGAFR14-DEV', 'EXPENSE', '6865', '8956', 'Dotations aux provisions financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8959, 'PCGAFR14-DEV', 'EXPENSE', '6866', '8956',
         'Dotations pour dépréciations des éléments financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8960, 'PCGAFR14-DEV', 'EXPENSE', '68662', '8959', 'Immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8961, 'PCGAFR14-DEV', 'EXPENSE', '68665', '8959', 'Valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8962, 'PCGAFR14-DEV', 'EXPENSE', '6868', '8956', 'Autres dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8963, 'PCGAFR14-DEV', 'EXPENSE', '687', '8941',
         'Dotations aux amortissements, aux dépréciations et aux provisions - Charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8964, 'PCGAFR14-DEV', 'EXPENSE', '6871', '8963',
         'Dotations aux amortissements exceptionnels des immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8965, 'PCGAFR14-DEV', 'EXPENSE', '6872', '8963',
         'Dotations aux provisions réglementées (immobilisations)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8966, 'PCGAFR14-DEV', 'EXPENSE', '68725', '8965', 'Amortissements dérogatoires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8967, 'PCGAFR14-DEV', 'EXPENSE', '6873', '8963', 'Dotations aux provisions réglementées (stocks)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8968, 'PCGAFR14-DEV', 'EXPENSE', '6874', '8963', 'Dotations aux autres provisions réglementées',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8969, 'PCGAFR14-DEV', 'EXPENSE', '6875', '8963', 'Dotations aux provisions exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8970, 'PCGAFR14-DEV', 'EXPENSE', '6876', '8963', 'Dotations pour dépréciations exceptionnelles',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8971, 'PCGAFR14-DEV', 'EXPENSE', '69', '8681',
         'Participation des salariés - Impôts sur les bénéfices et assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8972, 'PCGAFR14-DEV', 'EXPENSE', '691', '8971', 'Participation des salariés aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8973, 'PCGAFR14-DEV', 'EXPENSE', '695', '8971', 'Impôts sur les bénéfices', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8974, 'PCGAFR14-DEV', 'EXPENSE', '6951', '8973', 'Impôts dus en France', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8975, 'PCGAFR14-DEV', 'EXPENSE', '6954', '8973', 'Impôts dus à l''étranger', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8976, 'PCGAFR14-DEV', 'EXPENSE', '697', '8971', 'Imposition forfaitaire annuelle des sociétés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8977, 'PCGAFR14-DEV', 'EXPENSE', '698', '8971', 'Intégration fiscale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8978, 'PCGAFR14-DEV', 'EXPENSE', '6981', '8977', 'Intégration fiscale - Charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8979, 'PCGAFR14-DEV', 'EXPENSE', '6982', '8977', 'Intégration fiscale - Produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8980, 'PCGAFR14-DEV', 'EXPENSE', '699', '8971', 'Produits - Reports en arrière des déficits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8981, 'PCGAFR14-DEV', 'INCOME', '7', '0', 'Comptes de produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8982, 'PCGAFR14-DEV', 'INCOME', '70', '8981', 'Ventes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8983, 'PCGAFR14-DEV', 'INCOME', '701', '8982', 'Ventes de produits végétaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8984, 'PCGAFR14-DEV', 'INCOME', '702', '8982', 'Ventes de produits animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8985, 'PCGAFR14-DEV', 'INCOME', '703', '8982', 'Ventes de produits transformés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8986, 'PCGAFR14-DEV', 'INCOME', '704', '8982', 'Ventes d''animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8987, 'PCGAFR14-DEV', 'INCOME', '7041', '8986', 'Animaux reproducteurs (adultes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8988, 'PCGAFR14-DEV', 'INCOME', '7042', '8986', 'Animaux reproducteurs (jeunes de renouvellement)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8989, 'PCGAFR14-DEV', 'INCOME', '7045', '8986', 'Autres animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8990, 'PCGAFR14-DEV', 'INCOME', '705', '8982', 'Ventes de produits résiduels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8991, 'PCGAFR14-DEV', 'INCOME', '706', '8982', 'Travaux à façon', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8992, 'PCGAFR14-DEV', 'INCOME', '707', '8982', 'Ventes de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8993, 'PCGAFR14-DEV', 'INCOME', '708', '8982', 'Produits des activités annexes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8994, 'PCGAFR14-DEV', 'INCOME', '7081', '8993',
         'Produits des services exploités dans l''intérêt du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8995, 'PCGAFR14-DEV', 'INCOME', '7082', '8993', 'Commissions et courtages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8996, 'PCGAFR14-DEV', 'INCOME', '7083', '8993', 'Locations diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8997, 'PCGAFR14-DEV', 'INCOME', '7084', '8993', 'Prestations de services à caractère accessoire',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8998, 'PCGAFR14-DEV', 'INCOME', '7085', '8993', 'Ports et frais accessoires facturés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 8999, 'PCGAFR14-DEV', 'INCOME', '7086', '8993', 'Bonis sur reprises d''emballages consignés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9000, 'PCGAFR14-DEV', 'INCOME', '7087', '8993',
         'Bonifications obtenues des clients et primes sur ventes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9001, 'PCGAFR14-DEV', 'INCOME', '7088', '8993', 'Autres produits d''activités annexes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9002, 'PCGAFR14-DEV', 'INCOME', '709', '8982',
         'Rabais, remises et ristournes accordés par l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9003, 'PCGAFR14-DEV', 'INCOME', '7091', '9002', 'RRR sur ventes de produits végétaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9004, 'PCGAFR14-DEV', 'INCOME', '7092', '9002', 'RRR sur ventes de produits animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9005, 'PCGAFR14-DEV', 'INCOME', '7093', '9002', 'RRR sur ventes de produits transformés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9006, 'PCGAFR14-DEV', 'INCOME', '7094', '9002', 'RRR sur ventes d''animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9007, 'PCGAFR14-DEV', 'INCOME', '7095', '9002', 'RRR sur ventes de produits résiduels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9008, 'PCGAFR14-DEV', 'INCOME', '7096', '9002', 'RRR sur travaux à façon', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9009, 'PCGAFR14-DEV', 'INCOME', '7097', '9002', 'RRR sur ventes de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9010, 'PCGAFR14-DEV', 'INCOME', '7098', '9002', 'RRR sur produits des activités annexes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9011, 'PCGAFR14-DEV', 'INCOME', '71', '8981',
         'Variation d''inventaire (biens vivants, en-cours de production de biens et services, produits)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9012, 'PCGAFR14-DEV', 'INCOME', '712', '9011',
         'Variation d''inventaire : animaux reproducteurs immobilisés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9013, 'PCGAFR14-DEV', 'INCOME', '7121', '9012', 'Animaux reproducteurs (adultes)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9014, 'PCGAFR14-DEV', 'INCOME', '7122', '9012', 'Animaux reproducteurs (jeunes de renouvellement)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9015, 'PCGAFR14-DEV', 'INCOME', '713', '9011',
         'Variation d''inventaire : biens vivants non immobilisés, en-cours de production de biens et services, produits',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9016, 'PCGAFR14-DEV', 'INCOME', '7131', '9015', 'Animaux (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9017, 'PCGAFR14-DEV', 'INCOME', '7132', '9015', 'Animaux (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9018, 'PCGAFR14-DEV', 'INCOME', '7133', '9015', 'Végétaux en terre (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9019, 'PCGAFR14-DEV', 'INCOME', '7134', '9015', 'Végétaux en terre (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9020, 'PCGAFR14-DEV', 'INCOME', '7135', '9015',
         'En-cours de production de biens et services (cycle long)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9021, 'PCGAFR14-DEV', 'INCOME', '7136', '9015',
         'En-cours de production de biens et services (cycle court)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9022, 'PCGAFR14-DEV', 'INCOME', '7137', '9015', 'Produits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9023, 'PCGAFR14-DEV', 'INCOME', '72', '8981', 'Production immobilisée et autoconsommée', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9024, 'PCGAFR14-DEV', 'INCOME', '721', '9023',
         'Production immobilisée - Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9025, 'PCGAFR14-DEV', 'INCOME', '722', '9023',
         'Production immobilisée - Immobilisations corporelles (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9026, 'PCGAFR14-DEV', 'INCOME', '724', '9023',
         'Production immobilisée - Immobilisations corporelles (biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9027, 'PCGAFR14-DEV', 'INCOME', '726', '9023', 'Production autoconsommée', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9028, 'PCGAFR14-DEV', 'INCOME', '74', '8981', 'Indemnités et Subventions d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9029, 'PCGAFR14-DEV', 'INCOME', '741', '9028', 'Remboursement forfaitaire de TVA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9030, 'PCGAFR14-DEV', 'INCOME', '742', '9028', 'Indemnités d''assurance (exploitation)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9031, 'PCGAFR14-DEV', 'INCOME', '743', '9028',
         'Indemnités du Fond national de garantie des calamités agricoles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9032, 'PCGAFR14-DEV', 'INCOME', '744', '9028', 'Autres indemnités d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9033, 'PCGAFR14-DEV', 'INCOME', '745', '9028', 'Subventions d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9034, 'PCGAFR14-DEV', 'INCOME', '7451', '9033', 'Subventions aux produits végétaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9035, 'PCGAFR14-DEV', 'INCOME', '7452', '9033', 'Subventions aux structures (et jachères)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9036, 'PCGAFR14-DEV', 'INCOME', '7453', '9033', 'Subventions au revenu', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9037, 'PCGAFR14-DEV', 'INCOME', '7454', '9033', 'Subventions aux animaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9038, 'PCGAFR14-DEV', 'INCOME', '7458', '9033', 'Autres subventions d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9039, 'PCGAFR14-DEV', 'INCOME', '75', '8981', 'Autres produits de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9040, 'PCGAFR14-DEV', 'INCOME', '751', '9039',
         'Redevances pour concessions, brevets, licences, marques, procédés, logiciels, droits et valeurs similaires',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9041, 'PCGAFR14-DEV', 'INCOME', '752', '9039',
         'Revenus des immeubles non affectés à des activités professionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9042, 'PCGAFR14-DEV', 'INCOME', '753', '9039',
         'Jetons de présence, rémunérations et indemnités d''administrateurs, etc', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9043, 'PCGAFR14-DEV', 'INCOME', '754', '9039',
         'Ristournes perçues des coopératives agricoles (provenant des excédents)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9044, 'PCGAFR14-DEV', 'INCOME', '755', '9039',
         'Quote-parts de résultat sur opérations faites en commun', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9045, 'PCGAFR14-DEV', 'INCOME', '7551', '9044',
         'Quote-part de perte transférée (comptabilité du gérant)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9046, 'PCGAFR14-DEV', 'INCOME', '7555', '9044',
         'Quote-part de bénéfice attribuée (comptabilité des associés non - gérants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9047, 'PCGAFR14-DEV', 'INCOME', '756', '9039',
         'Produits des cessions courantes d''éléments d''actif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9048, 'PCGAFR14-DEV', 'INCOME', '7561', '9047', 'Animaux reproducteurs adultes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9049, 'PCGAFR14-DEV', 'INCOME', '7562', '9047', 'Animaux reproducteurs (jeunes de renouvellement)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9050, 'PCGAFR14-DEV', 'INCOME', '758', '9039', 'Produits divers de gestion courante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9051, 'PCGAFR14-DEV', 'INCOME', '76', '8981', 'Produits financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9052, 'PCGAFR14-DEV', 'INCOME', '761', '9051', 'Produits de participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9053, 'PCGAFR14-DEV', 'INCOME', '7611', '9052', 'Revenus des titres de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9054, 'PCGAFR14-DEV', 'INCOME', '7612', '9052',
         'Revenus des participations à des organismes professionnels agricoles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9055, 'PCGAFR14-DEV', 'INCOME', '7616', '9052', 'Revenus sur autres formes de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9056, 'PCGAFR14-DEV', 'INCOME', '7617', '9052',
         'Revenus des créances rattachées à des participations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9057, 'PCGAFR14-DEV', 'INCOME', '762', '9051', 'Produits des autres immobilisations financières',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9058, 'PCGAFR14-DEV', 'INCOME', '7621', '9057', 'Revenus des titres immobilisés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9059, 'PCGAFR14-DEV', 'INCOME', '7626', '9057', 'Revenus des prêts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9060, 'PCGAFR14-DEV', 'INCOME', '7627', '9057', 'Revenus des créances immobilisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9061, 'PCGAFR14-DEV', 'INCOME', '763', '9051', 'Revenus des autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9062, 'PCGAFR14-DEV', 'INCOME', '7631', '9061', 'Revenus des créances commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9063, 'PCGAFR14-DEV', 'INCOME', '7638', '9061', 'Revenus des créances diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9064, 'PCGAFR14-DEV', 'INCOME', '764', '9051', 'Revenus des valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9065, 'PCGAFR14-DEV', 'INCOME', '765', '9051', 'Escomptes obtenus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9066, 'PCGAFR14-DEV', 'INCOME', '766', '9051', 'Gains de change', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9067, 'PCGAFR14-DEV', 'INCOME', '767', '9051',
         'Produits nets sur cessions de valeurs mobilières de placement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9068, 'PCGAFR14-DEV', 'INCOME', '768', '9051', 'Autres produits financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9069, 'PCGAFR14-DEV', 'INCOME', '77', '8981', 'Produits exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9070, 'PCGAFR14-DEV', 'INCOME', '771', '9069', 'Produits exceptionnels sur opérations de gestion',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9071, 'PCGAFR14-DEV', 'INCOME', '7711', '9070',
         'Dédits et pénalités perçus sur achats et sur ventes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9072, 'PCGAFR14-DEV', 'INCOME', '7713', '9070', 'Libéralités reçues', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9073, 'PCGAFR14-DEV', 'INCOME', '7714', '9070', 'Rentrées sur créances amorties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9074, 'PCGAFR14-DEV', 'INCOME', '7715', '9070', 'Subventions d''équilibre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9075, 'PCGAFR14-DEV', 'INCOME', '7717', '9070',
         'Dégrèvements d''impôts (autres qu''impôts sur les bénéfices)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9076, 'PCGAFR14-DEV', 'INCOME', '7718', '9070',
         'Autres produits exceptionnels sur opérations de gestion', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9077, 'PCGAFR14-DEV', 'INCOME', '772', '9069', 'Produits sur exercices antérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9078, 'PCGAFR14-DEV', 'INCOME', '775', '9069', 'Produits des cessions d''éléments d''actif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9079, 'PCGAFR14-DEV', 'INCOME', '7751', '9078', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9080, 'PCGAFR14-DEV', 'INCOME', '7752', '9078', 'Immobilisations corporelles (hors biens vivants)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9081, 'PCGAFR14-DEV', 'INCOME', '7754', '9078', 'Immobilisations corporelles (biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9082, 'PCGAFR14-DEV', 'INCOME', '7756', '9078', 'Immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9083, 'PCGAFR14-DEV', 'INCOME', '777', '9069',
         'Quote-part des subventions d''investissement virée au résultat de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9084, 'PCGAFR14-DEV', 'INCOME', '778', '9069', 'Autres produits exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9085, 'PCGAFR14-DEV', 'INCOME', '7781', '9084', 'Bonis provenant de clauses d''indexation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9086, 'PCGAFR14-DEV', 'INCOME', '7782', '9084', 'Lots', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9087, 'PCGAFR14-DEV', 'INCOME', '7783', '9084',
         'Bonis provenant du rachat par l''entreprise de titres émis par elle - même', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9088, 'PCGAFR14-DEV', 'INCOME', '7788', '9084', 'Produits exceptionnels divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9089, 'PCGAFR14-DEV', 'INCOME', '78', '8981',
         'Reprises sur amortissements, dépréciations et provisions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9090, 'PCGAFR14-DEV', 'INCOME', '781', '9089',
         'Reprises sur amortissements, dépréciations et provisions (à inscrire dans les produits d''exploitation)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9091, 'PCGAFR14-DEV', 'INCOME', '7811', '9090',
         'Reprises sur amortissements des immobilisations incorporelles et corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9092, 'PCGAFR14-DEV', 'INCOME', '78111', '9091', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9093, 'PCGAFR14-DEV', 'INCOME', '78112', '9091',
         'Immobilisations corporelles (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9094, 'PCGAFR14-DEV', 'INCOME', '78114', '9091', 'Immobilisations corporelles (biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9095, 'PCGAFR14-DEV', 'INCOME', '7815', '9090', 'Reprises sur provisions d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9096, 'PCGAFR14-DEV', 'INCOME', '7816', '9090',
         'Reprises sur dépréciations des immobilisations incorporelles et corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9097, 'PCGAFR14-DEV', 'INCOME', '78161', '9096', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9098, 'PCGAFR14-DEV', 'INCOME', '78162', '9096',
         'Immobilisations corporelles (hors biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9099, 'PCGAFR14-DEV', 'INCOME', '78164', '9096', 'Immobilisations corporelles (biens vivants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9100, 'PCGAFR14-DEV', 'INCOME', '7817', '9090', 'Reprises sur dépréciations des actifs circulants',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9101, 'PCGAFR14-DEV', 'INCOME', '78173', '9100', 'Stocks et en-cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9102, 'PCGAFR14-DEV', 'INCOME', '78174', '9100', 'Créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9103, 'PCGAFR14-DEV', 'INCOME', '786', '9089',
         'Reprises sur dépréciations et sur provisions (à inscrire dans les produits financiers)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9104, 'PCGAFR14-DEV', 'INCOME', '7865', '9103', 'Reprises sur provisions financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9105, 'PCGAFR14-DEV', 'INCOME', '7866', '9103',
         'Reprises sur dépréciations des éléments financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9106, 'PCGAFR14-DEV', 'INCOME', '78662', '9105', 'Immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9107, 'PCGAFR14-DEV', 'INCOME', '78665', '9105', 'Valeurs mobilières de placements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9108, 'PCGAFR14-DEV', 'INCOME', '787', '9089',
         'Reprises sur dépréciations et sur provisions (à inscrire dans les produits exceptionnels)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9109, 'PCGAFR14-DEV', 'INCOME', '7872', '9108',
         'Reprises sur provisions réglementées (immobilisations)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9110, 'PCGAFR14-DEV', 'INCOME', '78725', '9109', 'Amortissements dérogatoires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9111, 'PCGAFR14-DEV', 'INCOME', '78726', '9109', 'Provision spéciale de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9112, 'PCGAFR14-DEV', 'INCOME', '78727', '9109', 'Plus-values réinvesties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9113, 'PCGAFR14-DEV', 'INCOME', '7873', '9108', 'Reprises sur provisions réglementées (stocks)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9114, 'PCGAFR14-DEV', 'INCOME', '7874', '9108', 'Reprises sur autres provisions réglementées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9115, 'PCGAFR14-DEV', 'INCOME', '7875', '9108', 'Reprises sur provisions exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9116, 'PCGAFR14-DEV', 'INCOME', '7876', '9108', 'Reprises sur dépréciations exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9117, 'PCGAFR14-DEV', 'INCOME', '79', '8981', 'Transferts de charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9118, 'PCGAFR14-DEV', 'INCOME', '791', '9117', 'Transferts de charges d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9119, 'PCGAFR14-DEV', 'INCOME', '796', '9117', 'Transferts de charges financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 9120, 'PCGAFR14-DEV', 'INCOME', '797', '9117', 'Transferts de charges exceptionnelles', 1);
