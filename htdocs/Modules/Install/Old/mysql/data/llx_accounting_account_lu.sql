-- Descriptif plan comptable LU PCN
-- ID 11000 - 12999
-- ADD 14000000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11000, 'PCN-LUXEMBURG', 'CAPIT', '1', '',
         'Capital ou dotation des succursales et comptes de l''exploitant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11001, 'PCN-LUXEMBURG', 'CAPIT', '101', 11000,
         'Capital souscrit (Sociétés de capitaux - Montant total)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11002, 'PCN-LUXEMBURG', 'CAPIT', '102', 11000,
         'Capital souscrit non appelé (Sociétés de capitaux)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11003, 'PCN-LUXEMBURG', 'CAPIT', '103', 11000,
         'Capital souscrit appelé et non versé (Sociétés de capitaux)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11004, 'PCN-LUXEMBURG', 'CAPIT', '104', 11000,
         'Capital des entreprises commerçants personnes physiques et des sociétés de personnes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11005, 'PCN-LUXEMBURG', 'CAPIT', '1041', 11004, 'Commerçants personnes physiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11006, 'PCN-LUXEMBURG', 'CAPIT', '1042', 11004, 'Sociétés de personnes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11007, 'PCN-LUXEMBURG', 'CAPIT', '105', 11000, 'Dotation des succursales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11008, 'PCN-LUXEMBURG', 'CAPIT', '106', 11000, 'Comptes de l’exploitant ou des co-exploitants',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11009, 'PCN-LUXEMBURG', 'CAPIT', '1061', 11008,
         'Prélèvements privés de l’exploitant ou des coexploitants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11010, 'PCN-LUXEMBURG', 'CAPIT', '10611', 11009, 'Prélèvements en numéraire (train de vie)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11011, 'PCN-LUXEMBURG', 'CAPIT', '10612', 11009,
         'Prélèvements en nature de marchandises, de produits finis et services (au prix de revient)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11012, 'PCN-LUXEMBURG', 'CAPIT', '10613', 11009, 'Part personnelle des frais de maladie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11013, 'PCN-LUXEMBURG', 'CAPIT', '10614', 11009, 'Primes d’assurances privées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11014, 'PCN-LUXEMBURG', 'CAPIT', '106141', 11013, 'Vie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11015, 'PCN-LUXEMBURG', 'CAPIT', '106142', 11013, 'Accident', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11016, 'PCN-LUXEMBURG', 'CAPIT', '106143', 11013, 'Incendie', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11017, 'PCN-LUXEMBURG', 'CAPIT', '106144', 11013, 'Responsabilité civile', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11018, 'PCN-LUXEMBURG', 'CAPIT', '106145', 11013, 'Multirisques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11019, 'PCN-LUXEMBURG', 'CAPIT', '106148', 11013, 'Autres primes d’assurances privées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11020, 'PCN-LUXEMBURG', 'CAPIT', '10615', 11009, 'Cotisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11021, 'PCN-LUXEMBURG', 'CAPIT', '106151', 11020, 'Assurances sociales (assurance dépendance)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11022, 'PCN-LUXEMBURG', 'CAPIT', '106152', 11020, 'Allocations familiales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11023, 'PCN-LUXEMBURG', 'CAPIT', '106153', 11020, 'Cotisations pour mutuelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11024, 'PCN-LUXEMBURG', 'CAPIT', '106154', 11020,
         'Caisse de décès, médicochirurgicale, Prestaplus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11025, 'PCN-LUXEMBURG', 'CAPIT', '106158', 11020, 'Autres cotisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11026, 'PCN-LUXEMBURG', 'CAPIT', '10616', 11009,
         'Prélèvements en nature (quote-part privée dans les frais généraux)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11027, 'PCN-LUXEMBURG', 'CAPIT', '106161', 11026, 'Salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11028, 'PCN-LUXEMBURG', 'CAPIT', '106162', 11026, 'Loyer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11029, 'PCN-LUXEMBURG', 'CAPIT', '106163', 11026, 'Chauffage, gaz, électricité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11030, 'PCN-LUXEMBURG', 'CAPIT', '106164', 11026, 'Eau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11031, 'PCN-LUXEMBURG', 'CAPIT', '106165', 11026, 'Téléphone', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11032, 'PCN-LUXEMBURG', 'CAPIT', '106166', 11026, 'Voiture', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11033, 'PCN-LUXEMBURG', 'CAPIT', '106168', 11026, 'Autres prélèvements en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11034, 'PCN-LUXEMBURG', 'CAPIT', '10617', 11009, 'Acquisitions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11035, 'PCN-LUXEMBURG', 'CAPIT', '106171', 11034, 'Mobilier privé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11036, 'PCN-LUXEMBURG', 'CAPIT', '106172', 11034, 'Voiture privée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11037, 'PCN-LUXEMBURG', 'CAPIT', '106173', 11034, 'Titres privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11038, 'PCN-LUXEMBURG', 'CAPIT', '106174', 11034, 'Immeubles privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11039, 'PCN-LUXEMBURG', 'CAPIT', '106178', 11034, 'Autres acquisitions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11040, 'PCN-LUXEMBURG', 'CAPIT', '10618', 11009, 'Impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11041, 'PCN-LUXEMBURG', 'CAPIT', '106181', 11040, 'Impôt sur le revenu payé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11042, 'PCN-LUXEMBURG', 'CAPIT', '106182', 11040, 'Impôt sur la fortune payé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11043, 'PCN-LUXEMBURG', 'CAPIT', '106183', 11040, 'Impôt commercial - arriérés payés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11044, 'PCN-LUXEMBURG', 'CAPIT', '106188', 11040, 'Autres impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11045, 'PCN-LUXEMBURG', 'CAPIT', '10619', 11009, 'Prélèvements privés particuliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11046, 'PCN-LUXEMBURG', 'CAPIT', '106191', 11045, 'Réparations aux immeubles privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11047, 'PCN-LUXEMBURG', 'CAPIT', '106192', 11045, 'Placements sur comptes financiers privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11048, 'PCN-LUXEMBURG', 'CAPIT', '106193', 11045, 'Remboursements de dettes privées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11049, 'PCN-LUXEMBURG', 'CAPIT', '106194', 11045, 'Dons et dotations aux enfants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11050, 'PCN-LUXEMBURG', 'CAPIT', '106195', 11045,
         'Droits de succession et droits de mutation par décès', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11051, 'PCN-LUXEMBURG', 'CAPIT', '106198', 11045, 'Autres prélèvements privés particuliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11052, 'PCN-LUXEMBURG', 'CAPIT', '1062', 11008,
         'Suppléments d’apports privés de l’exploitant ou des coexploitants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11053, 'PCN-LUXEMBURG', 'CAPIT', '10621', 11052, 'Héritage ou donation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11054, 'PCN-LUXEMBURG', 'CAPIT', '10622', 11052, 'Avoirs privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11055, 'PCN-LUXEMBURG', 'CAPIT', '10623', 11052, 'Emprunts privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11056, 'PCN-LUXEMBURG', 'CAPIT', '10624', 11052, 'Cessions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11057, 'PCN-LUXEMBURG', 'CAPIT', '106241', 11056, 'Mobilier privé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11058, 'PCN-LUXEMBURG', 'CAPIT', '106242', 11056, 'Voiture privée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11059, 'PCN-LUXEMBURG', 'CAPIT', '106243', 11056, 'Titres privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11060, 'PCN-LUXEMBURG', 'CAPIT', '106244', 11056, 'Immeubles privés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11061, 'PCN-LUXEMBURG', 'CAPIT', '106248', 11056, 'Autres cessions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11062, 'PCN-LUXEMBURG', 'CAPIT', '10625', 11052, 'Loyers encaissés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11063, 'PCN-LUXEMBURG', 'CAPIT', '10626', 11052, 'Salaires ou rentes touchés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11064, 'PCN-LUXEMBURG', 'CAPIT', '10627', 11052, 'Allocations familiales reçues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11065, 'PCN-LUXEMBURG', 'CAPIT', '10628', 11052, 'Remboursements d’impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11066, 'PCN-LUXEMBURG', 'CAPIT', '106281', 11065, 'Impôt sur le revenu', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11067, 'PCN-LUXEMBURG', 'CAPIT', '106283', 11065, 'Impôt sur la fortune', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11068, 'PCN-LUXEMBURG', 'CAPIT', '106284', 11065, 'Impôt commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11069, 'PCN-LUXEMBURG', 'CAPIT', '106288', 11065, 'Autres remboursements d’impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11070, 'PCN-LUXEMBURG', 'CAPIT', '10629', 11052, 'Quote-part professionnelle de frais privés',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11071, 'PCN-LUXEMBURG', 'CAPIT', '11', '', 'Primes d’émission et primes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11072, 'PCN-LUXEMBURG', 'CAPIT', '111', 11071, 'Primes d’émission', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11073, 'PCN-LUXEMBURG', 'CAPIT', '112', 11071, 'Primes de fusion', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11074, 'PCN-LUXEMBURG', 'CAPIT', '113', 11071, 'Primes d’apport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11075, 'PCN-LUXEMBURG', 'CAPIT', '114', 11071, 'Primes de conversion d’obligations en actions',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11076, 'PCN-LUXEMBURG', 'CAPIT', '115', 11071,
         'Apport en capitaux propres non rémunéré par des titres («Capital contribution»)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11077, 'PCN-LUXEMBURG', 'CAPIT', '12', '', 'Réserves de réévaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11078, 'PCN-LUXEMBURG', 'CAPIT', '121', 11077,
         'Réserves de réévaluation en application de la juste valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11079, 'PCN-LUXEMBURG', 'CAPIT', '122', 11077,
         'Réserves de mise en équivalence (Participations valorisées suivant l’art. 58)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11080, 'PCN-LUXEMBURG', 'CAPIT', '123', 11077, 'Plus-values sur écarts de conversion immunisées',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11081, 'PCN-LUXEMBURG', 'CAPIT', '128', 11077, 'Autres réserves de réévaluation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11082, 'PCN-LUXEMBURG', 'CAPIT', '13', '', 'Réserves', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11083, 'PCN-LUXEMBURG', 'CAPIT', '131', 11082, 'Réserve légale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11084, 'PCN-LUXEMBURG', 'CAPIT', '132', 11082, 'Réserve pour actions propres ou parts propres',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11085, 'PCN-LUXEMBURG', 'CAPIT', '133', 11082, 'Réserves statutaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11086, 'PCN-LUXEMBURG', 'CAPIT', '138', 11082, 'Autres réserves', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11087, 'PCN-LUXEMBURG', 'CAPIT', '1381', 11086, 'Réserve pour l’impôt sur la fortune', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11088, 'PCN-LUXEMBURG', 'CAPIT', '1382', 11086, 'Autres réserves indisponibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11089, 'PCN-LUXEMBURG', 'CAPIT', '1383', 11086, 'Autres réserves disponibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11090, 'PCN-LUXEMBURG', 'CAPIT', '14', '', 'Résultats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11091, 'PCN-LUXEMBURG', 'CAPIT', '141', 11090, 'Résultats reportés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11092, 'PCN-LUXEMBURG', 'CAPIT', '142', 11090, 'Résultat de l’exercice', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11093, 'PCN-LUXEMBURG', 'CAPIT', '15', '', 'Acomptes sur dividendes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11094, 'PCN-LUXEMBURG', 'CAPIT', '16', '', 'Subventions d’investissement en capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11095, 'PCN-LUXEMBURG', 'CAPIT', '161', 11094, 'Terrains et constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11096, 'PCN-LUXEMBURG', 'CAPIT', '162', 11094, 'Installations techniques et machines', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11097, 'PCN-LUXEMBURG', 'CAPIT', '163', 11094,
         'Autres installations, outillage, mobilier et matériel roulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11098, 'PCN-LUXEMBURG', 'CAPIT', '168', 11094, 'Autres subventions d’investissement en capital',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11099, 'PCN-LUXEMBURG', 'CAPIT', '17', '', 'Plus-values immunisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11100, 'PCN-LUXEMBURG', 'CAPIT', '171', 11099, 'Plus-values immunisées à réinvestir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11101, 'PCN-LUXEMBURG', 'CAPIT', '172', 11099, 'Plus-values immunisées réinvesties', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11102, 'PCN-LUXEMBURG', 'CAPIT', '18', '', 'Provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11103, 'PCN-LUXEMBURG', 'CAPIT', '181', 11102,
         'Provisions pour pensions et obligations similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11104, 'PCN-LUXEMBURG', 'CAPIT', '182', 11102, 'Provisions pour impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11105, 'PCN-LUXEMBURG', 'CAPIT', '1821', 11104,
         'Provisions pour impôt sur le revenu des collectivités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11106, 'PCN-LUXEMBURG', 'CAPIT', '1822', 11104, 'Provisions pour impôt commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11107, 'PCN-LUXEMBURG', 'CAPIT', '1823', 11104, 'Provisions pour impôt sur la fortune', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11108, 'PCN-LUXEMBURG', 'CAPIT', '1828', 11104, 'Autres provisions pour impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11109, 'PCN-LUXEMBURG', 'CAPIT', '183', 11102, 'Provisions pour impôts différés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11110, 'PCN-LUXEMBURG', 'CAPIT', '188', 11102, 'Autres provisions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11111, 'PCN-LUXEMBURG', 'CAPIT', '1881', 11110, 'Provisions d’exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11112, 'PCN-LUXEMBURG', 'CAPIT', '1882', 11110, 'Provisions financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11113, 'PCN-LUXEMBURG', 'CAPIT', '1883', 11110, 'Provisions exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11114, 'PCN-LUXEMBURG', 'CAPIT', '19', '', 'Dettes financières et dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11115, 'PCN-LUXEMBURG', 'CAPIT', '191', 11114, 'Dettes subordonnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11116, 'PCN-LUXEMBURG', 'CAPIT', '1911', 11115,
         'dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11117, 'PCN-LUXEMBURG', 'CAPIT', '19111', 11116, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11118, 'PCN-LUXEMBURG', 'CAPIT', '19112', 11116, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11119, 'PCN-LUXEMBURG', 'CAPIT', '1912', 11115, 'dont la durée résiduelle est supérieure à un an',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11120, 'PCN-LUXEMBURG', 'CAPIT', '19121', 11119, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11121, 'PCN-LUXEMBURG', 'CAPIT', '19122', 11119, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11122, 'PCN-LUXEMBURG', 'CAPIT', '192', 11114, 'Emprunts obligataires convertibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11123, 'PCN-LUXEMBURG', 'CAPIT', '1921', 11122,
         'dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11124, 'PCN-LUXEMBURG', 'CAPIT', '19211', 11123, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11125, 'PCN-LUXEMBURG', 'CAPIT', '19212', 11123, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11126, 'PCN-LUXEMBURG', 'CAPIT', '1922', 11122, 'dont la durée résiduelle est supérieure à un an',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11127, 'PCN-LUXEMBURG', 'CAPIT', '19221', 11126, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11128, 'PCN-LUXEMBURG', 'CAPIT', '19222', 11126, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11129, 'PCN-LUXEMBURG', 'CAPIT', '193', 11114, 'Emprunts obligataires non convertibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11130, 'PCN-LUXEMBURG', 'CAPIT', '1931', 11129,
         'dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11131, 'PCN-LUXEMBURG', 'CAPIT', '19311', 11130, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11132, 'PCN-LUXEMBURG', 'CAPIT', '19312', 11130, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11133, 'PCN-LUXEMBURG', 'CAPIT', '1932', 11129, 'dont la durée résiduelle est supérieure à un an',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11134, 'PCN-LUXEMBURG', 'CAPIT', '19321', 11133, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11135, 'PCN-LUXEMBURG', 'CAPIT', '19322', 11133, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11136, 'PCN-LUXEMBURG', 'CAPIT', '194', 11114, 'Dettes envers des établissements de crédit', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11137, 'PCN-LUXEMBURG', 'CAPIT', '1941', 11136,
         'dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11138, 'PCN-LUXEMBURG', 'CAPIT', '19411', 11137, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11139, 'PCN-LUXEMBURG', 'CAPIT', '19412', 11137, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11140, 'PCN-LUXEMBURG', 'CAPIT', '1942', 11136, 'dont la durée résiduelle est supérieure à un an',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11141, 'PCN-LUXEMBURG', 'CAPIT', '19421', 11140, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11142, 'PCN-LUXEMBURG', 'CAPIT', '19422', 11140, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11143, 'PCN-LUXEMBURG', 'CAPIT', '195', 11114, 'Dettes de leasing financier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11144, 'PCN-LUXEMBURG', 'CAPIT', '1951', 11143,
         'dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11145, 'PCN-LUXEMBURG', 'CAPIT', '1952', 11143, 'dont la durée résiduelle est supérieure à un an',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11146, 'PCN-LUXEMBURG', 'CAPIT', '198', 11114, 'Autres emprunts et dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11147, 'PCN-LUXEMBURG', 'CAPIT', '1981', 11146,
         'dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11148, 'PCN-LUXEMBURG', 'CAPIT', '19811', 11147, 'Autres emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11149, 'PCN-LUXEMBURG', 'CAPIT', '19812', 11147, 'Rentes viagères capitalisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11150, 'PCN-LUXEMBURG', 'CAPIT', '19813', 11147, 'Autres dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11151, 'PCN-LUXEMBURG', 'CAPIT', '19814', 11147,
         'Intérêts courus sur autres emprunts et dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11152, 'PCN-LUXEMBURG', 'CAPIT', '1982', 11146, 'dont la durée résiduelle est supérieure à un an',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11153, 'PCN-LUXEMBURG', 'CAPIT', '19821', 11152, 'Autres emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11154, 'PCN-LUXEMBURG', 'CAPIT', '19822', 11152, 'Rentes viagères capitalisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11155, 'PCN-LUXEMBURG', 'CAPIT', '19823', 11152, 'Autres dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11156, 'PCN-LUXEMBURG', 'CAPIT', '19824', 11152,
         'Intérêts courus sur autres emprunts et dettes assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11157, 'PCN-LUXEMBURG', 'IMMO', '2', '', 'Frais d’établissement et frais assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11158, 'PCN-LUXEMBURG', 'IMMO', '201', 11157, 'Frais de constitution', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11159, 'PCN-LUXEMBURG', 'IMMO', '202', 11157, 'Frais de premier établissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11160, 'PCN-LUXEMBURG', 'IMMO', '2021', 11159, 'Frais de prospection', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11161, 'PCN-LUXEMBURG', 'IMMO', '2022', 11159, 'Frais de publicité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11162, 'PCN-LUXEMBURG', 'IMMO', '203', 11157,
         'Frais d’augmentation de capital et d’opérations diverses (fusions, scissions, transformations)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11163, 'PCN-LUXEMBURG', 'IMMO', '204', 11157, 'Frais d’émission d’emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11164, 'PCN-LUXEMBURG', 'IMMO', '208', 11157, 'Autres frais assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11165, 'PCN-LUXEMBURG', 'IMMO', '21', '', 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11166, 'PCN-LUXEMBURG', 'IMMO', '211', 11165, 'Frais de recherche et de développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11167, 'PCN-LUXEMBURG', 'IMMO', '212', 11165,
         'Concessions, brevets, licences, marques ainsi que droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11168, 'PCN-LUXEMBURG', 'IMMO', '2121', 11167,
         'Acquis à titre onéreux (Actifs incorporels non produits)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11169, 'PCN-LUXEMBURG', 'IMMO', '21211', 11168, 'Concessions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11170, 'PCN-LUXEMBURG', 'IMMO', '21212', 11168, 'Brevets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11171, 'PCN-LUXEMBURG', 'IMMO', '21213', 11168,
         'Licences informatiques (logiciels et progiciels informatiques)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11172, 'PCN-LUXEMBURG', 'IMMO', '21214', 11168, 'Marques et franchises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11173, 'PCN-LUXEMBURG', 'IMMO', '21215', 11168,
         'Droits et valeurs similaires acquis à titre onéreux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11174, 'PCN-LUXEMBURG', 'IMMO', '212151', 11173, 'Droits d’auteur et de reproduction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11175, 'PCN-LUXEMBURG', 'IMMO', '212152', 11173, 'Droits d’émission', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11176, 'PCN-LUXEMBURG', 'IMMO', '212158', 11173,
         'Autres droits et valeurs similaires acquis à titre onéreux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11177, 'PCN-LUXEMBURG', 'IMMO', '2122', 11167,
         'Créés par l’entreprise elle-même (Actifs incorporels produits)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11178, 'PCN-LUXEMBURG', 'IMMO', '21221', 11177, 'Concessions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11179, 'PCN-LUXEMBURG', 'IMMO', '21222', 11177, 'Brevets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11180, 'PCN-LUXEMBURG', 'IMMO', '21223', 11177,
         'Licences informatiques (logiciels et progiciels informatiques)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11181, 'PCN-LUXEMBURG', 'IMMO', '21224', 11177, 'Marques et franchises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11182, 'PCN-LUXEMBURG', 'IMMO', '21225', 11177,
         'Droits et valeurs similaires créés par l’entreprise elle-même', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11183, 'PCN-LUXEMBURG', 'IMMO', '212251', 11182, 'Droits d’auteur et de reproduction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11184, 'PCN-LUXEMBURG', 'IMMO', '212252', 11182, 'Droits d’émission', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11185, 'PCN-LUXEMBURG', 'IMMO', '212258', 11182,
         'Autres droits et valeurs similaires créés par l’entreprise elle-même', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11186, 'PCN-LUXEMBURG', 'IMMO', '213', 11165,
         'Fonds de commerce, dans la mesure où il a été acquis à titre onéreux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11187, 'PCN-LUXEMBURG', 'IMMO', '214', 11165,
         'Acomptes versés et immobilisations incorporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11188, 'PCN-LUXEMBURG', 'IMMO', '2141', 11187, 'Frais de recherche et de développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11189, 'PCN-LUXEMBURG', 'IMMO', '2142', 11187,
         'Concessions, brevets, licences, marques ainsi que droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11190, 'PCN-LUXEMBURG', 'IMMO', '2143', 11187, 'Fonds de commerce', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11191, 'PCN-LUXEMBURG', 'IMMO', '22', '', 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11192, 'PCN-LUXEMBURG', 'IMMO', '221', 11191, 'Terrains et constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11193, 'PCN-LUXEMBURG', 'IMMO', '2211', 11192, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11194, 'PCN-LUXEMBURG', 'IMMO', '22111', 11193, 'Terrains nus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11195, 'PCN-LUXEMBURG', 'IMMO', '22112', 11193, 'Terrains aménagés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11196, 'PCN-LUXEMBURG', 'IMMO', '22113', 11193, 'Sous-sols et sursols', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11197, 'PCN-LUXEMBURG', 'IMMO', '22114', 11193, 'Terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11198, 'PCN-LUXEMBURG', 'IMMO', '22115', 11193, 'Terrains bâtis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11199, 'PCN-LUXEMBURG', 'IMMO', '22118', 11193, 'Autres terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11200, 'PCN-LUXEMBURG', 'IMMO', '2212', 11192, 'Agencements et aménagements de terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11201, 'PCN-LUXEMBURG', 'IMMO', '22121', 11200, 'Agencements et aménagements de terrains nus',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11202, 'PCN-LUXEMBURG', 'IMMO', '22122', 11200, 'Agencements et aménagements de terrains aménagés',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11203, 'PCN-LUXEMBURG', 'IMMO', '22123', 11200,
         'Agencements et aménagements de sous-sols et sursols', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11204, 'PCN-LUXEMBURG', 'IMMO', '22124', 11200,
         'Agencements et aménagements de terrains de gisement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11205, 'PCN-LUXEMBURG', 'IMMO', '22125', 11200, 'Agencements et aménagements de terrains bâtis',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11206, 'PCN-LUXEMBURG', 'IMMO', '22128', 11200, 'Agencements et aménagements d’autres terrains',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11207, 'PCN-LUXEMBURG', 'IMMO', '2213', 11192, 'Constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11208, 'PCN-LUXEMBURG', 'IMMO', '22131', 11207, 'Constructions sur sol propre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11209, 'PCN-LUXEMBURG', 'IMMO', '22132', 11207, 'Constructions sur sol d’autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11210, 'PCN-LUXEMBURG', 'IMMO', '222', 11191, 'Installations techniques et machines', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11211, 'PCN-LUXEMBURG', 'IMMO', '2221', 11210, 'Installations techniques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11212, 'PCN-LUXEMBURG', 'IMMO', '2222', 11210, 'Machines', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11213, 'PCN-LUXEMBURG', 'IMMO', '223', 11191,
         'Autres installations, outillage, mobilier et matériel roulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11214, 'PCN-LUXEMBURG', 'IMMO', '2231', 11213, 'Equipement de transport et de manutention', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11215, 'PCN-LUXEMBURG', 'IMMO', '2232', 11213, 'Véhicules de transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11216, 'PCN-LUXEMBURG', 'IMMO', '2233', 11213, 'Outillage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11217, 'PCN-LUXEMBURG', 'IMMO', '2234', 11213, 'Mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11218, 'PCN-LUXEMBURG', 'IMMO', '2235', 11213, 'Matériel informatique (hardware)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11219, 'PCN-LUXEMBURG', 'IMMO', '2236', 11213, 'Cheptel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11220, 'PCN-LUXEMBURG', 'IMMO', '2237', 11213, 'Emballages récupérables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11221, 'PCN-LUXEMBURG', 'IMMO', '2238', 11213, 'Autres installations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11222, 'PCN-LUXEMBURG', 'IMMO', '224', 11191,
         'Acomptes versés et immobilisations corporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11223, 'PCN-LUXEMBURG', 'IMMO', '2241', 11222, 'Terrains et constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11224, 'PCN-LUXEMBURG', 'IMMO', '22411', 11223, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11225, 'PCN-LUXEMBURG', 'IMMO', '22412', 11223, 'Agencements et aménagements de terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11226, 'PCN-LUXEMBURG', 'IMMO', '22413', 11223, 'Constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11227, 'PCN-LUXEMBURG', 'IMMO', '2242', 11222, 'Installations techniques et machines', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11228, 'PCN-LUXEMBURG', 'IMMO', '2243', 11222,
         'Autres installations, outillage, mobilier et matériel roulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11229, 'PCN-LUXEMBURG', 'IMMO', '23', '', 'Immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11230, 'PCN-LUXEMBURG', 'IMMO', '231', 11229, 'Parts dans des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11231, 'PCN-LUXEMBURG', 'IMMO', '232', 11229, 'Créances sur des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11232, 'PCN-LUXEMBURG', 'IMMO', '233', 11229,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11233, 'PCN-LUXEMBURG', 'IMMO', '234', 11229,
         'Créances sur des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11234, 'PCN-LUXEMBURG', 'IMMO', '235', 11229, 'Titres ayant le caractère d’immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11235, 'PCN-LUXEMBURG', 'IMMO', '2351', 11234, 'Titres immobilisés (droit de propriété)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11236, 'PCN-LUXEMBURG', 'IMMO', '23511', 11235, 'Actions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11237, 'PCN-LUXEMBURG', 'IMMO', '23518', 11235, 'Autres titres immobilisés (droit de propriété)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11238, 'PCN-LUXEMBURG', 'IMMO', '2352', 11234, 'Titres immobilisés (droit de créance)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11239, 'PCN-LUXEMBURG', 'IMMO', '23521', 11238, 'Obligations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11240, 'PCN-LUXEMBURG', 'IMMO', '23528', 11238, 'Autres titres immobilisés (droit de créance)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11241, 'PCN-LUXEMBURG', 'IMMO', '2358', 11234,
         'Autres titres ayant le caractère d’immobilisations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11242, 'PCN-LUXEMBURG', 'IMMO', '236', 11229, 'Prêts et créances immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11243, 'PCN-LUXEMBURG', 'IMMO', '2361', 11242, 'Prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11244, 'PCN-LUXEMBURG', 'IMMO', '23611', 11243, 'Prêts participatifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11245, 'PCN-LUXEMBURG', 'IMMO', '23612', 11243, 'Prêts aux associés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11246, 'PCN-LUXEMBURG', 'IMMO', '23613', 11243, 'Prêts au personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11247, 'PCN-LUXEMBURG', 'IMMO', '23618', 11243, 'Autres prêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11248, 'PCN-LUXEMBURG', 'IMMO', '2362', 11242, 'Dépôts et cautionnements versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11249, 'PCN-LUXEMBURG', 'IMMO', '23621', 11248, 'Dépôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11250, 'PCN-LUXEMBURG', 'IMMO', '23622', 11248, 'Cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11251, 'PCN-LUXEMBURG', 'IMMO', '2363', 11242, 'Créances immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11252, 'PCN-LUXEMBURG', 'IMMO', '237', 11229, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11253, 'PCN-LUXEMBURG', 'STOCK', '3', '', 'Matières premières et consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11254, 'PCN-LUXEMBURG', 'STOCK', '301', 11253, 'Matières premières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11255, 'PCN-LUXEMBURG', 'STOCK', '302', 11253, 'Matières consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11256, 'PCN-LUXEMBURG', 'STOCK', '303', 11253, 'Fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11257, 'PCN-LUXEMBURG', 'STOCK', '3031', 11256, 'Combustibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11258, 'PCN-LUXEMBURG', 'STOCK', '3032', 11256, 'Produits d’entretien', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11259, 'PCN-LUXEMBURG', 'STOCK', '3033', 11256, 'Fournitures d’atelier et d’usine', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11260, 'PCN-LUXEMBURG', 'STOCK', '3034', 11256, 'Fournitures de magasin', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11261, 'PCN-LUXEMBURG', 'STOCK', '3035', 11256, 'Fournitures de bureau1', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11262, 'PCN-LUXEMBURG', 'STOCK', '3036', 11256, 'Carburants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11263, 'PCN-LUXEMBURG', 'STOCK', '3037', 11256, 'Lubrifiants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11264, 'PCN-LUXEMBURG', 'STOCK', '3038', 11256, 'Autres fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11265, 'PCN-LUXEMBURG', 'STOCK', '304', 11253, 'Emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11266, 'PCN-LUXEMBURG', 'STOCK', '3041', 11265, 'Emballages non-récupérables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11267, 'PCN-LUXEMBURG', 'STOCK', '3042', 11265, 'Emballages récupérables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11268, 'PCN-LUXEMBURG', 'STOCK', '3043', 11265, 'Emballages à usage mixte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11269, 'PCN-LUXEMBURG', 'STOCK', '305', 11253, 'Approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11270, 'PCN-LUXEMBURG', 'STOCK', '31', '',
         'Produits en cours de fabrication et commandes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11271, 'PCN-LUXEMBURG', 'STOCK', '311', 11270, 'Produits en cours de fabrication', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11272, 'PCN-LUXEMBURG', 'STOCK', '312', 11270, 'Commandes en cours – Produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11273, 'PCN-LUXEMBURG', 'STOCK', '313', 11270, 'Commandes en cours – Prestations de services',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11274, 'PCN-LUXEMBURG', 'STOCK', '314', 11270, 'Immeubles en construction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11275, 'PCN-LUXEMBURG', 'STOCK', '32', '', 'Produits finis et marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11276, 'PCN-LUXEMBURG', 'STOCK', '321', 11275, 'Produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11277, 'PCN-LUXEMBURG', 'STOCK', '322', 11275, 'Produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11278, 'PCN-LUXEMBURG', 'STOCK', '323', 11275, 'Produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11279, 'PCN-LUXEMBURG', 'STOCK', '3231', 11278, 'Déchets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11280, 'PCN-LUXEMBURG', 'STOCK', '3232', 11278, 'Rebuts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11281, 'PCN-LUXEMBURG', 'STOCK', '3233', 11278, 'Matières de récupération', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11282, 'PCN-LUXEMBURG', 'STOCK', '326', 11275, 'Marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11283, 'PCN-LUXEMBURG', 'STOCK', '327', 11275,
         'Marchandises en voie d’acheminement, mises en dépôt ou données en consignation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11284, 'PCN-LUXEMBURG', 'STOCK', '33', '', 'Terrains et immeubles destinés à la revente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11285, 'PCN-LUXEMBURG', 'STOCK', '331', 11284, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11286, 'PCN-LUXEMBURG', 'STOCK', '332', 11284, 'Immeubles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11287, 'PCN-LUXEMBURG', 'STOCK', '3321', 11286, 'Immeubles acquis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11288, 'PCN-LUXEMBURG', 'STOCK', '3322', 11286, 'Immeubles construits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11289, 'PCN-LUXEMBURG', 'STOCK', '34', '', 'Acomptes versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11290, 'PCN-LUXEMBURG', 'STOCK', '341', 11289,
         'Acomptes versés sur matières premières et consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11291, 'PCN-LUXEMBURG', 'STOCK', '342', 11289,
         'Acomptes versés sur produits en cours de fabrication et commandes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11292, 'PCN-LUXEMBURG', 'STOCK', '343', 11289,
         'Acomptes versés sur produits finis et marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11293, 'PCN-LUXEMBURG', 'STOCK', '344', 11289,
         'Acomptes versés sur terrains et immeubles destinés à la revente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11294, 'PCN-LUXEMBURG', 'THIRDPARTY', '4', '',
         'Créances résultant de ventes et prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11295, 'PCN-LUXEMBURG', 'THIRDPARTY', '401', 11294,
         'Créances dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11296, 'PCN-LUXEMBURG', 'THIRDPARTY', '4011', 11295, 'Clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11297, 'PCN-LUXEMBURG', 'THIRDPARTY', '4012', 11295, 'Clients – Effets à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11298, 'PCN-LUXEMBURG', 'THIRDPARTY', '4013', 11295, 'Clients douteux ou litigieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11299, 'PCN-LUXEMBURG', 'THIRDPARTY', '4014', 11295, 'Clients – Factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11300, 'PCN-LUXEMBURG', 'THIRDPARTY', '4015', 11295, 'Clients créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11301, 'PCN-LUXEMBURG', 'THIRDPARTY', '4019', 11295, 'Corrections de valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11302, 'PCN-LUXEMBURG', 'THIRDPARTY', '402', 11294,
         'Créances dont la durée résiduelle est supérieure à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11303, 'PCN-LUXEMBURG', 'THIRDPARTY', '4021', 11302, 'Clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11304, 'PCN-LUXEMBURG', 'THIRDPARTY', '4022', 11302, 'Clients – Effets à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11305, 'PCN-LUXEMBURG', 'THIRDPARTY', '4023', 11302, 'Clients douteux ou litigieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11306, 'PCN-LUXEMBURG', 'THIRDPARTY', '4024', 11302, 'Clients – Factures à établir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11307, 'PCN-LUXEMBURG', 'THIRDPARTY', '4025', 11302, 'Clients créditeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11308, 'PCN-LUXEMBURG', 'THIRDPARTY', '4029', 11302, 'Corrections de valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11309, 'PCN-LUXEMBURG', 'THIRDPARTY', '41', '',
         'Créances sur des entreprises liées et sur des entreprises avec lesquelles la société a un lien de participation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11310, 'PCN-LUXEMBURG', 'THIRDPARTY', '411', 11309, 'Créances sur des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11311, 'PCN-LUXEMBURG', 'THIRDPARTY', '4111', 11310,
         'Créances dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11312, 'PCN-LUXEMBURG', 'THIRDPARTY', '41111', 11311,
         'Ventes de marchandises et de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11313, 'PCN-LUXEMBURG', 'THIRDPARTY', '41112', 11311, 'Prêts et avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11314, 'PCN-LUXEMBURG', 'THIRDPARTY', '41113', 11311, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11315, 'PCN-LUXEMBURG', 'THIRDPARTY', '41114', 11311, 'Dividendes à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11316, 'PCN-LUXEMBURG', 'THIRDPARTY', '41118', 11311, 'Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11317, 'PCN-LUXEMBURG', 'THIRDPARTY', '41119', 11311, 'Corrections de valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11318, 'PCN-LUXEMBURG', 'THIRDPARTY', '4112', 11310,
         'Créances dont la durée résiduelle est supérieure à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11319, 'PCN-LUXEMBURG', 'THIRDPARTY', '41121', 11318,
         'Ventes de marchandises et de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11320, 'PCN-LUXEMBURG', 'THIRDPARTY', '41122', 11318, 'Prêts et avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11321, 'PCN-LUXEMBURG', 'THIRDPARTY', '41123', 11318, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11322, 'PCN-LUXEMBURG', 'THIRDPARTY', '41124', 11318, 'Dividendes à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11323, 'PCN-LUXEMBURG', 'THIRDPARTY', '41128', 11318, 'Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11324, 'PCN-LUXEMBURG', 'THIRDPARTY', '41129', 11318, 'Corrections de valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11325, 'PCN-LUXEMBURG', 'THIRDPARTY', '412', 11309,
         'Créances sur des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11326, 'PCN-LUXEMBURG', 'THIRDPARTY', '4121', 11325,
         'Créances dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11327, 'PCN-LUXEMBURG', 'THIRDPARTY', '41211', 11326,
         'Ventes de marchandises et de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11328, 'PCN-LUXEMBURG', 'THIRDPARTY', '41212', 11326, 'Prêts et avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11329, 'PCN-LUXEMBURG', 'THIRDPARTY', '41213', 11326, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11330, 'PCN-LUXEMBURG', 'THIRDPARTY', '41214', 11326, 'Dividendes à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11331, 'PCN-LUXEMBURG', 'THIRDPARTY', '41218', 11326, 'Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11332, 'PCN-LUXEMBURG', 'THIRDPARTY', '41219', 11326, 'Corrections de valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11333, 'PCN-LUXEMBURG', 'THIRDPARTY', '4122', 11325,
         'Créances dont la durée résiduelle est supérieure à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11334, 'PCN-LUXEMBURG', 'THIRDPARTY', '41221', 11333,
         'Ventes de marchandises et de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11335, 'PCN-LUXEMBURG', 'THIRDPARTY', '41222', 11333, 'Prêts et avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11336, 'PCN-LUXEMBURG', 'THIRDPARTY', '41223', 11333, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11337, 'PCN-LUXEMBURG', 'THIRDPARTY', '41224', 11333, 'Dividendes à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11338, 'PCN-LUXEMBURG', 'THIRDPARTY', '41228', 11333, 'Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11339, 'PCN-LUXEMBURG', 'THIRDPARTY', '41229', 11333, 'Corrections de valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11340, 'PCN-LUXEMBURG', 'THIRDPARTY', '42', '', 'Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11341, 'PCN-LUXEMBURG', 'THIRDPARTY', '421', 11340,
         'Autres créances dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11342, 'PCN-LUXEMBURG', 'THIRDPARTY', '4211', 11341, 'Personnel – Avances et acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11343, 'PCN-LUXEMBURG', 'THIRDPARTY', '42111', 11342, 'Avances et acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11344, 'PCN-LUXEMBURG', 'THIRDPARTY', '42119', 11342, 'Corrections de valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11345, 'PCN-LUXEMBURG', 'THIRDPARTY', '4212', 11341, 'Créances sur associés ou actionnaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11346, 'PCN-LUXEMBURG', 'THIRDPARTY', '42121', 11345, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11347, 'PCN-LUXEMBURG', 'THIRDPARTY', '42122', 11345, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11348, 'PCN-LUXEMBURG', 'THIRDPARTY', '42129', 11345, 'Corrections de valeur sur créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11349, 'PCN-LUXEMBURG', 'THIRDPARTY', '4213', 11341, 'Etat – Subventions à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11350, 'PCN-LUXEMBURG', 'THIRDPARTY', '42131', 11349, 'Subventions d’investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11351, 'PCN-LUXEMBURG', 'THIRDPARTY', '42132', 11349, 'Subventions d’exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11352, 'PCN-LUXEMBURG', 'THIRDPARTY', '42138', 11349, 'Autres subventions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11353, 'PCN-LUXEMBURG', 'THIRDPARTY', '4214', 11341,
         'Administration des Contributions Directes (ACD)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11354, 'PCN-LUXEMBURG', 'THIRDPARTY', '4215', 11341, 'Administration des Douanes et Accises (ADA)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11355, 'PCN-LUXEMBURG', 'THIRDPARTY', '4216', 11341,
         'Administration de l’Enregistrement et des Domaines (AED)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11356, 'PCN-LUXEMBURG', 'THIRDPARTY', '42161', 11355, 'Taxe sur la valeur ajoutée – TVA', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11357, 'PCN-LUXEMBURG', 'THIRDPARTY', '421611', 11356, 'TVA en amont', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11358, 'PCN-LUXEMBURG', 'THIRDPARTY', '421612', 11356, 'TVA à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11359, 'PCN-LUXEMBURG', 'THIRDPARTY', '421613', 11356, 'TVA acomptes versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11360, 'PCN-LUXEMBURG', 'THIRDPARTY', '421618', 11356, 'TVA – Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11361, 'PCN-LUXEMBURG', 'THIRDPARTY', '42162', 11355, 'Impôts indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11362, 'PCN-LUXEMBURG', 'THIRDPARTY', '421621', 11361, 'Droits d’enregistrement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11363, 'PCN-LUXEMBURG', 'THIRDPARTY', '421622', 11361, 'Taxe d’abonnement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11364, 'PCN-LUXEMBURG', 'THIRDPARTY', '421623', 11361, 'Droits d’hypothèques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11365, 'PCN-LUXEMBURG', 'THIRDPARTY', '421624', 11361, 'Droits de timbre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11366, 'PCN-LUXEMBURG', 'THIRDPARTY', '421628', 11361, 'Autres impôts indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11367, 'PCN-LUXEMBURG', 'THIRDPARTY', '42168', 11355, 'AED – Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11368, 'PCN-LUXEMBURG', 'THIRDPARTY', '4217', 11341,
         'Créances sur la sécurité sociale et autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11369, 'PCN-LUXEMBURG', 'THIRDPARTY', '42171', 11368, 'Centre Commun de Sécurité Sociale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11370, 'PCN-LUXEMBURG', 'THIRDPARTY', '42172', 11368, 'Mutualité des employeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11371, 'PCN-LUXEMBURG', 'THIRDPARTY', '42178', 11368, 'Autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11372, 'PCN-LUXEMBURG', 'THIRDPARTY', '4218', 11341, 'Créances diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11373, 'PCN-LUXEMBURG', 'THIRDPARTY', '42181', 11372, 'Impôts étrangers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11374, 'PCN-LUXEMBURG', 'THIRDPARTY', '421811', 11373, 'TVA étrangères', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11375, 'PCN-LUXEMBURG', 'THIRDPARTY', '421818', 11373, 'Autres impôts étrangers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11376, 'PCN-LUXEMBURG', 'THIRDPARTY', '42188', 11372, 'Autres créances diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11377, 'PCN-LUXEMBURG', 'THIRDPARTY', '42189', 11372, 'Corrections de valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11378, 'PCN-LUXEMBURG', 'THIRDPARTY', '422', 11340,
         'Autres créances dont la durée résiduelle est supérieure à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11379, 'PCN-LUXEMBURG', 'THIRDPARTY', '4221', 11378, 'Personnel – Avances et acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11380, 'PCN-LUXEMBURG', 'THIRDPARTY', '42211', 11379, 'Avances et acomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11381, 'PCN-LUXEMBURG', 'THIRDPARTY', '42219', 11379, 'Corrections de valeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11382, 'PCN-LUXEMBURG', 'THIRDPARTY', '4222', 11378, 'Associés ou actionnaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11383, 'PCN-LUXEMBURG', 'THIRDPARTY', '42221', 11382, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11384, 'PCN-LUXEMBURG', 'THIRDPARTY', '42222', 11382, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11385, 'PCN-LUXEMBURG', 'THIRDPARTY', '42229', 11382, 'Corrections de valeur sur créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11386, 'PCN-LUXEMBURG', 'THIRDPARTY', '4223', 11378, 'Etat – Subventions à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11387, 'PCN-LUXEMBURG', 'THIRDPARTY', '42231', 11386, 'Subventions d’investissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11388, 'PCN-LUXEMBURG', 'THIRDPARTY', '42232', 11386, 'Subventions d’exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11389, 'PCN-LUXEMBURG', 'THIRDPARTY', '42238', 11386, 'Autres subventions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11390, 'PCN-LUXEMBURG', 'THIRDPARTY', '4224', 11378,
         'Administration des Contributions Directes (ACD)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11391, 'PCN-LUXEMBURG', 'THIRDPARTY', '4225', 11378, 'Administration des Douanes et Accises (ADA)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11392, 'PCN-LUXEMBURG', 'THIRDPARTY', '4226', 11378,
         'Administration de l’Enregistrement et des Domaines (AED)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11393, 'PCN-LUXEMBURG', 'THIRDPARTY', '42261', 11392, 'Taxe sur la valeur ajoutée – TVA', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11394, 'PCN-LUXEMBURG', 'THIRDPARTY', '422611', 11393, 'TVA en amont', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11395, 'PCN-LUXEMBURG', 'THIRDPARTY', '422612', 11393, 'TVA à recevoir', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11396, 'PCN-LUXEMBURG', 'THIRDPARTY', '422613', 11393, 'TVA acomptes versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11397, 'PCN-LUXEMBURG', 'THIRDPARTY', '422618', 11393, 'TVA – Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11398, 'PCN-LUXEMBURG', 'THIRDPARTY', '42262', 11392, 'Impôts indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11399, 'PCN-LUXEMBURG', 'THIRDPARTY', '422621', 11398, 'Droits d’enregistrement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11400, 'PCN-LUXEMBURG', 'THIRDPARTY', '422622', 11398, 'Taxe d’abonnement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11401, 'PCN-LUXEMBURG', 'THIRDPARTY', '422623', 11398, 'Droits d’hypothèques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11402, 'PCN-LUXEMBURG', 'THIRDPARTY', '422624', 11398, 'Droits de timbre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11403, 'PCN-LUXEMBURG', 'THIRDPARTY', '422628', 11398, 'Autres impôts indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11404, 'PCN-LUXEMBURG', 'THIRDPARTY', '4227', 11378,
         'Créances sur la sécurité sociale et autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11405, 'PCN-LUXEMBURG', 'THIRDPARTY', '42271', 11404, 'Centre Commun de Sécurité Sociale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11406, 'PCN-LUXEMBURG', 'THIRDPARTY', '42272', 11404, 'Mutualité des employeurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11407, 'PCN-LUXEMBURG', 'THIRDPARTY', '42278', 11404, 'Autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11408, 'PCN-LUXEMBURG', 'THIRDPARTY', '4228', 11378, 'Créances diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11409, 'PCN-LUXEMBURG', 'THIRDPARTY', '42281', 11408, 'Impôts étrangers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11410, 'PCN-LUXEMBURG', 'THIRDPARTY', '422811', 11409, 'TVA étrangères', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11411, 'PCN-LUXEMBURG', 'THIRDPARTY', '422818', 11409, 'Autres impôts étrangers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11412, 'PCN-LUXEMBURG', 'THIRDPARTY', '42288', 11408, 'Autres créances diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11413, 'PCN-LUXEMBURG', 'THIRDPARTY', '42289', 11408,
         'Corrections de valeur sur autres créances diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11414, 'PCN-LUXEMBURG', 'THIRDPARTY', '43', '',
         'Acomptes reçus sur commandes pour autant qu’ils ne sont pas déduits des stocks de façon distincte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11415, 'PCN-LUXEMBURG', 'THIRDPARTY', '431', 11414,
         'Acomptes reçus dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11416, 'PCN-LUXEMBURG', 'THIRDPARTY', '432', 11414,
         'Acomptes reçus dont la durée résiduelle est supérieure à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11417, 'PCN-LUXEMBURG', 'THIRDPARTY', '44', '',
         'Dettes sur achats et prestations de services et dettes représentées par des effets de commerce', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11418, 'PCN-LUXEMBURG', 'THIRDPARTY', '441', 11417, 'Dettes sur achats et prestations de services',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11419, 'PCN-LUXEMBURG', 'THIRDPARTY', '4411', 11418,
         'Dettes sur achats et prestations de services dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11420, 'PCN-LUXEMBURG', 'THIRDPARTY', '44111', 11419, 'Fournisseurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11421, 'PCN-LUXEMBURG', 'THIRDPARTY', '44112', 11419, 'Fournisseurs – Factures non parvenues',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11422, 'PCN-LUXEMBURG', 'THIRDPARTY', '44113', 11419, 'Fournisseurs débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11423, 'PCN-LUXEMBURG', 'THIRDPARTY', '441131', 11422,
         'Fournisseurs – Avances et acomptes versés sur commandes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11424, 'PCN-LUXEMBURG', 'THIRDPARTY', '441132', 11422,
         'Fournisseurs – Créances pour emballages et matériel à rendre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11425, 'PCN-LUXEMBURG', 'THIRDPARTY', '441133', 11422, 'Fournisseurs – Autres avoirs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11426, 'PCN-LUXEMBURG', 'THIRDPARTY', '441134', 11422,
         'Rabais, remises, ristournes à obtenir et autres avoirs non encore reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11427, 'PCN-LUXEMBURG', 'THIRDPARTY', '4412', 11418,
         'Dettes sur achats et prestations de services dont la durée résiduelle est supérieure à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11428, 'PCN-LUXEMBURG', 'THIRDPARTY', '44121', 11427, 'Fournisseurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11429, 'PCN-LUXEMBURG', 'THIRDPARTY', '44122', 11427, 'Fournisseurs – Factures non parvenues',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11430, 'PCN-LUXEMBURG', 'THIRDPARTY', '44123', 11427, 'Fournisseurs débiteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11431, 'PCN-LUXEMBURG', 'THIRDPARTY', '441231', 11430,
         'Fournisseurs – Avances et acomptes versés sur commandes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11432, 'PCN-LUXEMBURG', 'THIRDPARTY', '441232', 11430,
         'Fournisseurs – Créances pour emballages et matériel à rendre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11433, 'PCN-LUXEMBURG', 'THIRDPARTY', '441233', 11430, 'Fournisseurs – Autres avoirs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11434, 'PCN-LUXEMBURG', 'THIRDPARTY', '441234', 11430,
         'Rabais, remises, ristournes à obtenir et autres avoirs non encore reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11435, 'PCN-LUXEMBURG', 'THIRDPARTY', '442', 11417,
         'Dettes représentées par des effets de commerce', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11436, 'PCN-LUXEMBURG', 'THIRDPARTY', '4421', 11435,
         'Dettes représentées par des effets de commerce dont la durée résiduelle est inférieure ou égale à un an',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11437, 'PCN-LUXEMBURG', 'THIRDPARTY', '4422', 11435,
         'Dettes représentées par des effets de commerce dont la durée résiduelle est supérieure à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11438, 'PCN-LUXEMBURG', 'THIRDPARTY', '45', '',
         'Dettes envers des entreprises liées et des entreprises avec lesquelles la société a un lien de participation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11439, 'PCN-LUXEMBURG', 'THIRDPARTY', '451', 11438, 'Dettes envers des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11440, 'PCN-LUXEMBURG', 'THIRDPARTY', '4511', 11439,
         'Dettes envers des entreprises liées dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11441, 'PCN-LUXEMBURG', 'THIRDPARTY', '45111', 11440,
         'Ventes de marchandises et de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11442, 'PCN-LUXEMBURG', 'THIRDPARTY', '45112', 11440, 'Prêts et avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11443, 'PCN-LUXEMBURG', 'THIRDPARTY', '45113', 11440, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11444, 'PCN-LUXEMBURG', 'THIRDPARTY', '45114', 11440, 'Dividendes à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11445, 'PCN-LUXEMBURG', 'THIRDPARTY', '45118', 11440, 'Autres dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11446, 'PCN-LUXEMBURG', 'THIRDPARTY', '4512', 11439,
         'Dettes envers des entreprises liées dont la durée résiduelle est supérieure à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11447, 'PCN-LUXEMBURG', 'THIRDPARTY', '45121', 11446,
         'Ventes de marchandises et de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11448, 'PCN-LUXEMBURG', 'THIRDPARTY', '45122', 11446, 'Prêts et avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11449, 'PCN-LUXEMBURG', 'THIRDPARTY', '45123', 11446, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11450, 'PCN-LUXEMBURG', 'THIRDPARTY', '45124', 11446, 'Dividendes à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11451, 'PCN-LUXEMBURG', 'THIRDPARTY', '45128', 11446, 'Autres dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11452, 'PCN-LUXEMBURG', 'THIRDPARTY', '452', 11438,
         'Dettes envers des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11453, 'PCN-LUXEMBURG', 'THIRDPARTY', '4521', 11452,
         'Dettes envers des entreprises avec lesquelles la société a un lien de participation dont la durée résiduelle est inférieure ou égale à un an',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11454, 'PCN-LUXEMBURG', 'THIRDPARTY', '45211', 11453,
         'Ventes de marchandises et de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11455, 'PCN-LUXEMBURG', 'THIRDPARTY', '45212', 11453, 'Prêts et avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11456, 'PCN-LUXEMBURG', 'THIRDPARTY', '45213', 11453, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11457, 'PCN-LUXEMBURG', 'THIRDPARTY', '45214', 11453, 'Dividendes à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11458, 'PCN-LUXEMBURG', 'THIRDPARTY', '45218', 11453, 'Autres dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11459, 'PCN-LUXEMBURG', 'THIRDPARTY', '4522', 11452,
         'Dettes envers des entreprises avec lesquelles la société a un lien de participation dont la durée résiduelle est supérieure à un an',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11460, 'PCN-LUXEMBURG', 'THIRDPARTY', '45221', 11459,
         'Ventes de marchandises et de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11461, 'PCN-LUXEMBURG', 'THIRDPARTY', '45222', 11459, 'Prêts et avances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11462, 'PCN-LUXEMBURG', 'THIRDPARTY', '45223', 11459, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11463, 'PCN-LUXEMBURG', 'THIRDPARTY', '45224', 11459, 'Dividendes à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11464, 'PCN-LUXEMBURG', 'THIRDPARTY', '45228', 11459, 'Autres dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11465, 'PCN-LUXEMBURG', 'THIRDPARTY', '46', '',
         'Dettes fiscales et dettes envers la sécurité sociale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11466, 'PCN-LUXEMBURG', 'THIRDPARTY', '461', 11465, 'Dettes fiscales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11467, 'PCN-LUXEMBURG', 'THIRDPARTY', '4611', 11466, 'Administrations communales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11468, 'PCN-LUXEMBURG', 'THIRDPARTY', '46111', 11467, 'Impôts communaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11469, 'PCN-LUXEMBURG', 'THIRDPARTY', '46112', 11467, 'Taxes communales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11470, 'PCN-LUXEMBURG', 'THIRDPARTY', '4612', 11466,
         'Administration des Contributions Directes (ACD)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11471, 'PCN-LUXEMBURG', 'THIRDPARTY', '46121', 11470, 'Impôt sur le revenu des collectivités',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11472, 'PCN-LUXEMBURG', 'THIRDPARTY', '461211', 11471,
         'Impôt sur le revenu des collectivités – charge fiscale estimée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11473, 'PCN-LUXEMBURG', 'THIRDPARTY', '461212', 11471,
         'Impôt sur le revenu des collectivités – dette fiscale à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11474, 'PCN-LUXEMBURG', 'THIRDPARTY', '46122', 11470, 'Impôt commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11475, 'PCN-LUXEMBURG', 'THIRDPARTY', '461221', 11474, 'Impôt commercial – charge fiscale estimée',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11476, 'PCN-LUXEMBURG', 'THIRDPARTY', '461222', 11474, 'Impôt commercial – dette fiscale à payer',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11477, 'PCN-LUXEMBURG', 'THIRDPARTY', '46123', 11470, 'Impôt sur la fortune', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11478, 'PCN-LUXEMBURG', 'THIRDPARTY', '461231', 11477,
         'Impôt sur la fortune – charge fiscale estimée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11479, 'PCN-LUXEMBURG', 'THIRDPARTY', '461232', 11477,
         'Impôt sur la fortune – dette fiscale à payer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11480, 'PCN-LUXEMBURG', 'THIRDPARTY', '46124', 11470,
         'Retenue d’impôt sur traitements et salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11481, 'PCN-LUXEMBURG', 'THIRDPARTY', '46125', 11470,
         'Retenue d’impôt sur revenus de capitaux mobiliers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11482, 'PCN-LUXEMBURG', 'THIRDPARTY', '46126', 11470, 'Retenue d’impôt sur les tantièmes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11483, 'PCN-LUXEMBURG', 'THIRDPARTY', '46128', 11470, 'ACD – Autres dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11484, 'PCN-LUXEMBURG', 'THIRDPARTY', '4613', 11466, 'Administration des Douanes et Accises (ADA)',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11485, 'PCN-LUXEMBURG', 'THIRDPARTY', '46131', 11484, 'Taxe sur les véhicules automoteurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11486, 'PCN-LUXEMBURG', 'THIRDPARTY', '46132', 11484, 'Droits d’accises et taxe de consommation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11487, 'PCN-LUXEMBURG', 'THIRDPARTY', '46138', 11484, 'ADA – Autres dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11488, 'PCN-LUXEMBURG', 'THIRDPARTY', '4614', 11466,
         'Administration de l’Enregistrement et des Domaines (AED)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11489, 'PCN-LUXEMBURG', 'THIRDPARTY', '46141', 11488, 'Taxe sur la valeur ajoutée – TVA', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11490, 'PCN-LUXEMBURG', 'THIRDPARTY', '461411', 11489, 'TVA en aval', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11491, 'PCN-LUXEMBURG', 'THIRDPARTY', '461412', 11489, 'TVA due', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11492, 'PCN-LUXEMBURG', 'THIRDPARTY', '461413', 11489, 'TVA acomptes reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11493, 'PCN-LUXEMBURG', 'THIRDPARTY', '461418', 11489, 'TVA – Autres dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11494, 'PCN-LUXEMBURG', 'THIRDPARTY', '46142', 11488, 'Impôts indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11495, 'PCN-LUXEMBURG', 'THIRDPARTY', '461421', 11494, 'Droits d’enregistrement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11496, 'PCN-LUXEMBURG', 'THIRDPARTY', '461422', 11494, 'Taxe d’abonnement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11497, 'PCN-LUXEMBURG', 'THIRDPARTY', '461423', 11494, 'Droits d’hypothèques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11498, 'PCN-LUXEMBURG', 'THIRDPARTY', '461424', 11494, 'Droits de timbre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11499, 'PCN-LUXEMBURG', 'THIRDPARTY', '461428', 11494, 'Autres impôts indirects', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11500, 'PCN-LUXEMBURG', 'THIRDPARTY', '4615', 11466, 'Administrations fiscales étrangères', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11501, 'PCN-LUXEMBURG', 'THIRDPARTY', '462', 11465, 'Dettes au titre de la sécurité sociale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11502, 'PCN-LUXEMBURG', 'THIRDPARTY', '4621', 11501, 'Centre Commun de Sécurité Sociale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11503, 'PCN-LUXEMBURG', 'THIRDPARTY', '4622', 11501, 'Organismes de sécurité sociale étrangers',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11504, 'PCN-LUXEMBURG', 'THIRDPARTY', '4628', 11501, 'Autres organismes sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11505, 'PCN-LUXEMBURG', 'THIRDPARTY', '47', '', 'Autres dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11506, 'PCN-LUXEMBURG', 'THIRDPARTY', '471', 11505,
         'Autres dettes dont la durée résiduelle est inférieure ou égale à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11507, 'PCN-LUXEMBURG', 'THIRDPARTY', '4711', 11506, 'Dépôts et cautionnements reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11508, 'PCN-LUXEMBURG', 'THIRDPARTY', '47111', 11507, 'Dépôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11509, 'PCN-LUXEMBURG', 'THIRDPARTY', '47112', 11507, 'Cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11510, 'PCN-LUXEMBURG', 'THIRDPARTY', '47113', 11507, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11511, 'PCN-LUXEMBURG', 'THIRDPARTY', '4712', 11506, 'Dettes envers associés et actionnaires',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11512, 'PCN-LUXEMBURG', 'THIRDPARTY', '47121', 11511, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11513, 'PCN-LUXEMBURG', 'THIRDPARTY', '47122', 11511, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11514, 'PCN-LUXEMBURG', 'THIRDPARTY', '4713', 11506,
         'Dettes envers administrateurs, gérants et commissaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11515, 'PCN-LUXEMBURG', 'THIRDPARTY', '4714', 11506, 'Dettes envers le personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11516, 'PCN-LUXEMBURG', 'THIRDPARTY', '47141', 11515, 'Personnel – Rémunérations dues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11517, 'PCN-LUXEMBURG', 'THIRDPARTY', '47142', 11515, 'Personnel – Dépôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11518, 'PCN-LUXEMBURG', 'THIRDPARTY', '47143', 11515, 'Personnel – Oppositions, saisies', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11519, 'PCN-LUXEMBURG', 'THIRDPARTY', '47148', 11515, 'Personnel – Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11520, 'PCN-LUXEMBURG', 'THIRDPARTY', '4715', 11506, 'Etat – Droits d’émission à restituer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11521, 'PCN-LUXEMBURG', 'THIRDPARTY', '4718', 11506, 'Autres dettes diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11522, 'PCN-LUXEMBURG', 'THIRDPARTY', '472', 11505,
         'Autres dettes dont la durée résiduelle est supérieure à un an', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11523, 'PCN-LUXEMBURG', 'THIRDPARTY', '4721', 11522, 'Dépôts et cautionnements reçus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11524, 'PCN-LUXEMBURG', 'THIRDPARTY', '47211', 11523, 'Dépôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11525, 'PCN-LUXEMBURG', 'THIRDPARTY', '47212', 11523, 'Cautionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11526, 'PCN-LUXEMBURG', 'THIRDPARTY', '47213', 11523, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11527, 'PCN-LUXEMBURG', 'THIRDPARTY', '4722', 11522, 'Dettes envers associés et actionnaires',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11528, 'PCN-LUXEMBURG', 'THIRDPARTY', '47221', 11527, 'Montant principal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11529, 'PCN-LUXEMBURG', 'THIRDPARTY', '47222', 11527, 'Intérêts courus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11530, 'PCN-LUXEMBURG', 'THIRDPARTY', '4723', 11522,
         'Dettes envers administrateurs, gérants et commissaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11531, 'PCN-LUXEMBURG', 'THIRDPARTY', '4724', 11522, 'Dettes envers le personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11532, 'PCN-LUXEMBURG', 'THIRDPARTY', '47241', 11531, 'Personnel – Rémunérations dues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11533, 'PCN-LUXEMBURG', 'THIRDPARTY', '47242', 11531, 'Personnel – Dépôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11534, 'PCN-LUXEMBURG', 'THIRDPARTY', '47243', 11531, 'Personnel – Oppositions, saisies', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11535, 'PCN-LUXEMBURG', 'THIRDPARTY', '47248', 11531, 'Personnel – Autres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11536, 'PCN-LUXEMBURG', 'THIRDPARTY', '4726', 11522, 'Etat – Droits d’émission à restituer', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11537, 'PCN-LUXEMBURG', 'THIRDPARTY', '4728', 11522, 'Autres dettes diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11538, 'PCN-LUXEMBURG', 'THIRDPARTY', '48', '', 'Comptes de régularisation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11539, 'PCN-LUXEMBURG', 'THIRDPARTY', '481', 11538, 'Charges à reporter', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11540, 'PCN-LUXEMBURG', 'THIRDPARTY', '482', 11538, 'Produits à reporter', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11541, 'PCN-LUXEMBURG', 'THIRDPARTY', '483', 11538, 'Etat – droits d’émission alloués', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11542, 'PCN-LUXEMBURG', 'THIRDPARTY', '484', 11538, 'Comptes transitoires ou d’attente – Actif',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11543, 'PCN-LUXEMBURG', 'THIRDPARTY', '485', 11538, 'Comptes transitoires ou d’attente – Passif',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11544, 'PCN-LUXEMBURG', 'THIRDPARTY', '486', 11538, 'Comptes de liaison – Actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11545, 'PCN-LUXEMBURG', 'THIRDPARTY', '487', 11538, 'Comptes de liaison – Passif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11546, 'PCN-LUXEMBURG', 'FINAN', '5', '', 'Valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11547, 'PCN-LUXEMBURG', 'FINAN', '501', 11546, 'Parts dans des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11548, 'PCN-LUXEMBURG', 'FINAN', '502', 11546,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11549, 'PCN-LUXEMBURG', 'FINAN', '503', 11546, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11550, 'PCN-LUXEMBURG', 'FINAN', '508', 11546, 'Autres valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11551, 'PCN-LUXEMBURG', 'FINAN', '5081', 11550, 'Actions – Titres cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11552, 'PCN-LUXEMBURG', 'FINAN', '5082', 11550, 'Actions – Titres non cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11553, 'PCN-LUXEMBURG', 'FINAN', '5083', 11550,
         'Obligations et autres titres de créance émis par la société et rachetés par elle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11554, 'PCN-LUXEMBURG', 'FINAN', '5084', 11550, 'Obligations – Titres cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11555, 'PCN-LUXEMBURG', 'FINAN', '5085', 11550, 'Obligations – Titres non cotés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11556, 'PCN-LUXEMBURG', 'FINAN', '5088', 11550, 'Autres valeurs mobilières diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11557, 'PCN-LUXEMBURG', 'FINAN', '51', '',
         'Avoirs en banques, avoirs en comptes de chèques postaux, chèques et encaisse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11558, 'PCN-LUXEMBURG', 'FINAN', '511', 11557, 'Chèques à encaisser', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11559, 'PCN-LUXEMBURG', 'FINAN', '512', 11557, 'Valeurs à l’encaissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11560, 'PCN-LUXEMBURG', 'FINAN', '513', 11557, 'Banques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11561, 'PCN-LUXEMBURG', 'FINAN', '5131', 11560, 'Banques comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11562, 'PCN-LUXEMBURG', 'FINAN', '5132', 11560, 'Banques comptes à terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11563, 'PCN-LUXEMBURG', 'FINAN', '514', 11557, 'Compte chèque postal', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11564, 'PCN-LUXEMBURG', 'FINAN', '516', 11557, 'Caisse', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11565, 'PCN-LUXEMBURG', 'FINAN', '517', 11557, 'Virements internes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11566, 'PCN-LUXEMBURG', 'FINAN', '518', 11557, 'Autres avoirs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11567, 'PCN-LUXEMBURG', 'EXPENSE', '6', '',
         'Consommation de marchandises et de matières premières et consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11568, 'PCN-LUXEMBURG', 'EXPENSE', '601', 11567, 'Matières premières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11569, 'PCN-LUXEMBURG', 'EXPENSE', '602', 11567, 'Matières consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11570, 'PCN-LUXEMBURG', 'EXPENSE', '603', 11567, 'Fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11571, 'PCN-LUXEMBURG', 'EXPENSE', '6031', 11570, 'Combustibles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11572, 'PCN-LUXEMBURG', 'EXPENSE', '60311', 11571, 'Solides', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11573, 'PCN-LUXEMBURG', 'EXPENSE', '60312', 11571, 'Liquides', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11574, 'PCN-LUXEMBURG', 'EXPENSE', '60313', 11571, 'Gaz comprimé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11575, 'PCN-LUXEMBURG', 'EXPENSE', '6032', 11570, 'Produits d’entretien', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11576, 'PCN-LUXEMBURG', 'EXPENSE', '6033', 11570, 'Fournitures d’atelier et d’usine', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11577, 'PCN-LUXEMBURG', 'EXPENSE', '6034', 11570, 'Fournitures de magasin', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11578, 'PCN-LUXEMBURG', 'EXPENSE', '6035', 11570, 'Fournitures de bureau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11579, 'PCN-LUXEMBURG', 'EXPENSE', '6036', 11570, 'Carburants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11580, 'PCN-LUXEMBURG', 'EXPENSE', '6037', 11570, 'Lubrifiants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11581, 'PCN-LUXEMBURG', 'EXPENSE', '6038', 11570, 'Autres fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11582, 'PCN-LUXEMBURG', 'EXPENSE', '604', 11567, 'Emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11583, 'PCN-LUXEMBURG', 'EXPENSE', '6041', 11582, 'Emballages non récupérables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11584, 'PCN-LUXEMBURG', 'EXPENSE', '6042', 11582, 'Emballages récupérables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11585, 'PCN-LUXEMBURG', 'EXPENSE', '6043', 11582, 'Emballages à usage mixte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11586, 'PCN-LUXEMBURG', 'EXPENSE', '605', 11567, 'Approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11587, 'PCN-LUXEMBURG', 'EXPENSE', '606', 11567, 'Achats de biens destinés à la revente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11588, 'PCN-LUXEMBURG', 'EXPENSE', '6061', 11587, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11589, 'PCN-LUXEMBURG', 'EXPENSE', '6062', 11587, 'Immeubles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11590, 'PCN-LUXEMBURG', 'EXPENSE', '6063', 11587, 'Marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11591, 'PCN-LUXEMBURG', 'EXPENSE', '607', 11567, 'Variation des stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11592, 'PCN-LUXEMBURG', 'EXPENSE', '6071', 11591, 'Variation des stocks de matières premières',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11593, 'PCN-LUXEMBURG', 'EXPENSE', '6072', 11591, 'Variation des stocks de matières consommables',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11594, 'PCN-LUXEMBURG', 'EXPENSE', '6073', 11591,
         'Variation des stocks de fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11595, 'PCN-LUXEMBURG', 'EXPENSE', '6074', 11591, 'Variation des stocks d’emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11596, 'PCN-LUXEMBURG', 'EXPENSE', '6075', 11591, 'Variation des stocks d’approvisionnements',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11597, 'PCN-LUXEMBURG', 'EXPENSE', '6076', 11591,
         'Variation des stocks de biens destinés à la revente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11598, 'PCN-LUXEMBURG', 'EXPENSE', '608', 11567,
         'Achats non stockés et achats incorporés aux ouvrages et produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11599, 'PCN-LUXEMBURG', 'EXPENSE', '6081', 11598, 'Achats non stockés de matières et fournitures',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11600, 'PCN-LUXEMBURG', 'EXPENSE', '60811', 11599, 'Fournitures non stockables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11601, 'PCN-LUXEMBURG', 'EXPENSE', '608111', 11600, 'Eau', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11602, 'PCN-LUXEMBURG', 'EXPENSE', '608112', 11600, 'Electricité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11603, 'PCN-LUXEMBURG', 'EXPENSE', '608113', 11600, 'Gaz de canalisation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11604, 'PCN-LUXEMBURG', 'EXPENSE', '60812', 11599,
         'Fournitures d’entretien et de petit équipement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11605, 'PCN-LUXEMBURG', 'EXPENSE', '60813', 11599, 'Fournitures administratives', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11606, 'PCN-LUXEMBURG', 'EXPENSE', '60814', 11599, 'Carburants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11607, 'PCN-LUXEMBURG', 'EXPENSE', '60815', 11599, 'Lubrifiants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11608, 'PCN-LUXEMBURG', 'EXPENSE', '60816', 11599, 'Vêtements professionnels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11609, 'PCN-LUXEMBURG', 'EXPENSE', '60818', 11599, 'Autres matières et fournitures non stockées',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11610, 'PCN-LUXEMBURG', 'EXPENSE', '6082', 11598, 'Achats incorporés aux ouvrages et produits',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11611, 'PCN-LUXEMBURG', 'EXPENSE', '60821', 11610,
         'Achats d’études et prestations de services (incorporés aux ouvrages et produits)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11612, 'PCN-LUXEMBURG', 'EXPENSE', '608211', 11611, 'Travail à façon', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11613, 'PCN-LUXEMBURG', 'EXPENSE', '608212', 11611, 'Recherche et développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11614, 'PCN-LUXEMBURG', 'EXPENSE', '608213', 11611, 'Frais d’architectes et d’ingénieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11615, 'PCN-LUXEMBURG', 'EXPENSE', '60822', 11610,
         'Achats de matériel, équipements, pièces détachées et travaux (incorporés aux ouvrages et produits)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11616, 'PCN-LUXEMBURG', 'EXPENSE', '60828', 11610,
         'Autres achats d’études et de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11617, 'PCN-LUXEMBURG', 'EXPENSE', '609', 11567, 'Rabais, remises et ristournes obtenus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11618, 'PCN-LUXEMBURG', 'EXPENSE', '6091', 11617, 'Matières premières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11619, 'PCN-LUXEMBURG', 'EXPENSE', '6092', 11617, 'Matières consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11620, 'PCN-LUXEMBURG', 'EXPENSE', '6093', 11617, 'Fournitures consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11621, 'PCN-LUXEMBURG', 'EXPENSE', '6094', 11617, 'Emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11622, 'PCN-LUXEMBURG', 'EXPENSE', '6095', 11617, 'Approvisionnements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11623, 'PCN-LUXEMBURG', 'EXPENSE', '6096', 11617, 'Achats de biens destinés à la revente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11624, 'PCN-LUXEMBURG', 'EXPENSE', '6098', 11617,
         'Achats non stockés et achats incorporés aux ouvrages et produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11625, 'PCN-LUXEMBURG', 'EXPENSE', '6099', 11617, 'Rabais, remises et ristournes non affectés',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11626, 'PCN-LUXEMBURG', 'EXPENSE', '61', '', 'Autres charges externes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11627, 'PCN-LUXEMBURG', 'EXPENSE', '611', 11626, 'Loyers et charges locatives', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11628, 'PCN-LUXEMBURG', 'EXPENSE', '6111', 11627, 'Locations immobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11629, 'PCN-LUXEMBURG', 'EXPENSE', '61111', 11628, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11630, 'PCN-LUXEMBURG', 'EXPENSE', '61112', 11628, 'Bâtiments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11631, 'PCN-LUXEMBURG', 'EXPENSE', '6112', 11627, 'Locations mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11632, 'PCN-LUXEMBURG', 'EXPENSE', '61121', 11631, 'Installations techniques et machines', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11633, 'PCN-LUXEMBURG', 'EXPENSE', '61122', 11631, 'Autres installations, outillages et machines',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11634, 'PCN-LUXEMBURG', 'EXPENSE', '61123', 11631, 'Matériel roulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11635, 'PCN-LUXEMBURG', 'EXPENSE', '6113', 11627, 'Charges locatives et de copropriété', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11636, 'PCN-LUXEMBURG', 'EXPENSE', '6114', 11627, 'Leasing immobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11637, 'PCN-LUXEMBURG', 'EXPENSE', '61141', 11636, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11638, 'PCN-LUXEMBURG', 'EXPENSE', '61142', 11636, 'Bâtiments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11639, 'PCN-LUXEMBURG', 'EXPENSE', '6115', 11627, 'Leasing mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11640, 'PCN-LUXEMBURG', 'EXPENSE', '61151', 11639, 'Installations techniques et machines', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11641, 'PCN-LUXEMBURG', 'EXPENSE', '61152', 11639, 'Autres installations, outillages et machines',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11642, 'PCN-LUXEMBURG', 'EXPENSE', '61153', 11639, 'Matériel roulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11643, 'PCN-LUXEMBURG', 'EXPENSE', '6116', 11627, 'Malis sur emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11644, 'PCN-LUXEMBURG', 'EXPENSE', '612', 11626, 'Sous-traitance, entretiens et réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11645, 'PCN-LUXEMBURG', 'EXPENSE', '6121', 11644,
         'Sous-traitance générale (non incorporée directement aux ouvrages, travaux et produits)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11646, 'PCN-LUXEMBURG', 'EXPENSE', '6122', 11644, 'Entretien et réparations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11647, 'PCN-LUXEMBURG', 'EXPENSE', '61221', 11646, 'Sur installations techniques et machines',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11648, 'PCN-LUXEMBURG', 'EXPENSE', '61222', 11646,
         'Sur autres installations, outillages et machines', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11649, 'PCN-LUXEMBURG', 'EXPENSE', '61223', 11646, 'Sur matériel roulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11650, 'PCN-LUXEMBURG', 'EXPENSE', '6123', 11644, 'Contrats de maintenance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11651, 'PCN-LUXEMBURG', 'EXPENSE', '6124', 11644,
         'Etudes et recherches (non incorporées dans les produits)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11652, 'PCN-LUXEMBURG', 'EXPENSE', '613', 11626, 'Rémunérations d’intermédiaires et honoraires',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11653, 'PCN-LUXEMBURG', 'EXPENSE', '6131', 11652, 'Commissions et courtages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11654, 'PCN-LUXEMBURG', 'EXPENSE', '61311', 11653, 'Commissions et courtages sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11655, 'PCN-LUXEMBURG', 'EXPENSE', '61312', 11653, 'Commissions et courtages sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11656, 'PCN-LUXEMBURG', 'EXPENSE', '61313', 11653, 'Rémunérations des transitaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11657, 'PCN-LUXEMBURG', 'EXPENSE', '6132', 11652, 'Traitement informatique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11658, 'PCN-LUXEMBURG', 'EXPENSE', '6133', 11652, 'Services bancaires et assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11659, 'PCN-LUXEMBURG', 'EXPENSE', '61331', 11658, 'Frais sur titres (achat, vente, garde)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11660, 'PCN-LUXEMBURG', 'EXPENSE', '61332', 11658, 'Commissions et frais sur émission d’emprunts',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11661, 'PCN-LUXEMBURG', 'EXPENSE', '61333', 11658, 'Frais de compte', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11662, 'PCN-LUXEMBURG', 'EXPENSE', '61334', 11658, 'Frais sur cartes de crédit', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11663, 'PCN-LUXEMBURG', 'EXPENSE', '61335', 11658, 'Frais sur effets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11664, 'PCN-LUXEMBURG', 'EXPENSE', '61336', 11658, 'Rémunérations d’affacturage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11665, 'PCN-LUXEMBURG', 'EXPENSE', '61337', 11658, 'Location de coffres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11666, 'PCN-LUXEMBURG', 'EXPENSE', '61338', 11658,
         'Autres frais et commissions bancaires (hors intérêts et frais assimilés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11667, 'PCN-LUXEMBURG', 'EXPENSE', '6134', 11652, 'Honoraires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11668, 'PCN-LUXEMBURG', 'EXPENSE', '61341', 11667, 'Honoraires juridiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11669, 'PCN-LUXEMBURG', 'EXPENSE', '61342', 11667, 'Honoraires comptables et d’audit', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11670, 'PCN-LUXEMBURG', 'EXPENSE', '61343', 11667, 'Honoraires fiscaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11671, 'PCN-LUXEMBURG', 'EXPENSE', '61348', 11667, 'Autres honoraires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11672, 'PCN-LUXEMBURG', 'EXPENSE', '6135', 11652, 'Frais d’actes et de contentieux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11673, 'PCN-LUXEMBURG', 'EXPENSE', '6136', 11652, 'Frais de recrutement de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11674, 'PCN-LUXEMBURG', 'EXPENSE', '6138', 11652,
         'Autres rémunérations d’intermédiaires et honoraires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11675, 'PCN-LUXEMBURG', 'EXPENSE', '614', 11626, 'Primes d’assurance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11676, 'PCN-LUXEMBURG', 'EXPENSE', '6141', 11675, 'Assurances sur biens de l’actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11677, 'PCN-LUXEMBURG', 'EXPENSE', '61411', 11676, 'Bâtiments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11678, 'PCN-LUXEMBURG', 'EXPENSE', '61412', 11676, 'Véhicules', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11679, 'PCN-LUXEMBURG', 'EXPENSE', '61413', 11676, 'Installations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11680, 'PCN-LUXEMBURG', 'EXPENSE', '61418', 11676, 'Sur autres biens de l’actif', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11681, 'PCN-LUXEMBURG', 'EXPENSE', '6142', 11675, 'Assurances sur biens pris en location', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11682, 'PCN-LUXEMBURG', 'EXPENSE', '6143', 11675, 'Assurance-transport', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11683, 'PCN-LUXEMBURG', 'EXPENSE', '61431', 11682, 'Sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11684, 'PCN-LUXEMBURG', 'EXPENSE', '61432', 11682, 'Sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11685, 'PCN-LUXEMBURG', 'EXPENSE', '61438', 11682, 'Sur autres biens', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11686, 'PCN-LUXEMBURG', 'EXPENSE', '6144', 11675, 'Assurance risque d’exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11687, 'PCN-LUXEMBURG', 'EXPENSE', '6145', 11675, 'Assurance insolvabilité clients', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11688, 'PCN-LUXEMBURG', 'EXPENSE', '6146', 11675, 'Assurance responsabilité civile', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11689, 'PCN-LUXEMBURG', 'EXPENSE', '6148', 11675, 'Autres assurances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11690, 'PCN-LUXEMBURG', 'EXPENSE', '615', 11626, 'Frais de marketing et de communication', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11691, 'PCN-LUXEMBURG', 'EXPENSE', '6151', 11690, 'Frais de marketing et de publicité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11692, 'PCN-LUXEMBURG', 'EXPENSE', '61511', 11691, 'Annonces et insertions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11693, 'PCN-LUXEMBURG', 'EXPENSE', '61512', 11691, 'Echantillons', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11694, 'PCN-LUXEMBURG', 'EXPENSE', '61513', 11691, 'Foires et expositions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11695, 'PCN-LUXEMBURG', 'EXPENSE', '61514', 11691, 'Cadeaux à la clientèle', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11696, 'PCN-LUXEMBURG', 'EXPENSE', '61515', 11691, 'Catalogues et imprimés et publications', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11697, 'PCN-LUXEMBURG', 'EXPENSE', '61516', 11691, 'Dons courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11698, 'PCN-LUXEMBURG', 'EXPENSE', '61517', 11691, 'Sponsoring', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11699, 'PCN-LUXEMBURG', 'EXPENSE', '61518', 11691, 'Autres achats de services publicitaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11700, 'PCN-LUXEMBURG', 'EXPENSE', '6152', 11690, 'Frais de déplacements et de représentation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11701, 'PCN-LUXEMBURG', 'EXPENSE', '61521', 11700, 'Voyages et déplacements', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11702, 'PCN-LUXEMBURG', 'EXPENSE', '615211', 11701,
         'Direction (respectivement exploitant et associés)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11703, 'PCN-LUXEMBURG', 'EXPENSE', '615212', 11701, 'Personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11704, 'PCN-LUXEMBURG', 'EXPENSE', '61522', 11700, 'Frais de déménagement de l’entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11705, 'PCN-LUXEMBURG', 'EXPENSE', '61523', 11700, 'Missions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11706, 'PCN-LUXEMBURG', 'EXPENSE', '61524', 11700, 'Réceptions et frais de représentation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11707, 'PCN-LUXEMBURG', 'EXPENSE', '6153', 11690, 'Frais postaux et frais de télécommunications',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11708, 'PCN-LUXEMBURG', 'EXPENSE', '61531', 11707, 'Timbres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11709, 'PCN-LUXEMBURG', 'EXPENSE', '61532', 11707,
         'Téléphone et autres frais de télécommunication', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11710, 'PCN-LUXEMBURG', 'EXPENSE', '61538', 11707,
         'Autres frais postaux (location de boîtes postales, etc.)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11711, 'PCN-LUXEMBURG', 'EXPENSE', '616', 11626,
         'Transports de biens et transports collectifs du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11712, 'PCN-LUXEMBURG', 'EXPENSE', '6161', 11711, 'Transports sur achats', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11713, 'PCN-LUXEMBURG', 'EXPENSE', '6162', 11711, 'Transports sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11714, 'PCN-LUXEMBURG', 'EXPENSE', '6163', 11711, 'Transports entre établissements ou chantiers',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11715, 'PCN-LUXEMBURG', 'EXPENSE', '6164', 11711, 'Transports administratifs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11716, 'PCN-LUXEMBURG', 'EXPENSE', '6165', 11711, 'Transports collectifs du personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11717, 'PCN-LUXEMBURG', 'EXPENSE', '6168', 11711, 'Autres transports', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11718, 'PCN-LUXEMBURG', 'EXPENSE', '617', 11626, 'Personnel extérieur à l’entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11719, 'PCN-LUXEMBURG', 'EXPENSE', '6171', 11718, 'Personnel intérimaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11720, 'PCN-LUXEMBURG', 'EXPENSE', '6172', 11718, 'Personnel prêté à l’entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11721, 'PCN-LUXEMBURG', 'EXPENSE', '618', 11626, 'Charges externes diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11722, 'PCN-LUXEMBURG', 'EXPENSE', '6181', 11721, 'Documentation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11723, 'PCN-LUXEMBURG', 'EXPENSE', '61811', 11722, 'Documentation générale', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11724, 'PCN-LUXEMBURG', 'EXPENSE', '61812', 11722, 'Documentation technique', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11725, 'PCN-LUXEMBURG', 'EXPENSE', '6182', 11721, 'Frais de colloques, séminaires, conférences',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11726, 'PCN-LUXEMBURG', 'EXPENSE', '6183', 11721, 'Elimination des déchets industriels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11727, 'PCN-LUXEMBURG', 'EXPENSE', '6184', 11721, 'Elimination de déchets non industriels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11728, 'PCN-LUXEMBURG', 'EXPENSE', '6185', 11721, 'Evacuation des eaux usées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11729, 'PCN-LUXEMBURG', 'EXPENSE', '6186', 11721, 'Frais de surveillance', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11730, 'PCN-LUXEMBURG', 'EXPENSE', '6187', 11721, 'Cotisations aux associations professionnelles',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11731, 'PCN-LUXEMBURG', 'EXPENSE', '6188', 11721, 'Autres charges externes diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11732, 'PCN-LUXEMBURG', 'EXPENSE', '619', 11626,
         'Rabais, remises et ristournes obtenus sur autres charges externes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11733, 'PCN-LUXEMBURG', 'EXPENSE', '62', '', 'Frais de personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11734, 'PCN-LUXEMBURG', 'EXPENSE', '621', 11733, 'Rémunérations des salariés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11735, 'PCN-LUXEMBURG', 'EXPENSE', '6211', 11734, 'Salaires bruts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11736, 'PCN-LUXEMBURG', 'EXPENSE', '62111', 11735, 'Salaires de base', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11737, 'PCN-LUXEMBURG', 'EXPENSE', '62112', 11735, 'Suppléments pour travail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11738, 'PCN-LUXEMBURG', 'EXPENSE', '621121', 11737, 'Dimanche', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11739, 'PCN-LUXEMBURG', 'EXPENSE', '621122', 11737, 'Jours fériés légaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11740, 'PCN-LUXEMBURG', 'EXPENSE', '621123', 11737, 'Heures supplémentaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11741, 'PCN-LUXEMBURG', 'EXPENSE', '621128', 11737, 'Autres suppléments', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11742, 'PCN-LUXEMBURG', 'EXPENSE', '62113', 11735, 'Primes de ménage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11743, 'PCN-LUXEMBURG', 'EXPENSE', '62114', 11735, 'Gratifications, primes et commissions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11744, 'PCN-LUXEMBURG', 'EXPENSE', '62115', 11735, 'Avantages en nature', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11745, 'PCN-LUXEMBURG', 'EXPENSE', '62116', 11735, 'Indemnités de licenciement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11746, 'PCN-LUXEMBURG', 'EXPENSE', '62117', 11735, 'Trimestre de faveur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11747, 'PCN-LUXEMBURG', 'EXPENSE', '6218', 11734, 'Autres avantages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11748, 'PCN-LUXEMBURG', 'EXPENSE', '6219', 11734, 'Remboursements sur salaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11749, 'PCN-LUXEMBURG', 'EXPENSE', '62191', 11748, 'Remboursements mutualité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11750, 'PCN-LUXEMBURG', 'EXPENSE', '62192', 11748,
         'Remboursements pour congé politique, sportif, culturel, éducatif et mandats sociaux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11751, 'PCN-LUXEMBURG', 'EXPENSE', '62193', 11748, 'Remboursements trimestre de faveur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11752, 'PCN-LUXEMBURG', 'EXPENSE', '622', 11733, 'Autre personnel', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11753, 'PCN-LUXEMBURG', 'EXPENSE', '6221', 11752, 'Etudiants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11754, 'PCN-LUXEMBURG', 'EXPENSE', '6222', 11752, 'Salaires occasionnels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11755, 'PCN-LUXEMBURG', 'EXPENSE', '6228', 11752, 'Autre personnel temporaire', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11756, 'PCN-LUXEMBURG', 'EXPENSE', '623', 11733, 'Charges sociales (part patronale)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11757, 'PCN-LUXEMBURG', 'EXPENSE', '6231', 11756, 'Charges sociales salariés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11758, 'PCN-LUXEMBURG', 'EXPENSE', '62311', 11757, 'Caisse Nationale de Santé', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11759, 'PCN-LUXEMBURG', 'EXPENSE', '62312', 11757, 'Caisse Nationale d’Assurance-Pension', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11760, 'PCN-LUXEMBURG', 'EXPENSE', '62318', 11757, 'Cotisations patronales complémentaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11761, 'PCN-LUXEMBURG', 'EXPENSE', '6232', 11756, 'Assurance accidents du travail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11762, 'PCN-LUXEMBURG', 'EXPENSE', '6233', 11756, 'Service de santé au travail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11763, 'PCN-LUXEMBURG', 'EXPENSE', '6238', 11756, 'Autres charges sociales patronales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11764, 'PCN-LUXEMBURG', 'EXPENSE', '6239', 11756, 'Remboursements de charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11765, 'PCN-LUXEMBURG', 'EXPENSE', '624', 11733, 'Pensions complémentaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11766, 'PCN-LUXEMBURG', 'EXPENSE', '6241', 11765, 'Primes à des fonds de pensions extérieurs',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11767, 'PCN-LUXEMBURG', 'EXPENSE', '6242', 11765,
         'Dotation aux provisions pour pensions complémentaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11768, 'PCN-LUXEMBURG', 'EXPENSE', '6243', 11765, 'Retenue d’impôt sur pension complémentaire',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11769, 'PCN-LUXEMBURG', 'EXPENSE', '6244', 11765, 'Prime d’assurance insolvabilité', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11770, 'PCN-LUXEMBURG', 'EXPENSE', '6245', 11765,
         'Pensions complémentaires versées par l’employeur', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11771, 'PCN-LUXEMBURG', 'EXPENSE', '628', 11733, 'Autres charges sociales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11772, 'PCN-LUXEMBURG', 'EXPENSE', '6281', 11771, 'Médecine du travail', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11773, 'PCN-LUXEMBURG', 'EXPENSE', '6288', 11771, 'Autres charges sociales diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11774, 'PCN-LUXEMBURG', 'EXPENSE', '63', '',
         'Dotations aux corrections de valeur des éléments d’actif non financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11775, 'PCN-LUXEMBURG', 'EXPENSE', '631', 11774,
         'Dotations aux corrections de valeur sur frais d’établissement et frais assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11776, 'PCN-LUXEMBURG', 'EXPENSE', '6311', 11775, 'Frais de constitution', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11777, 'PCN-LUXEMBURG', 'EXPENSE', '6312', 11775, 'Frais de premier établissement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11778, 'PCN-LUXEMBURG', 'EXPENSE', '6313', 11775,
         'Frais d’augmentation de capital et d’opérations diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11779, 'PCN-LUXEMBURG', 'EXPENSE', '6314', 11775, 'Frais d’émission d’emprunts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11780, 'PCN-LUXEMBURG', 'EXPENSE', '6318', 11775, 'Autres frais assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11781, 'PCN-LUXEMBURG', 'EXPENSE', '632', 11774,
         'Dotations aux corrections de valeur sur immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11782, 'PCN-LUXEMBURG', 'EXPENSE', '6321', 11781, 'Frais de recherche et de développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11783, 'PCN-LUXEMBURG', 'EXPENSE', '6322', 11781,
         'Concessions, brevets, licences, marques ainsi que droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11784, 'PCN-LUXEMBURG', 'EXPENSE', '6323', 11781,
         'Fonds de commerce dans la mesure où il a été acquis à titre onéreux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11785, 'PCN-LUXEMBURG', 'EXPENSE', '6324', 11781,
         'Acomptes versés et immobilisations incorporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11786, 'PCN-LUXEMBURG', 'EXPENSE', '633', 11774,
         'Dotations aux corrections de valeur sur immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11787, 'PCN-LUXEMBURG', 'EXPENSE', '6331', 11786, 'Terrains et constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11788, 'PCN-LUXEMBURG', 'EXPENSE', '63311', 11787, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11789, 'PCN-LUXEMBURG', 'EXPENSE', '63312', 11787, 'Agencements et aménagements de terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11790, 'PCN-LUXEMBURG', 'EXPENSE', '63313', 11787, 'Constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11791, 'PCN-LUXEMBURG', 'EXPENSE', '6332', 11786, 'Installations techniques et machines', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11792, 'PCN-LUXEMBURG', 'EXPENSE', '6333', 11786,
         'Autres installations, outillage, mobilier et matériel roulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11793, 'PCN-LUXEMBURG', 'EXPENSE', '6334', 11786,
         'Acomptes versés et immobilisations corporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11794, 'PCN-LUXEMBURG', 'EXPENSE', '634', 11774, 'Dotations aux corrections de valeur sur stocks',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11795, 'PCN-LUXEMBURG', 'EXPENSE', '6341', 11794, 'Matières premières et consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11796, 'PCN-LUXEMBURG', 'EXPENSE', '6342', 11794,
         'Produits en cours de fabrication et commandes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11797, 'PCN-LUXEMBURG', 'EXPENSE', '6343', 11794, 'Produits finis et marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11798, 'PCN-LUXEMBURG', 'EXPENSE', '6344', 11794, 'Terrains et immeubles destinés à la revente',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11799, 'PCN-LUXEMBURG', 'EXPENSE', '6345', 11794, 'Acomptes versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11800, 'PCN-LUXEMBURG', 'EXPENSE', '635', 11774,
         'Dotations aux corrections de valeur sur créances de l’actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11801, 'PCN-LUXEMBURG', 'EXPENSE', '6351', 11800,
         'Créances résultant de ventes et prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11802, 'PCN-LUXEMBURG', 'EXPENSE', '6352', 11800,
         'Créances sur des entreprises liées et des entreprises avec lesquelles la société a un lien de participation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11803, 'PCN-LUXEMBURG', 'EXPENSE', '6353', 11800, 'Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11804, 'PCN-LUXEMBURG', 'EXPENSE', '64', '', 'Autres charges d’exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11805, 'PCN-LUXEMBURG', 'EXPENSE', '641', 11804,
         'Redevances pour concessions, brevets, licences, marques, droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11806, 'PCN-LUXEMBURG', 'EXPENSE', '6411', 11805, 'Concessions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11807, 'PCN-LUXEMBURG', 'EXPENSE', '6412', 11805, 'Brevets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11808, 'PCN-LUXEMBURG', 'EXPENSE', '6413', 11805, 'Licences informatiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11809, 'PCN-LUXEMBURG', 'EXPENSE', '6414', 11805, 'Marques et franchises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11810, 'PCN-LUXEMBURG', 'EXPENSE', '6415', 11805, 'Droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11811, 'PCN-LUXEMBURG', 'EXPENSE', '64151', 11810, 'Droits d’auteur et de reproduction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11812, 'PCN-LUXEMBURG', 'EXPENSE', '64158', 11810, 'Autres droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11813, 'PCN-LUXEMBURG', 'EXPENSE', '642', 11804, 'Indemnités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11814, 'PCN-LUXEMBURG', 'EXPENSE', '643', 11804, 'Jetons de présence', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11815, 'PCN-LUXEMBURG', 'EXPENSE', '644', 11804, 'Tantièmes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11816, 'PCN-LUXEMBURG', 'EXPENSE', '645', 11804, 'Pertes sur créances irrécouvrables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11817, 'PCN-LUXEMBURG', 'EXPENSE', '6451', 11816,
         'Créances résultant de ventes et de prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11818, 'PCN-LUXEMBURG', 'EXPENSE', '6452', 11816,
         'Créances sur des entreprises liées et sur des entreprises avec lesquelles la société a un lien de participation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11819, 'PCN-LUXEMBURG', 'EXPENSE', '6453', 11816, 'Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11820, 'PCN-LUXEMBURG', 'EXPENSE', '646', 11804, 'Impôts, taxes et versements assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11821, 'PCN-LUXEMBURG', 'EXPENSE', '6461', 11820, 'Impôt foncier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11822, 'PCN-LUXEMBURG', 'EXPENSE', '6462', 11820, 'TVA non déductible', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11823, 'PCN-LUXEMBURG', 'EXPENSE', '6463', 11820,
         'Droits sur les marchandises en provenance de l’étranger', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11824, 'PCN-LUXEMBURG', 'EXPENSE', '64631', 11823,
         'Droits d’accises et taxe de consommation sur marchandises en provenance de l’étranger', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11825, 'PCN-LUXEMBURG', 'EXPENSE', '64632', 11823, 'Droits de douane', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11826, 'PCN-LUXEMBURG', 'EXPENSE', '64633', 11823, 'Montants compensatoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11827, 'PCN-LUXEMBURG', 'EXPENSE', '6464', 11820,
         'Droits d’accises à la production et taxe de consommation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11828, 'PCN-LUXEMBURG', 'EXPENSE', '6465', 11820,
         'Droits d’enregistrement et de timbre, droits d’hypothèques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11829, 'PCN-LUXEMBURG', 'EXPENSE', '64651', 11828, 'Droits d’enregistrement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11830, 'PCN-LUXEMBURG', 'EXPENSE', '64652', 11828, 'Taxe d’abonnement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11831, 'PCN-LUXEMBURG', 'EXPENSE', '64653', 11828, 'Droits d’hypothèques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11832, 'PCN-LUXEMBURG', 'EXPENSE', '64654', 11828, 'Droits de timbre', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11833, 'PCN-LUXEMBURG', 'EXPENSE', '64658', 11828,
         'Autres droits d’enregistrement et de timbre, droits d’hypothèques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11834, 'PCN-LUXEMBURG', 'EXPENSE', '6466', 11820, 'Taxes sur les véhicules', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11835, 'PCN-LUXEMBURG', 'EXPENSE', '6467', 11820, 'Taxe de cabaretage', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11836, 'PCN-LUXEMBURG', 'EXPENSE', '6468', 11820, 'Autres droits et impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11837, 'PCN-LUXEMBURG', 'EXPENSE', '6469', 11820, 'Dotations aux provisions pour impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11838, 'PCN-LUXEMBURG', 'EXPENSE', '647', 11804, 'Dotations aux plus-values immunisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11839, 'PCN-LUXEMBURG', 'EXPENSE', '648', 11804, 'Autres charges d’exploitation diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11840, 'PCN-LUXEMBURG', 'EXPENSE', '649', 11804, 'Dotations aux provisions d’exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11841, 'PCN-LUXEMBURG', 'EXPENSE', '65', '', 'Charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11842, 'PCN-LUXEMBURG', 'EXPENSE', '651', 11841,
         'Dotations aux corrections de valeur et ajustements pour juste valeur sur immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11843, 'PCN-LUXEMBURG', 'EXPENSE', '6511', 11842,
         'Dotations aux corrections de valeur sur immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11844, 'PCN-LUXEMBURG', 'EXPENSE', '65111', 11843, 'Parts dans des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11845, 'PCN-LUXEMBURG', 'EXPENSE', '65112', 11843, 'Créances sur des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11846, 'PCN-LUXEMBURG', 'EXPENSE', '65113', 11843,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11847, 'PCN-LUXEMBURG', 'EXPENSE', '65114', 11843,
         'Créances sur des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11848, 'PCN-LUXEMBURG', 'EXPENSE', '65115', 11843, 'Titres ayant le caractère d’immobilisations',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11849, 'PCN-LUXEMBURG', 'EXPENSE', '65116', 11843, 'Prêts et créances immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11850, 'PCN-LUXEMBURG', 'EXPENSE', '65117', 11843, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11851, 'PCN-LUXEMBURG', 'EXPENSE', '6512', 11842,
         'Ajustements pour juste valeur sur immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11852, 'PCN-LUXEMBURG', 'EXPENSE', '653', 11841,
         'Dotations aux corrections de valeur et ajustements pour juste valeur sur éléments financiers de l’actif circulant',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11853, 'PCN-LUXEMBURG', 'EXPENSE', '6531', 11852,
         'Dotations aux corrections de valeur sur valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11854, 'PCN-LUXEMBURG', 'EXPENSE', '65311', 11853, 'Parts dans des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11855, 'PCN-LUXEMBURG', 'EXPENSE', '65312', 11853,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11856, 'PCN-LUXEMBURG', 'EXPENSE', '65313', 11853, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11857, 'PCN-LUXEMBURG', 'EXPENSE', '65318', 11853, 'Autres valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11858, 'PCN-LUXEMBURG', 'EXPENSE', '6532', 11852,
         'Dotations aux corrections de valeur sur créances sur des entreprises liées et sur des entreprises avec lesquelles la société a un lien de participation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11859, 'PCN-LUXEMBURG', 'EXPENSE', '6533', 11852,
         'Dotations aux corrections de valeur sur autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11860, 'PCN-LUXEMBURG', 'EXPENSE', '6534', 11852,
         'Ajustements pour juste valeur sur éléments financiers de l’actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11861, 'PCN-LUXEMBURG', 'EXPENSE', '654', 11841, 'Moins-values de cession de valeurs mobilières',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11862, 'PCN-LUXEMBURG', 'EXPENSE', '6541', 11861, 'Parts dans des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11863, 'PCN-LUXEMBURG', 'EXPENSE', '6542', 11861,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11864, 'PCN-LUXEMBURG', 'EXPENSE', '6543', 11861, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11865, 'PCN-LUXEMBURG', 'EXPENSE', '6548', 11861, 'Autres valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11866, 'PCN-LUXEMBURG', 'EXPENSE', '655', 11841, 'Intérêts et escomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11867, 'PCN-LUXEMBURG', 'EXPENSE', '6551', 11866, 'Intérêts des dettes financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11868, 'PCN-LUXEMBURG', 'EXPENSE', '65511', 11867, 'Intérêts des dettes subordonnées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11869, 'PCN-LUXEMBURG', 'EXPENSE', '65512', 11867, 'Intérêts des emprunts obligataires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11870, 'PCN-LUXEMBURG', 'EXPENSE', '6552', 11866, 'Intérêts bancaires et assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11871, 'PCN-LUXEMBURG', 'EXPENSE', '65521', 11870, 'Intérêts bancaires sur comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11872, 'PCN-LUXEMBURG', 'EXPENSE', '65522', 11870,
         'Intérêts bancaires sur opérations de financement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11873, 'PCN-LUXEMBURG', 'EXPENSE', '65523', 11870, 'Intérêts sur leasings financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11874, 'PCN-LUXEMBURG', 'EXPENSE', '6553', 11866, 'Intérêts sur dettes commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11875, 'PCN-LUXEMBURG', 'EXPENSE', '6554', 11866,
         'Intérêts sur des entreprises liées et sur des entreprises avec lesquelles la société a un lien de participation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11876, 'PCN-LUXEMBURG', 'EXPENSE', '6555', 11866, 'Escomptes et frais sur effets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11877, 'PCN-LUXEMBURG', 'EXPENSE', '6556', 11866, 'Escomptes accordés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11878, 'PCN-LUXEMBURG', 'EXPENSE', '6558', 11866, 'Intérêts sur autres emprunts et dettes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11879, 'PCN-LUXEMBURG', 'EXPENSE', '656', 11841, 'Pertes de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11880, 'PCN-LUXEMBURG', 'EXPENSE', '657', 11841,
         'Quote-part de perte dans les entreprises collectives (autres que les sociétés de capitaux)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11881, 'PCN-LUXEMBURG', 'EXPENSE', '658', 11841, 'Autres charges financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11882, 'PCN-LUXEMBURG', 'EXPENSE', '659', 11841, 'Dotations aux provisions financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11883, 'PCN-LUXEMBURG', 'EXPENSE', '66', '', 'Charges exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11884, 'PCN-LUXEMBURG', 'EXPENSE', '661', 11883,
         'Dotations aux corrections de valeur exceptionnelles sur immobilisations incorporelles et corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11885, 'PCN-LUXEMBURG', 'EXPENSE', '6611', 11884, 'Sur immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11886, 'PCN-LUXEMBURG', 'EXPENSE', '6612', 11884, 'Sur immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11887, 'PCN-LUXEMBURG', 'EXPENSE', '662', 11883,
         'Dotations aux corrections de valeur exceptionnelles sur éléments de l’actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11888, 'PCN-LUXEMBURG', 'EXPENSE', '6621', 11887, 'Sur stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11889, 'PCN-LUXEMBURG', 'EXPENSE', '6622', 11887, 'Sur créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11890, 'PCN-LUXEMBURG', 'EXPENSE', '663', 11883,
         'Valeur comptable des immobilisations incorporelles et corporelles cédées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11891, 'PCN-LUXEMBURG', 'EXPENSE', '6631', 11890, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11892, 'PCN-LUXEMBURG', 'EXPENSE', '6632', 11890, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11893, 'PCN-LUXEMBURG', 'EXPENSE', '664', 11883,
         'Valeur comptable des immobilisations financières cédées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11894, 'PCN-LUXEMBURG', 'EXPENSE', '6641', 11893, 'Parts dans des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11895, 'PCN-LUXEMBURG', 'EXPENSE', '6642', 11893, 'Créances sur des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11896, 'PCN-LUXEMBURG', 'EXPENSE', '6643', 11893,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11897, 'PCN-LUXEMBURG', 'EXPENSE', '6644', 11893,
         'Créances sur des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11898, 'PCN-LUXEMBURG', 'EXPENSE', '6645', 11893, 'Titres ayant le caractère d’immobilisations',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11899, 'PCN-LUXEMBURG', 'EXPENSE', '6646', 11893, 'Prêts et créances immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11900, 'PCN-LUXEMBURG', 'EXPENSE', '6647', 11893, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11901, 'PCN-LUXEMBURG', 'EXPENSE', '665', 11883,
         'Valeur comptable des créances de l’actif circulant financier cédées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11902, 'PCN-LUXEMBURG', 'EXPENSE', '6651', 11901,
         'ur des entreprises liées et sur des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11903, 'PCN-LUXEMBURG', 'EXPENSE', '6652', 11901, 'Sur autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11904, 'PCN-LUXEMBURG', 'EXPENSE', '668', 11883, 'Autres charges exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11905, 'PCN-LUXEMBURG', 'EXPENSE', '6681', 11904,
         'Pénalités sur marchés et dédits payés sur achats et ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11906, 'PCN-LUXEMBURG', 'EXPENSE', '6682', 11904,
         'Amendes et pénalités fiscales, sociales et pénales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11907, 'PCN-LUXEMBURG', 'EXPENSE', '6683', 11904, 'Dommages et intérêts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11908, 'PCN-LUXEMBURG', 'EXPENSE', '6684', 11904, 'Malis provenant de clauses d’indexation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11909, 'PCN-LUXEMBURG', 'EXPENSE', '6688', 11904, 'Autres charges exceptionnelles diverses', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11910, 'PCN-LUXEMBURG', 'EXPENSE', '669', 11883, 'Dotations aux provisions exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11911, 'PCN-LUXEMBURG', 'EXPENSE', '67', '', 'Impôts sur le résultat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11912, 'PCN-LUXEMBURG', 'EXPENSE', '671', 11911, 'Impôt sur le revenu des collectivités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11913, 'PCN-LUXEMBURG', 'EXPENSE', '6711', 11912, 'Exercice courant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11914, 'PCN-LUXEMBURG', 'EXPENSE', '6712', 11912, 'Exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11915, 'PCN-LUXEMBURG', 'EXPENSE', '672', 11911, 'Impôt commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11916, 'PCN-LUXEMBURG', 'EXPENSE', '6721', 11915, 'Exercice courant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11917, 'PCN-LUXEMBURG', 'EXPENSE', '6722', 11915, 'Exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11918, 'PCN-LUXEMBURG', 'EXPENSE', '673', 11911, 'Impôts étrangers sur le résultat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11919, 'PCN-LUXEMBURG', 'EXPENSE', '6731', 11918, 'Retenues d’impôt à la source', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11920, 'PCN-LUXEMBURG', 'EXPENSE', '6732', 11918,
         'Impôts supportés par les établissements stables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11921, 'PCN-LUXEMBURG', 'EXPENSE', '67321', 11921, 'Exercice courant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11922, 'PCN-LUXEMBURG', 'EXPENSE', '67322', 11921, 'Exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11923, 'PCN-LUXEMBURG', 'EXPENSE', '6733', 11918,
         'Impôts supportés par les entreprises non résidentes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11924, 'PCN-LUXEMBURG', 'EXPENSE', '6738', 11918, 'Autres impôts étrangers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11925, 'PCN-LUXEMBURG', 'EXPENSE', '679', 11911,
         'Dotations aux provisions pour impôts sur le résultat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11926, 'PCN-LUXEMBURG', 'EXPENSE', '6791', 11925, 'Dotations aux provisions pour impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11927, 'PCN-LUXEMBURG', 'EXPENSE', '6792', 11925, 'Dotations aux provisions pour impôts différés',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11928, 'PCN-LUXEMBURG', 'EXPENSE', '68', '',
         'Autres impôts ne figurant pas sous le poste ci-dessus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11929, 'PCN-LUXEMBURG', 'EXPENSE', '681', 11928, 'Impôt sur la fortune', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11930, 'PCN-LUXEMBURG', 'EXPENSE', '6811', 11930, 'Exercice courant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11931, 'PCN-LUXEMBURG', 'EXPENSE', '6812', 11930, 'Exercices antérieurs', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11932, 'PCN-LUXEMBURG', 'EXPENSE', '682', 11928, 'Taxe d’abonnement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11933, 'PCN-LUXEMBURG', 'EXPENSE', '683', 11928, 'Impôts étrangers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11934, 'PCN-LUXEMBURG', 'EXPENSE', '688', 11928, 'Autres impôts et taxes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11935, 'PCN-LUXEMBURG', 'EXPENSE', '689', 11928, 'Dotations aux provisions pour autres impôts',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11936, 'PCN-LUXEMBURG', 'INCOME', '70', '', 'Montant net du chiffre d’affaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11937, 'PCN-LUXEMBURG', 'INCOME', '701', 11936, 'Ventes sur commandes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11938, 'PCN-LUXEMBURG', 'INCOME', '7011', 11937, 'Produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11939, 'PCN-LUXEMBURG', 'INCOME', '7012', 11937, 'Prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11940, 'PCN-LUXEMBURG', 'INCOME', '7013', 11937, 'Immeubles en construction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11941, 'PCN-LUXEMBURG', 'INCOME', '702', 11936, 'Ventes de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11942, 'PCN-LUXEMBURG', 'INCOME', '703', 11936, 'Ventes de produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11943, 'PCN-LUXEMBURG', 'INCOME', '704', 11936, 'Ventes de produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11944, 'PCN-LUXEMBURG', 'INCOME', '705', 11936, 'Ventes d’éléments destinés à la revente', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11945, 'PCN-LUXEMBURG', 'INCOME', '7051', 11944, 'Ventes de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11946, 'PCN-LUXEMBURG', 'INCOME', '7052', 11944,
         'Ventes de terrains et d’immeubles existants (promotion immobilière)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11947, 'PCN-LUXEMBURG', 'INCOME', '7053', 11944, 'Ventes d’autres éléments destinés à la revente',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11948, 'PCN-LUXEMBURG', 'INCOME', '706', 11936, 'Prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11949, 'PCN-LUXEMBURG', 'INCOME', '708', 11936, 'Autres éléments du chiffre d’affaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11950, 'PCN-LUXEMBURG', 'INCOME', '7081', 11949, 'Commissions et courtages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11951, 'PCN-LUXEMBURG', 'INCOME', '7082', 11949, 'Locations', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11952, 'PCN-LUXEMBURG', 'INCOME', '70821', 11951, 'Loyer immobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11953, 'PCN-LUXEMBURG', 'INCOME', '70822', 11951, 'Loyer mobilier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11954, 'PCN-LUXEMBURG', 'INCOME', '7083', 11949, 'Ventes d’emballages', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11955, 'PCN-LUXEMBURG', 'INCOME', '7088', 11949, 'Autres éléments divers du chiffre d’affaires',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11956, 'PCN-LUXEMBURG', 'INCOME', '709', 11936,
         'Rabais, remises et ristournes accordés par l’entreprise', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11957, 'PCN-LUXEMBURG', 'INCOME', '7091', 11956, 'Sur ventes sur commandes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11958, 'PCN-LUXEMBURG', 'INCOME', '7092', 11956, 'Sur ventes de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11959, 'PCN-LUXEMBURG', 'INCOME', '7093', 11956, 'Sur ventes de produits intermédiaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11960, 'PCN-LUXEMBURG', 'INCOME', '7094', 11956, 'Sur ventes de produits résiduels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11961, 'PCN-LUXEMBURG', 'INCOME', '7095', 11956, 'Sur ventes d’éléments destinés à la revente',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11962, 'PCN-LUXEMBURG', 'INCOME', '7096', 11956, 'Sur prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11963, 'PCN-LUXEMBURG', 'INCOME', '7098', 11956, 'Sur autres éléments du chiffre d’affaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11964, 'PCN-LUXEMBURG', 'INCOME', '71', '',
         'Variation des stocks de produits finis, d’en cours de fabrication et des commandes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11965, 'PCN-LUXEMBURG', 'INCOME', '711', 11964,
         'Variation des stocks de produits en cours de fabrication et de commandes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11966, 'PCN-LUXEMBURG', 'INCOME', '7111', 11965, 'Variation des stocks de produits en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11967, 'PCN-LUXEMBURG', 'INCOME', '7112', 11965,
         'Variation des stocks de commandes en cours – produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11968, 'PCN-LUXEMBURG', 'INCOME', '7113', 11965,
         'Variation des stocks de commandes en cours – prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11969, 'PCN-LUXEMBURG', 'INCOME', '7114', 11965,
         'Variation des stocks d’immeubles en construction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11970, 'PCN-LUXEMBURG', 'INCOME', '712', 11964,
         'Variation des stocks de produits finis et marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11971, 'PCN-LUXEMBURG', 'INCOME', '7121', 11970, 'Variation des stocks de produits finis', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11972, 'PCN-LUXEMBURG', 'INCOME', '7122', 11970, 'Variation des stocks de produits intermédiaires',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11973, 'PCN-LUXEMBURG', 'INCOME', '7123', 11970, 'Variation des stocks de produits résiduels',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11974, 'PCN-LUXEMBURG', 'INCOME', '7126', 11970, 'Variation des stocks de marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11975, 'PCN-LUXEMBURG', 'INCOME', '7127', 11970,
         'Variation des stocks de marchandises en voie d’acheminement, mises en dépôt ou données en consignation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11976, 'PCN-LUXEMBURG', 'INCOME', '72', '', 'Production immobilisée', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11977, 'PCN-LUXEMBURG', 'INCOME', '721', 11976, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11978, 'PCN-LUXEMBURG', 'INCOME', '7211', 11977, 'Frais de recherche et développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11979, 'PCN-LUXEMBURG', 'INCOME', '7212', 11977,
         'Concessions, brevets, licences, marques, droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11980, 'PCN-LUXEMBURG', 'INCOME', '72121', 11979, 'Concessions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11981, 'PCN-LUXEMBURG', 'INCOME', '72122', 11979, 'Brevets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11982, 'PCN-LUXEMBURG', 'INCOME', '72123', 11979, 'Licences informatiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11983, 'PCN-LUXEMBURG', 'INCOME', '72124', 11979, 'Marques et franchises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11984, 'PCN-LUXEMBURG', 'INCOME', '72125', 11983, 'Droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11985, 'PCN-LUXEMBURG', 'INCOME', '721251', 11984, 'Droits d’auteur et de reproduction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11986, 'PCN-LUXEMBURG', 'INCOME', '721258', 11984, 'Autres droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11987, 'PCN-LUXEMBURG', 'INCOME', '722', 11976, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11988, 'PCN-LUXEMBURG', 'INCOME', '7221', 11987, 'Terrains et constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11989, 'PCN-LUXEMBURG', 'INCOME', '7222', 11987, 'Installations techniques et machines', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11990, 'PCN-LUXEMBURG', 'INCOME', '7223', 11987,
         'Autres installations, outillage, mobilier et matériel roulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11991, 'PCN-LUXEMBURG', 'INCOME', '73', '',
         'Reprises de corrections de valeur des éléments d’actif non financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11992, 'PCN-LUXEMBURG', 'INCOME', '732', 11991,
         'Reprises de corrections de valeur sur immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11993, 'PCN-LUXEMBURG', 'INCOME', '7321', 11992, 'Frais de recherche et de développement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11994, 'PCN-LUXEMBURG', 'INCOME', '7322', 11992,
         'Concessions, brevets, licences, marques ainsi que droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11995, 'PCN-LUXEMBURG', 'INCOME', '7323', 11992,
         'Fonds de commerce dans la mesure où il a été acquis à titre onéreux', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11996, 'PCN-LUXEMBURG', 'INCOME', '7324', 11992,
         'Acomptes versés et immobilisations incorporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11997, 'PCN-LUXEMBURG', 'INCOME', '733', 11991,
         'Reprises de corrections de valeur sur immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11998, 'PCN-LUXEMBURG', 'INCOME', '7331', 11997, 'Terrains et constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 11999, 'PCN-LUXEMBURG', 'INCOME', '73311', 11998, 'Terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12000, 'PCN-LUXEMBURG', 'INCOME', '73312', 11998, 'Agencements et aménagements de terrains', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12001, 'PCN-LUXEMBURG', 'INCOME', '73313', 11998, 'Constructions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12002, 'PCN-LUXEMBURG', 'INCOME', '73314', 11998, 'Constructions sur sol d’autrui', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12003, 'PCN-LUXEMBURG', 'INCOME', '7332', 11997, 'Installations techniques et machines', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12004, 'PCN-LUXEMBURG', 'INCOME', '7333', 11997,
         'Autres installations, outillage, mobilier et matériel roulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12005, 'PCN-LUXEMBURG', 'INCOME', '7334', 11997,
         'Acomptes versés et immobilisations corporelles en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12006, 'PCN-LUXEMBURG', 'INCOME', '734', 11991, 'Reprises de corrections de valeur sur stocks',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12007, 'PCN-LUXEMBURG', 'INCOME', '7341', 12006, 'Matières premières et consommables', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12008, 'PCN-LUXEMBURG', 'INCOME', '7342', 12006,
         'Produits en cours de fabrication et commandes en cours', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12009, 'PCN-LUXEMBURG', 'INCOME', '7343', 12006, 'Produits finis et marchandises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12010, 'PCN-LUXEMBURG', 'INCOME', '7344', 12006, 'Terrains et immeubles destinés à la revente',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12011, 'PCN-LUXEMBURG', 'INCOME', '7345', 12006, 'Acomptes versés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12012, 'PCN-LUXEMBURG', 'INCOME', '735', 11991,
         'Reprises de corrections de valeur sur créances de l’actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12013, 'PCN-LUXEMBURG', 'INCOME', '7351', 12012,
         'Créances résultant de ventes et prestations de services', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12014, 'PCN-LUXEMBURG', 'INCOME', '7352', 12012,
         'Créances sur des entreprises liées et des entreprises avec lesquelles la société a un lien de participation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12015, 'PCN-LUXEMBURG', 'INCOME', '7353', 12012, 'Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12016, 'PCN-LUXEMBURG', 'INCOME', '74', '', 'Autres produits d’exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12017, 'PCN-LUXEMBURG', 'INCOME', '741', 12016,
         'Redevances pour concessions, brevets, licences, marques, droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12018, 'PCN-LUXEMBURG', 'INCOME', '7411', 12017, 'Concessions', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12019, 'PCN-LUXEMBURG', 'INCOME', '7412', 12017, 'Brevets', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12020, 'PCN-LUXEMBURG', 'INCOME', '7413', 12017, 'Licences informatiques', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12021, 'PCN-LUXEMBURG', 'INCOME', '7414', 12017, 'Marques et franchises', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12022, 'PCN-LUXEMBURG', 'INCOME', '7415', 12017, 'Droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12023, 'PCN-LUXEMBURG', 'INCOME', '74151', 12022, 'Droits d’auteur et de reproduction', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12024, 'PCN-LUXEMBURG', 'INCOME', '74158', 12022, 'Autres droits et valeurs similaires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12025, 'PCN-LUXEMBURG', 'INCOME', '742', 12016,
         'Revenus des immeubles non affectés aux activités professionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12026, 'PCN-LUXEMBURG', 'INCOME', '743', 12016,
         'Jetons de présence, tantièmes et rémunérations assimilées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12027, 'PCN-LUXEMBURG', 'INCOME', '744', 12016, 'Subventions d’exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12028, 'PCN-LUXEMBURG', 'INCOME', '7441', 12027, 'Subventions sur produits', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12029, 'PCN-LUXEMBURG', 'INCOME', '7442', 12027, 'Bonifications d’intérêt', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12030, 'PCN-LUXEMBURG', 'INCOME', '7443', 12027, 'Montants compensatoires', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12031, 'PCN-LUXEMBURG', 'INCOME', '7444', 12027, 'Subventions destinées à promouvoir l’emploi',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12032, 'PCN-LUXEMBURG', 'INCOME', '74441', 12031, 'Primes d’apprentissage reçues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12033, 'PCN-LUXEMBURG', 'INCOME', '74442', 12031,
         'Autres subventions destinées à promouvoir l’emploi', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12034, 'PCN-LUXEMBURG', 'INCOME', '7448', 12027, 'Autres subventions d’exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12035, 'PCN-LUXEMBURG', 'INCOME', '745', 12016,
         'Ristournes perçues des coopératives (provenant des excédents)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12036, 'PCN-LUXEMBURG', 'INCOME', '746', 12016, 'Indemnités d’assurance touchées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12037, 'PCN-LUXEMBURG', 'INCOME', '747', 12016,
         'Reprises de plus-values immunisées et de subventions d’investissement en capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12038, 'PCN-LUXEMBURG', 'INCOME', '7471', 12037, 'Plus-values immunisées non réinvesties', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12039, 'PCN-LUXEMBURG', 'INCOME', '7472', 12037, 'Plus-values immunisées réinvesties', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12040, 'PCN-LUXEMBURG', 'INCOME', '7473', 12037, 'Subventions d’investissement en capital', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12041, 'PCN-LUXEMBURG', 'INCOME', '748', 12016, 'Autres produits d’exploitation divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12042, 'PCN-LUXEMBURG', 'INCOME', '749', 12016, 'Reprises sur provisions d’exploitation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12043, 'PCN-LUXEMBURG', 'INCOME', '75', '', 'Produits financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12044, 'PCN-LUXEMBURG', 'INCOME', '751', 12043,
         'Reprises sur corrections de valeur et ajustements pour juste valeur sur immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12045, 'PCN-LUXEMBURG', 'INCOME', '7511', 12044,
         'Reprises sur corrections de valeur sur immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12046, 'PCN-LUXEMBURG', 'INCOME', '75111', 12045, 'Parts dans des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12047, 'PCN-LUXEMBURG', 'INCOME', '75112', 12045, 'Créances sur des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12048, 'PCN-LUXEMBURG', 'INCOME', '75113', 12045,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12049, 'PCN-LUXEMBURG', 'INCOME', '75114', 12045,
         'Créances sur des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12050, 'PCN-LUXEMBURG', 'INCOME', '75115', 12045, 'Titres ayant le caractère d’immobilisations',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12051, 'PCN-LUXEMBURG', 'INCOME', '75116', 12045, 'Prêts et créances immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12052, 'PCN-LUXEMBURG', 'INCOME', '75117', 12045, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12053, 'PCN-LUXEMBURG', 'INCOME', '7512', 12044,
         'Ajustements pour juste valeur sur immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12054, 'PCN-LUXEMBURG', 'INCOME', '752', 12043, 'Revenus des immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12055, 'PCN-LUXEMBURG', 'INCOME', '7521', 12054, 'Parts dans des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12056, 'PCN-LUXEMBURG', 'INCOME', '7522', 12054, 'Créances sur des entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12057, 'PCN-LUXEMBURG', 'INCOME', '7523', 12054,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12058, 'PCN-LUXEMBURG', 'INCOME', '7524', 12054,
         'Créances sur des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12059, 'PCN-LUXEMBURG', 'INCOME', '7525', 12054, 'Titres ayant le caractère d’immobilisations',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12060, 'PCN-LUXEMBURG', 'INCOME', '7526', 12054, 'Prêts et créances immobilisées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12061, 'PCN-LUXEMBURG', 'INCOME', '7527', 12054, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12062, 'PCN-LUXEMBURG', 'INCOME', '753', 12043,
         'Reprises sur corrections de valeur et ajustements pour juste valeur sur éléments financiers de l’actif circulant',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12063, 'PCN-LUXEMBURG', 'INCOME', '7531', 12062,
         'Reprises sur corrections de valeur sur créances sur des entreprises liées et des entreprises avec lesquelles la société a un lien de participation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12064, 'PCN-LUXEMBURG', 'INCOME', '7532', 12062,
         'Reprises sur corrections de valeur sur autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12065, 'PCN-LUXEMBURG', 'INCOME', '7533', 12062,
         'Reprises sur corrections de valeur sur valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12066, 'PCN-LUXEMBURG', 'INCOME', '75331', 12065, 'Parts dans les entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12067, 'PCN-LUXEMBURG', 'INCOME', '75332', 12065,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12068, 'PCN-LUXEMBURG', 'INCOME', '75333', 12065, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12069, 'PCN-LUXEMBURG', 'INCOME', '75338', 12065, 'Autres valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12070, 'PCN-LUXEMBURG', 'INCOME', '7534', 12062,
         'Ajustements pour juste valeur sur éléments financiers de l’actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12071, 'PCN-LUXEMBURG', 'INCOME', '754', 12043,
         'Plus-value de cession et autres produits de valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12072, 'PCN-LUXEMBURG', 'INCOME', '7541', 12071, 'Plus-value de cession de valeurs mobilière',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12073, 'PCN-LUXEMBURG', 'INCOME', '75411', 12072, 'Parts dans les entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12074, 'PCN-LUXEMBURG', 'INCOME', '75412', 12072,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12075, 'PCN-LUXEMBURG', 'INCOME', '75413', 12072, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12076, 'PCN-LUXEMBURG', 'INCOME', '75418', 12072, 'Autres valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12077, 'PCN-LUXEMBURG', 'INCOME', '7548', 12071, 'Autres produits de valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12078, 'PCN-LUXEMBURG', 'INCOME', '75481', 12077, 'Parts dans les entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12079, 'PCN-LUXEMBURG', 'INCOME', '75482', 12077,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12080, 'PCN-LUXEMBURG', 'INCOME', '75483', 12077, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12081, 'PCN-LUXEMBURG', 'INCOME', '75488', 12077, 'Autres valeurs mobilières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12082, 'PCN-LUXEMBURG', 'INCOME', '755', 12043, 'Autres intérêts et escomptes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12083, 'PCN-LUXEMBURG', 'INCOME', '7552', 12082, 'Intérêts bancaires et assimilés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12084, 'PCN-LUXEMBURG', 'INCOME', '75521', 12083, 'Intérêts sur comptes courants', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12085, 'PCN-LUXEMBURG', 'INCOME', '75522', 12083, 'Intérêts sur comptes à terme', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12086, 'PCN-LUXEMBURG', 'INCOME', '75523', 12083, 'Intérêts sur leasings financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12087, 'PCN-LUXEMBURG', 'INCOME', '7553', 12082, 'Intérêts sur créances commerciales', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12088, 'PCN-LUXEMBURG', 'INCOME', '7554', 12082,
         'Intérêts sur des entreprises liées et sur des entreprises avec lesquelles la société a un lien de participation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12089, 'PCN-LUXEMBURG', 'INCOME', '7555', 12082, 'Escomptes d’effets de commerce', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12090, 'PCN-LUXEMBURG', 'INCOME', '7556', 12082, 'Escomptes obtenus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12091, 'PCN-LUXEMBURG', 'INCOME', '7558', 12082, 'Intérêts sur autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12092, 'PCN-LUXEMBURG', 'INCOME', '756', 12043, 'Gains de change', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12093, 'PCN-LUXEMBURG', 'INCOME', '757', 12043,
         'Quote-part de bénéfice dans les entreprises collectives (autres que les sociétés de capitaux)', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12094, 'PCN-LUXEMBURG', 'INCOME', '758', 12043, 'Autres produits financiers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12095, 'PCN-LUXEMBURG', 'INCOME', '759', 12043, 'Reprises sur provisions financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12096, 'PCN-LUXEMBURG', 'INCOME', '76', '', 'Produits exceptionnels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12097, 'PCN-LUXEMBURG', 'INCOME', '761', 12096,
         'Reprises sur corrections de valeur exceptionnelles sur immobilisations incorporelles et corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12098, 'PCN-LUXEMBURG', 'INCOME', '7611', 12097, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12099, 'PCN-LUXEMBURG', 'INCOME', '7612', 12097, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12100, 'PCN-LUXEMBURG', 'INCOME', '762', 12096,
         'Reprises sur corrections de valeur exceptionnelles sur éléments de l’actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12101, 'PCN-LUXEMBURG', 'INCOME', '7621', 12100, 'Sur stocks', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12102, 'PCN-LUXEMBURG', 'INCOME', '7622', 12100, 'Sur créances de l’actif circulant', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12103, 'PCN-LUXEMBURG', 'INCOME', '763', 12096,
         'Produits de cession d’immobilisations incorporelles et corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12104, 'PCN-LUXEMBURG', 'INCOME', '7631', 12103, 'Immobilisations incorporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12105, 'PCN-LUXEMBURG', 'INCOME', '7632', 12103, 'Immobilisations corporelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12106, 'PCN-LUXEMBURG', 'INCOME', '764', 12096,
         'Produits de cession d’immobilisations financières', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12107, 'PCN-LUXEMBURG', 'INCOME', '7641', 12106, 'Parts dans les entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12108, 'PCN-LUXEMBURG', 'INCOME', '7642', 12106, 'Créances sur entreprises liées', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12109, 'PCN-LUXEMBURG', 'INCOME', '7643', 12106,
         'Parts dans des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12110, 'PCN-LUXEMBURG', 'INCOME', '7644', 12106,
         'Créances sur des entreprises avec lesquelles la société a un lien de participation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12111, 'PCN-LUXEMBURG', 'INCOME', '7645', 12106, 'Titres ayant le caractère d’immobilisations',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12112, 'PCN-LUXEMBURG', 'INCOME', '7646', 12106, 'Prêts et créances immobilisés', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12113, 'PCN-LUXEMBURG', 'INCOME', '7647', 12106, 'Actions propres ou parts propres', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12114, 'PCN-LUXEMBURG', 'INCOME', '765', 12096,
         'Produits de cession sur créances de l’actif circulant financier', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12115, 'PCN-LUXEMBURG', 'INCOME', '7651', 12114,
         'Créances sur des entreprises liées et sur des entreprises avec lesquelles la société a un lien de participation',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12116, 'PCN-LUXEMBURG', 'INCOME', '7652', 12114, 'Autres créances', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12117, 'PCN-LUXEMBURG', 'INCOME', '768', 12096, 'Autres produits exceptionnels', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12118, 'PCN-LUXEMBURG', 'INCOME', '7681', 12117,
         'Pénalités sur marchés et dédits perçus sur achats et sur ventes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12119, 'PCN-LUXEMBURG', 'INCOME', '7682', 12117, 'Libéralités reçues', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12120, 'PCN-LUXEMBURG', 'INCOME', '7683', 12117, 'Rentrées sur créances amorties', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12121, 'PCN-LUXEMBURG', 'INCOME', '7684', 12117, 'Subventions exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12122, 'PCN-LUXEMBURG', 'INCOME', '7685', 12117, 'Bonis provenant de clauses d’indexation', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12123, 'PCN-LUXEMBURG', 'INCOME', '7686', 12117,
         'Bonis provenant du rachat par l’entreprise d’actions et d’obligations émises par elle-même', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12124, 'PCN-LUXEMBURG', 'INCOME', '7688', 12117, 'Autres produits exceptionnels divers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12125, 'PCN-LUXEMBURG', 'INCOME', '769', 12096, 'Reprises sur provisions exceptionnelles', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12126, 'PCN-LUXEMBURG', 'INCOME', '77', '', 'Régularisations d’impôts sur le résultat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12127, 'PCN-LUXEMBURG', 'INCOME', '771', 12126,
         'Régularisations d’impôt sur le revenu des collectivités', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12128, 'PCN-LUXEMBURG', 'INCOME', '772', 12126, 'Régularisations d’impôt commercial', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12129, 'PCN-LUXEMBURG', 'INCOME', '773', 12126,
         'Régularisations d’impôts étrangers sur le résultat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12130, 'PCN-LUXEMBURG', 'INCOME', '779', 12126,
         'Reprises sur provisions pour impôts sur le résultat', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12131, 'PCN-LUXEMBURG', 'INCOME', '7791', 12130, 'Reprises sur provisions pour impôts', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12132, 'PCN-LUXEMBURG', 'INCOME', '7792', 12130, 'Reprises sur provisions pour impôts différés',
         '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12133, 'PCN-LUXEMBURG', 'INCOME', '78', '',
         'Régularisations d’autres impôts ne figurant pas sous le poste ci-dessus', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12134, 'PCN-LUXEMBURG', 'INCOME', '781', 12133, 'Régularisations d’impôt sur la fortune', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12135, 'PCN-LUXEMBURG', 'INCOME', '782', 12133, 'Régularisations de taxes d’abonnement', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12136, 'PCN-LUXEMBURG', 'INCOME', '783', 12133, 'Régularisations d’impôts étrangers', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12137, 'PCN-LUXEMBURG', 'INCOME', '788', 12133, 'Régularisations d’autres impôts et taxes', '1');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 12138, 'PCN-LUXEMBURG', 'INCOME', '789', 12133, 'Reprises sur provisions pour autres impôts', '1');



