-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2009 Regis Houssin        <regis.houssin@inodbox.com>
-- Copyright (C) 2007 	   Patrick Raguin       <patrick.raguin@gmail.com>
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
-- de l'install et tous les sigles '--' sont supprimés.
--

-- Descriptif des plans comptables BE PCMN-BASE
-- ID 439-1357
-- ADD 200000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 439, 'PCMN-BASE', 'CAPIT', '10', '1351', 'Capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 440, 'PCMN-BASE', 'CAPIT', '100', '439', 'Capital souscrit ou capital personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 441, 'PCMN-BASE', 'CAPIT', '1000', '440', 'Capital non amorti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 442, 'PCMN-BASE', 'CAPIT', '1001', '440', 'Capital amorti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 443, 'PCMN-BASE', 'CAPIT', '101', '439', 'Capital non appelé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 444, 'PCMN-BASE', 'CAPIT', '109', '439', 'Compte de l''exploitant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 445, 'PCMN-BASE', 'CAPIT', '1090', '444', 'Opérations courantes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 446, 'PCMN-BASE', 'CAPIT', '1091', '444', 'Impôts personnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 447, 'PCMN-BASE', 'CAPIT', '1092', '444', 'Rémunérations et autres avantages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 448, 'PCMN-BASE', 'CAPIT', '11', '1351', 'Primes d''émission', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 449, 'PCMN-BASE', 'CAPIT', '12', '1351', 'Plus-values de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 450, 'PCMN-BASE', 'CAPIT', '120', '449',
         'Plus-values de réévaluation sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 451, 'PCMN-BASE', 'CAPIT', '1200', '450', 'Plus-values de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 452, 'PCMN-BASE', 'CAPIT', '1201', '450', 'Reprises de réductions de valeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 453, 'PCMN-BASE', 'CAPIT', '121', '449',
         'Plus-values de réévaluation sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 454, 'PCMN-BASE', 'CAPIT', '1210', '453', 'Plus-values de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 455, 'PCMN-BASE', 'CAPIT', '1211', '453', 'Reprises de réductions de valeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 456, 'PCMN-BASE', 'CAPIT', '122', '449',
         'Plus-values de réévaluation sur immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 457, 'PCMN-BASE', 'CAPIT', '1220', '456', 'Plus-values de réévaluation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 458, 'PCMN-BASE', 'CAPIT', '1221', '456', 'Reprises de réductions de valeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 459, 'PCMN-BASE', 'CAPIT', '123', '449', 'Plus-values de réévaluation sur stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 460, 'PCMN-BASE', 'CAPIT', '124', '449',
         'Reprises de réductions de valeur sur placements de trésorerie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 461, 'PCMN-BASE', 'CAPIT', '13', '1351', 'Réserve', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 462, 'PCMN-BASE', 'CAPIT', '130', '461', 'Réserve légale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 463, 'PCMN-BASE', 'CAPIT', '131', '461', 'Réserves indisponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 464, 'PCMN-BASE', 'CAPIT', '1310', '463', 'Réserve pour actions propres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 465, 'PCMN-BASE', 'CAPIT', '1311', '463', 'Autres réserves indisponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 466, 'PCMN-BASE', 'CAPIT', '132', '461', 'Réserves immunisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 467, 'PCMN-BASE', 'CAPIT', '133', '461', 'Réserves disponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 468, 'PCMN-BASE', 'CAPIT', '1330', '467', 'Réserve pour régularisation de dividendes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 469, 'PCMN-BASE', 'CAPIT', '1331', '467', 'Réserve pour renouvellement des immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 470, 'PCMN-BASE', 'CAPIT', '1332', '467',
         'Réserve pour installations en faveur du personnel 1333 Réserves libres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 471, 'PCMN-BASE', 'CAPIT', '14', '1351', 'Bénéfice reporté (ou perte reportée)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 472, 'PCMN-BASE', 'CAPIT', '15', '1351', 'Subsides en capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 473, 'PCMN-BASE', 'CAPIT', '150', '472', 'Montants obtenus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 474, 'PCMN-BASE', 'CAPIT', '151', '472', 'Montants transférés aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 475, 'PCMN-BASE', 'CAPIT', '16', '1351', 'Provisions pour risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 476, 'PCMN-BASE', 'CAPIT', '160', '475', 'Provisions pour pensions et obligations similaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 477, 'PCMN-BASE', 'CAPIT', '161', '475', 'Provisions pour charges fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 478, 'PCMN-BASE', 'CAPIT', '162', '475', 'Provisions pour grosses réparations et gros entretiens',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 479, 'PCMN-BASE', 'CAPIT', '163', '475', 'à 169 Provisions pour autres risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 480, 'PCMN-BASE', 'CAPIT', '164', '475',
         'Provisions pour sûretés personnelles ou réelles constituées à l''appui de dettes et d''engagements de tiers',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 481, 'PCMN-BASE', 'CAPIT', '165', '475',
         'Provisions pour engagements relatifs à l''acquisition ou à la cession d''immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 482, 'PCMN-BASE', 'CAPIT', '166', '475',
         'Provisions pour exécution de commandes passées ou reçues', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 483, 'PCMN-BASE', 'CAPIT', '167', '475',
         'Provisions pour positions et marchés à terme en devises ou positions et marchés à terme en marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 484, 'PCMN-BASE', 'CAPIT', '168', '475',
         'Provisions pour garanties techniques attachées aux ventes et prestations déjà effectuées par l''entreprise',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 485, 'PCMN-BASE', 'CAPIT', '169', '475', 'Provisions pour autres risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 486, 'PCMN-BASE', 'CAPIT', '1690', '485', 'Pour litiges en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 487, 'PCMN-BASE', 'CAPIT', '1691', '485', 'Pour amendes, doubles droits et pénalités', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 488, 'PCMN-BASE', 'CAPIT', '1692', '485', 'Pour propre assureur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 489, 'PCMN-BASE', 'CAPIT', '1693', '485',
         'Pour risques inhérents aux opérations de crédits à moyen ou long terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 490, 'PCMN-BASE', 'CAPIT', '1695', '485', 'Provision pour charge de liquidation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 491, 'PCMN-BASE', 'CAPIT', '1696', '485', 'Provision pour départ de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 492, 'PCMN-BASE', 'CAPIT', '1699', '485', 'Pour risques divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 493, 'PCMN-BASE', 'CAPIT', '17', '1351', 'Dettes à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 494, 'PCMN-BASE', 'CAPIT', '170', '493', 'Emprunts subordonnés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 495, 'PCMN-BASE', 'CAPIT', '1700', '494', 'Convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 496, 'PCMN-BASE', 'CAPIT', '1701', '494', 'Non convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 497, 'PCMN-BASE', 'CAPIT', '171', '493', 'Emprunts obligataires non subordonnés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 498, 'PCMN-BASE', 'CAPIT', '1710', '498', 'Convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 499, 'PCMN-BASE', 'CAPIT', '1711', '498', 'Non convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 500, 'PCMN-BASE', 'CAPIT', '172', '493', 'Dettes de location-financement et assimilés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 501, 'PCMN-BASE', 'CAPIT', '1720', '500', 'Dettes de location-financement de biens immobiliers',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 502, 'PCMN-BASE', 'CAPIT', '1721', '500', 'Dettes de location-financement de biens mobiliers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 503, 'PCMN-BASE', 'CAPIT', '1722', '500', 'Dettes sur droits réels sur immeubles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 504, 'PCMN-BASE', 'CAPIT', '173', '493', 'Etablissements de crédit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 505, 'PCMN-BASE', 'CAPIT', '1730', '504', 'Dettes en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 506, 'PCMN-BASE', 'CAPIT', '17300', '505', 'Banque A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 507, 'PCMN-BASE', 'CAPIT', '17301', '505', 'Banque B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 508, 'PCMN-BASE', 'CAPIT', '17302', '505', 'Banque C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 509, 'PCMN-BASE', 'CAPIT', '17303', '505', 'Banque D', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 510, 'PCMN-BASE', 'CAPIT', '1731', '504', 'Promesses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 511, 'PCMN-BASE', 'CAPIT', '17310', '510', 'Banque A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 512, 'PCMN-BASE', 'CAPIT', '17311', '510', 'Banque B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 513, 'PCMN-BASE', 'CAPIT', '17312', '510', 'Banque C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 514, 'PCMN-BASE', 'CAPIT', '17313', '510', 'Banque D', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 515, 'PCMN-BASE', 'CAPIT', '1732', '504', 'Crédits d''acceptation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 516, 'PCMN-BASE', 'CAPIT', '17320', '515', 'Banque A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 517, 'PCMN-BASE', 'CAPIT', '17321', '515', 'Banque B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 518, 'PCMN-BASE', 'CAPIT', '17322', '515', 'Banque C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 519, 'PCMN-BASE', 'CAPIT', '17323', '515', 'Banque D', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 520, 'PCMN-BASE', 'CAPIT', '174', '493', 'Autres emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 521, 'PCMN-BASE', 'CAPIT', '175', '493', 'Dettes commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 522, 'PCMN-BASE', 'CAPIT', '1750', '521', 'Fournisseurs : dettes en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 523, 'PCMN-BASE', 'CAPIT', '17500', '522', 'Entreprises apparentées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 524, 'PCMN-BASE', 'CAPIT', '175000', '523', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 525, 'PCMN-BASE', 'CAPIT', '175001', '523',
         'Entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 526, 'PCMN-BASE', 'CAPIT', '17501', '522', 'Fournisseurs ordinaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 527, 'PCMN-BASE', 'CAPIT', '175010', '526', 'Fournisseurs belges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 528, 'PCMN-BASE', 'CAPIT', '175011', '526', 'Fournisseurs C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 529, 'PCMN-BASE', 'CAPIT', '175012', '526', 'Fournisseurs importation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 530, 'PCMN-BASE', 'CAPIT', '1751', '521', 'Effets à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 531, 'PCMN-BASE', 'CAPIT', '17510', '530', 'Entreprises apparentées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 532, 'PCMN-BASE', 'CAPIT', '175100', '531', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 533, 'PCMN-BASE', 'CAPIT', '175101', '531',
         'Entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 534, 'PCMN-BASE', 'CAPIT', '17511', '530', 'Fournisseurs ordinaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 535, 'PCMN-BASE', 'CAPIT', '175110', '534', 'Fournisseurs belges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 536, 'PCMN-BASE', 'CAPIT', '175111', '534', 'Fournisseurs C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 537, 'PCMN-BASE', 'CAPIT', '175112', '534', 'Fournisseurs importation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 538, 'PCMN-BASE', 'CAPIT', '176', '493', 'Acomptes reçus sur commandes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 539, 'PCMN-BASE', 'CAPIT', '178', '493', 'Cautionnements reçus en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 540, 'PCMN-BASE', 'CAPIT', '179', '493', 'Dettes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 541, 'PCMN-BASE', 'CAPIT', '1790', '540', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 542, 'PCMN-BASE', 'CAPIT', '1791', '540',
         'Autres entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 543, 'PCMN-BASE', 'CAPIT', '1792', '540', 'Administrateurs, gérants et associés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 544, 'PCMN-BASE', 'CAPIT', '1794', '540', 'Rentes viagères capitalisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 545, 'PCMN-BASE', 'CAPIT', '1798', '540',
         'Dettes envers les coparticipants des associations momentanées et en participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 546, 'PCMN-BASE', 'CAPIT', '1799', '540', 'Autres dettes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 547, 'PCMN-BASE', 'CAPIT', '18', '1351', 'Comptes de liaison des établissements et succursales',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 548, 'PCMN-BASE', 'IMMO', '20', '1352', 'Frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 549, 'PCMN-BASE', 'IMMO', '200', '548', 'Frais de constitution et d''augmentation de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 550, 'PCMN-BASE', 'IMMO', '2000', '549', 'Frais de constitution et d''augmentation de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 551, 'PCMN-BASE', 'IMMO', '2009', '549',
         'Amortissements sur frais de constitution et d''augmentation de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 552, 'PCMN-BASE', 'IMMO', '201', '548', 'Frais d''émission d''emprunts et primes de remboursement',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 553, 'PCMN-BASE', 'IMMO', '2010', '552', 'Agios sur emprunts et frais d''émission d''emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 554, 'PCMN-BASE', 'IMMO', '2019', '552',
         'Amortissements sur agios sur emprunts et frais d''émission d''emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 555, 'PCMN-BASE', 'IMMO', '202', '548', 'Autres frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 556, 'PCMN-BASE', 'IMMO', '2020', '555', 'Autres frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 557, 'PCMN-BASE', 'IMMO', '2029', '555', 'Amortissements sur autres frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 558, 'PCMN-BASE', 'IMMO', '203', '548', 'Intérêts intercalaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 559, 'PCMN-BASE', 'IMMO', '2030', '558', 'Intérêts intercalaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 560, 'PCMN-BASE', 'IMMO', '2039', '558', 'Amortissements sur intérêts intercalaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 561, 'PCMN-BASE', 'IMMO', '204', '548', 'Frais de restructuration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 562, 'PCMN-BASE', 'IMMO', '2040', '561', 'Coût des frais de restructuration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 563, 'PCMN-BASE', 'IMMO', '2049', '561', 'Amortissements sur frais de restructuration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 564, 'PCMN-BASE', 'IMMO', '21', '1352', 'Immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 565, 'PCMN-BASE', 'IMMO', '210', '564', 'Frais de recherche et de développement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 566, 'PCMN-BASE', 'IMMO', '2100', '565', 'Frais de recherche et de mise au point', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 567, 'PCMN-BASE', 'IMMO', '2108', '565',
         'Plus-values actées sur frais de recherche et de mise au point', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 568, 'PCMN-BASE', 'IMMO', '2109', '565',
         'Amortissements sur frais de recherche et de mise au point', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 569, 'PCMN-BASE', 'IMMO', '211', '564',
         'Concessions, brevets, licences, savoir-faire, marque et droits similaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 570, 'PCMN-BASE', 'IMMO', '2110', '569', 'Concessions, brevets, licences, marques, etc', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 571, 'PCMN-BASE', 'IMMO', '2118', '569', 'Plus-values actées sur concessions, etc', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 572, 'PCMN-BASE', 'IMMO', '2119', '569', 'Amortissements sur concessions, etc', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 573, 'PCMN-BASE', 'IMMO', '212', '564', 'Goodwill', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 574, 'PCMN-BASE', 'IMMO', '2120', '573', 'Coût d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 575, 'PCMN-BASE', 'IMMO', '2128', '573', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 576, 'PCMN-BASE', 'IMMO', '2129', '573', 'Amortissements sur goodwill', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 577, 'PCMN-BASE', 'IMMO', '213', '564', 'Acomptes versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 578, 'PCMN-BASE', 'IMMO', '22', '1352', 'Terrains et constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 579, 'PCMN-BASE', 'IMMO', '220', '578', 'Terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 580, 'PCMN-BASE', 'IMMO', '2200', '579', 'Terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 581, 'PCMN-BASE', 'IMMO', '2201', '579', 'Frais d''acquisition sur terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 582, 'PCMN-BASE', 'IMMO', '2208', '579', 'Plus-values actées sur terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 583, 'PCMN-BASE', 'IMMO', '2209', '579', 'Amortissements et réductions de valeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 584, 'PCMN-BASE', 'IMMO', '22090', '583', 'Amortissements sur frais d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 585, 'PCMN-BASE', 'IMMO', '22091', '583', 'Réductions de valeur sur terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 586, 'PCMN-BASE', 'IMMO', '221', '578', 'Constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 587, 'PCMN-BASE', 'IMMO', '2210', '586', 'Bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 588, 'PCMN-BASE', 'IMMO', '2211', '586', 'Bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 589, 'PCMN-BASE', 'IMMO', '2212', '586', 'Autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 590, 'PCMN-BASE', 'IMMO', '2213', '586', 'Voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 591, 'PCMN-BASE', 'IMMO', '2215', '586', 'Constructions sur sol d''autrui', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 592, 'PCMN-BASE', 'IMMO', '2216', '586', 'Frais d''acquisition sur constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 593, 'PCMN-BASE', 'IMMO', '2218', '586', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 594, 'PCMN-BASE', 'IMMO', '22180', '593', 'Sur bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 595, 'PCMN-BASE', 'IMMO', '22181', '593', 'Sur bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 596, 'PCMN-BASE', 'IMMO', '22182', '593', 'Sur autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 597, 'PCMN-BASE', 'IMMO', '22184', '593', 'Sur voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 598, 'PCMN-BASE', 'IMMO', '2219', '586', 'Amortissements sur constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 599, 'PCMN-BASE', 'IMMO', '22190', '598', 'Sur bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 600, 'PCMN-BASE', 'IMMO', '22191', '598', 'Sur bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 601, 'PCMN-BASE', 'IMMO', '22192', '598', 'Sur autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 602, 'PCMN-BASE', 'IMMO', '22194', '598', 'Sur voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 603, 'PCMN-BASE', 'IMMO', '22195', '598', 'Sur constructions sur sol d''autrui', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 604, 'PCMN-BASE', 'IMMO', '22196', '598', 'Sur frais d''acquisition sur constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 605, 'PCMN-BASE', 'IMMO', '222', '578', 'Terrains bâtis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 606, 'PCMN-BASE', 'IMMO', '2220', '605', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 607, 'PCMN-BASE', 'IMMO', '22200', '606', 'Bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 608, 'PCMN-BASE', 'IMMO', '22201', '606', 'Bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 609, 'PCMN-BASE', 'IMMO', '22202', '606', 'Autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 610, 'PCMN-BASE', 'IMMO', '22203', '606', 'Voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 611, 'PCMN-BASE', 'IMMO', '22204', '606', 'Frais d''acquisition des terrains à bâtir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 612, 'PCMN-BASE', 'IMMO', '2228', '605', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 613, 'PCMN-BASE', 'IMMO', '22280', '612', 'Sur bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 614, 'PCMN-BASE', 'IMMO', '22281', '612', 'Sur bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 615, 'PCMN-BASE', 'IMMO', '22282', '612', 'Sur autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 616, 'PCMN-BASE', 'IMMO', '22283', '612', 'Sur voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 617, 'PCMN-BASE', 'IMMO', '2229', '605', 'Amortissements sur terrains bâtis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 618, 'PCMN-BASE', 'IMMO', '22290', '617', 'Sur bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 619, 'PCMN-BASE', 'IMMO', '22291', '617', 'Sur bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 620, 'PCMN-BASE', 'IMMO', '22292', '617', 'Sur autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 621, 'PCMN-BASE', 'IMMO', '22293', '617', 'Sur voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 622, 'PCMN-BASE', 'IMMO', '22294', '617', 'Sur frais d''acquisition des terrains bâtis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 623, 'PCMN-BASE', 'IMMO', '223', '578', 'Autres droits réels sur des immeubles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 624, 'PCMN-BASE', 'IMMO', '2230', '623', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 625, 'PCMN-BASE', 'IMMO', '2238', '623', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 626, 'PCMN-BASE', 'IMMO', '2239', '623', 'Amortissements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 627, 'PCMN-BASE', 'IMMO', '23', '1352', 'Installations, machines et outillages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 628, 'PCMN-BASE', 'IMMO', '230', '627', 'Installations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 629, 'PCMN-BASE', 'IMMO', '2300', '628', 'Installations bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 630, 'PCMN-BASE', 'IMMO', '2301', '628', 'Installations bâtiments administratifs et commerciaux',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 631, 'PCMN-BASE', 'IMMO', '2302', '628', 'Installations bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 632, 'PCMN-BASE', 'IMMO', '2303', '628', 'Installations voies de transport et ouvrages d''art', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 633, 'PCMN-BASE', 'IMMO', '2304', '628', 'Installation d''eau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 634, 'PCMN-BASE', 'IMMO', '2305', '628', 'Installation d''électricité', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 635, 'PCMN-BASE', 'IMMO', '2306', '628', 'Installation de vapeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 636, 'PCMN-BASE', 'IMMO', '2307', '628', 'Installation de gaz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 637, 'PCMN-BASE', 'IMMO', '2308', '628', 'Installation de chauffage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 638, 'PCMN-BASE', 'IMMO', '2309', '628', 'Installation de conditionnement d''air', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 640, 'PCMN-BASE', 'IMMO', '231', '627', 'Machines', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 641, 'PCMN-BASE', 'IMMO', '2310', '640', 'Division A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 642, 'PCMN-BASE', 'IMMO', '2311', '640', 'Division B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 643, 'PCMN-BASE', 'IMMO', '2312', '640', 'Division C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 644, 'PCMN-BASE', 'IMMO', '237', '627', 'Outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 645, 'PCMN-BASE', 'IMMO', '2370', '644', 'Division A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 646, 'PCMN-BASE', 'IMMO', '2371', '644', 'Division B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 647, 'PCMN-BASE', 'IMMO', '2372', '644', 'Division C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 648, 'PCMN-BASE', 'IMMO', '238', '627', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 649, 'PCMN-BASE', 'IMMO', '2380', '648', 'Sur installations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 650, 'PCMN-BASE', 'IMMO', '2381', '648', 'Sur machines', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 651, 'PCMN-BASE', 'IMMO', '2382', '648', 'Sur outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 652, 'PCMN-BASE', 'IMMO', '239', '627', 'Amortissements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 653, 'PCMN-BASE', 'IMMO', '2390', '652', 'Sur installations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 654, 'PCMN-BASE', 'IMMO', '2391', '652', 'Sur machines', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 655, 'PCMN-BASE', 'IMMO', '2392', '652', 'Sur outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 656, 'PCMN-BASE', 'IMMO', '24', '1352', 'Mobilier et matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 657, 'PCMN-BASE', 'IMMO', '240', '656', 'Mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 658, 'PCMN-BASE', 'IMMO', '2400', '656', 'Mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 659, 'PCMN-BASE', 'IMMO', '24000', '658', 'Mobilier des bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 660, 'PCMN-BASE', 'IMMO', '24001', '658', 'Mobilier des bâtiments administratifs et commerciaux',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 661, 'PCMN-BASE', 'IMMO', '24002', '658', 'Mobilier des autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 662, 'PCMN-BASE', 'IMMO', '24003', '658', 'Mobilier oeuvres sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 663, 'PCMN-BASE', 'IMMO', '2401', '657', 'Matériel de bureau et de service social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 664, 'PCMN-BASE', 'IMMO', '24010', '663', 'Des bâtiments industriels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 665, 'PCMN-BASE', 'IMMO', '24011', '663', 'Des bâtiments administratifs et commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 666, 'PCMN-BASE', 'IMMO', '24012', '663', 'Des autres bâtiments d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 667, 'PCMN-BASE', 'IMMO', '24013', '663', 'Des oeuvres sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 668, 'PCMN-BASE', 'IMMO', '2408', '657', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 669, 'PCMN-BASE', 'IMMO', '24080', '668', 'Plus-values actées sur mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 670, 'PCMN-BASE', 'IMMO', '24081', '668',
         'Plus-values actées sur matériel de bureau et service social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 671, 'PCMN-BASE', 'IMMO', '2409', '657', 'Amortissements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 672, 'PCMN-BASE', 'IMMO', '24090', '671', 'Amortissements sur mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 673, 'PCMN-BASE', 'IMMO', '24091', '671',
         'Amortissements sur matériel de bureau et service social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 674, 'PCMN-BASE', 'IMMO', '241', '656', 'Matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 675, 'PCMN-BASE', 'IMMO', '2410', '674', 'Matériel automobile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 676, 'PCMN-BASE', 'IMMO', '24100', '675', 'Voitures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 677, 'PCMN-BASE', 'IMMO', '24105', '675', 'Camions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 678, 'PCMN-BASE', 'IMMO', '2411', '674', 'Matériel ferroviaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 679, 'PCMN-BASE', 'IMMO', '2412', '674', 'Matériel fluvial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 680, 'PCMN-BASE', 'IMMO', '2413', '674', 'Matériel naval', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 681, 'PCMN-BASE', 'IMMO', '2414', '674', 'Matériel aérien', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 682, 'PCMN-BASE', 'IMMO', '2418', '674', 'Plus-values sur matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 683, 'PCMN-BASE', 'IMMO', '24180', '682', 'Plus-values sur matériel automobile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 684, 'PCMN-BASE', 'IMMO', '24181', '682', 'Idem sur matériel ferroviaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 685, 'PCMN-BASE', 'IMMO', '24182', '682', 'Idem sur matériel fluvial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 686, 'PCMN-BASE', 'IMMO', '24183', '682', 'Idem sur matériel naval', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 687, 'PCMN-BASE', 'IMMO', '24184', '682', 'Idem sur matériel aérien', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 688, 'PCMN-BASE', 'IMMO', '2419', '674', 'Amortissements sur matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 689, 'PCMN-BASE', 'IMMO', '24190', '688', 'Amortissements sur matériel automobile', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 690, 'PCMN-BASE', 'IMMO', '24191', '688', 'Idem sur matériel ferroviaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 691, 'PCMN-BASE', 'IMMO', '24192', '688', 'Idem sur matériel fluvial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 692, 'PCMN-BASE', 'IMMO', '24193', '688', 'Idem sur matériel naval', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 693, 'PCMN-BASE', 'IMMO', '24194', '688', 'Idem sur matériel aérien', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 694, 'PCMN-BASE', 'IMMO', '25', '1352',
         'Immobilisation détenues en location-financement et droits similaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 695, 'PCMN-BASE', 'IMMO', '250', '694', 'Terrains et constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 696, 'PCMN-BASE', 'IMMO', '2500', '695', 'Terrains', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 697, 'PCMN-BASE', 'IMMO', '2501', '695', 'Constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 698, 'PCMN-BASE', 'IMMO', '2508', '695',
         'Plus-values sur emphytéose,  leasing et droits similaires : terrains et constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 699, 'PCMN-BASE', 'IMMO', '2509', '695',
         'Amortissements et réductions de valeur sur terrains et constructions en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 700, 'PCMN-BASE', 'IMMO', '251', '694', 'Installations,  machines et outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 701, 'PCMN-BASE', 'IMMO', '2510', '700', 'Installations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 702, 'PCMN-BASE', 'IMMO', '2511', '700', 'Machines', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 703, 'PCMN-BASE', 'IMMO', '2512', '700', 'Outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 704, 'PCMN-BASE', 'IMMO', '2518', '700',
         'Plus-values actées sur installations machines et outillage pris en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 705, 'PCMN-BASE', 'IMMO', '2519', '700',
         'Amortissements sur installations machines et outillage pris en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 706, 'PCMN-BASE', 'IMMO', '252', '694', 'Mobilier et matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 707, 'PCMN-BASE', 'IMMO', '2520', '706', 'Mobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 708, 'PCMN-BASE', 'IMMO', '2521', '706', 'Matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 709, 'PCMN-BASE', 'IMMO', '2528', '706',
         'Plus-values actées sur mobilier et matériel roulant en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 710, 'PCMN-BASE', 'IMMO', '2529', '706',
         'Amortissements sur mobilier et matériel roulant en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 711, 'PCMN-BASE', 'IMMO', '26', '1352', 'Autres immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 712, 'PCMN-BASE', 'IMMO', '260', '711', 'Frais d''aménagements de locaux pris en location', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 713, 'PCMN-BASE', 'IMMO', '261', '711', 'Maison d''habitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 714, 'PCMN-BASE', 'IMMO', '262', '711', 'Réserve immobilière', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 715, 'PCMN-BASE', 'IMMO', '263', '711', 'Matériel d''emballage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 716, 'PCMN-BASE', 'IMMO', '264', '711', 'Emballages récupérables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 717, 'PCMN-BASE', 'IMMO', '268', '711',
         'Plus-values actées sur autres immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 718, 'PCMN-BASE', 'IMMO', '269', '711', 'Amortissements sur autres immobilisations corporelles',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 719, 'PCMN-BASE', 'IMMO', '2690', '718',
         'Amortissements sur frais d''aménagement des locaux pris en location', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 720, 'PCMN-BASE', 'IMMO', '2691', '718', 'Amortissements sur maison d''habitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 721, 'PCMN-BASE', 'IMMO', '2692', '718', 'Amortissements sur réserve immobilière', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 722, 'PCMN-BASE', 'IMMO', '2693', '718', 'Amortissements sur matériel d''emballage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 723, 'PCMN-BASE', 'IMMO', '2694', '718', 'Amortissements sur emballages récupérables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 724, 'PCMN-BASE', 'IMMO', '27', '1352', 'Immobilisations corporelles en cours et acomptes versés',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 725, 'PCMN-BASE', 'IMMO', '270', '724', 'Immobilisations en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 726, 'PCMN-BASE', 'IMMO', '2700', '725', 'Constructions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 727, 'PCMN-BASE', 'IMMO', '2701', '725', 'Installations machines et outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 728, 'PCMN-BASE', 'IMMO', '2702', '725', 'Mobilier et matériel roulant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 729, 'PCMN-BASE', 'IMMO', '2703', '725', 'Autres immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 730, 'PCMN-BASE', 'IMMO', '271', '724', 'Avances et acomptes versés sur immobilisations en cours',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 731, 'PCMN-BASE', 'IMMO', '28', '1352', 'Immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 732, 'PCMN-BASE', 'IMMO', '280', '731', 'Participations dans des entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 733, 'PCMN-BASE', 'IMMO', '2800', '732',
         'Valeur d''acquisition (peut être subdivisé par participation)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 734, 'PCMN-BASE', 'IMMO', '2801', '732', 'Montants non appelés (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 735, 'PCMN-BASE', 'IMMO', '2808', '732', 'Plus-values actées (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 736, 'PCMN-BASE', 'IMMO', '2809', '732', 'Réductions de valeurs actées (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 737, 'PCMN-BASE', 'IMMO', '281', '731', 'Créances sur des entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 738, 'PCMN-BASE', 'IMMO', '2810', '737', 'Créances en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 739, 'PCMN-BASE', 'IMMO', '2811', '737', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 740, 'PCMN-BASE', 'IMMO', '2812', '737', 'Titres à revenu fixes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 741, 'PCMN-BASE', 'IMMO', '2817', '737', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 742, 'PCMN-BASE', 'IMMO', '2819', '737', 'Réductions de valeurs actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 743, 'PCMN-BASE', 'IMMO', '282', '731',
         'Participations dans des entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 744, 'PCMN-BASE', 'IMMO', '2820', '743',
         'Valeur d''acquisition (peut être subdivisé par participation)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 745, 'PCMN-BASE', 'IMMO', '2821', '743', 'Montants non appelés (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 746, 'PCMN-BASE', 'IMMO', '2828', '743', 'Plus-values actées (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 747, 'PCMN-BASE', 'IMMO', '2829', '743', 'Réductions de valeurs actées (idem)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 748, 'PCMN-BASE', 'IMMO', '283', '731',
         'Créances sur des entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 749, 'PCMN-BASE', 'IMMO', '2830', '748', 'Créances en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 750, 'PCMN-BASE', 'IMMO', '2831', '748', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 751, 'PCMN-BASE', 'IMMO', '2832', '748', 'Titres à revenu fixe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 752, 'PCMN-BASE', 'IMMO', '2837', '748', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 753, 'PCMN-BASE', 'IMMO', '2839', '748', 'Réductions de valeurs actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 754, 'PCMN-BASE', 'IMMO', '284', '731', 'Autres actions et parts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 755, 'PCMN-BASE', 'IMMO', '2840', '754', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 756, 'PCMN-BASE', 'IMMO', '2841', '754', 'Montants non appelés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 757, 'PCMN-BASE', 'IMMO', '2848', '754', 'Plus-values actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 758, 'PCMN-BASE', 'IMMO', '2849', '754', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 759, 'PCMN-BASE', 'IMMO', '285', '731', 'Autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 760, 'PCMN-BASE', 'IMMO', '2850', '759', 'Créances en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 761, 'PCMN-BASE', 'IMMO', '2851', '759', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 762, 'PCMN-BASE', 'IMMO', '2852', '759', 'Titres à revenu fixe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 763, 'PCMN-BASE', 'IMMO', '2857', '759', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 764, 'PCMN-BASE', 'IMMO', '2859', '759', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 765, 'PCMN-BASE', 'IMMO', '288', '731', 'Cautionnements versés en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 766, 'PCMN-BASE', 'IMMO', '2880', '765', 'Téléphone, téléfax, télex', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 767, 'PCMN-BASE', 'IMMO', '2881', '765', 'Gaz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 768, 'PCMN-BASE', 'IMMO', '2882', '765', 'Eau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 769, 'PCMN-BASE', 'IMMO', '2883', '765', 'Electricité', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 770, 'PCMN-BASE', 'IMMO', '2887', '765', 'Autres cautionnements versés en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 771, 'PCMN-BASE', 'IMMO', '29', '1352', 'Créances à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 772, 'PCMN-BASE', 'IMMO', '290', '771', 'Créances commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 773, 'PCMN-BASE', 'IMMO', '2900', '772', 'Clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 774, 'PCMN-BASE', 'IMMO', '29000', '773', 'Créances en compte sur entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 775, 'PCMN-BASE', 'IMMO', '29001', '773',
         'Sur entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 776, 'PCMN-BASE', 'IMMO', '29002', '773', 'Sur clients Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 777, 'PCMN-BASE', 'IMMO', '29003', '773', 'Sur clients C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 778, 'PCMN-BASE', 'IMMO', '29004', '773', 'Sur clients exportation hors C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 779, 'PCMN-BASE', 'IMMO', '29005', '773',
         'Créances sur les coparticipants (associations momentanées)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 780, 'PCMN-BASE', 'IMMO', '2901', '772', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 781, 'PCMN-BASE', 'IMMO', '29010', '780', 'Sur entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 782, 'PCMN-BASE', 'IMMO', '29011', '780',
         'Sur entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 783, 'PCMN-BASE', 'IMMO', '29012', '780', 'Sur clients Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 784, 'PCMN-BASE', 'IMMO', '29013', '780', 'Sur clients C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 785, 'PCMN-BASE', 'IMMO', '29014', '780', 'Sur clients exportation hors C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 786, 'PCMN-BASE', 'IMMO', '2905', '772', 'Retenues sur garanties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 787, 'PCMN-BASE', 'IMMO', '2906', '772', 'Acomptes versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 788, 'PCMN-BASE', 'IMMO', '2907', '772', 'Créances douteuses (à ventiler comme clients 2900)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 789, 'PCMN-BASE', 'IMMO', '2909', '772',
         'Réductions de valeur actées (à ventiler comme clients 2900)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 790, 'PCMN-BASE', 'IMMO', '291', '771', 'Autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 791, 'PCMN-BASE', 'IMMO', '2910', '790', 'Créances en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 792, 'PCMN-BASE', 'IMMO', '29100', '791', 'Sur entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 793, 'PCMN-BASE', 'IMMO', '29101', '791',
         'Sur entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 794, 'PCMN-BASE', 'IMMO', '29102', '791', 'Sur autres débiteurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 795, 'PCMN-BASE', 'IMMO', '2911', '790', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 796, 'PCMN-BASE', 'IMMO', '29110', '795', 'Sur entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 797, 'PCMN-BASE', 'IMMO', '29111', '795',
         'Sur entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 798, 'PCMN-BASE', 'IMMO', '29112', '795', 'Sur autres débiteurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 799, 'PCMN-BASE', 'IMMO', '2912', '790',
         'Créances résultant de la cession d''immobilisations données en leasing', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 800, 'PCMN-BASE', 'IMMO', '2917', '790', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 801, 'PCMN-BASE', 'IMMO', '2919', '790', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 802, 'PCMN-BASE', 'STOCK', '30', '1353', 'Approvisionnements - matières premières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 803, 'PCMN-BASE', 'STOCK', '300', '802', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 804, 'PCMN-BASE', 'STOCK', '309', '802', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 805, 'PCMN-BASE', 'STOCK', '31', '1353', 'Approvsionnements et fournitures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 806, 'PCMN-BASE', 'STOCK', '310', '805', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 807, 'PCMN-BASE', 'STOCK', '3100', '806', 'Matières d''approvisionnement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 808, 'PCMN-BASE', 'STOCK', '3101', '806', 'Energie, charbon, coke, mazout, essence, propane', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 809, 'PCMN-BASE', 'STOCK', '3102', '806', 'Produits d''entretien', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 810, 'PCMN-BASE', 'STOCK', '3103', '806', 'Fournitures diverses et petit outillage', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 811, 'PCMN-BASE', 'STOCK', '3104', '806', 'Imprimés et fournitures de bureau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 812, 'PCMN-BASE', 'STOCK', '3105', '806', 'Fournitures de services sociaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 813, 'PCMN-BASE', 'STOCK', '3106', '806', 'Emballages commerciaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 814, 'PCMN-BASE', 'STOCK', '31060', '813', 'Emballages perdus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 815, 'PCMN-BASE', 'STOCK', '31061', '813', 'Emballages récupérables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 816, 'PCMN-BASE', 'STOCK', '319', '805', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 817, 'PCMN-BASE', 'STOCK', '32', '1353', 'En cours de fabrication', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 818, 'PCMN-BASE', 'STOCK', '320', '817', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 819, 'PCMN-BASE', 'STOCK', '3200', '818', 'Produits semi-ouvrés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 820, 'PCMN-BASE', 'STOCK', '3201', '818', 'Produits en cours de fabrication', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 821, 'PCMN-BASE', 'STOCK', '3202', '818', 'Travaux en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 822, 'PCMN-BASE', 'STOCK', '3205', '818', 'Déchets', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 823, 'PCMN-BASE', 'STOCK', '3206', '818', 'Rebuts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 824, 'PCMN-BASE', 'STOCK', '3209', '818', 'Travaux en association momentanée', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 825, 'PCMN-BASE', 'STOCK', '329', '817', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 826, 'PCMN-BASE', 'STOCK', '33', '1353', 'Produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 827, 'PCMN-BASE', 'STOCK', '330', '826', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 828, 'PCMN-BASE', 'STOCK', '3300', '827', 'Produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 829, 'PCMN-BASE', 'STOCK', '339', '826', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 830, 'PCMN-BASE', 'STOCK', '34', '1353', 'Marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 831, 'PCMN-BASE', 'STOCK', '340', '830', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 832, 'PCMN-BASE', 'STOCK', '3400', '831', 'Groupe A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 833, 'PCMN-BASE', 'STOCK', '3401', '831', 'Groupe B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 834, 'PCMN-BASE', 'STOCK', '3402', '831', 'Groupe C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 835, 'PCMN-BASE', 'STOCK', '349', '830', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 836, 'PCMN-BASE', 'STOCK', '35', '1353', 'Immeubles destinés à la vente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 837, 'PCMN-BASE', 'STOCK', '350', '836', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 838, 'PCMN-BASE', 'STOCK', '3500', '837', 'Immeuble A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 839, 'PCMN-BASE', 'STOCK', '3501', '837', 'Immeuble B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 840, 'PCMN-BASE', 'STOCK', '3502', '837', 'Immeuble C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 841, 'PCMN-BASE', 'STOCK', '351', '836', 'Immeubles construits en vue de leur revente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 842, 'PCMN-BASE', 'STOCK', '3510', '841', 'Immeuble A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 843, 'PCMN-BASE', 'STOCK', '3511', '841', 'Immeuble B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 844, 'PCMN-BASE', 'STOCK', '3512', '841', 'Immeuble C', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 845, 'PCMN-BASE', 'STOCK', '359', '836', 'Réductions de valeurs actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 846, 'PCMN-BASE', 'STOCK', '36', '1353', 'Acomptes versés sur achats pour stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 847, 'PCMN-BASE', 'STOCK', '360', '846',
         'Acomptes versés (à ventiler éventuellement par catégorie)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 848, 'PCMN-BASE', 'STOCK', '369', '846', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 849, 'PCMN-BASE', 'STOCK', '37', '1353', 'Commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 850, 'PCMN-BASE', 'STOCK', '370', '849', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 851, 'PCMN-BASE', 'STOCK', '371', '849', 'Bénéfice pris en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 852, 'PCMN-BASE', 'STOCK', '379', '849', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 853, 'PCMN-BASE', 'THIRDPARTY', '40', '1354', 'Créances commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 854, 'PCMN-BASE', 'THIRDPARTY', '400', '853', 'Clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 855, 'PCMN-BASE', 'THIRDPARTY', '4007', '854',
         'Rabais, remises et  ristournes à accorder et autres notes de crédit à établir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 856, 'PCMN-BASE', 'THIRDPARTY', '4008', '854',
         'Créances résultant de livraisons de biens (associations momentanées)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 857, 'PCMN-BASE', 'THIRDPARTY', '401', '853', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 858, 'PCMN-BASE', 'THIRDPARTY', '4010', '857', 'Effets à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 859, 'PCMN-BASE', 'THIRDPARTY', '4013', '857', 'Effets à l''encaissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 860, 'PCMN-BASE', 'THIRDPARTY', '4015', '857', 'Effets à l''escompte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 861, 'PCMN-BASE', 'THIRDPARTY', '402', '853',
         'Clients, créances courantes, entreprises apparentées, administrateurs et gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 862, 'PCMN-BASE', 'THIRDPARTY', '4020', '861', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 863, 'PCMN-BASE', 'THIRDPARTY', '4021', '861',
         'Autres entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 864, 'PCMN-BASE', 'THIRDPARTY', '4022', '861', 'Administrateurs et gérants d''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 865, 'PCMN-BASE', 'THIRDPARTY', '403', '853',
         'Effets à recevoir sur entreprises apparentées et administrateurs et gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 866, 'PCMN-BASE', 'THIRDPARTY', '4030', '865', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 867, 'PCMN-BASE', 'THIRDPARTY', '4031', '865',
         'Autres entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 868, 'PCMN-BASE', 'THIRDPARTY', '4032', '865', 'Administrateurs et gérants de l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 869, 'PCMN-BASE', 'THIRDPARTY', '404', '853', 'Produits à recevoir (factures à établir)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 870, 'PCMN-BASE', 'THIRDPARTY', '405', '853', 'Clients : retenues sur garanties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 871, 'PCMN-BASE', 'THIRDPARTY', '406', '853', 'Acomptes versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 872, 'PCMN-BASE', 'THIRDPARTY', '407', '853', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 873, 'PCMN-BASE', 'THIRDPARTY', '408', '853', 'Compensation clients', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 874, 'PCMN-BASE', 'THIRDPARTY', '409', '853', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 875, 'PCMN-BASE', 'THIRDPARTY', '41', '1354', 'Autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 876, 'PCMN-BASE', 'THIRDPARTY', '410', '875', 'Capital appelé, non versé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 877, 'PCMN-BASE', 'THIRDPARTY', '4100', '876', 'Appels de fonds', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 878, 'PCMN-BASE', 'THIRDPARTY', '4101', '876', 'Actionnaires défaillants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 879, 'PCMN-BASE', 'THIRDPARTY', '411', '875', 'T.V.A. à récupérer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 880, 'PCMN-BASE', 'THIRDPARTY', '4110', '879', 'T.V.A. due', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 881, 'PCMN-BASE', 'THIRDPARTY', '4111', '879', 'T.V.A. déductible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 882, 'PCMN-BASE', 'THIRDPARTY', '4112', '879', 'Compte courant administration T.V.A.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 883, 'PCMN-BASE', 'THIRDPARTY', '4118', '879', 'Taxe d''égalisation due', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 884, 'PCMN-BASE', 'THIRDPARTY', '412', '875', 'Impôts et versements fiscaux à récupérer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 885, 'PCMN-BASE', 'THIRDPARTY', '4120', '884', 'Impôts belges sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 886, 'PCMN-BASE', 'THIRDPARTY', '4125', '884', 'Autres impôts belges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 887, 'PCMN-BASE', 'THIRDPARTY', '4128', '884', 'Impôts étrangers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 888, 'PCMN-BASE', 'THIRDPARTY', '414', '875', 'Produits à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 889, 'PCMN-BASE', 'THIRDPARTY', '416', '875', 'Créances diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 890, 'PCMN-BASE', 'THIRDPARTY', '4160', '889', 'Associés (compte d''apport en société)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 891, 'PCMN-BASE', 'THIRDPARTY', '4161', '889', 'Avances et prêts au personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 892, 'PCMN-BASE', 'THIRDPARTY', '4162', '889', 'Compte courant des associés en S.P.R.L.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 893, 'PCMN-BASE', 'THIRDPARTY', '4163', '889', 'Compte courant des administrateurs et gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 894, 'PCMN-BASE', 'THIRDPARTY', '4164', '889', 'Créances sur sociétés apparentées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 895, 'PCMN-BASE', 'THIRDPARTY', '4166', '889', 'Emballages et matériel à rendre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 896, 'PCMN-BASE', 'THIRDPARTY', '4167', '889', 'Etat et établissements publics', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 897, 'PCMN-BASE', 'THIRDPARTY', '41670', '896', 'Subsides à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 898, 'PCMN-BASE', 'THIRDPARTY', '41671', '896', 'Autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 899, 'PCMN-BASE', 'THIRDPARTY', '4168', '889',
         'Rabais, ristournes et remises à obtenir et autres avoirs non encore reçus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 900, 'PCMN-BASE', 'THIRDPARTY', '417', '875', 'Créances douteuses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 901, 'PCMN-BASE', 'THIRDPARTY', '418', '875', 'Cautionnements versés en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 902, 'PCMN-BASE', 'THIRDPARTY', '419', '875', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 903, 'PCMN-BASE', 'THIRDPARTY', '42', '1354', 'Dettes à plus d''un an échéant dans l''année', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 904, 'PCMN-BASE', 'THIRDPARTY', '420', '903', 'Emprunts subordonnés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 905, 'PCMN-BASE', 'THIRDPARTY', '4200', '904', 'Convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 906, 'PCMN-BASE', 'THIRDPARTY', '4201', '904', 'Non convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 907, 'PCMN-BASE', 'THIRDPARTY', '421', '903', 'Emprunts obligataires non subordonnés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 908, 'PCMN-BASE', 'THIRDPARTY', '4210', '907', 'Convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 909, 'PCMN-BASE', 'THIRDPARTY', '4211', '907', 'Non convertibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 910, 'PCMN-BASE', 'THIRDPARTY', '422', '903', 'Dettes de location-financement et assimilées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 911, 'PCMN-BASE', 'THIRDPARTY', '4220', '910', 'Financement de biens immobiliers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 912, 'PCMN-BASE', 'THIRDPARTY', '4221', '910', 'Financement de biens mobiliers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 913, 'PCMN-BASE', 'THIRDPARTY', '423', '903', 'Etablissements de crédit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 914, 'PCMN-BASE', 'THIRDPARTY', '4230', '913', 'Dettes en compte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 915, 'PCMN-BASE', 'THIRDPARTY', '4231', '913', 'Promesses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 916, 'PCMN-BASE', 'THIRDPARTY', '4232', '913', 'Crédits d''acceptation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 917, 'PCMN-BASE', 'THIRDPARTY', '424', '903', 'Autres emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 918, 'PCMN-BASE', 'THIRDPARTY', '425', '903', 'Dettes commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 919, 'PCMN-BASE', 'THIRDPARTY', '4250', '918', 'Fournisseurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 920, 'PCMN-BASE', 'THIRDPARTY', '4251', '918', 'Effets à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 921, 'PCMN-BASE', 'THIRDPARTY', '426', '903', 'Cautionnements reçus en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 922, 'PCMN-BASE', 'THIRDPARTY', '429', '903', 'Dettes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 923, 'PCMN-BASE', 'THIRDPARTY', '4290', '922', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 924, 'PCMN-BASE', 'THIRDPARTY', '4291', '922',
         'Entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 925, 'PCMN-BASE', 'THIRDPARTY', '4292', '922', 'Administrateurs, gérants, associés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 926, 'PCMN-BASE', 'THIRDPARTY', '4299', '922', 'Autres dettes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 927, 'PCMN-BASE', 'THIRDPARTY', '43', '1354', 'Dettes financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 928, 'PCMN-BASE', 'THIRDPARTY', '430', '927',
         'Etablissements de crédit. Emprunts en compte à terme fixe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 929, 'PCMN-BASE', 'THIRDPARTY', '431', '927', 'Etablissements de crédit. Promesses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 930, 'PCMN-BASE', 'THIRDPARTY', '432', '927', 'Etablissements de crédit. Crédits d''acceptation',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 931, 'PCMN-BASE', 'THIRDPARTY', '433', '927', 'Etablissements de crédit. Dettes en compte courant',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 932, 'PCMN-BASE', 'THIRDPARTY', '439', '927', 'Autres emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 933, 'PCMN-BASE', 'THIRDPARTY', '44', '1354', 'Dettes commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 934, 'PCMN-BASE', 'THIRDPARTY', '440', '933', 'Fournisseurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 935, 'PCMN-BASE', 'THIRDPARTY', '4400', '934', 'Entreprises apparentées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 936, 'PCMN-BASE', 'THIRDPARTY', '44000', '935', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 937, 'PCMN-BASE', 'THIRDPARTY', '44001', '935',
         'Entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 938, 'PCMN-BASE', 'THIRDPARTY', '4401', '934', 'Fournisseurs ordinaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 939, 'PCMN-BASE', 'THIRDPARTY', '44010', '938', 'Fournisseurs belges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 940, 'PCMN-BASE', 'THIRDPARTY', '44011', '938', 'Fournisseurs CEE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 941, 'PCMN-BASE', 'THIRDPARTY', '44012', '938', 'Fournisseurs importation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 942, 'PCMN-BASE', 'THIRDPARTY', '4402', '934',
         'Dettes envers les coparticipants (associations momentanées)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 943, 'PCMN-BASE', 'THIRDPARTY', '4403', '934', 'Fournisseurs - retenues de garanties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 944, 'PCMN-BASE', 'THIRDPARTY', '441', '933', 'Effets à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 945, 'PCMN-BASE', 'THIRDPARTY', '4410', '944', 'Entreprises apparentées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 946, 'PCMN-BASE', 'THIRDPARTY', '44100', '945', 'Entreprises liées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 947, 'PCMN-BASE', 'THIRDPARTY', '44101', '945',
         'Entreprises avec lesquelles il existe un lien de participation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 948, 'PCMN-BASE', 'THIRDPARTY', '4411', '944', 'Fournisseurs ordinaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 949, 'PCMN-BASE', 'THIRDPARTY', '44110', '948', 'Fournisseurs belges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 950, 'PCMN-BASE', 'THIRDPARTY', '44111', '948', 'Fournisseurs CEE', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 951, 'PCMN-BASE', 'THIRDPARTY', '44112', '948', 'Fournisseurs importation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 952, 'PCMN-BASE', 'THIRDPARTY', '444', '933', 'Factures à recevoir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 953, 'PCMN-BASE', 'THIRDPARTY', '446', '933', 'Acomptes reçus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 954, 'PCMN-BASE', 'THIRDPARTY', '448', '933', 'Compensations fournisseurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 955, 'PCMN-BASE', 'THIRDPARTY', '45', '1354', 'Dettes fiscales, salariales et sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 956, 'PCMN-BASE', 'THIRDPARTY', '450', '955', 'Dettes fiscales estimées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 957, 'PCMN-BASE', 'THIRDPARTY', '4501', '956', 'Impôts sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 958, 'PCMN-BASE', 'THIRDPARTY', '4505', '956', 'Autres impôts en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 959, 'PCMN-BASE', 'THIRDPARTY', '4508', '956', 'Impôts à l''étranger', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 960, 'PCMN-BASE', 'THIRDPARTY', '451', '955', 'T.V.A. à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 961, 'PCMN-BASE', 'THIRDPARTY', '4510', '960', 'T.V.A. due', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 962, 'PCMN-BASE', 'THIRDPARTY', '4511', '960', 'T.V.A. déductible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 963, 'PCMN-BASE', 'THIRDPARTY', '4512', '960', 'Compte courant administration T.V.A.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 964, 'PCMN-BASE', 'THIRDPARTY', '4518', '960', 'Taxe d''égalisation due', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 965, 'PCMN-BASE', 'THIRDPARTY', '452', '955', 'Impôts et taxes à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 966, 'PCMN-BASE', 'THIRDPARTY', '4520', '965', 'Autres impôts sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 967, 'PCMN-BASE', 'THIRDPARTY', '4525', '965', 'Autres impôts et taxes en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 968, 'PCMN-BASE', 'THIRDPARTY', '45250', '967', 'Précompte immobilier', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 969, 'PCMN-BASE', 'THIRDPARTY', '45251', '967', 'Impôts communaux à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 970, 'PCMN-BASE', 'THIRDPARTY', '45252', '967', 'Impôts provinciaux à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 971, 'PCMN-BASE', 'THIRDPARTY', '45253', '967', 'Autres impôts et taxes à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 972, 'PCMN-BASE', 'THIRDPARTY', '4528', '965', 'Impôts et taxes à l''étranger', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 973, 'PCMN-BASE', 'THIRDPARTY', '453', '955', 'Précomptes retenus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 974, 'PCMN-BASE', 'THIRDPARTY', '4530', '973', 'Précompte professionnel retenu sur rémunérations',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 975, 'PCMN-BASE', 'THIRDPARTY', '4531', '973', 'Précompte professionnel retenu sur tantièmes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 976, 'PCMN-BASE', 'THIRDPARTY', '4532', '973',
         'Précompte mobilier retenu sur dividendes attribués', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 977, 'PCMN-BASE', 'THIRDPARTY', '4533', '973', 'Précompte mobilier retenu sur intérêts payés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 978, 'PCMN-BASE', 'THIRDPARTY', '4538', '973', 'Autres précomptes retenus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 979, 'PCMN-BASE', 'THIRDPARTY', '454', '955', 'Office National de la Sécurité Sociale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 980, 'PCMN-BASE', 'THIRDPARTY', '4540', '979', 'Arriérés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 981, 'PCMN-BASE', 'THIRDPARTY', '4541', '979', '1er trimestre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 982, 'PCMN-BASE', 'THIRDPARTY', '4542', '979', '2ème trimestre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 983, 'PCMN-BASE', 'THIRDPARTY', '4543', '979', '3ème trimestre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 984, 'PCMN-BASE', 'THIRDPARTY', '4544', '979', '4ème trimestre', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 985, 'PCMN-BASE', 'THIRDPARTY', '455', '955', 'Rémunérations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 986, 'PCMN-BASE', 'THIRDPARTY', '4550', '985',
         'Administrateurs,  gérants et commissaires (non réviseurs)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 987, 'PCMN-BASE', 'THIRDPARTY', '4551', '985', 'Direction', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 988, 'PCMN-BASE', 'THIRDPARTY', '4552', '985', 'Employés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 989, 'PCMN-BASE', 'THIRDPARTY', '4553', '985', 'Ouvriers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 990, 'PCMN-BASE', 'THIRDPARTY', '456', '955', 'Pécules de vacances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 991, 'PCMN-BASE', 'THIRDPARTY', '4560', '990', 'Direction', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 992, 'PCMN-BASE', 'THIRDPARTY', '4561', '990', 'Employés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 993, 'PCMN-BASE', 'THIRDPARTY', '4562', '990', 'Ouvriers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 994, 'PCMN-BASE', 'THIRDPARTY', '459', '955', 'Autres dettes sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 995, 'PCMN-BASE', 'THIRDPARTY', '4590', '994', 'Provision pour gratifications de fin d''année', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 996, 'PCMN-BASE', 'THIRDPARTY', '4591', '994', 'Départs de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 997, 'PCMN-BASE', 'THIRDPARTY', '4592', '994', 'Oppositions sur rémunérations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 998, 'PCMN-BASE', 'THIRDPARTY', '4593', '994', 'Assurances relatives au personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 999, 'PCMN-BASE', 'THIRDPARTY', '45930', '998', 'Assurance loi', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1000, 'PCMN-BASE', 'THIRDPARTY', '45931', '998', 'Assurance salaire garanti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1001, 'PCMN-BASE', 'THIRDPARTY', '45932', '998', 'Assurance groupe', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1002, 'PCMN-BASE', 'THIRDPARTY', '45933', '998', 'Assurances individuelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1003, 'PCMN-BASE', 'THIRDPARTY', '4594', '994',
         'Caisse d''assurances sociales pour travailleurs indépendants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1004, 'PCMN-BASE', 'THIRDPARTY', '4597', '994', 'Dettes et provisions sociales diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1005, 'PCMN-BASE', 'THIRDPARTY', '46', '1354', 'Acomptes reçus sur commande', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1006, 'PCMN-BASE', 'THIRDPARTY', '47', '1354', 'Dettes découlant de l''affectation des résultats',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1007, 'PCMN-BASE', 'THIRDPARTY', '470', '1006', 'Dividendes et tantièmes d''exercices antérieurs',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1008, 'PCMN-BASE', 'THIRDPARTY', '471', '1006', 'Dividendes de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1009, 'PCMN-BASE', 'THIRDPARTY', '472', '1006', 'Tantièmes de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1010, 'PCMN-BASE', 'THIRDPARTY', '473', '1006', 'Autres allocataires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1011, 'PCMN-BASE', 'THIRDPARTY', '48', '4', 'Dettes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1012, 'PCMN-BASE', 'THIRDPARTY', '480', '1011', 'Obligations et coupons échus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1013, 'PCMN-BASE', 'THIRDPARTY', '481', '1011', 'Actionnaires - capital à rembourser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1014, 'PCMN-BASE', 'THIRDPARTY', '482', '1011', 'Participation du personnel à payer', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1015, 'PCMN-BASE', 'THIRDPARTY', '483', '1011', 'Acomptes reçus d''autres tiers à moins d''un an',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1016, 'PCMN-BASE', 'THIRDPARTY', '486', '1011', 'Emballages et matériel consignés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1017, 'PCMN-BASE', 'THIRDPARTY', '488', '1011', 'Cautionnements reçus en numéraires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1018, 'PCMN-BASE', 'THIRDPARTY', '489', '1011', 'Autres dettes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1019, 'PCMN-BASE', 'THIRDPARTY', '49', '1354', 'Comptes de régularisation et compte d''attente',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1020, 'PCMN-BASE', 'THIRDPARTY', '490', '1019',
         'Charges à reporter (à subdiviser par catégorie de charges)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1021, 'PCMN-BASE', 'THIRDPARTY', '491', '1019', 'Produits acquis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1022, 'PCMN-BASE', 'THIRDPARTY', '4910', '1021', 'Produits d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1023, 'PCMN-BASE', 'THIRDPARTY', '49100', '1022', 'Ristournes et rabais à obtenir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1024, 'PCMN-BASE', 'THIRDPARTY', '49101', '1022', 'Commissions à obtenir', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1025, 'PCMN-BASE', 'THIRDPARTY', '49102', '1022',
         'Autres produits d''exploitation (redevances par exemple)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1026, 'PCMN-BASE', 'THIRDPARTY', '4911', '1021', 'Produits financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1027, 'PCMN-BASE', 'THIRDPARTY', '49110', '1026',
         'Intérêts courus et non échus sur prêts et débits', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1028, 'PCMN-BASE', 'THIRDPARTY', '49111', '1026', 'Autres produits financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1029, 'PCMN-BASE', 'THIRDPARTY', '492', '1019',
         'Charges à imputer (à subdiviser par catégorie de charges)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1030, 'PCMN-BASE', 'THIRDPARTY', '493', '1019', 'Produits à reporter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1031, 'PCMN-BASE', 'THIRDPARTY', '4930', '1030', 'Produits d''exploitation à reporter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1032, 'PCMN-BASE', 'THIRDPARTY', '4931', '1030', 'Produits financiers à reporter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1033, 'PCMN-BASE', 'THIRDPARTY', '499', '1019', 'Comptes d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1034, 'PCMN-BASE', 'THIRDPARTY', '4990', '1033', 'Compte d''attente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1035, 'PCMN-BASE', 'THIRDPARTY', '4991', '1033', 'Compte de répartition périodique des charges',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1036, 'PCMN-BASE', 'THIRDPARTY', '4999', '1033', 'Transferts d''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1037, 'PCMN-BASE', 'FINAN', '50', '1355', 'Actions propres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1038, 'PCMN-BASE', 'FINAN', '51', '1355', 'Actions et parts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1039, 'PCMN-BASE', 'FINAN', '510', '1038', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1040, 'PCMN-BASE', 'FINAN', '511', '1038', 'Montants non appelés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1041, 'PCMN-BASE', 'FINAN', '519', '1038', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1042, 'PCMN-BASE', 'FINAN', '52', '1355', 'Titres à revenus fixes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1043, 'PCMN-BASE', 'FINAN', '520', '1042', 'Valeur d''acquisition', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1044, 'PCMN-BASE', 'FINAN', '529', '1042', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1045, 'PCMN-BASE', 'FINAN', '53', '1355', 'Dépots à terme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1046, 'PCMN-BASE', 'FINAN', '530', '1045', 'De plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1047, 'PCMN-BASE', 'FINAN', '531', '1045', 'De plus d''un mois et à un an au plus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1048, 'PCMN-BASE', 'FINAN', '532', '1045', 'd''un mois au plus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1049, 'PCMN-BASE', 'FINAN', '539', '1045', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1050, 'PCMN-BASE', 'FINAN', '54', '1355', 'Valeurs échues à l''encaissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1051, 'PCMN-BASE', 'FINAN', '540', '1050', 'Chèques à encaisser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1052, 'PCMN-BASE', 'FINAN', '541', '1050', 'Coupons à encaisser', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1053, 'PCMN-BASE', 'FINAN', '55', '1355',
         'Etablissements de crédit - Comptes ouverts auprès des divers établissements.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1054, 'PCMN-BASE', 'FINAN', '550', '1053', 'Comptes courants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1055, 'PCMN-BASE', 'FINAN', '551', '1053', 'Chèques émis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1056, 'PCMN-BASE', 'FINAN', '559', '1053', 'Réductions de valeur actées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1057, 'PCMN-BASE', 'FINAN', '56', '1355', 'Office des chèques postaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1058, 'PCMN-BASE', 'FINAN', '560', '1057', 'Compte courant', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1059, 'PCMN-BASE', 'FINAN', '561', '1057', 'Chèques émis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1060, 'PCMN-BASE', 'FINAN', '57', '1355', 'Caisses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1061, 'PCMN-BASE', 'FINAN', '570', '1060',
         'à 577 Caisses - espèces ( 0 - centrale ; 7 - succursales et agences)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1062, 'PCMN-BASE', 'FINAN', '578', '1060', 'Caisses - timbres ( 0 - fiscaux ; 1 - postaux)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1063, 'PCMN-BASE', 'FINAN', '58', '1355', 'Virements internes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1064, 'PCMN-BASE', 'EXPENSE', '60', '1356', 'Approvisionnements et marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1065, 'PCMN-BASE', 'EXPENSE', '600', '1064', 'Achats de matières premières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1066, 'PCMN-BASE', 'EXPENSE', '601', '1064', 'Achats de fournitures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1067, 'PCMN-BASE', 'EXPENSE', '602', '1064', 'Achats de services, travaux et études', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1068, 'PCMN-BASE', 'EXPENSE', '603', '1064', 'Sous-traitances générales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1069, 'PCMN-BASE', 'EXPENSE', '604', '1064', 'Achats de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1070, 'PCMN-BASE', 'EXPENSE', '605', '1064', 'Achats d''immeubles destinés à la revente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1071, 'PCMN-BASE', 'EXPENSE', '608', '1064', 'Remises , ristournes et rabais obtenus sur achats',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1072, 'PCMN-BASE', 'EXPENSE', '609', '1064', 'Variations de stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1073, 'PCMN-BASE', 'EXPENSE', '6090', '1072', 'De matières premières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1074, 'PCMN-BASE', 'EXPENSE', '6091', '1072', 'De fournitures', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1075, 'PCMN-BASE', 'EXPENSE', '6094', '1072', 'De marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1076, 'PCMN-BASE', 'EXPENSE', '6095', '1072', 'd''immeubles destinés à la vente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1077, 'PCMN-BASE', 'EXPENSE', '61', '1356', 'Services et biens divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1078, 'PCMN-BASE', 'EXPENSE', '610', '1077', 'Loyers et charges locatives', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1079, 'PCMN-BASE', 'EXPENSE', '6100', '1078', 'Loyers divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1080, 'PCMN-BASE', 'EXPENSE', '6101', '1078',
         'Charges locatives (assurances, frais de confort,etc)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1081, 'PCMN-BASE', 'EXPENSE', '611', '1077',
         'Entretien et réparation (fournitures et prestations)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1082, 'PCMN-BASE', 'EXPENSE', '612', '1077', 'Fournitures faites à l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1083, 'PCMN-BASE', 'EXPENSE', '6120', '1082', 'Eau, gaz, électricité, vapeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1084, 'PCMN-BASE', 'EXPENSE', '61200', '1083', 'Eau', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1085, 'PCMN-BASE', 'EXPENSE', '61201', '1083', 'Gaz', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1086, 'PCMN-BASE', 'EXPENSE', '61202', '1083', 'Electricité', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1087, 'PCMN-BASE', 'EXPENSE', '61203', '1083', 'Vapeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1088, 'PCMN-BASE', 'EXPENSE', '6121', '1082',
         'Téléphone, télégrammes, télex, téléfax, frais postaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1089, 'PCMN-BASE', 'EXPENSE', '61210', '1088', 'Téléphone', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1090, 'PCMN-BASE', 'EXPENSE', '61211', '1088', 'Télégrammes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1091, 'PCMN-BASE', 'EXPENSE', '61212', '1088', 'Télex et téléfax', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1092, 'PCMN-BASE', 'EXPENSE', '61213', '1088', 'Frais postaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1093, 'PCMN-BASE', 'EXPENSE', '6122', '1082', 'Livres, bibliothèque', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1094, 'PCMN-BASE', 'EXPENSE', '6123', '1082',
         'Imprimés et fournitures de bureau (si non comptabilisé au 601)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1095, 'PCMN-BASE', 'EXPENSE', '613', '1077', 'Rétributions de tiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1096, 'PCMN-BASE', 'EXPENSE', '6130', '1095', 'Redevances et royalties', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1097, 'PCMN-BASE', 'EXPENSE', '61300', '1096',
         'Redevances pour brevets, licences, marques et accessoires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1098, 'PCMN-BASE', 'EXPENSE', '61301', '1096', 'Autres redevances (procédés de fabrication)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1099, 'PCMN-BASE', 'EXPENSE', '6131', '1095', 'Assurances non relatives au personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1100, 'PCMN-BASE', 'EXPENSE', '61310', '1099', 'Assurance incendie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1101, 'PCMN-BASE', 'EXPENSE', '61311', '1099', 'Assurance vol', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1102, 'PCMN-BASE', 'EXPENSE', '61312', '1099', 'Assurance autos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1103, 'PCMN-BASE', 'EXPENSE', '61313', '1099', 'Assurance crédit', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1104, 'PCMN-BASE', 'EXPENSE', '61314', '1099', 'Assurances frais généraux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1105, 'PCMN-BASE', 'EXPENSE', '6132', '1095', 'Divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1106, 'PCMN-BASE', 'EXPENSE', '61320', '1105', 'Commissions aux tiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1107, 'PCMN-BASE', 'EXPENSE', '61321', '1105', 'Honoraires d''avocats, d''experts, etc', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1108, 'PCMN-BASE', 'EXPENSE', '61322', '1105', 'Cotisations aux groupements professionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1109, 'PCMN-BASE', 'EXPENSE', '61323', '1105', 'Dons, libéralités, etc', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1110, 'PCMN-BASE', 'EXPENSE', '61324', '1105', 'Frais de contentieux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1111, 'PCMN-BASE', 'EXPENSE', '61325', '1105', 'Publications légales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1112, 'PCMN-BASE', 'EXPENSE', '6133', '1095', 'Transports et déplacements', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1113, 'PCMN-BASE', 'EXPENSE', '61330', '1112', 'Transports de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1114, 'PCMN-BASE', 'EXPENSE', '61331', '1112', 'Voyages, déplacements et représentations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1115, 'PCMN-BASE', 'EXPENSE', '6134', '1095', 'Personnel intérimaire', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1116, 'PCMN-BASE', 'EXPENSE', '614', '1077', 'Annonces, publicité, propagande et documentation',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1117, 'PCMN-BASE', 'EXPENSE', '6140', '1116', 'Annonces et insertions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1118, 'PCMN-BASE', 'EXPENSE', '6141', '1116', 'Catalogues et imprimés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1119, 'PCMN-BASE', 'EXPENSE', '6142', '1116', 'Echantillons', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1120, 'PCMN-BASE', 'EXPENSE', '6143', '1116', 'Foires et expositions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1121, 'PCMN-BASE', 'EXPENSE', '6144', '1116', 'Primes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1122, 'PCMN-BASE', 'EXPENSE', '6145', '1116', 'Cadeaux à la clientèle', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1123, 'PCMN-BASE', 'EXPENSE', '6146', '1116', 'Missions et réceptions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1124, 'PCMN-BASE', 'EXPENSE', '6147', '1116', 'Documentation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1125, 'PCMN-BASE', 'EXPENSE', '615', '1077', 'Sous-traitants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1126, 'PCMN-BASE', 'EXPENSE', '6150', '1125', 'Sous-traitants pour activités propres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1127, 'PCMN-BASE', 'EXPENSE', '6151', '1125',
         'Sous-traitants d''associations momentanées (coparticipants)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1128, 'PCMN-BASE', 'EXPENSE', '6152', '1125', 'Quote-part bénéficiaire des coparticipants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1129, 'PCMN-BASE', 'EXPENSE', '617', '1077',
         'Personnel intérimaire et personnes mises à la disposition de l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1130, 'PCMN-BASE', 'EXPENSE', '618', '1077',
         'Rémunérations, primes pour assurances extralégales, pensions de retraite et de survie des administrateurs, gérants et associés actifs qui ne sont pas attribuées en vertu d''un contrat de travail',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1131, 'PCMN-BASE', 'EXPENSE', '62', '1356', 'Rémunérations, charges sociales et pensions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1132, 'PCMN-BASE', 'EXPENSE', '620', '1131', 'Rémunérations et avantages sociaux directs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1133, 'PCMN-BASE', 'EXPENSE', '6200', '1132', 'Administrateurs ou gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1134, 'PCMN-BASE', 'EXPENSE', '6201', '1132', 'Personnel de direction', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1135, 'PCMN-BASE', 'EXPENSE', '6202', '1132', 'Employés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1136, 'PCMN-BASE', 'EXPENSE', '6203', '1132', 'Ouvriers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1137, 'PCMN-BASE', 'EXPENSE', '6204', '1132', 'Autres membres du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1138, 'PCMN-BASE', 'EXPENSE', '621', '1131', 'Cotisations patronales d''assurances sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1139, 'PCMN-BASE', 'EXPENSE', '6210', '1138', 'Sur salaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1140, 'PCMN-BASE', 'EXPENSE', '6211', '1138', 'Sur appointements et commissions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1141, 'PCMN-BASE', 'EXPENSE', '622', '1131', 'Primes patronales pour assurances extralégales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1142, 'PCMN-BASE', 'EXPENSE', '623', '1131', 'Autres frais de personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1143, 'PCMN-BASE', 'EXPENSE', '6230', '1142', 'Assurances du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1144, 'PCMN-BASE', 'EXPENSE', '62300', '1143',
         'Assurances loi, responsabilité civile, chemin du travail', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1145, 'PCMN-BASE', 'EXPENSE', '62301', '1143', 'Assurance salaire garanti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1146, 'PCMN-BASE', 'EXPENSE', '62302', '1143', 'Assurances individuelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1147, 'PCMN-BASE', 'EXPENSE', '6231', '1142', 'Charges sociales diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1148, 'PCMN-BASE', 'EXPENSE', '62310', '1147', 'Jours fériés payés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1149, 'PCMN-BASE', 'EXPENSE', '62311', '1147', 'Salaire hebdomadaire garanti', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1150, 'PCMN-BASE', 'EXPENSE', '62312', '1147', 'Allocations familiales complémentaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1151, 'PCMN-BASE', 'EXPENSE', '6232', '1142',
         'Charges sociales des administrateurs, gérants et commissaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1152, 'PCMN-BASE', 'EXPENSE', '62320', '1151',
         'Allocations familiales complémentaires pour non salariés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1153, 'PCMN-BASE', 'EXPENSE', '62321', '1151', 'Lois sociales pour indépendants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1154, 'PCMN-BASE', 'EXPENSE', '62322', '1151', 'Divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1155, 'PCMN-BASE', 'EXPENSE', '624', '1131', 'Pensions de retraite et de survie', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1156, 'PCMN-BASE', 'EXPENSE', '6240', '1155', 'Administrateurs et gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1157, 'PCMN-BASE', 'EXPENSE', '6241', '1155', 'Personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1158, 'PCMN-BASE', 'EXPENSE', '625', '1131', 'Provision pour pécule de vacances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1159, 'PCMN-BASE', 'EXPENSE', '6250', '1158', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1160, 'PCMN-BASE', 'EXPENSE', '6251', '1158', 'Utilisations et reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1161, 'PCMN-BASE', 'EXPENSE', '63', '1356',
         'Amortissements, réductions de valeur et provisions pour risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1162, 'PCMN-BASE', 'EXPENSE', '630', '1161',
         'Dotations aux amortissements et aux réductions de valeur sur immobilisations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1163, 'PCMN-BASE', 'EXPENSE', '6300', '1162',
         'Dotations aux amortissements sur frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1164, 'PCMN-BASE', 'EXPENSE', '6301', '1162',
         'Dotations aux amortissements sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1165, 'PCMN-BASE', 'EXPENSE', '6302', '1162',
         'Dotations aux amortissements sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1166, 'PCMN-BASE', 'EXPENSE', '6308', '1162',
         'Dotations aux réductions de valeur sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1167, 'PCMN-BASE', 'EXPENSE', '6309', '1162',
         'Dotations aux réductions de valeur sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1168, 'PCMN-BASE', 'EXPENSE', '631', '1161', 'Réductions de valeur sur stocks', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1169, 'PCMN-BASE', 'EXPENSE', '6310', '1168', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1170, 'PCMN-BASE', 'EXPENSE', '6311', '1168', 'Reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1171, 'PCMN-BASE', 'EXPENSE', '632', '1161',
         'Réductions de valeur sur commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1172, 'PCMN-BASE', 'EXPENSE', '6320', '1171', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1173, 'PCMN-BASE', 'EXPENSE', '6321', '1171', 'Reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1174, 'PCMN-BASE', 'EXPENSE', '633', '1161',
         'Réductions de valeur sur créances commerciales à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1175, 'PCMN-BASE', 'EXPENSE', '6330', '1174', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1176, 'PCMN-BASE', 'EXPENSE', '6331', '1174', 'Reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1177, 'PCMN-BASE', 'EXPENSE', '634', '1161',
         'Réductions de valeur sur créances commerciales à un an au plus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1178, 'PCMN-BASE', 'EXPENSE', '6340', '1177', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1179, 'PCMN-BASE', 'EXPENSE', '6341', '1177', 'Reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1180, 'PCMN-BASE', 'EXPENSE', '635', '1161', 'Provisions pour pensions et obligations similaires',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1181, 'PCMN-BASE', 'EXPENSE', '6350', '1180', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1182, 'PCMN-BASE', 'EXPENSE', '6351', '1180', 'Utilisations et reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1183, 'PCMN-BASE', 'EXPENSE', '636', '11613',
         'Provisions pour grosses réparations et gros entretiens', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1184, 'PCMN-BASE', 'EXPENSE', '6360', '1183', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1185, 'PCMN-BASE', 'EXPENSE', '6361', '1183', 'Utilisations et reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1186, 'PCMN-BASE', 'EXPENSE', '637', '1161', 'Provisions pour autres risques et charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1187, 'PCMN-BASE', 'EXPENSE', '6370', '1186', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1188, 'PCMN-BASE', 'EXPENSE', '6371', '1186', 'Utilisations et reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1189, 'PCMN-BASE', 'EXPENSE', '64', '1356', 'Autres charges d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1190, 'PCMN-BASE', 'EXPENSE', '640', '1189', 'Charges fiscales d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1191, 'PCMN-BASE', 'EXPENSE', '6400', '1190', 'Taxes et impôts directs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1192, 'PCMN-BASE', 'EXPENSE', '64000', '1191', 'Taxes sur autos et camions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1193, 'PCMN-BASE', 'EXPENSE', '6401', '1190', 'Taxes et impôts indirects', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1194, 'PCMN-BASE', 'EXPENSE', '64010', '1193', 'Timbres fiscaux pris en charge par la firme', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1195, 'PCMN-BASE', 'EXPENSE', '64011', '1193', 'Droits d''enregistrement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1196, 'PCMN-BASE', 'EXPENSE', '64012', '1193', 'T.V.A. non déductible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1197, 'PCMN-BASE', 'EXPENSE', '6402', '1190', 'Impôts provinciaux et communaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1198, 'PCMN-BASE', 'EXPENSE', '64020', '1197', 'Taxe sur la force motrice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1199, 'PCMN-BASE', 'EXPENSE', '64021', '1197', 'Taxe sur le personnel occupé', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1200, 'PCMN-BASE', 'EXPENSE', '6403', '1190', 'Taxes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1201, 'PCMN-BASE', 'EXPENSE', '641', '1189',
         'Moins-values sur réalisations courantes d''immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1202, 'PCMN-BASE', 'EXPENSE', '642', '1189',
         'Moins-values sur réalisations de créances commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1203, 'PCMN-BASE', 'EXPENSE', '643', '1189', 'à 648 Charges d''exploitations diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1204, 'PCMN-BASE', 'EXPENSE', '649', '1189',
         'Charges d''exploitation portées à l''actif au titre de restructuration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1205, 'PCMN-BASE', 'EXPENSE', '65', '1356', 'Charges financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1206, 'PCMN-BASE', 'EXPENSE', '650', '1205', 'Charges des dettes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1207, 'PCMN-BASE', 'EXPENSE', '6500', '1206',
         'Intérêts, commissions et frais afférents aux dettes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1208, 'PCMN-BASE', 'EXPENSE', '6501', '1206',
         'Amortissements des agios et frais d''émission d''emprunts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1209, 'PCMN-BASE', 'EXPENSE', '6502', '1206', 'Autres charges de dettes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1210, 'PCMN-BASE', 'EXPENSE', '6503', '1206', 'Intérêts intercalaires portés à l''actif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1211, 'PCMN-BASE', 'EXPENSE', '651', '1205', 'Réductions de valeur sur actifs circulants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1212, 'PCMN-BASE', 'EXPENSE', '6510', '1211', 'Dotations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1213, 'PCMN-BASE', 'EXPENSE', '6511', '1211', 'Reprises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1214, 'PCMN-BASE', 'EXPENSE', '652', '1205', 'Moins-values sur réalisation d''actifs circulants',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1215, 'PCMN-BASE', 'EXPENSE', '653', '1205', 'Charges d''escompte de créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1216, 'PCMN-BASE', 'EXPENSE', '654', '1205', 'Différences de change', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1217, 'PCMN-BASE', 'EXPENSE', '655', '1205', 'Ecarts de conversion des devises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1218, 'PCMN-BASE', 'EXPENSE', '656', '1205', 'Frais de banques, de chèques postaux', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1219, 'PCMN-BASE', 'EXPENSE', '657', '1205',
         'Commissions sur ouvertures de crédit, cautions et avals', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1220, 'PCMN-BASE', 'EXPENSE', '658', '1205', 'Frais de vente des titres', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1221, 'PCMN-BASE', 'EXPENSE', '66', '1356', 'Charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1222, 'PCMN-BASE', 'EXPENSE', '660', '1221',
         'Amortissements et réductions de valeur exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1223, 'PCMN-BASE', 'EXPENSE', '6600', '1222', 'Sur frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1224, 'PCMN-BASE', 'EXPENSE', '6601', '1222', 'Sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1225, 'PCMN-BASE', 'EXPENSE', '6602', '1222', 'Sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1226, 'PCMN-BASE', 'EXPENSE', '661', '1221',
         'Réductions de valeur sur immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1227, 'PCMN-BASE', 'EXPENSE', '662', '1221', 'Provisions pour risques et charges exceptionnels',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1228, 'PCMN-BASE', 'EXPENSE', '663', '1221', 'Moins-values sur réalisation d''actifs immobilisés',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1229, 'PCMN-BASE', 'EXPENSE', '6630', '1228', 'Sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1230, 'PCMN-BASE', 'EXPENSE', '6631', '1228', 'Sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1231, 'PCMN-BASE', 'EXPENSE', '6632', '1228',
         'Sur immobilisations détenues en location-financement et droits similaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1232, 'PCMN-BASE', 'EXPENSE', '6633', '1228', 'Sur immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1233, 'PCMN-BASE', 'EXPENSE', '6634', '1228',
         'Sur immeubles acquis ou construits en vue de la revente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1234, 'PCMN-BASE', 'EXPENSE', '668', '1221', 'Autres charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1235, 'PCMN-BASE', 'EXPENSE', '664', '1221', 'Pénalités et amendes diverses', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1236, 'PCMN-BASE', 'EXPENSE', '665', '1221', 'Différence de charge', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1237, 'PCMN-BASE', 'EXPENSE', '669', '1221',
         'Charges exceptionnelles transférées à l''actif en frais de restructuration', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1238, 'PCMN-BASE', 'EXPENSE', '67', '1356', 'Impôts sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1239, 'PCMN-BASE', 'EXPENSE', '670', '1238', 'Impôts belges sur le résultat de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1240, 'PCMN-BASE', 'EXPENSE', '6700', '1239', 'Impôts et précomptes dus ou versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1241, 'PCMN-BASE', 'EXPENSE', '6701', '1239',
         'Excédent de versements d''impôts et précomptes porté à l''actif', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1242, 'PCMN-BASE', 'EXPENSE', '6702', '1239', 'Charges fiscales estimées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1243, 'PCMN-BASE', 'EXPENSE', '671', '1238',
         'Impôts belges sur le résultat d''exercices antérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1244, 'PCMN-BASE', 'EXPENSE', '6710', '1243', 'Suppléments d''impôts dus ou versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1245, 'PCMN-BASE', 'EXPENSE', '6711', '1243', 'Suppléments d''impôts estimés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1246, 'PCMN-BASE', 'EXPENSE', '6712', '1243', 'Provisions fiscales constituées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1247, 'PCMN-BASE', 'EXPENSE', '672', '1238', 'Impôts étrangers sur le résultat de l''exercice', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1248, 'PCMN-BASE', 'EXPENSE', '673', '1238',
         'Impôts étrangers sur le résultat d''exercices antérieurs', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1249, 'PCMN-BASE', 'EXPENSE', '68', '1356', 'Transferts aux réserves immunisées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1250, 'PCMN-BASE', 'EXPENSE', '69', '1356', 'Affectation des résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1251, 'PCMN-BASE', 'EXPENSE', '690', '1250', 'Perte reportée de l''exercice précédent', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1252, 'PCMN-BASE', 'EXPENSE', '691', '1250', 'Dotation à la réserve légale', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1253, 'PCMN-BASE', 'EXPENSE', '692', '1250', 'Dotation aux autres réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1254, 'PCMN-BASE', 'EXPENSE', '693', '1250', 'Bénéfice à reporter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1255, 'PCMN-BASE', 'EXPENSE', '694', '1250', 'Rémunération du capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1256, 'PCMN-BASE', 'EXPENSE', '695', '1250', 'Administrateurs ou gérants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1257, 'PCMN-BASE', 'EXPENSE', '696', '1250', 'Autres allocataires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1258, 'PCMN-BASE', 'INCOME', '70', '1357', 'Chiffre d''affaires', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1260, 'PCMN-BASE', 'INCOME', '700', '1258', 'Ventes de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1261, 'PCMN-BASE', 'INCOME', '7000', '1260', 'Ventes en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1262, 'PCMN-BASE', 'INCOME', '7001', '1260', 'Ventes dans les pays membres de la C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1263, 'PCMN-BASE', 'INCOME', '7002', '1260', 'Ventes à l''exportation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1264, 'PCMN-BASE', 'INCOME', '701', '1258', 'Ventes de produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1265, 'PCMN-BASE', 'INCOME', '7010', '1264', 'Ventes en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1266, 'PCMN-BASE', 'INCOME', '7011', '1264', 'Ventes dans les pays membres de la C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1267, 'PCMN-BASE', 'INCOME', '7012', '1264', 'Ventes à l''exportation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1268, 'PCMN-BASE', 'INCOME', '702', '1258', 'Ventes de déchets et rebuts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1269, 'PCMN-BASE', 'INCOME', '7020', '1268', 'Ventes en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1270, 'PCMN-BASE', 'INCOME', '7021', '1268', 'Ventes dans les pays membres de la C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1271, 'PCMN-BASE', 'INCOME', '7022', '1268', 'Ventes à l''exportation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1272, 'PCMN-BASE', 'INCOME', '703', '1258', 'Ventes d''emballages récupérables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1273, 'PCMN-BASE', 'INCOME', '704', '1258',
         'Facturations des travaux en cours (associations momentanées)', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1274, 'PCMN-BASE', 'INCOME', '705', '1258', 'Prestations de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1275, 'PCMN-BASE', 'INCOME', '7050', '1274', 'Prestations de services en Belgique', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1276, 'PCMN-BASE', 'INCOME', '7051', '1274',
         'Prestations de services dans les pays membres de la C.E.E.', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1277, 'PCMN-BASE', 'INCOME', '7052', '1274', 'Prestations de services en vue de l''exportation',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1278, 'PCMN-BASE', 'INCOME', '706', '1258', 'Pénalités et dédits obtenus par l''entreprise', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1279, 'PCMN-BASE', 'INCOME', '708', '1258', 'Remises, ristournes et rabais accordés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1280, 'PCMN-BASE', 'INCOME', '7080', '1279', 'Sur ventes de marchandises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1281, 'PCMN-BASE', 'INCOME', '7081', '1279', 'Sur ventes de produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1282, 'PCMN-BASE', 'INCOME', '7082', '1279', 'Sur ventes de déchets et rebuts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1283, 'PCMN-BASE', 'INCOME', '7083', '1279', 'Sur prestations de services', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1284, 'PCMN-BASE', 'INCOME', '7084', '1279',
         'Mali sur travaux facturés aux associations momentanées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1285, 'PCMN-BASE', 'INCOME', '71', '1357',
         'Variation des stocks et des commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1286, 'PCMN-BASE', 'INCOME', '712', '1285', 'Des en cours de fabrication', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1287, 'PCMN-BASE', 'INCOME', '713', '1285', 'Des produits finis', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1288, 'PCMN-BASE', 'INCOME', '715', '1285', 'Des immeubles construits destinés à la vente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1289, 'PCMN-BASE', 'INCOME', '717', '1285', 'Des commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1290, 'PCMN-BASE', 'INCOME', '7170', '1289', 'Commandes en cours - Coût de revient', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1291, 'PCMN-BASE', 'INCOME', '71700', '1290', 'Coût des commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1292, 'PCMN-BASE', 'INCOME', '71701', '1290',
         'Coût des travaux en cours des associations momentanées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1293, 'PCMN-BASE', 'INCOME', '7171', '1289', 'Bénéfices portés en compte sur commandes en cours',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1294, 'PCMN-BASE', 'INCOME', '71710', '1293', 'Sur commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1295, 'PCMN-BASE', 'INCOME', '71711', '1293', 'Sur travaux en cours des associations momentanées',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1296, 'PCMN-BASE', 'INCOME', '72', '1357', 'Production immobilisée', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1297, 'PCMN-BASE', 'INCOME', '720', '1296', 'En frais d''établissement', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1298, 'PCMN-BASE', 'INCOME', '721', '1296', 'En immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1299, 'PCMN-BASE', 'INCOME', '722', '1296', 'En immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1300, 'PCMN-BASE', 'INCOME', '723', '1296', 'En immobilisations en cours', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1301, 'PCMN-BASE', 'INCOME', '74', '1357', 'Autres produits d''exploitation', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1302, 'PCMN-BASE', 'INCOME', '740', '1301', 'Subsides d''exploitation et montants compensatoires',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1303, 'PCMN-BASE', 'INCOME', '741', '1301',
         'Plus-values sur réalisations courantes d''immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1304, 'PCMN-BASE', 'INCOME', '742', '1301',
         'Plus-values sur réalisations de créances commerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1306, 'PCMN-BASE', 'INCOME', '743', '1301',
         'Produits de services exploités dans l''intérêt du personnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1307, 'PCMN-BASE', 'INCOME', '744', '1301', 'Commissions et courtages', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1308, 'PCMN-BASE', 'INCOME', '745', '1301', 'Redevances pour brevets et licences', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1309, 'PCMN-BASE', 'INCOME', '746', '1301', 'Prestations de services (transports, études, etc)',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1310, 'PCMN-BASE', 'INCOME', '747', '1301',
         'Revenus des immeubles affectés aux activités non professionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1311, 'PCMN-BASE', 'INCOME', '748', '1301', 'Locations diverses à caractère professionnel', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1312, 'PCMN-BASE', 'INCOME', '749', '1301', 'Produits divers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1313, 'PCMN-BASE', 'INCOME', '7490', '1312', 'Bonis sur reprises d''emballages consignés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1314, 'PCMN-BASE', 'INCOME', '7491', '1312', 'Bonis sur travaux en associations momentanées', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1315, 'PCMN-BASE', 'INCOME', '75', '1357', 'Produits financiers', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1316, 'PCMN-BASE', 'INCOME', '750', '1315', 'Produits des immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1317, 'PCMN-BASE', 'INCOME', '7500', '1316', 'Revenus des actions', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1318, 'PCMN-BASE', 'INCOME', '7501', '1316', 'Revenus des obligations', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1319, 'PCMN-BASE', 'INCOME', '7502', '1316', 'Revenus des créances à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1320, 'PCMN-BASE', 'INCOME', '751', '1315', 'Produits des actifs circulants', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1321, 'PCMN-BASE', 'INCOME', '752', '1315', 'Plus-values sur réalisations d''actifs circulants',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1322, 'PCMN-BASE', 'INCOME', '753', '1315', 'Subsides en capital et en intérêts', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1323, 'PCMN-BASE', 'INCOME', '754', '1315', 'Différences de change', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1324, 'PCMN-BASE', 'INCOME', '755', '1315', 'Ecarts de conversion des devises', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1326, 'PCMN-BASE', 'INCOME', '756', '1315', 'Produits des autres créances', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1327, 'PCMN-BASE', 'INCOME', '757', '1315', 'Escomptes obtenus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1328, 'PCMN-BASE', 'INCOME', '76', '1357', 'Produits exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1329, 'PCMN-BASE', 'INCOME', '760', '1328',
         'Reprises d''amortissements et de réductions de valeur', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1330, 'PCMN-BASE', 'INCOME', '7600', '1329', 'Sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1331, 'PCMN-BASE', 'INCOME', '7601', '1329', 'Sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1332, 'PCMN-BASE', 'INCOME', '761', '1328',
         'Reprises de réductions de valeur sur immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1333, 'PCMN-BASE', 'INCOME', '762', '1328',
         'Reprises de provisions pour risques et charges exceptionnelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1334, 'PCMN-BASE', 'INCOME', '763', '1328', 'Plus-values sur réalisation d''actifs immobilisés',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1335, 'PCMN-BASE', 'INCOME', '7630', '1334', 'Sur immobilisations incorporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1336, 'PCMN-BASE', 'INCOME', '7631', '1334', 'Sur immobilisations corporelles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1337, 'PCMN-BASE', 'INCOME', '7632', '1334', 'Sur immobilisations financières', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1338, 'PCMN-BASE', 'INCOME', '764', '1328', 'Autres produits exceptionnels', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1339, 'PCMN-BASE', 'INCOME', '77', '1357',
         'Régularisations d''impôts et reprises de provisions fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1340, 'PCMN-BASE', 'INCOME', '771', '1339', 'Impôts belges sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1341, 'PCMN-BASE', 'INCOME', '7710', '1340', 'Régularisations d''impôts dus ou versés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1342, 'PCMN-BASE', 'INCOME', '7711', '1340', 'Régularisations d''impôts estimés', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1343, 'PCMN-BASE', 'INCOME', '7712', '1340', 'Reprises de provisions fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1344, 'PCMN-BASE', 'INCOME', '773', '1339', 'Impôts étrangers sur le résultat', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1345, 'PCMN-BASE', 'INCOME', '79', '1357', 'Affectation aux résultats', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1346, 'PCMN-BASE', 'INCOME', '790', '1345', 'Bénéfice reporté de l''exercice précédent', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1347, 'PCMN-BASE', 'INCOME', '791', '1345', 'Prélèvement sur le capital et les primes d''émission',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1348, 'PCMN-BASE', 'INCOME', '792', '1345', 'Prélèvement sur les réserves', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1349, 'PCMN-BASE', 'INCOME', '793', '1345', 'Perte à reporter', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1350, 'PCMN-BASE', 'INCOME', '794', '1345',
         'Intervention d''associés (ou du propriétaire) dans la perte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1351, 'PCMN-BASE', 'CAPIT', '1', '0',
         'Fonds propres, provisions pour risques et charges et dettes à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1352, 'PCMN-BASE', 'IMMO', '2', '0',
         'Frais d''établissement. Actifs immobilisés et créances à plus d''un an', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1353, 'PCMN-BASE', 'STOCK', '3', '0', 'Stock et commandes en cours d''exécution', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1354, 'PCMN-BASE', 'THIRDPARTY', '4', '0', 'Créances et dettes à un an au plus', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1355, 'PCMN-BASE', 'FINAN', '5', '0', 'Placement de trésorerie et de valeurs disponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1356, 'PCMN-BASE', 'EXPENSE', '6', '0', 'Charges', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 1357, 'PCMN-BASE', 'INCOME', '7', '0', 'Produits', 1);
