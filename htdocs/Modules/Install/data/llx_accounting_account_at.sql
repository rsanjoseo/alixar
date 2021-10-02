-- Copyright (C) 2020 Norbert Penel   <support@oscss-shop.fr>
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
-- along with this program. If not, see <http://www.gnu.org/licenses/>.
--

--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--

-- Descriptif des plans comptables autrichiens standard
-- ADD 4100000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 1, 'AT-BASE', 'GROUP0', '110', '0', 'Patentrechte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 2, 'AT-BASE', 'GROUP0', '120', '0', 'Software');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 3, 'AT-BASE', 'GROUP0', '121', '0', 'ERP System');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 4, 'AT-BASE', 'GROUP0', '122', '0', 'Homepage');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 5, 'AT-BASE', 'GROUP0', '125', '0', 'Software Fremdentwicklung_noch nicht aktivieren');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 6, 'AT-BASE', 'GROUP0', '160', '0', 'Umgründungsmehrwert');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 7, 'AT-BASE', 'GROUP0', '250', '0', 'Mieterinvestitionen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 8, 'AT-BASE', 'GROUP0', '400', '0', 'Maschinen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 9, 'AT-BASE', 'GROUP0', '600', '0', 'Betriebs u. Geschäftsausstattung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 10, 'AT-BASE', 'GROUP0', '601', '0', 'Ausstellungsstücke');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 11, 'AT-BASE', 'GROUP0', '602', '0', 'Leihstellungsstücke');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 12, 'AT-BASE', 'GROUP0', '603', '0', 'Getriebeprüfstand_hinten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 13, 'AT-BASE', 'GROUP0', '604', '0', 'Wuchtstand_links_AQ');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 14, 'AT-BASE', 'GROUP0', '605', '0', 'Messlabor(Messraum)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 15, 'AT-BASE', 'GROUP0', '606', '0', 'PAK-System');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 16, 'AT-BASE', 'GROUP0', '607', '0', 'Server');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 17, 'AT-BASE', 'GROUP0', '608', '0', 'EDV-Ausstattung (Hardware)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 18, 'AT-BASE', 'GROUP0', '609', '0', 'Werkstattausstattung (Werkzeug)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 19, 'AT-BASE', 'GROUP0', '610', '0', 'Wuchtprüfstand neu_noch nicht in Betrieb genommen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 20, 'AT-BASE', 'GROUP0', '611', '0', 'Messequipment/Ausstattung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 21, 'AT-BASE', 'GROUP0', '630', '0', 'PKW');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 22, 'AT-BASE', 'GROUP0', '640', '0', 'LKW');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 23, 'AT-BASE', 'GROUP0', '680', '0', 'GWG-Geschäftsausstattung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 24, 'AT-BASE', 'GROUP0', '710', '0', 'Anlagen in Bau');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 25, 'AT-BASE', 'GROUP1', '1100', '0', 'Rohstoffe');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 26, 'AT-BASE', 'GROUP1', '1200', '0', 'Bezogenen Teile');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 27, 'AT-BASE', 'GROUP1', '1300', '0', 'Hilfsstoffe und Betriebsstoffe');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 28, 'AT-BASE', 'GROUP1', '1400', '0', 'fertige Erzeugnisse');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 29, 'AT-BASE', 'GROUP1', '1500', '0', 'unfertige Erzeugnisse');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 30, 'AT-BASE', 'GROUP1', '1600', '0', 'Waren');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 31, 'AT-BASE', 'GROUP1', '1700', '0', 'Noch nicht abrechenbare Leist.');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 32, 'AT-BASE', 'GROUP1', '1701', '0', 'Bestandsveränderung laufend');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 33, 'AT-BASE', 'GROUP1', '1800', '0', 'Vorrat Verpackungsmaterial');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 34, 'AT-BASE', 'GROUP1', '1810', '0', 'Vorrat Werbematerial');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 35, 'AT-BASE', 'GROUP2', '2000', '0', 'Lieferforderungen Inland I');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 36, 'AT-BASE', 'GROUP2', '2080', '0', 'Einzelwertb. Ford. Inland');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 37, 'AT-BASE', 'GROUP2', '2292', '0', 'geleistete Anzahlungen (20%)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 38, 'AT-BASE', 'GROUP2', '2293', '0', 'gel. Anzahlungen i.g.');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 39, 'AT-BASE', 'GROUP2', '2301', '0', 'Forderung Forschungsprämie');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 40, 'AT-BASE', 'GROUP2', '2302', '0', 'Forderungen gelieferte (noch nicht fakturierte Waren)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 41, 'AT-BASE', 'GROUP2', '2303', '0', 'Vorauszahlung Leasing Server');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 42, 'AT-BASE', 'GROUP2', '2306', '0', 'Kaution Pfauengarten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 43, 'AT-BASE', 'GROUP2', '2307', '0', 'Kaution Werkstatt');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 44, 'AT-BASE', 'GROUP2', '2308', '0', 'Kaution Parkplatz PKW');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 45, 'AT-BASE', 'GROUP2', '2309', '0', 'Kaution Werkstatt');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 46, 'AT-BASE', 'GROUP2', '2310', '0', 'Kaution Studentenwohnheim');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 47, 'AT-BASE', 'GROUP2', '2311', '0', 'Kaution China');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 48, 'AT-BASE', 'GROUP2', '2312', '0', 'Vorauszahlung Xerox');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 49, 'AT-BASE', 'GROUP2', '2313', '0', 'Verrechnung Bildungsscheck');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 50, 'AT-BASE', 'GROUP2', '2315', '0', 'Aktivierung Körperschaftsteuer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 51, 'AT-BASE', 'GROUP2', '2500', '0', 'Vorsteuer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 52, 'AT-BASE', 'GROUP2', '2501', '0', 'Vorsteuer aus i. g. Erwerb');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 53, 'AT-BASE', 'GROUP2', '2502', '0', 'Vorsteuer reverse charge syst.');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 54, 'AT-BASE', 'GROUP2', '2503', '0', 'Vorsteuer Reverse Charge § 19/1d');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 55, 'AT-BASE', 'GROUP2', '2508', '0', 'Vorsteuer sonstige Leistungen EU');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 56, 'AT-BASE', 'GROUP2', '2509', '0', 'EUSt Forderung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 57, 'AT-BASE', 'GROUP2', '2510', '0', 'Einfuhrumsatzsteuer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 58, 'AT-BASE', 'GROUP2', '2531', '0', 'Vorsteuer Frankreich');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 59, 'AT-BASE', 'GROUP2', '2532', '0', 'Vorsteuer Niederlande');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 60, 'AT-BASE', 'GROUP2', '2533', '0', 'Vorsteuer GB');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 61, 'AT-BASE', 'GROUP2', '2534', '0', 'Vorsteuer Belgien');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 62, 'AT-BASE', 'GROUP2', '2535', '0', 'Vorsteuer GB');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 63, 'AT-BASE', 'GROUP2', '2901', '0', 'Leasingvorauszahlung Vito');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 64, 'AT-BASE', 'GROUP3', '3020', '0', 'Rückstellung für Körperschaftsteuer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 65, 'AT-BASE', 'GROUP3', '3060', '0', 'Rst. für Beratungskosten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 66, 'AT-BASE', 'GROUP3', '3064', '0', 'Rst. für Sonderzahlungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 67, 'AT-BASE', 'GROUP3', '3072', '0', 'Rst. für nicht konsum. Urlaube');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 68, 'AT-BASE', 'GROUP3', '3214', '0', 'Raika 40-00.800.185');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 69, 'AT-BASE', 'GROUP3', '3286', '0', 'Darlehen Dipl. Ing. REICH GMBH');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 70, 'AT-BASE', 'GROUP3', '3287', '0', 'Darlehen Dr.Höfler');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 71, 'AT-BASE', 'GROUP3', '3288', '0', 'Darlehen DI Mayrhofer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 72, 'AT-BASE', 'GROUP3', '3289', '0', 'Darlehen AWS');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 73, 'AT-BASE', 'GROUP3', '3292', '0', 'Anzahlungen von Kunden 20 %');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 74, 'AT-BASE', 'GROUP3', '3294', '0', 'Anzahlungen von Kunden Drittland');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 75, 'AT-BASE', 'GROUP3', '3300', '0', 'Lieferverbindlichkeiten I');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 76, 'AT-BASE', 'GROUP3', '3481', '0', 'Verrechnungskto DI Mayrhofer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 77, 'AT-BASE', 'GROUP3', '3500', '0', 'Umsatzsteuer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 78, 'AT-BASE', 'GROUP3', '3501', '0', 'Umsatzsteuer aus i. g. Erwerb');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 79, 'AT-BASE', 'GROUP3', '3502', '0', 'USt § 19/Art 19 (reverse Charge)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 80, 'AT-BASE', 'GROUP3', '3503', '0', 'Umsatzsteuer Reverse Charge § 19/1d');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 81, 'AT-BASE', 'GROUP3', '3508', '0', 'Umsatzsteuer sonstige Leistung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 82, 'AT-BASE', 'GROUP3', '3531', '0', 'FA-Zahllast Dezember');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 83, 'AT-BASE', 'GROUP3', '3533', '0', 'Umsatzsteuer 2012');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 84, 'AT-BASE', 'GROUP3', '3535', '0', 'Umsatzsteuer 2013');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 85, 'AT-BASE', 'GROUP3', '3536', '0', 'Umsatzsteuer 2014');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 86, 'AT-BASE', 'GROUP3', '3537', '0', 'Umsatzsteuer 2015');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 87, 'AT-BASE', 'GROUP3', '3632', '0', 'Verrechnungskonto EUSt');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 88, 'AT-BASE', 'GROUP3', '3892', '0', 'Verbindlichkeiten Anzahlungsrechn.');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 89, 'AT-BASE', 'GROUP3', '3898', '0', 'Abgrenzung Sonderzahlungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 90, 'AT-BASE', 'GROUP4', '4000', '0', 'Erlöse Lieferungen 20 %');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 91, 'AT-BASE', 'GROUP4', '4001', '0', 'Erlöse i.g. Lieferung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 92, 'AT-BASE', 'GROUP4', '4002', '0', 'Erlöse Dienstleistungen EU');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 93, 'AT-BASE', 'GROUP4', '4003', '0', 'Erlöse Dienstleistungen 20 %');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 94, 'AT-BASE', 'GROUP4', '4004', '0', 'Erlöse Software 20 %');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 95, 'AT-BASE', 'GROUP4', '4005', '0', 'Erlöse Software EU');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 96, 'AT-BASE', 'GROUP4', '4006', '0', 'Evidenz Kfd. Reverse Charge');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 97, 'AT-BASE', 'GROUP4', '4050', '0', 'Erlöse 0 % Drittland');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 98, 'AT-BASE', 'GROUP4', '4051', '0', 'Erlöse Dienstleistungen Drittland');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 99, 'AT-BASE', 'GROUP4', '4052', '0', 'Erlöse Software Drittland');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 100, 'AT-BASE', 'GROUP4', '4069', '0', 'Erlöse § 19/1d Schrott');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 101, 'AT-BASE', 'GROUP4', '4400', '0', 'Kundenskonto 20 %');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 102, 'AT-BASE', 'GROUP4', '4405', '0', 'Kundenskonto 0 % Ausfuhrlieferungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 103, 'AT-BASE', 'GROUP4', '4410', '0', 'Skontoaufwand i.g. Lieferung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 104, 'AT-BASE', 'GROUP4', '4413', '0', 'Kundenskonto sonstige Leistung EU');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 105, 'AT-BASE', 'GROUP4', '4420', '0', 'Kundenskonto EU-Land A x %');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 106, 'AT-BASE', 'GROUP4', '4450', '0', 'Kundenrabatt 20%');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 107, 'AT-BASE', 'GROUP4', '4500', '0', 'Bestandsveränderungen fertige Erzeugnisse');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 108, 'AT-BASE', 'GROUP4', '4510', '0', 'Best.Veränd.Halbf.Erzeugnisse');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 109, 'AT-BASE', 'GROUP4', '4519', '0', 'Bestandsveränderung laufend');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 110, 'AT-BASE', 'GROUP4', '4520', '0', 'Best.Veränd.n.n.abger.Leist.');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 111, 'AT-BASE', 'GROUP4', '4530', '0', 'Gelieferte (noch nicht fakturierte Waren)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 112, 'AT-BASE', 'GROUP4', '4580', '0', 'Aktivierte Eigenleistung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 113, 'AT-BASE', 'GROUP4', '4630', '0', 'Erträge aus d.Abgang v.Anlagen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 114, 'AT-BASE', 'GROUP4', '4801', '0', 'Zuwendungen a.öffentl. Mitteln');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 115, 'AT-BASE', 'GROUP4', '4831', '0', 'sonstige betriebliche Erträge (nicht steuerbar)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 116, 'AT-BASE', 'GROUP4', '4840', '0', 'Sonstige Erlöse 20 %');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 117, 'AT-BASE', 'GROUP4', '4850', '0', 'Erl. Aufwandersätze');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 118, 'AT-BASE', 'GROUP4', '4881', '0', 'Versicherungsvergütungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 119, 'AT-BASE', 'GROUP4', '4885', '0', 'Zuschreibungen zum Umlaufvermögen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 120, 'AT-BASE', 'GROUP4', '4950', '0', 'Privatanteil 20 %');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 121, 'AT-BASE', 'GROUP4', '4991', '0', 'Sachbezüge 20%');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 122, 'AT-BASE', 'GROUP5', '5000', '0', 'Handelswareneinsatz');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 123, 'AT-BASE', 'GROUP5', '5001', '0', 'Materialeinkauf Fremdfertigung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 124, 'AT-BASE', 'GROUP5', '5002', '0', 'Wareneinkauf Verkauf');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 125, 'AT-BASE', 'GROUP5', '5020', '0', 'Materialeinkauf');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 126, 'AT-BASE', 'GROUP5', '5090', '0', 'Bezugskosten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 127, 'AT-BASE', 'GROUP5', '5100', '0', 'Verbrauch Rohstoffe');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 128, 'AT-BASE', 'GROUP5', '5199', '0', 'Aufwand für TW-AFA Vorräte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 129, 'AT-BASE', 'GROUP5', '5200', '0', 'Verbrauch bezogenen Teile');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 130, 'AT-BASE', 'GROUP5', '5300', '0', 'Verbrauch Hilfsstoffe');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 131, 'AT-BASE', 'GROUP5', '5400', '0', 'Hilfsstoffverbrauch');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 132, 'AT-BASE', 'GROUP5', '5440', '0', 'Inventurveränderung Fremdbarb. + GK');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 133, 'AT-BASE', 'GROUP5', '5441', '0', 'GWG Fremdbarb. + GK');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 134, 'AT-BASE', 'GROUP5', '5450', '0', 'Verpackungsmaterial');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 135, 'AT-BASE', 'GROUP5', '5800', '0', 'Fremdleistungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 136, 'AT-BASE', 'GROUP5', '5880', '0', 'Lieferantenskonti');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 137, 'AT-BASE', 'GROUP5', '5900', '0', 'Skontoertrag ig.E. 0% (m.VST)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 138, 'AT-BASE', 'GROUP5', '5920', '0', 'Skontoertrag ig.E. 20% (m.VST)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 139, 'AT-BASE', 'GROUP6', '6000', '0', 'Löhne');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 140, 'AT-BASE', 'GROUP6', '6001', '0', 'Rückerstattung AUVA Arbeiter');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 141, 'AT-BASE', 'GROUP6', '6010', '0', 'Lehrlingsentschädigung Arb.');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 142, 'AT-BASE', 'GROUP6', '6020', '0', 'Nichtleistungslöhne');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 143, 'AT-BASE', 'GROUP6', '6100', '0', 'Leihpersonal Aufwand');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 144, 'AT-BASE', 'GROUP6', '6150', '0', 'Sonderzahlungen Arbeiter');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 145, 'AT-BASE', 'GROUP6', '6200', '0', 'Gehälter');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 146, 'AT-BASE', 'GROUP6', '6201', '0', 'Förderung AMS');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 147, 'AT-BASE', 'GROUP6', '6202', '0', 'Rückerstattung AUVA Angestellte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 148, 'AT-BASE', 'GROUP6', '6210', '0', 'Veränderung Mehrarbeitsvergütung RSt Ang');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 149, 'AT-BASE', 'GROUP6', '6211', '0', 'Veränderung Mehrarbeitsvergütung RSt Arbeiter');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 150, 'AT-BASE', 'GROUP6', '6230', '0', 'Sonderzahlungen Angestellte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 151, 'AT-BASE', 'GROUP6', '6231', '0', 'Dotierung RST Sonderzahlungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 152, 'AT-BASE', 'GROUP6', '6255', '0', 'Geschäftsführerbezüge');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 153, 'AT-BASE', 'GROUP6', '6256', '0', 'Geschäftsführersachbezüge');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 154, 'AT-BASE', 'GROUP6', '6300', '0', 'Sonderzahlung aliquot vorläufig');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 155, 'AT-BASE', 'GROUP6', '6310', '0', 'Dotierung Urlaubsrückstellung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 156, 'AT-BASE', 'GROUP6', '6311', '0', 'Veränderung Urlaubsrückstellung Arbeiter');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 157, 'AT-BASE', 'GROUP6', '6402', '0', 'Betriebliche Vorsorgekassa Arbeiter');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 158, 'AT-BASE', 'GROUP6', '6407', '0', 'Betriebliche Vorsorgekassa Angestellte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 159, 'AT-BASE', 'GROUP6', '6416', '0', 'Veränderung Pensionsrückstellung (Angestellte)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 160, 'AT-BASE', 'GROUP6', '6435', '0', 'sonstige Beiträge für die Altersversorgung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 161, 'AT-BASE', 'GROUP6', '6500', '0', 'Gesetzlicher Sozialaufwand');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 162, 'AT-BASE', 'GROUP6', '6600', '0', 'Gesetzlicher Sozialaufwand Arbeiter');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 163, 'AT-BASE', 'GROUP6', '6605', '0', 'Gesetzlicher Sozialaufwand Angestellte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 164, 'AT-BASE', 'GROUP6', '6610', '0', 'Dienstgeberbeitrag Arbeiter');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 165, 'AT-BASE', 'GROUP6', '6611', '0', 'Dienstgeberbeitrag Angestellte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 166, 'AT-BASE', 'GROUP6', '6620', '0', 'Zuschlag zum DB');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 167, 'AT-BASE', 'GROUP6', '6621', '0', 'Zuschlag zum DB Angestellte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 168, 'AT-BASE', 'GROUP6', '6630', '0', 'Ausgleichstaxe');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 169, 'AT-BASE', 'GROUP6', '6690', '0', 'Lohnsteuer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 170, 'AT-BASE', 'GROUP6', '6693', '0', 'Kommunalsteuer Arbeiter');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 171, 'AT-BASE', 'GROUP6', '6694', '0', 'Kommunalsteuer Angestellte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 172, 'AT-BASE', 'GROUP6', '6700', '0', 'Freiwilliger Sozialaufwand');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 173, 'AT-BASE', 'GROUP6', '6710', '0', 'Arbeitskleidung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 174, 'AT-BASE', 'GROUP6', '6720', '0', 'Fahrspesen Dienstnehmer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 175, 'AT-BASE', 'GROUP6', '6730', '0', 'Weihnachtsgeschenke Arbeitnehmer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 176, 'AT-BASE', 'GROUP6', '6740', '0', 'Betriebsveranstaltungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 177, 'AT-BASE', 'GROUP6', '6750', '0', 'Konto frei');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 178, 'AT-BASE', 'GROUP6', '6760', '0', 'Vergleichszahlung Dienstnehmer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 179, 'AT-BASE', 'GROUP7', '7030', '0', 'Abschreibung  G W G');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 180, 'AT-BASE', 'GROUP7', '7070', '0', 'Buchwert ausgeschiedener Anlagen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 181, 'AT-BASE', 'GROUP7', '7080', '0', 'Planmäßige AFA immat.WG.');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 182, 'AT-BASE', 'GROUP7', '7081', '0', 'Planmäßige Abschreibung für Sachanlagen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 183, 'AT-BASE', 'GROUP7', '7100', '0', 'Nicht abzugsfähige Vorsteuer (VStK)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 184, 'AT-BASE', 'GROUP7', '7110', '0', 'Gebühren und Abgaben_Zoll');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 185, 'AT-BASE', 'GROUP7', '7111', '0', 'Kammerumlage');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 186, 'AT-BASE', 'GROUP7', '7200', '0', 'Instandhaltung Gebäude');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 187, 'AT-BASE', 'GROUP7', '7201', '0', 'Instandhaltung Außenanlagen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 188, 'AT-BASE', 'GROUP7', '7202', '0', 'Instandh. - Maschinen u. Anl.');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 189, 'AT-BASE', 'GROUP7', '7204', '0',
         'Instandhaltung und Betriebskosten Betriebs und Geschäftsgebäude');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 190, 'AT-BASE', 'GROUP7', '7205', '0', 'Verbrauchsmaterial Werkstatt');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 191, 'AT-BASE', 'GROUP7', '7210', '0', 'Müllentsorgung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 192, 'AT-BASE', 'GROUP7', '7211', '0', 'Entsorgungskosten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 193, 'AT-BASE', 'GROUP7', '7230', '0', 'Reinigungsmaterial (div. Verbrauchsmaterial)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 194, 'AT-BASE', 'GROUP7', '7231', '0', 'Berufsbekleidung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 195, 'AT-BASE', 'GROUP7', '7235', '0', 'Reinigung durch Dritte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 196, 'AT-BASE', 'GROUP7', '7240', '0', 'LKW-Betriebskosten Vito G 437 MB');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 197, 'AT-BASE', 'GROUP7', '7241', '0', 'Leasing Mercedes Vito G 437 MB');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 198, 'AT-BASE', 'GROUP7', '7250', '0', 'KFZ Betriebskosten allgemein');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 199, 'AT-BASE', 'GROUP7', '7251', '0', 'KFZ Leasing allgemein');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 200, 'AT-BASE', 'GROUP7', '7252', '0', 'KFZ Versicherungen allgemein');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 201, 'AT-BASE', 'GROUP7', '7253', '0', 'Wachdienst');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 202, 'AT-BASE', 'GROUP7', '7254', '0', 'Konto frei');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 203, 'AT-BASE', 'GROUP7', '7255', '0', 'Aufwand Leihwagen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 204, 'AT-BASE', 'GROUP7', '7256', '0', 'PKW-Betriebskosten VW Golf G 854 SH Versuchsfahrzeug');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 205, 'AT-BASE', 'GROUP7', '7257', '0', 'Leasing VW Golf G 854 SH');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 206, 'AT-BASE', 'GROUP7', '7258', '0', 'Konto frei');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 207, 'AT-BASE', 'GROUP7', '7285', '0', 'Strom');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 208, 'AT-BASE', 'GROUP7', '7286', '0', 'Betriebskosten/Beheizung Mietobjekte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 209, 'AT-BASE', 'GROUP7', '7300', '0', 'Transporte durch Dritte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 210, 'AT-BASE', 'GROUP7', '7330', '0', 'Reise und Fahrtspesen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 211, 'AT-BASE', 'GROUP7', '7331', '0', 'Kilometergelder');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 212, 'AT-BASE', 'GROUP7', '7360', '0', 'Reisediäten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 213, 'AT-BASE', 'GROUP7', '7380', '0', 'Telefon');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 214, 'AT-BASE', 'GROUP7', '7381', '0', 'Internet');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 215, 'AT-BASE', 'GROUP7', '7382', '0', 'Wartung Homepage');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 216, 'AT-BASE', 'GROUP7', '7390', '0', 'Postgebühren');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 217, 'AT-BASE', 'GROUP7', '7400', '0', 'Konto frei');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 218, 'AT-BASE', 'GROUP7', '7401', '0', 'Konto frei');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 219, 'AT-BASE', 'GROUP7', '7402', '0', 'Konto frei');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 220, 'AT-BASE', 'GROUP7', '7403', '0', 'Miete Büro Linz');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 221, 'AT-BASE', 'GROUP7', '7404', '0', 'Miete Gradnerstraße');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 222, 'AT-BASE', 'GROUP7', '7410', '0', 'Maschinen u. Gerätemieten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 223, 'AT-BASE', 'GROUP7', '7411', '0', 'Wartungskosten BuG Ausstattung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 224, 'AT-BASE', 'GROUP7', '7420', '0', 'Mobilien-Leasing ');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 225, 'AT-BASE', 'GROUP7', '7421', '0', 'Konto frei');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 226, 'AT-BASE', 'GROUP7', '7422', '0', 'Leasing Server');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 227, 'AT-BASE', 'GROUP7', '7423', '0', 'Konto frei');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 228, 'AT-BASE', 'GROUP7', '7424', '0', 'Konto frei');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 229, 'AT-BASE', 'GROUP7', '7480', '0', 'Lizenzgebühren');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 230, 'AT-BASE', 'GROUP7', '7540', '0', 'Provisionen an Dritte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 231, 'AT-BASE', 'GROUP7', '7600', '0', 'Büromaterial');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 232, 'AT-BASE', 'GROUP7', '7601', '0', 'EDV-Material');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 233, 'AT-BASE', 'GROUP7', '7610', '0', 'Drucksorten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 234, 'AT-BASE', 'GROUP7', '7620', '0', 'Fachliteratur und Zeitungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 235, 'AT-BASE', 'GROUP7', '7630', '0', 'Gästeunt. u. Zeitschriften');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 236, 'AT-BASE', 'GROUP7', '7650', '0', 'Werbeaufwand/Inserate');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 237, 'AT-BASE', 'GROUP7', '7651', '0', 'Anbahnung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 238, 'AT-BASE', 'GROUP7', '7652', '0', 'Aufwand Messen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 239, 'AT-BASE', 'GROUP7', '7653', '0', 'Konto frei');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 240, 'AT-BASE', 'GROUP7', '7654', '0', 'Inserate');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 241, 'AT-BASE', 'GROUP7', '7670', '0', 'Bewirtungskosten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 242, 'AT-BASE', 'GROUP7', '7690', '0', 'Trinkgelder u. Spenden');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 243, 'AT-BASE', 'GROUP7', '7691', '0', 'Spenden an begünstigte Institutionen/Sponsoring');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 244, 'AT-BASE', 'GROUP7', '7696', '0', 'Säumnis- und Verspätungszuschläge');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 245, 'AT-BASE', 'GROUP7', '7700', '0', 'Betriebsversicherungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 246, 'AT-BASE', 'GROUP7', '7701', '0', 'Transportversicherungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 247, 'AT-BASE', 'GROUP7', '7710', '0', 'Pflichtversich. Unternehmer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 248, 'AT-BASE', 'GROUP7', '7749', '0', 'Aufwand Japan');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 249, 'AT-BASE', 'GROUP7', '7750', '0', 'Steuerberatung (Lohnverrechnung, Buchhaltung)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 250, 'AT-BASE', 'GROUP7', '7751', '0', 'Patentkosten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 251, 'AT-BASE', 'GROUP7', '7752', '0', 'Rechtsberatung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 252, 'AT-BASE', 'GROUP7', '7753', '0', 'Unternehmensberatung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 253, 'AT-BASE', 'GROUP7', '7754', '0', 'Aufwand tectos China');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 254, 'AT-BASE', 'GROUP7', '7755', '0', 'Wartung (Betreuung EDV)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 255, 'AT-BASE', 'GROUP7', '7756', '0', 'Lizenzgebühren Abaqus');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 256, 'AT-BASE', 'GROUP7', '7757', '0', 'Lizenzgebühren Sonstige');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 257, 'AT-BASE', 'GROUP7', '7758', '0', 'Sonstige Beratungskosten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 258, 'AT-BASE', 'GROUP7', '7759', '0', 'EDV-Beratung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 259, 'AT-BASE', 'GROUP7', '7760', '0', 'Mitgliedsbeiträge/freiwillige Beiträge');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 260, 'AT-BASE', 'GROUP7', '7761', '0', 'Prüfung Jahresabschluss');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 261, 'AT-BASE', 'GROUP7', '7770', '0', 'Aus- und Fortbildung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 262, 'AT-BASE', 'GROUP7', '7775', '0', 'Forschung und Entwicklung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 263, 'AT-BASE', 'GROUP7', '7776', '0', 'Messentwicklung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 264, 'AT-BASE', 'GROUP7', '7777', '0', 'Produktentwicklung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 265, 'AT-BASE', 'GROUP7', '7785', '0', 'Freiwillige Verbandsbeiträge');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 266, 'AT-BASE', 'GROUP7', '7790', '0', 'Spesen des Geldverkehrs');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 267, 'AT-BASE', 'GROUP7', '7791', '0', 'Kursdifferenzen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 268, 'AT-BASE', 'GROUP7', '7800', '0', 'Betriebsbedingte Schadensfälle');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 269, 'AT-BASE', 'GROUP7', '7801', '0', 'Ausgaben nicht absetzbar');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 270, 'AT-BASE', 'GROUP7', '7802', '0', 'Strafen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 271, 'AT-BASE', 'GROUP7', '7805', '0', 'Forderungsverluste 20');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 272, 'AT-BASE', 'GROUP7', '7806', '0', 'Abschreibungen auf Forderungen (EU)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 273, 'AT-BASE', 'GROUP7', '7807', '0', 'Abschreibungen auf Forderungen (Drittland)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 274, 'AT-BASE', 'GROUP7', '7810', '0', 'Zuweisung an Einzel-WB Forderungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 275, 'AT-BASE', 'GROUP7', '7811', '0',
         'Zuweisung pauschale Wertberichtigungen zu Exportforderungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 276, 'AT-BASE', 'GROUP7', '7812', '0', 'Abschreibungen auf Vorräte');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 277, 'AT-BASE', 'GROUP7', '7820', '0', 'Buchwert abgegangener Sachanlagen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 278, 'AT-BASE', 'GROUP7', '7840', '0', 'Gründungskosten');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 279, 'AT-BASE', 'GROUP7', '7850', '0', 'Sonstiger Aufwand');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 280, 'AT-BASE', 'GROUP7', '7851', '0', 'Sonstiger Aufwand Gewinnanteil Reich');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 281, 'AT-BASE', 'GROUP7', '7930', '0', 'Aufw. Gewährleistungsverpfl.');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 282, 'AT-BASE', 'GROUP7', '7940', '0', 'Aufwand aus Vorperioden');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 283, 'AT-BASE', 'GROUP8', '8020', '0', 'Gewinnüberrg. v. Organgesell.');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 284, 'AT-BASE', 'GROUP8', '8060', '0', 'Zinserträge');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 285, 'AT-BASE', 'GROUP8', '8090', '0', 'Ertr.a.Ant.a.and. Unternehmen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 286, 'AT-BASE', 'GROUP8', '8100', '0', 'Habenzinsen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 287, 'AT-BASE', 'GROUP8', '8280', '0', 'Zinsen f. Kredite u. Darlehen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 288, 'AT-BASE', 'GROUP8', '8286', '0', 'Kursgewinne/Kursverluste');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 289, 'AT-BASE', 'GROUP8', '8288', '0', 'Zinsen auf Lieferantenkredite');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 290, 'AT-BASE', 'GROUP8', '8291', '0', 'Sonst. Zinsen und ähnliche Aufwendungen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 291, 'AT-BASE', 'GROUP8', '8500', '0', 'Körperschaftsteuer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 292, 'AT-BASE', 'GROUP8', '8505', '0', 'Kapitalertragsteuer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 293, 'AT-BASE', 'GROUP8', '8510', '0', 'Körperschaftsteuervorauszahl.');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 294, 'AT-BASE', 'GROUP8', '8511', '0', 'Dotierung KöSt-Rückstellung');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 295, 'AT-BASE', 'GROUP8', '8512', '0', 'Aktivierung Körperschaftsteuer');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 296, 'AT-BASE', 'GROUP8', '8513', '0', 'Köst Vorperioden');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 297, 'AT-BASE', 'GROUP8', '8520', '0', 'Forschungsprämie');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 298, 'AT-BASE', 'GROUP8', '8595', '0', 'Ertrag aus der Aktivierung latenter Steuern');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 299, 'AT-BASE', 'GROUP8', '8610', '0', 'Auflösung sonstiger unversteuerter Rücklagen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 300, 'AT-BASE', 'GROUP8', '8700', '0', 'Auflösung gebundener Kapitalrücklage');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 301, 'AT-BASE', 'GROUP8', '8710', '0', 'Auflösung Rücklage für eigene Anteile');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 302, 'AT-BASE', 'GROUP8', '8720', '0', 'Auflösung nicht gebundene Kapitalrücklage');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 303, 'AT-BASE', 'GROUP8', '8750', '0', 'Auflösung gesetzliche Rücklage');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 304, 'AT-BASE', 'GROUP8', '8760', '0', 'Auflösung satzungsmäßige Rücklage');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 305, 'AT-BASE', 'GROUP8', '8770', '0', 'Auflösung andere (freie) Rücklage');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 306, 'AT-BASE', 'GROUP8', '8810', '0', 'Zuweisung sonstige unversteuerte Rücklagen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 307, 'AT-BASE', 'GROUP8', '8820', '0', 'Zuweisung Inv. Rücklage');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 308, 'AT-BASE', 'GROUP8', '8890', '0', 'Zuw.Bew.Res.GWG');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 309, 'AT-BASE', 'GROUP8', '8900', '0', 'Zuweisung gesetzliche Rücklagen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 310, 'AT-BASE', 'GROUP8', '8910', '0', 'Zuweisung satzungsmäßige Rücklagen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 311, 'AT-BASE', 'GROUP8', '8920', '0', 'Zuweisung andere (freie) Rücklagen');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 312, 'AT-BASE', 'GROUP9', '9390', '0', 'Bilanzgewinn');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 313, 'AT-BASE', 'GROUP9', '9391', '0', 'Bilanzverlust');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 314, 'AT-BASE', 'GROUP9', '9700', '0', 'Wachdienst');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 315, 'AT-BASE', 'GROUP9', '9991', '0', 'Gewinnvortrag');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 316, 'AT-BASE', 'GROUP9', '9993', '0', 'Verlustvortrag');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 317, 'AT-BASE', 'GROUP9', '9994', '0', 'Verlustvortrag');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 318, 'AT-BASE', 'GROUP5', '50200', '0', 'Materialeinkauf');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 319, 'AT-BASE', 'GROUP6', '60000', '0', 'kalk. Löhne u Gehälter');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 320, 'AT-BASE', 'GROUP6', '64160', '0', 'Veränderung Pensionsrückstellung (Angestellte)');
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label)
VALUES (__ ENTITY__, 321, 'AT-BASE', 'GROUP6', '66300', '0', 'Leistungserfassung');
