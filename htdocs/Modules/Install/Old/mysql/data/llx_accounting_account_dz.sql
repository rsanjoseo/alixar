-- Copyright (C) 2018 Abbes Bahfir         <dolipar@dolipar.org>
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

--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--

-- Descriptif du système comptable financier DZ NSCF
-- ID 15000 - 15811
-- ADD 1300000 to rowid # Do no remove this comment --

INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15000,'NSCF','CAPIT','1',0,'Comptes de capitaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15001,'NSCF','CAPIT','10',17000,'Capital, réserves et assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15002,'NSCF','CAPIT','101',15001,'Capital émis','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15003,'NSCF','CAPIT','1011',15002,'Capital souscrit, non appelé','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15004,'NSCF','CAPIT','1012',15002,'Capital souscrit, appelé, non versé','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15005,'NSCF','CAPIT','1013',15002,'Capital souscrit, appelé, versé','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15006,'NSCF','CAPIT','10131',15005,'Capital non amorti','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15007,'NSCF','CAPIT','10132',15005,'Capital amorti','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15008,'NSCF','CAPIT','1018',15002,'Capital souscrit, soumis à des réglementations particulières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15009,'NSCF','CAPIT','103',15001,'Primes liées au capital social','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15010,'NSCF','CAPIT','1031',15009,'Primes d''émission','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15011,'NSCF','CAPIT','1032',15009,'Primes de fusion','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15012,'NSCF','CAPIT','1033',15009,'Primes d''apport','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15013,'NSCF','CAPIT','1034',15009,'Primes de conversion d''obligations en actions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15014,'NSCF','CAPIT','104',15001,'Ecart d''évaluation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15015,'NSCF','CAPIT','105',15001,'Ecart de réévaluation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15016,'NSCF','CAPIT','1050',15015,'Ecart de réévaluation : Immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15017,'NSCF','CAPIT','10503',15016,'Ecart de réévaluation : Frais de recherche et de développement immobilisés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15018,'NSCF','CAPIT','10504',15016,'Ecart de réévaluation : Logiciels informatiques et assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15019,'NSCF','CAPIT','10505',15016,'Ecart de réévaluation : Concessions et droits similaires, brevets, licences et marques','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15020,'NSCF','CAPIT','10507',15016,'Ecarts de réévaluation : Fonds commercial – goodwill','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15021,'NSCF','CAPIT','10508',15016,'Ecart de réévaluation : Immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15022,'NSCF','CAPIT','1051',15015,'Ecart de réévaluation :Immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15023,'NSCF','CAPIT','10511',15022,'Ecart de réévaluation : Terrains','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15024,'NSCF','CAPIT','10512',15022,'Ecart de réévaluation : Agencements et  aménagements de terrains','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15025,'NSCF','CAPIT','10513',15022,'Ecart de réévaluation : Constructions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15026,'NSCF','CAPIT','10515',15022,'Ecarts de réévaluation : Installations techniques','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15027,'NSCF','CAPIT','10518',15022,'Ecart de réévaluation : Autres Immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15028,'NSCF','CAPIT','1052',15015,'Ecart de réévaluation sur immobilisations financières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15029,'NSCF','CAPIT','10526',15028,'Ecart de réévaluation : Titres de filiale','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15030,'NSCF','CAPIT','10527',15028,'Ecart de réévaluation : Autres immobilisations financières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15031,'NSCF','CAPIT','106',15001,'Réserves','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15032,'NSCF','CAPIT','1061',15031,'Réserve légale','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15033,'NSCF','CAPIT','1062',15031,'Réserve statutaire','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15034,'NSCF','CAPIT','1063',15031,'Réserve ordinaire','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15035,'NSCF','CAPIT','1064',15031,'Réserve réglementée','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15036,'NSCF','CAPIT','10641',15035,'Réserve réglementée proprement dits','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15037,'NSCF','CAPIT','10642',15035,'Plus-values nettes à long terme','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15038,'NSCF','CAPIT','1068',15031,'Autres réserves','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15039,'NSCF','CAPIT','107',15001,'Ecart d''équivalence','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15040,'NSCF','CAPIT','108',15001,'Compte de l''exploitant','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15041,'NSCF','CAPIT','109',15001,'Capital souscrit - non appelé (Solde débiteur à l''actif du bilan)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15042,'NSCF','CAPIT','11',17000,'Report à nouveau (solde créditeur ou débiteur)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15043,'NSCF','CAPIT','110',15042,'Report à nouveau (solde créditeur)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15044,'NSCF','CAPIT','119',15042,'Report à nouveau (solde débiteur)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15045,'NSCF','CAPIT','12',17000,'Résultat de l''exercice (bénéfice ou perte)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15046,'NSCF','CAPIT','120',15045,'Résultat de l''exercice (bénéfice)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15047,'NSCF','CAPIT','129',15045,'Résultat de l''exercice (perte)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15048,'NSCF','CAPIT','13',17000,'Produits et charges différés – hors cycle d''exploitation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15049,'NSCF','CAPIT','131',15048,'Subventions d''équipements','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15050,'NSCF','CAPIT','1312',15049,'Subventions d''équipements – Transfert gratuit d''immobilisations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15051,'NSCF','CAPIT','1314',15049,'Subventions d''équipements – Financement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15052,'NSCF','CAPIT','1319',15049,'Subventions d''investissement inscrites au compte de résultat','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15053,'NSCF','CAPIT','132',15048,'Autres subventions d''investissements','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15054,'NSCF','CAPIT','133',15048,'Impôts différés actif','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15055,'NSCF','CAPIT','134',15048,'Impôts différés passif','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15056,'NSCF','CAPIT','138',15048,'Autres produits et charges différés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15057,'NSCF','CAPIT','15',17000,'Provisions pour charges - passifs non courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15058,'NSCF','CAPIT','153',15057,'Provisions pour pensions et obligations similaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15059,'NSCF','CAPIT','155',15057,'Provisions pour impôts','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15060,'NSCF','CAPIT','156',15057,'Provisions pour renouvellement des immobilisations en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15061,'NSCF','CAPIT','1560',15060,'Provisions pour renouvellement d''immobilisation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15062,'NSCF','CAPIT','1562',15060,'Provisions pour renouvellement de gisements miniers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15063,'NSCF','CAPIT','158',15057,'Autres provisions pour charges – passifs non courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15064,'NSCF','CAPIT','1581',15063,'Provisions réglementées relatives aux immobilisations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15065,'NSCF','CAPIT','1583',15063,'Provisions pour risques environnementaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15066,'NSCF','CAPIT','16',17000,'Emprunts et dettes assimilées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15067,'NSCF','CAPIT','161',15066,'Titres participatifs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15068,'NSCF','CAPIT','162',15066,'Emprunts obligataires convertibles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15069,'NSCF','CAPIT','163',15066,'Autres emprunts obligataires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15070,'NSCF','CAPIT','164',15066,'Emprunts auprès des établissements de crédit','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15071,'NSCF','CAPIT','165',15066,'Dépôts et cautionnements reçus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15072,'NSCF','CAPIT','1651',15071,'Dépôts reçus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15073,'NSCF','CAPIT','1655',15071,'Cautionnements reçus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15074,'NSCF','CAPIT','167',15066,'Dettes sur contrat de location - financement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15075,'NSCF','CAPIT','168',15066,'Autres emprunts et dettes assimilées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15076,'NSCF','CAPIT','1681',15075,'Autres emprunts','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15077,'NSCF','CAPIT','1682',15075,'Emprunts auprès d''organismes internationaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15078,'NSCF','CAPIT','1688',15075,'Intérêts courus sur emprunts et dettes assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15079,'NSCF','CAPIT','169',15066,'Primes de remboursement des obligations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15080,'NSCF','CAPIT','17',17000,'Dettes rattachées à des participations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15081,'NSCF','CAPIT','171',15080,'Dettes rattachées à des participations groupe','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15082,'NSCF','CAPIT','172',15080,'Dettes rattachées à des participations hors groupe','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15083,'NSCF','CAPIT','173',15080,'Dettes rattachées à des sociétés en participation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15084,'NSCF','CAPIT','1731',15083,'Principal','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15085,'NSCF','CAPIT','1738',15083,'Intérêts courus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15086,'NSCF','CAPIT','178',15080,'Autres dettes rattachées à des participations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15087,'NSCF','CAPIT','18',17000,'Comptes de liaison des établissements et sociétés en participation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15088,'NSCF','CAPIT','187',15087,'Biens et prestations de services échangés entre établissements (produits)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15089,'NSCF','CAPIT','188',15087,'Comptes de liaison entre sociétés en participation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15090,'NSCF','IMMO','2',0,'COMPTES D''IMMOBILISATIONS','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15091,'NSCF','IMMO','20',15090,'Immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15092,'NSCF','IMMO','203',15091,'Frais de développement immobilisables','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15093,'NSCF','IMMO','204',15091,'Logiciels informatiques et assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15094,'NSCF','IMMO','205',15091,'Concessions et droits similaires, brevets, licences, marques','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15095,'NSCF','IMMO','2051',15094,'Logiciels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15096,'NSCF','IMMO','2052',15094,'Brevets','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15097,'NSCF','IMMO','2053',15094,'Marques','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15098,'NSCF','IMMO','2056',15094,'Licence','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15099,'NSCF','IMMO','2058',15094,'Concession - autres droits similaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15100,'NSCF','IMMO','207',15091,'Ecart d''acquisition - goodwill','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15101,'NSCF','IMMO','208',15091,'Autres immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15102,'NSCF','IMMO','21',15090,'Immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15103,'NSCF','IMMO','211',15102,'Terrains','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15104,'NSCF','IMMO','2110',15103,'Terrains de construction et chantiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15105,'NSCF','IMMO','2111',15103,'Terrains nus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15106,'NSCF','IMMO','2112',15103,'Terrains aménagés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15107,'NSCF','IMMO','2114',15103,'Terrains bâtis','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15108,'NSCF','IMMO','2115',15103,'Carrières et gisements','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15109,'NSCF','IMMO','2118',15103,'Autres terrains','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15110,'NSCF','IMMO','212',15102,'Agencements et aménagements de terrains (même ventilation que celle du compte 211)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15111,'NSCF','IMMO','213',15102,'Constructions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15112,'NSCF','IMMO','2131',15111,'Bâtiments','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15113,'NSCF','IMMO','21311',15112,'Bâtiments industriels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15114,'NSCF','IMMO','21312',15112,'Bâtiments administratifs et commerciaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15115,'NSCF','IMMO','21318',15112,'Autres ensembles immobiliers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15116,'NSCF','IMMO','213181',15115,'Affectés aux opérations professionnelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15117,'NSCF','IMMO','213188',15115,'Affectés aux opérations non professionnelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15118,'NSCF','IMMO','2135',15111,'Installations générales - agencements - aménagements des constructions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15119,'NSCF','IMMO','21351',15118,'Installation d''eau','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15120,'NSCF','IMMO','21352',15118,'Installation d''électricité','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15121,'NSCF','IMMO','21353',15118,'Installation de gaz','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15122,'NSCF','IMMO','21354',15118,'Installation de vapeur','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15123,'NSCF','IMMO','21355',15118,'Installation de protection et de sécurité','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15124,'NSCF','IMMO','21356',15118,'Installation de télécommunication','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15125,'NSCF','IMMO','21357',15118,'Installation d''aération, chauffage et climatisation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15126,'NSCF','IMMO','21358',15118,'Autres agencements et installations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15127,'NSCF','IMMO','2138',15111,'Ouvrages d''infrastructures','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15128,'NSCF','IMMO','21381',15127,'Voies de terre','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15129,'NSCF','IMMO','21382',15127,'Voies de fer','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15130,'NSCF','IMMO','21383',15127,'Voies d''eau','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15131,'NSCF','IMMO','21384',15127,'Barrages - puits d''eau','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15132,'NSCF','IMMO','21385',15127,'Pistes d''aérodromes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15133,'NSCF','IMMO','215',15102,'Installations techniques, matériel et outillage industriels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15134,'NSCF','IMMO','2151',15133,'Installations complexes spécialisées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15135,'NSCF','IMMO','2153',15133,'Installations à caractère spécifique','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15136,'NSCF','IMMO','2154',15133,'Matériel industriel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15137,'NSCF','IMMO','2155',15133,'Outillage industriel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15138,'NSCF','IMMO','2157',15133,'Agencements et aménagements des matériels et outillage industriels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15139,'NSCF','IMMO','218',15102,'Autres immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15140,'NSCF','IMMO','2181',15139,'Installations générales, agencements, aménagements divers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15141,'NSCF','IMMO','2182',15139,'Matériel de transport','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15142,'NSCF','IMMO','2183',15139,'Matériel de bureau et matériel informatique','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15143,'NSCF','IMMO','2184',15139,'Mobilier','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15144,'NSCF','IMMO','2185',15139,'Cheptel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15145,'NSCF','IMMO','2186',15139,'Emballages récupérables','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15146,'NSCF','IMMO','22',15090,'Immobilisations mises en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15147,'NSCF','IMMO','221',15146,'Terrains en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15148,'NSCF','IMMO','222',15146,'Agencements et aménagements de terrains en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15149,'NSCF','IMMO','223',15146,'Constructions en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15150,'NSCF','IMMO','225',15146,'Installations techniques en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15151,'NSCF','IMMO','228',15146,'Autres immobilisations corporelles en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15152,'NSCF','IMMO','229',15146,'Droits du concédant','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15153,'NSCF','IMMO','23',15090,'Immobilisations en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15154,'NSCF','IMMO','232',15153,'Immobilisations corporelles en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15155,'NSCF','IMMO','2322',15154,'Agencements et aménagements de Terrains en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15156,'NSCF','IMMO','2323',15154,'Constructions en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15157,'NSCF','IMMO','2325',15154,'Installations techniques, matériel et outillage industriels en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15158,'NSCF','IMMO','2328',15154,'Autres immobilisations corporelles en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15159,'NSCF','IMMO','237',15153,'Immobilisations incorporelles en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15160,'NSCF','IMMO','238',15153,'Avances et acomptes versés sur commandes d''immobilisations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15161,'NSCF','IMMO','2382',15160,'Avances et acomptes versés sur commandes d''immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15162,'NSCF','IMMO','2387',15160,'Avances et acomptes versés sur commandes d''immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15163,'NSCF','IMMO','26',15090,'Participations et créances rattachées à des participations (entreprises associées)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15164,'NSCF','IMMO','261',15163,'Titres de filiales','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15165,'NSCF','IMMO','2611',15164,'Actions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15166,'NSCF','IMMO','2618',15164,'Autres titres','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15167,'NSCF','IMMO','262',15163,'Autres titres de participation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15168,'NSCF','IMMO','265',15163,'Titres de participation évalués par équivalence','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15169,'NSCF','IMMO','266',15163,'Créances rattachées à des participations groupe','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15170,'NSCF','IMMO','2661',15169,'Créances liées à des participations groupe','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15171,'NSCF','IMMO','2665',15169,'Versements représentatifs d''apports non capitalisés (appel de fonds)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15172,'NSCF','IMMO','2666',15169,'Avances consolidables','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15173,'NSCF','IMMO','2668',15169,'Dividendes à percevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15174,'NSCF','IMMO','267',15163,'Créances rattachées à des participations hors groupe','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15175,'NSCF','IMMO','2671',15174,'Créances liées à des participations hors groupe','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15176,'NSCF','IMMO','2675',15174,'Versements représentatifs d''apports non capitalisés (appel de fonds)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15177,'NSCF','IMMO','2676',15174,'Avances consolidables','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15178,'NSCF','IMMO','2677',15174,'Autres créances rattachées à des participations hors groupe','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15179,'NSCF','IMMO','2678',15174,'Dividendes et intérêts à percevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15180,'NSCF','IMMO','268',15163,'Créances rattachées à des sociétés en participation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15181,'NSCF','IMMO','2681',15180,'Principal','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15182,'NSCF','IMMO','2688',15180,'Intérêts courus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15183,'NSCF','IMMO','269',15163,'Versements restant à effectuer sur titres de participation non libérés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15184,'NSCF','IMMO','27',15090,'Autres immobilisations financières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15185,'NSCF','IMMO','271',15184,'Titres immobilisés autres que les titres immobilisés de l''activité de portefeuille','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15186,'NSCF','IMMO','2711',15185,'Actions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15187,'NSCF','IMMO','2718',15185,'Autres titres','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15188,'NSCF','IMMO','272',15184,'Titres représentatifs de droit de créance','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15189,'NSCF','IMMO','2721',15188,'Obligations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15190,'NSCF','IMMO','2722',15188,'Bons','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15191,'NSCF','IMMO','273',15184,'Titres immobilisés de l''activité de portefeuille','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15192,'NSCF','IMMO','2731',15191,'Actions immobilisées de l''activité de portefeuille','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15193,'NSCF','IMMO','2732',15191,'Obligations remboursables en actions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15194,'NSCF','IMMO','2733',15191,'Obligations convertibles en actions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15195,'NSCF','IMMO','274',15184,'Prêts et créances sur contrat de location – financement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15196,'NSCF','IMMO','2741',15195,'Prêts participatifs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15197,'NSCF','IMMO','2742',15195,'Prêts aux associés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15198,'NSCF','IMMO','2743',15195,'Prêts au personnel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15199,'NSCF','IMMO','2745',15195,'Créances sur contrat de location - financement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15200,'NSCF','IMMO','2748',15195,'Autres prêts','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15201,'NSCF','IMMO','275',15184,'Dépôts et cautionnements versés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15202,'NSCF','IMMO','2751',15201,'Dépôts','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15203,'NSCF','IMMO','2755',15201,'Cautionnements','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15204,'NSCF','IMMO','276',15184,'Autres créances immobilisées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15205,'NSCF','IMMO','2761',15204,'Créances diverses','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15206,'NSCF','IMMO','2768',15204,'Intérêts courus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15207,'NSCF','IMMO','27682',15206,'Autres créances sur titres immobilisés (droit de créance)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15208,'NSCF','IMMO','27684',15206,'Autres créances sur prêts','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15209,'NSCF','IMMO','27685',15206,'Autres créances sur dépôts et cautionnements','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15210,'NSCF','IMMO','27688',15206,'Autres créances sur créances diverses','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15211,'NSCF','IMMO','279',15184,'Versements restant à effectuer sur titres immobilisés non libérés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15212,'NSCF','IMMO','28',15090,'Amortissement des immobilisations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15213,'NSCF','IMMO','280',15212,'Amortissement des immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15214,'NSCF','IMMO','2803',15213,'Amortissement des frais de recherche et de développement immobilisables','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15215,'NSCF','IMMO','2804',15213,'Amortissement. des logiciels informatiques et assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15216,'NSCF','IMMO','2805',15213,'Amortissement concessions et droits similaires, brevets, licences, marques.','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15217,'NSCF','IMMO','2807',15213,'Amortissement écart d''acquisition - Goodwill','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15218,'NSCF','IMMO','2808',15213,'Amortissement autres immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15219,'NSCF','IMMO','281',15212,'Amortissement des immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15220,'NSCF','IMMO','2812',15219,'Amortissement des agencements et aménagement de terrains','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15221,'NSCF','IMMO','2813',15219,'Amortissement des constructions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15222,'NSCF','IMMO','2815',15219,'Amortissement des installations techniques','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15223,'NSCF','IMMO','2818',15219,'Amortissement des autres immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15224,'NSCF','IMMO','282',15212,'Amortissement des immobilisations mises en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15225,'NSCF','IMMO','29',15090,'Pertes de valeur sur immobilisations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15226,'NSCF','IMMO','290',15225,'Pertes de valeur sur immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15227,'NSCF','IMMO','2903',15226,'Pertes de valeurs sur frais de recherche et de développement immobilisables','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15228,'NSCF','IMMO','2904',15226,'Pertes de valeur sur logiciels informatiques et assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15229,'NSCF','IMMO','2905',15226,'Pertes de valeur sur concessions et droits similaires, brevets, licences, marques.','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15230,'NSCF','IMMO','2907',15226,'Pertes de valeur sur écart d''acquisition – Goodwill','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15231,'NSCF','IMMO','2908',15226,'Pertes de valeur sur autres immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15232,'NSCF','IMMO','291',15225,'Pertes de valeurs sur immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15233,'NSCF','IMMO','2912',15232,'Pertes de valeur sur agencements et aménagements de terrains','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15234,'NSCF','IMMO','2913',15232,'Pertes de valeur sur constructions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15235,'NSCF','IMMO','2915',15232,'Pertes de valeur sur installations techniques','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15236,'NSCF','IMMO','2918',15232,'Pertes de valeur sur autres immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15237,'NSCF','IMMO','292',15225,'Pertes de valeur sur immobilisations mises en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15238,'NSCF','IMMO','293',15225,'Pertes de valeur sur immobilisations en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15239,'NSCF','IMMO','2931',15238,'Pertes de valeur sur immobilisations corporelles en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15240,'NSCF','IMMO','2932',15238,'Pertes de valeur sur immobilisations incorporelles en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15241,'NSCF','IMMO','296',15225,'Pertes de valeur sur participations et créances rattachées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15242,'NSCF','IMMO','2961',15241,'Pertes de valeur sur titres de filiales','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15243,'NSCF','IMMO','2962',15241,'Pertes de valeur sur autres formes de participations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15244,'NSCF','IMMO','2965',15241,'Pertes de valeur sur titres de participations évalués par équivalence','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15245,'NSCF','IMMO','2966',15241,'Pertes de valeur sur créances rattachées à des participations groupe','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15246,'NSCF','IMMO','2967',15241,'Pertes de valeur sur créances rattachées à des participations hors groupe','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15247,'NSCF','IMMO','2968',15241,'Pertes de valeur sur créances rattachées à des sociétés en participations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15248,'NSCF','IMMO','297',15225,'Pertes de valeur sur autres titres immobilisés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15249,'NSCF','IMMO','2971',15248,'Pertes de valeur sur titres immobilisés autres que les titres immobilisés autres que TIAP (droits de propriété)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15250,'NSCF','IMMO','2972',15248,'Pertes de valeur sur titres représentatifs de droit de créance','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15251,'NSCF','IMMO','2973',15248,'Pertes de valeur sur titres immobilisés de l''activité de portefeuille','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15252,'NSCF','IMMO','2974',15248,'Pertes de valeur sur contrat de location – financement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15253,'NSCF','IMMO','2975',15248,'Pertes de valeur sur dépôts et cautionnements versés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15254,'NSCF','IMMO','2976',15248,'Pertes de valeur sur autres créances immobilisées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15255,'NSCF','IMMO','298',15225,'Pertes de valeur sur autres instruments financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15256,'NSCF','STOCK','3',0,'COMPTES DE STOCKS ET ENCOURS','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15257,'NSCF','STOCK','30',15256,'Stocks de marchandises','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15258,'NSCF','STOCK','31',15256,'Matières premières et fournitures','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15259,'NSCF','STOCK','311',15258,'Matières (ou groupe) A','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15260,'NSCF','STOCK','312',15258,'Matières (ou groupe) B','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15261,'NSCF','STOCK','313',15258,'Matières ...','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15262,'NSCF','STOCK','32',15256,'Autres approvisionnements','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15263,'NSCF','STOCK','321',15262,'Matières consommables','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15264,'NSCF','STOCK','322',15262,'Fournitures consommables','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15265,'NSCF','STOCK','326',15262,'Emballages','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15266,'NSCF','STOCK','3261',15265,'Emballages perdus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15267,'NSCF','STOCK','3265',15265,'Emballages récupérables non identifiables','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15268,'NSCF','STOCK','3267',15265,'Emballages à usage mixte','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15269,'NSCF','STOCK','33',15256,'En-cours de production de biens','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15270,'NSCF','STOCK','331',15269,'Produits en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15271,'NSCF','STOCK','335',15269,'Travaux en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15272,'NSCF','STOCK','34',15256,'En-cours de production de services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15273,'NSCF','STOCK','341',15272,'Etudes en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15274,'NSCF','STOCK','345',15272,'Prestations de services en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15275,'NSCF','STOCK','35',15256,'Stocks de produits','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15276,'NSCF','STOCK','351',15275,'Produits intermédiaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15277,'NSCF','STOCK','355',15275,'Produits finis','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15278,'NSCF','STOCK','358',15275,'Produits résiduels ou matières de récupération','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15279,'NSCF','STOCK','3581',15278,'Déchets','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15280,'NSCF','STOCK','3585',15278,'Rebuts','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15281,'NSCF','STOCK','3586',15278,'Matières de récupération','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15282,'NSCF','STOCK','36',15256,'Stocks provenant d''immobilisations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15283,'NSCF','STOCK','37',15256,'Stocks à l''extérieur','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15284,'NSCF','STOCK','370',15283,'Stocks de marchandises l''extérieur','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15285,'NSCF','STOCK','3700',15284,'Stocks en cours de route','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15286,'NSCF','STOCK','3701',15284,'Stocks de marchandises en dépôt à l''extérieur','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15287,'NSCF','STOCK','3702',15284,'Stocks de marchandises en consignation à l''extérieur','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15288,'NSCF','STOCK','371',15283,'Stocks de matières premières et fournitures à l''extérieur','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15289,'NSCF','STOCK','375',15283,'Stocks de produits à l''extérieur','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15290,'NSCF','STOCK','38',15256,'Achats stockés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15291,'NSCF','STOCK','380',15290,'Marchandises stockées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15292,'NSCF','STOCK','381',15290,'Matières premières et fournitures stockées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15293,'NSCF','STOCK','382',15290,'Autres approvisionnements stockés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15294,'NSCF','STOCK','39',15256,'Pertes de valeur sur stocks et en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15295,'NSCF','STOCK','390',15294,'Pertes de valeur sur stocks de marchandises','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15296,'NSCF','STOCK','391',15294,'Pertes de valeur sur matières premières et fournitures de biens','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15297,'NSCF','STOCK','392',15294,'Pertes de valeur sur autres approvisionnements','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15298,'NSCF','STOCK','393',15294,'Pertes de valeur sur en-cours de production de de biens','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15299,'NSCF','STOCK','394',15294,'Pertes de valeur sur en-cours de production de de services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15300,'NSCF','STOCK','395',15294,'Pertes de valeur sur stocks de produits','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15301,'NSCF','STOCK','397',15294,'Pertes de valeur sur stocks à l''extérieur','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15302,'NSCF','THIRDPARTY','4',0,'COMPTES DE TIERS','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15303,'NSCF','THIRDPARTY','40',15302,'Fournisseurs et comptes rattachés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15304,'NSCF','THIRDPARTY','401',15303,'Fournisseurs de stocks et services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15305,'NSCF','THIRDPARTY','4011',15304,'Fournisseurs - Achats de biens et prestations de services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15306,'NSCF','THIRDPARTY','4017',15304,'Fournisseurs - Retenues de garantie','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15307,'NSCF','THIRDPARTY','403',15303,'Fournisseurs - Effets à payer','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15308,'NSCF','THIRDPARTY','404',15303,'Fournisseurs d''immobilisations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15309,'NSCF','THIRDPARTY','4041',15308,'Fournisseurs - Achats d''immobilisations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15310,'NSCF','THIRDPARTY','4047',15308,'Fournisseurs d''immobilisations – Retenues de garantie','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15311,'NSCF','THIRDPARTY','405',15303,'Fournisseurs d''immobilisations - Effets à payer','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15312,'NSCF','THIRDPARTY','408',15303,'Fournisseurs - factures non parvenues','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15313,'NSCF','THIRDPARTY','4081',15312,'Fournisseurs de stocks - Factures non parvenues','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15314,'NSCF','THIRDPARTY','4084',15312,'Fournisseurs d''immobilisations – Factures non parvenues','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15315,'NSCF','THIRDPARTY','4088',15312,'Fournisseurs - Intérêts courus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15316,'NSCF','THIRDPARTY','409',15303,'Fournisseurs débiteurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15317,'NSCF','THIRDPARTY','4091',15316,'Fournisseurs - Avances et acomptes versés sur commandes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15318,'NSCF','THIRDPARTY','4096',15316,'Fournisseurs - Créances pour emballages et matériel à rendre ','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15319,'NSCF','THIRDPARTY','4097',15316,'Fournisseurs - Autres avoirs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15320,'NSCF','THIRDPARTY','4098',15316,'Rabais, remises, ristournes à obtenir et autres avoirs non encore reçus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15321,'NSCF','THIRDPARTY','41',15302,'Clients et comptes rattachés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15322,'NSCF','THIRDPARTY','411',15321,'Clients','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15323,'NSCF','THIRDPARTY','4111',15322,'Clients - Ventes de biens ou de prestations de services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15324,'NSCF','THIRDPARTY','4117',15322,'Clients - Retenues de garantie','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15325,'NSCF','THIRDPARTY','413',15321,'Clients - Effets à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15326,'NSCF','THIRDPARTY','416',15321,'Clients douteux (litigieux)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15327,'NSCF','THIRDPARTY','417',15321,'Créances sur travaux ou prestations en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15328,'NSCF','THIRDPARTY','418',15321,'Clients - Produits non encore facturés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15329,'NSCF','THIRDPARTY','4181',15328,'Clients - Factures à établir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15330,'NSCF','THIRDPARTY','4188',15328,'Clients - Intérêts courus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15331,'NSCF','THIRDPARTY','419',15321,'Clients créditeurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15332,'NSCF','THIRDPARTY','4191',15331,'Clients - Avances et acomptes reçus sur commandes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15333,'NSCF','THIRDPARTY','4196',15331,'Clients - Dettes sur emballages et matériels consignés autres avoirs à établir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15334,'NSCF','THIRDPARTY','4197',15331,'Clients - Autres avoirs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15335,'NSCF','THIRDPARTY','4198',15331,'Rabais, remises, ristournes à accorder et','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15336,'NSCF','THIRDPARTY','42',15302,'Personnel et comptes rattachés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15337,'NSCF','THIRDPARTY','421',15336,'Personnel - Rémunérations dues','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15338,'NSCF','THIRDPARTY','422',15336,'Fonds des œuvres sociales','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15339,'NSCF','THIRDPARTY','423',15336,'Participation des salariés aux résultats','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15340,'NSCF','THIRDPARTY','425',15336,'Personnel - Avances et acomptes accordés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15341,'NSCF','THIRDPARTY','426',15336,'Personnel - Dépôts reçus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15342,'NSCF','THIRDPARTY','427',15336,'Personnel - Oppositions sur salaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15343,'NSCF','THIRDPARTY','428',15336,'Personnel - Charges à payer et produits à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15344,'NSCF','THIRDPARTY','4286',15343,'Personnel, charges à payer','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15345,'NSCF','THIRDPARTY','4287',15343,'Personnel, produits à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15346,'NSCF','THIRDPARTY','43',15302,'Organismes sociaux et comptes rattachés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15347,'NSCF','THIRDPARTY','431',15346,'Sécurité sociale','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15348,'NSCF','THIRDPARTY','432',15346,'Autres organismes sociaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15349,'NSCF','THIRDPARTY','438',15346,'Organismes sociaux - Charges à payer et produits à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15350,'NSCF','THIRDPARTY','4386',15349,'Organismes sociaux, charges à payer','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15351,'NSCF','THIRDPARTY','4387',15349,'Organismes sociaux, produits à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15352,'NSCF','THIRDPARTY','44',15302,'État, collectivités publiques, organismes internationaux et comptes rattachés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15353,'NSCF','THIRDPARTY','441',15352,'État et collectivités publiques, subventions à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15354,'NSCF','THIRDPARTY','4411',15353,'Subventions d''investissement à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15355,'NSCF','THIRDPARTY','4417',15353,'Subventions d''exploitation à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15356,'NSCF','THIRDPARTY','4418',15353,'Subventions d''équilibre à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15357,'NSCF','THIRDPARTY','4419',15353,'Avances sur subventions à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15358,'NSCF','THIRDPARTY','442',15352,'Impôts et taxes recouvrables sur des tiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15359,'NSCF','THIRDPARTY','443',15352,'Opérations particulières avec l''Etat et les collectivités publiques','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15360,'NSCF','THIRDPARTY','444',15352,'Etat - Impôts sur les résultats','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15361,'NSCF','THIRDPARTY','445',15352,'Etat - Taxes sur le chiffre d''affaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15362,'NSCF','THIRDPARTY','4451',15361,'Taxes sur le chiffre d''affaires à décaisser','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15363,'NSCF','THIRDPARTY','44511',15362,'T.V.A. à décaisser','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15364,'NSCF','THIRDPARTY','44518',15362,'Autres taxes assimilées à décaisser','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15365,'NSCF','THIRDPARTY','4456',15361,'Taxes sur le chiffre d''affaires déductibles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15366,'NSCF','THIRDPARTY','44562',15365,'T.V.A. sur immobilisations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15367,'NSCF','THIRDPARTY','44566',15365,'T.V.A. sur autres biens et services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15368,'NSCF','THIRDPARTY','44567',15365,'Crédit de T.V.A. à reporter','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15369,'NSCF','THIRDPARTY','4457',15361,'Taxes sur le chiffre d''affaires collectées par l''entreprise','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15370,'NSCF','THIRDPARTY','44571',15369,'T.V.A. collectée','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15371,'NSCF','THIRDPARTY','44578',15369,'Autres taxes collectée assimilées à la T.V.A.','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15372,'NSCF','THIRDPARTY','4458',15361,'Taxes sur le chiffre d''affaires à régulariser ou en attente','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15373,'NSCF','THIRDPARTY','44586',15372,'Taxes sur le chiffre d''affaires sur factures non parvenues','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15374,'NSCF','THIRDPARTY','44587',15372,'Taxes sur le chiffre d''affaires sur factures à établir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15375,'NSCF','THIRDPARTY','446',15352,'Organismes internationaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15376,'NSCF','THIRDPARTY','447',15352,'Autres impôts, taxes et versements assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15377,'NSCF','THIRDPARTY','448',15352,'Etat - Charges à payer et produits à recevoir (hors impôts)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15378,'NSCF','THIRDPARTY','4486',15377,'Etat, charges à payer','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15379,'NSCF','THIRDPARTY','4487',15377,'Etat, produits à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15380,'NSCF','THIRDPARTY','4488',15377,'Obligations cautionnées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15381,'NSCF','THIRDPARTY','45',15302,'Groupe et associés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15382,'NSCF','THIRDPARTY','451',15381,'Opérations groupe','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15383,'NSCF','THIRDPARTY','4510',15382,'Groupe, avances accordées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15384,'NSCF','THIRDPARTY','4511',15382,'Groupe, avances reçues','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15385,'NSCF','THIRDPARTY','455',15381,'Associés - Comptes courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15386,'NSCF','THIRDPARTY','4551',15385,'Principal','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15387,'NSCF','THIRDPARTY','4558',15385,'Intérêts courus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15388,'NSCF','THIRDPARTY','456',15381,'Associés - Opérations sur le capital','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15389,'NSCF','THIRDPARTY','4561',15388,'Associés - Comptes d''apport en société','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15390,'NSCF','THIRDPARTY','45611',15389,'Apports en nature','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15391,'NSCF','THIRDPARTY','45615',15389,'Apports en numéraire','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15392,'NSCF','THIRDPARTY','4562',15388,'Apporteurs - Capital appelé, non versé','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15393,'NSCF','THIRDPARTY','45621',15392,'Actionnaires - Capital souscrit et appelé, non versé','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15394,'NSCF','THIRDPARTY','45625',15392,'Associés - Capital appelé, non versé','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15395,'NSCF','THIRDPARTY','4563',15388,'Associés - versements reçus sur augmentation de capital','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15396,'NSCF','THIRDPARTY','4564',15388,'Associés - Versements anticipés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15397,'NSCF','THIRDPARTY','4566',15388,'Actionnaires défaillants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15398,'NSCF','THIRDPARTY','4567',15388,'Associés - Capital à rembourser','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15399,'NSCF','THIRDPARTY','457',15381,'Associés - Dividendes à payer','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15400,'NSCF','THIRDPARTY','458',15381,'Associés - Opérations faites en commun ou en groupement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15401,'NSCF','THIRDPARTY','4581',15400,'Opérations courantes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15402,'NSCF','THIRDPARTY','4588',15400,'Intérêts courus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15403,'NSCF','THIRDPARTY','46',15302,'Débiteurs divers et créditeurs divers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15404,'NSCF','THIRDPARTY','462',15403,'Créances sur cessions d''immobilisations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15405,'NSCF','THIRDPARTY','464',15403,'Dettes sur acquisitions valeurs mobilières de placement et instruments financiers dérivés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15406,'NSCF','THIRDPARTY','465',15403,'Créances sur cessions valeurs mobilières de placement et instruments financiers dérivés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15407,'NSCF','THIRDPARTY','467',15403,'Autres comptes débiteurs ou créditeurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15408,'NSCF','THIRDPARTY','468',15403,'Diverses charges à payer et produits à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15409,'NSCF','THIRDPARTY','4686',15408,'Diverses charges à payer','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15410,'NSCF','THIRDPARTY','4687',15408,'Divers produits à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15411,'NSCF','THIRDPARTY','47',15302,'Comptes transitoires ou d''attente','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15412,'NSCF','THIRDPARTY','471',15411,'Compte d''attente 1','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15413,'NSCF','THIRDPARTY','472',15411,'Compte d''attente 2','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15414,'NSCF','THIRDPARTY','473',15411,'Compte d''attente 3','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15415,'NSCF','THIRDPARTY','474',15411,'Compte d''attente 4','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15416,'NSCF','THIRDPARTY','475',15411,'Compte d''attente 5','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15417,'NSCF','THIRDPARTY','476',15411,'Différence de conversion - Actif','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15418,'NSCF','THIRDPARTY','4761',15417,'Diminution des créances','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15419,'NSCF','THIRDPARTY','4762',15417,'Augmentation des dettes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15420,'NSCF','THIRDPARTY','4768',15417,'Différences compensées par couverture de change','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15421,'NSCF','THIRDPARTY','477',15411,'Différences de conversion - Passif','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15422,'NSCF','THIRDPARTY','4771',15421,'Augmentation des créances','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15423,'NSCF','THIRDPARTY','4772',15421,'Diminution des dettes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15424,'NSCF','THIRDPARTY','4778',15421,'Différences compensées par couverture de change','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15425,'NSCF','THIRDPARTY','478',15411,'Autres comptes transitoires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15426,'NSCF','THIRDPARTY','48',15302,'Charges ou produits constatés d''avance et provisions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15427,'NSCF','THIRDPARTY','481',15426,'Provisions, passifs courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15428,'NSCF','THIRDPARTY','486',15426,'Charges constatées d''avance','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15429,'NSCF','THIRDPARTY','487',15426,'Produits constatés d''avance','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15430,'NSCF','THIRDPARTY','49',15302,'Pertes de valeur sur comptes de tiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15431,'NSCF','THIRDPARTY','491',15430,'Pertes de valeur sur comptes de clients','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15432,'NSCF','THIRDPARTY','495',15430,'Pertes de valeur sur comptes du groupe et sur associés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15433,'NSCF','THIRDPARTY','4951',15432,'Pertes de valeur sur comptes du groupe','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15434,'NSCF','THIRDPARTY','4955',15432,'Pertes de valeur sur comptes courants des associés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15435,'NSCF','THIRDPARTY','496',15430,'Pertes de valeur sur comptes de débiteurs divers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15436,'NSCF','THIRDPARTY','4962',15435,'Créances sur cessions d''immobilisations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15437,'NSCF','THIRDPARTY','4965',15435,'Créances sur cessions de valeurs mobilières de placement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15438,'NSCF','THIRDPARTY','4967',15435,'Autres comptes débiteurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15439,'NSCF','THIRDPARTY','498',15430,'Pertes de valeur sur comptes de débiteurs divers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15440,'NSCF','FINAN','5',0,'COMPTES FINANCIERS','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15441,'NSCF','FINAN','50',15440,'Valeurs mobilières de placement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15442,'NSCF','FINAN','501',15441,'Parts dans des entreprises liées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15443,'NSCF','FINAN','502',15441,'Actions propres','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15444,'NSCF','FINAN','503',15441,'Autres actions ou titres conférant un droit de propriété','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15445,'NSCF','FINAN','5031',15444,'Titres cotés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15446,'NSCF','FINAN','5032',15444,'Titres non cotés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15447,'NSCF','FINAN','506',15441,'Obligations, bons du Trésor et bons de caisse à court terme','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15448,'NSCF','FINAN','5061',15447,'Obligations à court termes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15449,'NSCF','FINAN','5062',15447,'Bons du trésor à court terme','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15450,'NSCF','FINAN','5063',15447,'Bons de caisse à court terme','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15451,'NSCF','FINAN','508',15441,'Autres valeurs mobilières de placement et créances assimilées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15452,'NSCF','FINAN','5088',15451,'Autres valeurs mobilières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15453,'NSCF','FINAN','5082',15451,'Bons de souscription','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15454,'NSCF','FINAN','5083',15451,'Intérêts courus sur obligations, bons et valeurs assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15455,'NSCF','FINAN','509',15441,'Versements restant à effectuer sur valeurs mobilières de placement non libérées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15456,'NSCF','FINAN','51',15440,'Banques, établissements financiers et assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15457,'NSCF','FINAN','511',15456,'Valeurs à l''encaissement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15458,'NSCF','FINAN','5111',15457,'Coupons échus à l''encaissement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15459,'NSCF','FINAN','5112',15457,'Chèques à encaisser','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15460,'NSCF','FINAN','5113',15457,'Effets à l''encaissement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15461,'NSCF','FINAN','5114',15457,'Effets à l''escompte','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15462,'NSCF','FINAN','5115',15457,'Cartes bancaires à l''encaissement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15463,'NSCF','FINAN','512',15456,'Banques comptes courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15464,'NSCF','FINAN','514',15456,'Chèques postaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15465,'NSCF','FINAN','515',15456,'Caisses du Trésor et des établissements publics','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15466,'NSCF','FINAN','516',15456,'Sociétés de bourse','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15467,'NSCF','FINAN','517',15456,'Autres organismes financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15468,'NSCF','FINAN','518',15456,'Intérêts courus','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15469,'NSCF','FINAN','5181',15468,'Intérêts courus à payer','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15470,'NSCF','FINAN','5188',15468,'Intérêts courus à recevoir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15471,'NSCF','FINAN','519',15456,'Concours bancaires courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15472,'NSCF','FINAN','5191',15471,'Crédit de mobilisation de créances commerciales (CMCC)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15473,'NSCF','FINAN','5192',15471,'Crédit documentaire','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15474,'NSCF','FINAN','5193',15471,'Mobilisation de créances nées à l''étranger','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15475,'NSCF','FINAN','5198',15471,'Intérêts courus sur concours bancaires courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15476,'NSCF','FINAN','52',15440,'Instruments de trésorerie','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15477,'NSCF','FINAN','53',15440,'Caisse','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15478,'NSCF','FINAN','54',15440,'Régies d''avance et accréditifs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15479,'NSCF','FINAN','541',15478,'Régie d''avance','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15480,'NSCF','FINAN','542',15478,'Accréditifs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15481,'NSCF','FINAN','58',15440,'Virements internes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15482,'NSCF','FINAN','581',15481,'Virements de fonds','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15483,'NSCF','FINAN','588',15481,'Autres virements internes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15484,'NSCF','FINAN','59',15440,'Pertes de valeur des actifs financiers courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15485,'NSCF','FINAN','591',15484,'Pertes de valeur des dépôts en banque et autres établissements financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15486,'NSCF','FINAN','594',15484,'Pertes de valeur sur des régies d''avance et accréditifs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15487,'NSCF','EXPENSE','6',0,'COMPTES DE CHARGES','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15488,'NSCF','EXPENSE','60',15487,'Achats consommées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15489,'NSCF','EXPENSE','600',15488,'Achats de marchandises vendues','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15490,'NSCF','EXPENSE','601',15488,'Matières premières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15491,'NSCF','EXPENSE','602',15488,'Autres approvisionnements','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15492,'NSCF','EXPENSE','603',15488,'Variations des stocks ','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15493,'NSCF','EXPENSE','6030',15492,'Variations des stocks de marchandises','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15494,'NSCF','EXPENSE','6031',15492,'Variations des stocks de matières premières et fournitures','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15495,'NSCF','EXPENSE','6032',15492,'Variations des stocks d''autres approvisionnements','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15496,'NSCF','EXPENSE','604',15488,'Achats d''études  et prestations de services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15497,'NSCF','EXPENSE','605',15488,'Achats de matériel, équipements et travaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15498,'NSCF','EXPENSE','607',15488,'Achats non stockés de matière et fournitures','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15499,'NSCF','EXPENSE','6071',15498,'Fournitures non stockables (eau, énergie)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15500,'NSCF','EXPENSE','6073',15498,'Fournitures d''entretien et de petit équipement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15501,'NSCF','EXPENSE','6074',15498,'Fournitures administratives','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15502,'NSCF','EXPENSE','6078',15498,'Autres matières et fournitures','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15503,'NSCF','EXPENSE','608',15488,'Frais accessoires sur achats (FAA)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15504,'NSCF','EXPENSE','609',15488,'Rabais, remises et ristournes obtenus sur achats','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15505,'NSCF','EXPENSE','61',15487,'Services extérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15506,'NSCF','EXPENSE','611',15505,'Sous-traitance générale','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15507,'NSCF','EXPENSE','613',15505,'Locations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15508,'NSCF','EXPENSE','6132',15507,'Locations immobilières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15509,'NSCF','EXPENSE','6135',15507,'Locations mobilières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15510,'NSCF','EXPENSE','6136',15507,'Malis sur emballages','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15511,'NSCF','EXPENSE','614',15505,'Charges locatives et charges de copropriété','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15512,'NSCF','EXPENSE','615',15505,'Entretien, réparations et maintenance','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15513,'NSCF','EXPENSE','6152',15512,'Sur biens immobiliers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15514,'NSCF','EXPENSE','6155',15512,'Sur biens mobiliers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15515,'NSCF','EXPENSE','6156',15512,'Maintenance','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15516,'NSCF','EXPENSE','616',15505,'Primes d''assurances','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15517,'NSCF','EXPENSE','6161',15516,'Multirisques','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15518,'NSCF','EXPENSE','6162',15516,'Assurance obligatoire dommage construction','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15519,'NSCF','EXPENSE','6163',15516,'Assurance-transport','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15520,'NSCF','EXPENSE','61636',15519,'sur achats','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15521,'NSCF','EXPENSE','61637',15519,'sur ventes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15522,'NSCF','EXPENSE','61638',15519,'sur autres biens','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15523,'NSCF','EXPENSE','6166',15516,'Assurances véhicules','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15524,'NSCF','EXPENSE','6168',15516,'Autres assurances','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15525,'NSCF','EXPENSE','617',15505,'Etudes et recherches','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15526,'NSCF','EXPENSE','618',15505,'Documentation et divers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15527,'NSCF','EXPENSE','6181',15526,'Documentation générale','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15528,'NSCF','EXPENSE','6183',15526,'Documentation technique','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15529,'NSCF','EXPENSE','6185',15526,'Frais de colloques, séminaires, conférences','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15530,'NSCF','EXPENSE','619',15505,'Rabais, remises et ristournes obtenus sur services extérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15531,'NSCF','EXPENSE','62',15487,'Autres services extérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15532,'NSCF','EXPENSE','621',15531,'Personnel extérieur à l''entreprise','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15533,'NSCF','EXPENSE','6211',15532,'Personnel intérimaire','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15534,'NSCF','EXPENSE','6214',15532,'Personnel détaché ou prêté à l''entreprise','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15535,'NSCF','EXPENSE','622',15531,'Rémunérations d''intermédiaires et honoraires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15536,'NSCF','EXPENSE','6221',15535,'Commissions et courtages sur achats','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15537,'NSCF','EXPENSE','6222',15535,'Commissions et courtages sur ventes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15538,'NSCF','EXPENSE','6224',15535,'Rémunérations des transitaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15539,'NSCF','EXPENSE','6225',15535,'Rémunérations d''affacturage (mémoire)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15540,'NSCF','EXPENSE','6226',15535,'Honoraires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15541,'NSCF','EXPENSE','6227',15535,'Frais d''actes et de contentieux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15542,'NSCF','EXPENSE','6228',15535,'Divers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15543,'NSCF','EXPENSE','624',15531,'Transports de biens et transports collectifs du personnel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15544,'NSCF','EXPENSE','6241',15543,'Transports sur achats','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15545,'NSCF','EXPENSE','6242',15543,'Transports sur ventes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15546,'NSCF','EXPENSE','6243',15543,'Transports entre établissements ou chantiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15547,'NSCF','EXPENSE','6244',15543,'Transports administratifs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15548,'NSCF','EXPENSE','6247',15543,'Transports collectifs du personnel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15549,'NSCF','EXPENSE','6248',15543,'Divers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15550,'NSCF','EXPENSE','625',15531,'Déplacements, missions et réceptions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15551,'NSCF','EXPENSE','6251',15550,'Voyages et déplacements','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15552,'NSCF','EXPENSE','6255',15550,'Frais de déménagement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15553,'NSCF','EXPENSE','6256',15550,'Missions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15554,'NSCF','EXPENSE','6257',15550,'Réceptions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15555,'NSCF','EXPENSE','626',15531,'Frais postaux et de télécommunications','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15556,'NSCF','EXPENSE','627',15531,'Services bancaires et assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15557,'NSCF','EXPENSE','6271',15556,'Frais sur titres (achat, vente, garde)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15558,'NSCF','EXPENSE','6272',15556,'Commissions et frais sur émission d''emprunts','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15559,'NSCF','EXPENSE','6275',15556,'Frais sur effets','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15560,'NSCF','EXPENSE','6276',15556,'Location de coffres','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15561,'NSCF','EXPENSE','6278',15556,'Autres frais et commissions sur prestations de services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15562,'NSCF','EXPENSE','628',15531,'Cotisations et divers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15563,'NSCF','EXPENSE','6281',15562,'Concours divers (cotisations)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15564,'NSCF','EXPENSE','6284',15562,'Frais de recrutement de personnel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15565,'NSCF','EXPENSE','629',15531,'Rabais, remises et ristournes obtenus sur autres services extérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15566,'NSCF','EXPENSE','63',15487,'Charges de personnel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15567,'NSCF','EXPENSE','631',15566,'Rémunérations du personnel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15568,'NSCF','EXPENSE','6311',15567,'Salaires, appointements','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15569,'NSCF','EXPENSE','6312',15567,'Congés payés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15570,'NSCF','EXPENSE','6313',15567,'Primes et gratifications','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15571,'NSCF','EXPENSE','6314',15567,'Indemnités et avantages divers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15572,'NSCF','EXPENSE','6316',15567,'Contributions aux œuvres sociales','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15573,'NSCF','EXPENSE','634',15566,'Rémunération de l''exploitant individuel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15574,'NSCF','EXPENSE','635',15566,'Cotisations aux organismes sociaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15575,'NSCF','EXPENSE','6351',15574,'Cotisations CNAS','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15576,'NSCF','EXPENSE','6352',15574,'Cotisations aux mutuelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15577,'NSCF','EXPENSE','6353',15574,'Cotisations aux caisses de retraites','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15578,'NSCF','EXPENSE','6358',15574,'Cotisations aux autres organismes sociaux (CACOBATH)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15579,'NSCF','EXPENSE','636',15566,'Charges sociales de l''exploitant individuel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15580,'NSCF','EXPENSE','637',15566,'Autres charges sociales','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15581,'NSCF','EXPENSE','6371',15580,'Prestations directes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15582,'NSCF','EXPENSE','6372',15580,'Versements aux comités d''entreprise et d''établissement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15583,'NSCF','EXPENSE','6374',15580,'Versements aux autres œuvres sociales','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15584,'NSCF','EXPENSE','6375',15580,'Médecine du travail, pharmacie','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15585,'NSCF','EXPENSE','638',15566,'Autres charges de personnel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15586,'NSCF','EXPENSE','64',15487,'Impôts, taxes et versements assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15587,'NSCF','EXPENSE','641',15586,'Impôts, taxes et versements assimilés sur rémunérations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15588,'NSCF','EXPENSE','6411',15587,'Taxe sur les salaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15589,'NSCF','EXPENSE','6413',15587,'Participation des employeurs à la formation professionnelle','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15590,'NSCF','EXPENSE','6418',15587,'Autres impôts, taxes et versements assimilés sur rémunérations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15591,'NSCF','EXPENSE','642',15586,'Impôts et taxes non récupérables sur le chiffre d''affaire','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15592,'NSCF','EXPENSE','6421',15591,'Taxe sur l''activité professionnelle (TAP)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15593,'NSCF','EXPENSE','6422',15591,'TVA non récupérable','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15594,'NSCF','EXPENSE','6423',15591,'Droits de timbre et d''enregistrement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15595,'NSCF','EXPENSE','6428',15591,'Autres impôts et taxes non récupérables sur le chiffre d''affaire','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15596,'NSCF','EXPENSE','645',15586,'Autres impôts et taxes (hors impôts sur le résultat)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15597,'NSCF','EXPENSE','6451',15596,'Taxe foncière','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15598,'NSCF','EXPENSE','6452',15596,'Taxe d''assainissement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15599,'NSCF','EXPENSE','6453',15596,'Droits de douane','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15600,'NSCF','EXPENSE','6454',15596,'Vignettes automobiles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15601,'NSCF','EXPENSE','6456',15596,'Taxe écologique','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15602,'NSCF','EXPENSE','6458',15596,'Autres droits et taxes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15603,'NSCF','EXPENSE','65',15487,'Autres charges opérationnelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15604,'NSCF','EXPENSE','651',15603,'Redevances pour concessions, brevets, licences, logiciels et accès similaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15605,'NSCF','EXPENSE','6511',15604,'Redevances pour concessions, brevets, licences, marques, procédés, logiciels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15606,'NSCF','EXPENSE','6516',15604,'Droits d''auteur et de reproduction','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15607,'NSCF','EXPENSE','6518',15604,'Autres droits et valeurs similaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15608,'NSCF','EXPENSE','652',15603,'Moins-values sur sorties d''actifs immobilisés non financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15609,'NSCF','EXPENSE','653',15603,'Jetons de présence','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15610,'NSCF','EXPENSE','654',15603,'Pertes sur créances irrécouvrables','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15611,'NSCF','EXPENSE','6541',15610,'Pertes sur créances de l''exercice','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15612,'NSCF','EXPENSE','6544',15610,'Pertes sur créances des exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15613,'NSCF','EXPENSE','655',15603,'Quote-part de résultat sur opérations faites en commun','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15614,'NSCF','EXPENSE','6551',15613,'Quote-part de résultats de groupement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15615,'NSCF','EXPENSE','6558',15613,'Amortissements de caducité des immobilisations mises en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15616,'NSCF','EXPENSE','6559',15613,'Dotations aux provisions des immobilisations mises en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15617,'NSCF','EXPENSE','656',15603,'Amendes et pénalités, subventions accordées dons et libéralités','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15618,'NSCF','EXPENSE','6561',15617,'Amendes et pénalité','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15619,'NSCF','EXPENSE','6562',15617,'Subventions accordées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15620,'NSCF','EXPENSE','6563',15617,'Dons et libéralités','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15621,'NSCF','EXPENSE','657',15603,'Charges exceptionnelles de gestion courante','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15622,'NSCF','EXPENSE','658',15603,'Autres charges de gestion courante','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15623,'NSCF','EXPENSE','66',15487,'Charges financières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15624,'NSCF','EXPENSE','661',15623,'Charges d''intérêts','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15625,'NSCF','EXPENSE','6611',15624,'Intérêts des emprunts et dettes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15626,'NSCF','EXPENSE','66116',15625,'Intérêts des emprunts et dettes assimilées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15627,'NSCF','EXPENSE','66117',15625,'Intérêts des emprunts et  dettes rattachées à des participations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15628,'NSCF','EXPENSE','6615',15624,'Intérêts des comptes courants et des dépôts créditeurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15629,'NSCF','EXPENSE','6616',15624,'Intérêts bancaires et sur opérations de financement (escompte,…)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15630,'NSCF','EXPENSE','6617',15624,'Intérêts des obligations cautionnées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15631,'NSCF','EXPENSE','6618',15624,'Intérêts des autres dettes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15632,'NSCF','EXPENSE','66181',15631,'Intérêts des dettes commerciales','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15633,'NSCF','EXPENSE','66188',15631,'Intérêts des dettes diverses','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15634,'NSCF','EXPENSE','664',15623,'Pertes sur créances liées à des participations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15635,'NSCF','EXPENSE','665',15623,'Ecarts d''évaluation sur actifs financiers – Moins-values','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15636,'NSCF','EXPENSE','6651',15635,'Ecarts d''évaluation - moins-values sur des parts dans les entreprises liées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15637,'NSCF','EXPENSE','6653',15635,'Ecarts d''évaluation - moins-values sur autres titres conférant un droit de propriété','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15638,'NSCF','EXPENSE','6656',15635,'Ecarts d''évaluation - moins-values sur obligations, bons du trésor et bons de caisse à court terme','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15639,'NSCF','EXPENSE','6658',15635,'Ecarts d''évaluation - moins-values sur autres valeurs mobilières et autres créances assimilées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15640,'NSCF','EXPENSE','666',15623,'Pertes de change','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15641,'NSCF','EXPENSE','667',15623,'Pertes nettes sur cessions d''actifs financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15642,'NSCF','EXPENSE','6671',15641,'Pertes nettes sur cession des parts dans les entreprises liées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15643,'NSCF','EXPENSE','6672',15641,'Pertes nettes sur cession d''actions propres','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15644,'NSCF','EXPENSE','6673',15641,'Pertes nettes sur cession d''autres titres conférant un droit de propriété','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15645,'NSCF','EXPENSE','6676',15641,'Pertes nettes sur cession d''obligations, bons du trésor et bons de caisse à court terme','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15646,'NSCF','EXPENSE','6678',15641,'Pertes nettes sur cession des autres valeurs mobilières et autres créances assimilées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15647,'NSCF','EXPENSE','668',15623,'Autres charges financières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15648,'NSCF','EXPENSE','67',15487,'Eléments extraordinaires - charges','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15649,'NSCF','EXPENSE','672',15648,'Valeur résiduelle des immobilisations cédées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15650,'NSCF','EXPENSE','676',15648,'Charges sur exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15651,'NSCF','EXPENSE','6760',15650,'Consommations sur exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15652,'NSCF','EXPENSE','6761',15650,'Services sur exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15653,'NSCF','EXPENSE','6762',15650,'Autres services sur exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15654,'NSCF','EXPENSE','6763',15650,'Charges de personnel sur exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15655,'NSCF','EXPENSE','6764',15650,'Impôts et taxes sur exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15656,'NSCF','EXPENSE','6765',15650,'Autres charges opérationnelles sur exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15657,'NSCF','EXPENSE','6766',15650,'Charges financières sur exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15658,'NSCF','EXPENSE','6768',15650,'Dotations aux amortissements, provisions et pertes de valeurs sur exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15659,'NSCF','EXPENSE','6769',15650,'Impôts sur les bénéfices sur exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15660,'NSCF','EXPENSE','678',15648,'Autres éléments extraordinaires - charges','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15661,'NSCF','EXPENSE','6783',15660,'Malis provenant du rachat par l''entreprise d''actions et obligations émises par elle-même','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15662,'NSCF','EXPENSE','6788',15660,'Autres charges extraordinaires diverses','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15663,'NSCF','EXPENSE','68',15487,'Dotations aux amortissements, provisions et pertes de valeur','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15664,'NSCF','EXPENSE','681',15663,'Dotations aux amortissements, provisions et pertes de valeur, actifs non courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15665,'NSCF','EXPENSE','6811',15664,'Dotations aux amortissements, provisions et pertes de valeur sur immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15666,'NSCF','EXPENSE','68111',15665,'Dotations aux amortissements et provisions et pertes de valeur sur immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15667,'NSCF','EXPENSE','68112',15665,'Pertes de valeur sur immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15668,'NSCF','EXPENSE','6812',15664,'Dotations aux amortissements, provisions et pertes de valeur sur immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15669,'NSCF','EXPENSE','68121',15668,'Dotations aux amortissements et provisions et immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15670,'NSCF','EXPENSE','68122',15668,'Pertes de valeur sur immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15671,'NSCF','EXPENSE','68123',15668,'Pertes de valeur sur les investissements en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15672,'NSCF','EXPENSE','68126',15668,'Pertes de valeur sur immobilisations financières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15673,'NSCF','EXPENSE','682',15663,'Dotations aux amortissements, provisions et pertes de valeur des biens mis en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15674,'NSCF','EXPENSE','6821',15673,'Dotations aux amortissements, des biens mis en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15675,'NSCF','EXPENSE','6822',15673,'Dotations aux provisions des biens mis-en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15676,'NSCF','EXPENSE','6828',15673,'Pertes de valeur des biens mis en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15677,'NSCF','EXPENSE','685',15663,'Dotations aux amortissements, provisions et pertes de valeur, actifs courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15678,'NSCF','EXPENSE','6853',15677,'Dotations aux pertes de valeur sur stocks','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15679,'NSCF','EXPENSE','6854',15677,'Dotations aux pertes de valeur sur créances','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15680,'NSCF','EXPENSE','6855',15677,'Dotations aux provisions et pertes de valeur sur comptes financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15681,'NSCF','EXPENSE','686',15663,'Dotations aux amortissements, provisions et pertes de valeur, éléments financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15682,'NSCF','EXPENSE','6861',15681,'Dotations aux amortissements des primes de remboursement des obligations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15683,'NSCF','EXPENSE','6865',15681,'Dotations aux provisions pour risques et charges financières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15684,'NSCF','EXPENSE','6866',15681,'Dotations aux provisions pour dépréciations des éléments financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15685,'NSCF','EXPENSE','68662',15684,'Dotations aux provisions pour dépréciations des immobilisations financières','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15686,'NSCF','EXPENSE','68665',15684,'Dotations aux provisions pour les valeurs mobilières de placement','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15687,'NSCF','EXPENSE','6868',15681,'Autres dotations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15688,'NSCF','EXPENSE','69',15487,'Impôts sur les résultats et assimilés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15689,'NSCF','EXPENSE','692',15688,'Imposition différée actif','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15690,'NSCF','EXPENSE','693',15688,'Imposition différée passif','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15691,'NSCF','EXPENSE','695',15688,'Impôts sur les bénéfices basés sur les résultats des activités ordinaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15692,'NSCF','EXPENSE','698',15688,'Autres impôts sur les résultats','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15693,'NSCF','INCOME','7',0,'COMPTES DE PRODUITS','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15694,'NSCF','INCOME','70',15693,'Ventes de marchandises et de produits fabriqués, ventes de prestations de services et produits annexes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15695,'NSCF','INCOME','700',15694,'Ventes de marchandises','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15696,'NSCF','INCOME','701',15694,'Ventes de produits finis','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15697,'NSCF','INCOME','702',15694,'Ventes de produits intermédiaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15698,'NSCF','INCOME','703',15694,'Ventes de produits résiduels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15699,'NSCF','INCOME','704',15694,'Ventes de travaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15700,'NSCF','INCOME','705',15694,'Ventes d''études ','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15701,'NSCF','INCOME','706',15694,'Autres prestations de services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15702,'NSCF','INCOME','708',15694,'Produits des activités annexes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15703,'NSCF','INCOME','7081',15702,'Produits des services exploités dans l''intérêt du personnel','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15704,'NSCF','INCOME','7082',15702,'Commissions et courtages','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15705,'NSCF','INCOME','7083',15702,'Locations diverses','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15706,'NSCF','INCOME','7084',15702,'Mise à disposition de personnel facturée','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15707,'NSCF','INCOME','7085',15702,'Ports et frais accessoires facturés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15708,'NSCF','INCOME','7086',15702,'Bonis sur reprises d''emballages consignés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15709,'NSCF','INCOME','7087',15702,'Bonifications obtenues des clients et primes sur ventes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15710,'NSCF','INCOME','7088',15702,'Autres produits d''activités annexes (cessions d''approvisionnements)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15711,'NSCF','INCOME','709',15694,'Rabais, remises et ristournes accordés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15712,'NSCF','INCOME','7090',15711,'R.RR, accordés sur ventes de marchandises','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15713,'NSCF','INCOME','7091',15711,'R.RR, accordés sur ventes de produits finis','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15714,'NSCF','INCOME','7092',15711,'R.RR, accordés sur ventes de produits intermédiaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15715,'NSCF','INCOME','7094',15711,'R.RR, accordés sur ventes de travaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15716,'NSCF','INCOME','7095',15711,'R.RR, accordés sur ventes d''études ','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15717,'NSCF','INCOME','7096',15711,'R.RR, accordés sur autres prestations de services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15718,'NSCF','INCOME','7098',15711,'R.RR, accordés sur produits des activités annexes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15719,'NSCF','INCOME','72',15693,'Production stockée ou déstockée','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15720,'NSCF','INCOME','723',15719,'Variation de stocks d''encours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15721,'NSCF','INCOME','7233',15720,'Variation des en-cours de production de biens','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15722,'NSCF','INCOME','72331',15721,'Produits en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15723,'NSCF','INCOME','72335',15721,'Travaux en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15724,'NSCF','INCOME','7234',15720,'Variation des en-cours de production de services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15725,'NSCF','INCOME','72341',15724,'Etudes en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15726,'NSCF','INCOME','72345',15724,'Autres prestations de services en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15727,'NSCF','INCOME','724',15719,'Variation de stocks de produits','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15728,'NSCF','INCOME','7241',15727,'Variation de stocks des produits intermédiaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15729,'NSCF','INCOME','7245',15727,'Variation de stocks des produits finis','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15730,'NSCF','INCOME','7248',15727,'Variation des stocks des produits résiduels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15731,'NSCF','INCOME','73',15693,'Production immobilisée','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15732,'NSCF','INCOME','731',15731,'Production immobilisée d''actifs incorporels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15733,'NSCF','INCOME','732',15731,'Production immobilisée d''actifs corporels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15734,'NSCF','INCOME','74',15693,'Subventions d''exploitation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15735,'NSCF','INCOME','741',15734,'Subventions d''équilibre','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15736,'NSCF','INCOME','748',15734,'Autres subventions d''exploitation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15737,'NSCF','INCOME','75',15693,'Autres produits opérationnels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15738,'NSCF','INCOME','751',15737,'Redevances pour concessions, brevets, licences, logiciels et valeurs similaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15739,'NSCF','INCOME','7511',15738,'Redevances pour concessions, brevets, licences, logiciels, marques, procédés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15740,'NSCF','INCOME','7516',15738,'Droits d''auteur et de reproduction','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15741,'NSCF','INCOME','7518',15738,'Autres droits et valeurs similaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15742,'NSCF','INCOME','752',15737,'Plus-value sur sortie d''actifs immobilisés non financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15743,'NSCF','INCOME','753',15737,'Jetons de présence et rémunérations d''administrateurs ou de gérants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15744,'NSCF','INCOME','754',15737,'Quotes-parts de subventions d''investissements virés au résultat de l''exercice','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15745,'NSCF','INCOME','755',15737,'Quotes-parts de résultat sur opérations faites en commun','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15746,'NSCF','INCOME','7551',15745,'Quote-part de perte transférée (comptabilité du gérant)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15747,'NSCF','INCOME','7555',15745,'Quote-part de bénéfice attribuée (comptabilité des associés non-gérants)','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15748,'NSCF','INCOME','756',15737,'Rentrées sur créances amorties','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15749,'NSCF','INCOME','757',15737,'Produits exceptionnels sur opérations de gestion','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15750,'NSCF','INCOME','758',15737,'Autres produits de gestion courante','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15751,'NSCF','INCOME','76',15693,'Produits financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15752,'NSCF','INCOME','761',15751,'Produits des participations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15753,'NSCF','INCOME','7611',15752,'Revenus des titres de participation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15754,'NSCF','INCOME','7616',15752,'Revenus sur autres formes de participation','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15755,'NSCF','INCOME','7617',15752,'Revenus des créances rattachées à des participations','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15756,'NSCF','INCOME','762',15751,'Revenus des actifs financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15757,'NSCF','INCOME','7621',15756,'Revenus des titres immobilisés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15758,'NSCF','INCOME','7626',15756,'Revenus des prêts','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15759,'NSCF','INCOME','7627',15756,'Revenus des créances immobilisées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15760,'NSCF','INCOME','763',15751,'Revenus de créances','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15761,'NSCF','INCOME','7631',15760,'Revenus des créances commerciales','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15762,'NSCF','INCOME','7638',15760,'Revenus des créances diverses','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15763,'NSCF','INCOME','765',15751,'Ecart d''évaluation sur actifs financiers - plus values','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15764,'NSCF','INCOME','766',15751,'Gains de change','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15765,'NSCF','INCOME','767',15751,'Produits nets sur cessions d''actifs financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15766,'NSCF','INCOME','7671',15765,'Profits nets sur cession des part dans les entreprises liées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15767,'NSCF','INCOME','7672',15765,'Profits nets sur cession d''actions propres','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15768,'NSCF','INCOME','7673',15765,'Profits nets sur cession des autres titres conférant un droit de propriété','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15769,'NSCF','INCOME','7676',15765,'Profits nets sur cession d''obligations, bons du trésor et bons de caisse à court terme','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15770,'NSCF','INCOME','7678',15765,'Profits nets sur cession des autres valeurs mobilières et créances assimilées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15771,'NSCF','INCOME','768',15751,'Autres produits financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15772,'NSCF','INCOME','77',15693,'Eléments extraordinaires - produits','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15773,'NSCF','INCOME','770',15772,'Produits sur exercices antérieurs','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15774,'NSCF','INCOME','7700',15773,'Produits sur exercices antérieurs – ventes de marchandises','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15775,'NSCF','INCOME','7701',15773,'Produits sur exercices antérieurs – ventes de produits finis','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15776,'NSCF','INCOME','7702',15773,'Produits sur exercices antérieurs – ventes de produits intermédiaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15777,'NSCF','INCOME','7703',15773,'Produits sur exercices antérieurs – ventes de produits résiduels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15778,'NSCF','INCOME','7704',15773,'Produits sur exercices antérieurs – ventes de travaux','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15779,'NSCF','INCOME','7705',15773,'Produits sur exercices antérieurs – ventes d''études ','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15780,'NSCF','INCOME','7706',15773,'Produits sur exercices antérieurs – autres prestations de services','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15781,'NSCF','INCOME','7708',15773,'Produits sur exercices antérieur - ventes de produits des activités annexes','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15782,'NSCF','INCOME','775',15772,'Produits sur exercices antérieurs - autres produits opérationnels','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15783,'NSCF','INCOME','7751',15782,'Redevances pour concessions, brevets, licence ; logiciels et valeurs similaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15784,'NSCF','INCOME','7752',15782,'Plus-values sur sorties d''actifs immobilisés non financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15785,'NSCF','INCOME','7753',15782,'Jetons de présence et rémunérations d''administrateurs ou de gérants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15786,'NSCF','INCOME','7754',15782,'Quotes-parts de subventions d''investissements virées au résultat de l''exercice','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15787,'NSCF','INCOME','7755',15782,'Quotes-parts de résultat sur opérations faites en commun','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15788,'NSCF','INCOME','7756',15782,'Rentrées sur créances amorties','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15789,'NSCF','INCOME','7757',15782,'Produits exceptionnels sur opération de gestion','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15790,'NSCF','INCOME','7759',15782,'Produits sur exercices antérieurs - remboursement des immobilisations expropriées détruites','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15791,'NSCF','INCOME','778',15772,'Autres éléments extraordinaires - produits','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15792,'NSCF','INCOME','7783',15791,'Bonis provenant du rachat par l''entreprise d''actions et d''obligations émises par elle-même','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15793,'NSCF','INCOME','7788',15791,'Autres Produits extraordinaires divers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15794,'NSCF','INCOME','78',15693,'Reprises sur pertes de valeur et provisions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15795,'NSCF','INCOME','781',15794,'Reprises d''exploitation sur pertes de valeurs et provisions - actifs non courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15796,'NSCF','INCOME','7810',15795,'Reprises sur provisions et pertes de valeur des immobilisations incorporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15797,'NSCF','INCOME','7811',15795,'Reprises sur provisions et pertes de valeur des immobilisations corporelles','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15798,'NSCF','INCOME','7812',15795,'Reprises sur provisions des immobilisations en concession','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15799,'NSCF','INCOME','7813',15795,'Reprises sur provisions d''immobilisations en cours','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15800,'NSCF','INCOME','7816',15795,'Reprise sur pertes de valeur des participations et créances rattachées','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15801,'NSCF','INCOME','7817',15795,'Reprise sur perte de valeur des autres titres immobilisés','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15802,'NSCF','INCOME','7818',15795,'Reprise sur pertes de valeur des autres instruments financiers','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15803,'NSCF','INCOME','785',15794,'Reprises d''exploitation sur pertes de valeur et provisions - actifs courants','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15804,'NSCF','INCOME','7853',15803,'Reprises sur provisions et pertes de valeur sur les comptes de stocks','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15805,'NSCF','INCOME','7854',15803,'Reprises sur provisions et pertes de valeur sur les comptes de créances','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15806,'NSCF','INCOME','7855',15803,'Reprises sur provisions et pertes de valeur sur les comptes de trésorerie','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15807,'NSCF','INCOME','786',15794,'Reprises financières sur pertes de valeurs et provisions','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15808,'NSCF','INCOME','7860',15807,'Reprises provisions sur plus-values à réinvestir','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15809,'NSCF','INCOME','7863',15807,'Reprises provisions sur pensions et obligations similaires','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15810,'NSCF','INCOME','7865',15807,'Reprises provisions pour impôts','1');
INSERT
IGNORE INTO llx_accounting_account (rowid, fk_pcg_version, pcg_type, account_number, account_parent, label, active) VALUES (15811,'NSCF','INCOME','7868',15807,'Reprises autres provisions pour charges - passifs non courants','1');
