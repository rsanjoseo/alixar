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

--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--

-- Descriptif des plans comptables ES PCG08-PYME
-- ID 4000 - 4784
-- ADD 400000 to rowid # Do no remove this comment --

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4001, 'PCG08-PYME', 'CAPIT', '1', '0', 'Financiación básica', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4002, 'PCG08-PYME', 'ACTIVO', '2', '0', 'Activo no corriente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4003, 'PCG08-PYME', 'EXISTENCIAS', '3', '0', 'Existencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4004, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4', '0',
         'Acreedores y deudores por operaciones comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4005, 'PCG08-PYME', 'FINAN', '5', '0', 'Cuentas financieras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4006, 'PCG08-PYME', 'EXPENSE', '6', '0', 'Compras y gastos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4007, 'PCG08-PYME', 'INCOME', '7', '0', 'Ventas e ingresos', 1);

INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4008, 'PCG08-PYME', 'CAPIT', '10', '4001', 'CAPITAL', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4009, 'PCG08-PYME', 'CAPIT', '100', '4008', 'Capital social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4010, 'PCG08-PYME', 'CAPIT', '101', '4008', 'Fondo social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4011, 'PCG08-PYME', 'CAPIT', '102', '4008', 'Capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4012, 'PCG08-PYME', 'CAPIT', '103', '4008', 'Socios por desembolsos no exigidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4013, 'PCG08-PYME', 'CAPIT', '1030', '4012', 'Socios por desembolsos no exigidos capital social',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4014, 'PCG08-PYME', 'CAPIT', '1034', '4012',
         'Socios por desembolsos no exigidos capital pendiente de inscripción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4015, 'PCG08-PYME', 'CAPIT', '104', '4008', 'Socios por aportaciones no dineradas pendientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4016, 'PCG08-PYME', 'CAPIT', '1040', '4015',
         'Socios por aportaciones no dineradas pendientes capital social', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4017, 'PCG08-PYME', 'CAPIT', '1044', '4015',
         'Socios por aportaciones no dineradas pendientes capital pendiente de inscripción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4018, 'PCG08-PYME', 'CAPIT', '108', '4008',
         'Acciones o participaciones propias en situaciones especiales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4019, 'PCG08-PYME', 'CAPIT', '109', '4008',
         'Acciones o participaciones propias para reducción de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4020, 'PCG08-PYME', 'CAPIT', '11', '4001', 'Reservas y otros instrumentos de patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4021, 'PCG08-PYME', 'CAPIT', '110', '4020', 'Prima de emisión o asunción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4022, 'PCG08-PYME', 'CAPIT', '111', '4020', 'Otros instrumentos de patrimonio neto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4023, 'PCG08-PYME', 'CAPIT', '1110', '4022',
         'Patrimonio neto por emisión de instrumentos financieros compuestos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4024, 'PCG08-PYME', 'CAPIT', '1111', '4022', 'Resto de instrumentos de patrimoio neto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4025, 'PCG08-PYME', 'CAPIT', '112', '4020', 'Reserva legal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4026, 'PCG08-PYME', 'CAPIT', '113', '4020', 'Reservas voluntarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4027, 'PCG08-PYME', 'CAPIT', '114', '4020', 'Reservas especiales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4028, 'PCG08-PYME', 'CAPIT', '1140', '4027',
         'Reservas para acciones o participaciones de la sociedad dominante', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4029, 'PCG08-PYME', 'CAPIT', '1141', '4027', 'Reservas estatutarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4030, 'PCG08-PYME', 'CAPIT', '1142', '4027', 'Reservas por capital amortizado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4031, 'PCG08-PYME', 'CAPIT', '1143', '4027', 'Reservas por fondo de comercio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4032, 'PCG08-PYME', 'CAPIT', '1144', '4028', 'Reservas por acciones propias aceptadas en garantía',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4033, 'PCG08-PYME', 'CAPIT', '115', '4020',
         'Reservas por pérdidas y ganancias actuariales y otros ajustes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4034, 'PCG08-PYME', 'CAPIT', '118', '4020', 'Aportaciones de socios o propietarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4035, 'PCG08-PYME', 'CAPIT', '119', '4020', 'Diferencias por ajuste del capital a euros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4036, 'PCG08-PYME', 'CAPIT', '12', '4001', 'Resultados pendientes de aplicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4037, 'PCG08-PYME', 'CAPIT', '120', '4036', 'Remanente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4038, 'PCG08-PYME', 'CAPIT', '121', '4036', 'Resultados negativos de ejercicios anteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4039, 'PCG08-PYME', 'CAPIT', '129', '4036', 'Resultado del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4040, 'PCG08-PYME', 'CAPIT', '13', '4001',
         'Subvenciones, donaciones y ajustes por cambio de valor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4041, 'PCG08-PYME', 'CAPIT', '130', '4040', 'Subvenciones oficiales de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4042, 'PCG08-PYME', 'CAPIT', '131', '4040', 'Donaciones y legados de capital', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4043, 'PCG08-PYME', 'CAPIT', '132', '4040', 'Otras subvenciones, donaciones y legados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4044, 'PCG08-PYME', 'CAPIT', '133', '4040',
         'Ajustes por valoración en activos financieros disponibles para la venta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4045, 'PCG08-PYME', 'CAPIT', '134', '4040', 'Operaciones de cobertura', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4046, 'PCG08-PYME', 'CAPIT', '1340', '4045', 'Cobertura de flujos de efectivo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4047, 'PCG08-PYME', 'CAPIT', '1341', '4045',
         'Cobertura de una inversión neta en un negocio extranjero', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4048, 'PCG08-PYME', 'CAPIT', '135', '4040', 'Diferencias de conversión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4049, 'PCG08-PYME', 'CAPIT', '136', '4040',
         'Ajustes por valoración en activos no corrientes y grupos enajenables de elementos mantenidos para la venta',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4050, 'PCG08-PYME', 'CAPIT', '137', '4040', 'Ingresos fiscales a distribuir en varios ejercicios',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4051, 'PCG08-PYME', 'CAPIT', '1370', '4050',
         'Ingresos fiscales por diferencias permanentes a distribuir en varios ejercicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4052, 'PCG08-PYME', 'CAPIT', '1371', '4050',
         'Ingresos fiscales por deducciones y bonificaciones a distribuir en varios ejercicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4053, 'PCG08-PYME', 'CAPIT', '14', '4001', 'Provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4054, 'PCG08-PYME', 'CAPIT', '141', '4053', 'Provisión para impuestos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4055, 'PCG08-PYME', 'CAPIT', '142', '4053', 'Provisión para otras responsabilidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4056, 'PCG08-PYME', 'CAPIT', '143', '4053',
         'Provisión por desmantelamiento, retiro o rehabilitación del inmovilizado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4057, 'PCG08-PYME', 'CAPIT', '145', '4053', 'Provisión para actuaciones medioambientales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4058, 'PCG08-PYME', 'CAPIT', '15', '4001', 'Deudas a largo plazo con características especiales',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4059, 'PCG08-PYME', 'CAPIT', '150', '4058',
         'Acciones o participaciones a largo plazo consideradas como pasivos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4060, 'PCG08-PYME', 'CAPIT', '153', '4058',
         'Desembolsos no exigidos por acciones o participaciones consideradas como pasivos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4061, 'PCG08-PYME', 'CAPIT', '1533', '4060', 'Desembolsos no exigidos empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4062, 'PCG08-PYME', 'CAPIT', '1534', '4060', 'Desembolsos no exigidos empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4063, 'PCG08-PYME', 'CAPIT', '1535', '4060', 'Desembolsos no exigidos otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4064, 'PCG08-PYME', 'CAPIT', '1536', '4060', 'Otros desembolsos no exigidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4065, 'PCG08-PYME', 'CAPIT', '154', '4058',
         'Aportaciones no dinerarias pendientes por acciones o participaciones consideradas como pasivos financieros',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4066, 'PCG08-PYME', 'CAPIT', '1543', '4065',
         'Aportaciones no dinerarias pendientes empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4067, 'PCG08-PYME', 'CAPIT', '1544', '4065',
         'Aportaciones no dinerarias pendientes empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4068, 'PCG08-PYME', 'CAPIT', '1545', '4065',
         'Aportaciones no dinerarias pendientes otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4069, 'PCG08-PYME', 'CAPIT', '1546', '4065', 'Otras aportaciones no dinerarias pendientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4070, 'PCG08-PYME', 'CAPIT', '16', '4001', 'Deudas a largo plazo con partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4071, 'PCG08-PYME', 'CAPIT', '160', '4070',
         'Deudas a largo plazo con entidades de crédito vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4072, 'PCG08-PYME', 'CAPIT', '1603', '4071',
         'Deudas a largo plazo con entidades de crédito empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4073, 'PCG08-PYME', 'CAPIT', '1604', '4071',
         'Deudas a largo plazo con entidades de crédito empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4074, 'PCG08-PYME', 'CAPIT', '1605', '4071',
         'Deudas a largo plazo con otras entidades de crédito vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4075, 'PCG08-PYME', 'CAPIT', '161', '4070',
         'Proveedores de inmovilizado a largo plazo partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4076, 'PCG08-PYME', 'CAPIT', '1613', '4075',
         'Proveedores de inmovilizado a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4077, 'PCG08-PYME', 'CAPIT', '1614', '4075',
         'Proveedores de inmovilizado a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4078, 'PCG08-PYME', 'CAPIT', '1615', '4075',
         'Proveedores de inmovilizado a largo plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4079, 'PCG08-PYME', 'CAPIT', '162', '4070',
         'Acreedores por arrendamiento financiero a largo plazo partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4080, 'PCG08-PYME', 'CAPIT', '1623', '4079',
         'Acreedores por arrendamiento financiero a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4081, 'PCG08-PYME', 'CAPIT', '1624', '4080',
         'Acreedores por arrendamiento financiero a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4082, 'PCG08-PYME', 'CAPIT', '1625', '4080',
         'Acreedores por arrendamiento financiero a largo plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4083, 'PCG08-PYME', 'CAPIT', '163', '4070', 'Otras deudas a largo plazo con partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4084, 'PCG08-PYME', 'CAPIT', '1633', '4083', 'Otras deudas a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4085, 'PCG08-PYME', 'CAPIT', '1634', '4083', 'Otras deudas a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4086, 'PCG08-PYME', 'CAPIT', '1635', '4083', 'Otras deudas a largo plazo otras partes vinculadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4087, 'PCG08-PYME', 'CAPIT', '17', '4001',
         'Deudas a largo plazo por préstamos recibidos empresitos y otros conceptos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4088, 'PCG08-PYME', 'CAPIT', '170', '4087', 'Deudas a largo plazo con entidades de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4089, 'PCG08-PYME', 'CAPIT', '171', '4087', 'Deudas a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4090, 'PCG08-PYME', 'CAPIT', '172', '4087',
         'Deudas a largo plazo transformables en suvbenciones donaciones y legados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4091, 'PCG08-PYME', 'CAPIT', '173', '4087', 'Proveedores de inmovilizado a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4092, 'PCG08-PYME', 'CAPIT', '174', '4087',
         'Acreedores por arrendamiento financiero a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4093, 'PCG08-PYME', 'CAPIT', '175', '4087', 'Efectos a pagar a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4094, 'PCG08-PYME', 'CAPIT', '176', '4087', 'Pasivos por derivados financieros a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4095, 'PCG08-PYME', 'CAPIT', '177', '4087', 'Obligaciones y bonos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4096, 'PCG08-PYME', 'CAPIT', '179', '4087', 'Deudas representadas en otros valores negociables',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4097, 'PCG08-PYME', 'CAPIT', '18', '4001',
         'Pasivos por fianzas garantias y otros conceptos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4098, 'PCG08-PYME', 'CAPIT', '180', '4097', 'Fianzas recibidas a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4099, 'PCG08-PYME', 'CAPIT', '181', '4097',
         'Anticipos recibidos por ventas o prestaciones de servicios a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4100, 'PCG08-PYME', 'CAPIT', '185', '4097', 'Depositos recibidos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4101, 'PCG08-PYME', 'CAPIT', '19', '4001', 'Situaciones transitorias de financiación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4102, 'PCG08-PYME', 'CAPIT', '190', '4101', 'Acciones o participaciones emitidas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4103, 'PCG08-PYME', 'CAPIT', '192', '4101', 'Suscriptores de acciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4104, 'PCG08-PYME', 'CAPIT', '194', '4101', 'Capital emitido pendiente de inscripción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4105, 'PCG08-PYME', 'CAPIT', '195', '4101',
         'Acciones o participaciones emitidas consideradas como pasivos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4106, 'PCG08-PYME', 'CAPIT', '197', '4101',
         'Suscriptores de acciones consideradas como pasivos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4107, 'PCG08-PYME', 'CAPIT', '199', '4101',
         'Acciones o participaciones emitidas consideradas como pasivos financieros pendientes de inscripción', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4108, 'PCG08-PYME', 'ACTIVO', '20', '4002', 'Inmovilizaciones intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4109, 'PCG08-PYME', 'ACTIVO', '200', '4108', 'Investigación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4110, 'PCG08-PYME', 'ACTIVO', '201', '4108', 'Desarrollo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4111, 'PCG08-PYME', 'ACTIVO', '202', '4108', 'Concesiones administrativas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4112, 'PCG08-PYME', 'ACTIVO', '203', '4108', 'Propiedad industrial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4113, 'PCG08-PYME', 'ACTIVO', '205', '4108', 'Derechos de transpaso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4114, 'PCG08-PYME', 'ACTIVO', '206', '4108', 'Aplicaciones informáticas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4115, 'PCG08-PYME', 'ACTIVO', '209', '4108', 'Anticipos para inmovilizaciones intangibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4116, 'PCG08-PYME', 'ACTIVO', '21', '4002', 'Inmovilizaciones materiales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4117, 'PCG08-PYME', 'ACTIVO', '210', '4116', 'Terrenos y bienes naturales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4118, 'PCG08-PYME', 'ACTIVO', '211', '4116', 'Construcciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4119, 'PCG08-PYME', 'ACTIVO', '212', '4116', 'Instalaciones técnicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4120, 'PCG08-PYME', 'ACTIVO', '213', '4116', 'Maquinaria', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4121, 'PCG08-PYME', 'ACTIVO', '214', '4116', 'Utillaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4122, 'PCG08-PYME', 'ACTIVO', '215', '4116', 'Otras instalaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4123, 'PCG08-PYME', 'ACTIVO', '216', '4116', 'Mobiliario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4124, 'PCG08-PYME', 'ACTIVO', '217', '4116', 'Equipos para procesos de información', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4125, 'PCG08-PYME', 'ACTIVO', '218', '4116', 'Elementos de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4126, 'PCG08-PYME', 'ACTIVO', '219', '4116', 'Otro inmovilizado material', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4127, 'PCG08-PYME', 'ACTIVO', '22', '4002', 'Inversiones inmobiliarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4128, 'PCG08-PYME', 'ACTIVO', '220', '4127', 'Inversiones en terreons y bienes naturales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4129, 'PCG08-PYME', 'ACTIVO', '221', '4127', 'Inversiones en construcciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4130, 'PCG08-PYME', 'ACTIVO', '23', '4002', 'Inmovilizaciones materiales en curso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4131, 'PCG08-PYME', 'ACTIVO', '230', '4130', 'Adaptación de terrenos y bienes naturales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4132, 'PCG08-PYME', 'ACTIVO', '231', '4130', 'Construcciones en curso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4133, 'PCG08-PYME', 'ACTIVO', '232', '4130', 'Instalaciones técnicas en montaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4134, 'PCG08-PYME', 'ACTIVO', '233', '4130', 'Maquinaria en montaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4135, 'PCG08-PYME', 'ACTIVO', '237', '4130', 'Equipos para procesos de información en montaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4136, 'PCG08-PYME', 'ACTIVO', '239', '4130', 'Anticipos para inmovilizaciones materiales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4137, 'PCG08-PYME', 'ACTIVO', '24', '4002',
         'Inversiones financieras a largo plazo en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4138, 'PCG08-PYME', 'ACTIVO', '240', '4137', 'Participaciones a largo plazo en partes vinculadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4139, 'PCG08-PYME', 'ACTIVO', '2403', '4138',
         'Participaciones a largo plazo en empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4140, 'PCG08-PYME', 'ACTIVO', '2404', '4138',
         'Participaciones a largo plazo en empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4141, 'PCG08-PYME', 'ACTIVO', '2405', '4138',
         'Participaciones a largo plazo en otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4142, 'PCG08-PYME', 'ACTIVO', '241', '4137',
         'Valores representativos de deuda a largo plazo de partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4143, 'PCG08-PYME', 'ACTIVO', '2413', '4142',
         'Valores representativos de deuda a largo plazo de empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4144, 'PCG08-PYME', 'ACTIVO', '2414', '4142',
         'Valores representativos de deuda a largo plazo de empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4145, 'PCG08-PYME', 'ACTIVO', '2415', '4142',
         'Valores representativos de deuda a largo plazo de otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4146, 'PCG08-PYME', 'ACTIVO', '242', '4137', 'Créditos a largo plazo a partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4147, 'PCG08-PYME', 'ACTIVO', '2423', '4146', 'Créditos a largo plazo a empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4148, 'PCG08-PYME', 'ACTIVO', '2424', '4146', 'Créditos a largo plazo a empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4149, 'PCG08-PYME', 'ACTIVO', '2425', '4146', 'Créditos a largo plazo a otras partes vinculadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4150, 'PCG08-PYME', 'ACTIVO', '249', '4137',
         'Desembolsos pendientes sobre participaciones a largo plazo en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4151, 'PCG08-PYME', 'ACTIVO', '2493', '4150',
         'Desembolsos pendientes sobre participaciones a largo plazo en empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4152, 'PCG08-PYME', 'ACTIVO', '2494', '4150',
         'Desembolsos pendientes sobre participaciones a largo plazo en empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4153, 'PCG08-PYME', 'ACTIVO', '2495', '4150',
         'Desembolsos pendientes sobre participaciones a largo plazo en otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4154, 'PCG08-PYME', 'ACTIVO', '25', '4002', 'Otras inversiones financieras a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4155, 'PCG08-PYME', 'ACTIVO', '250', '4154',
         'Inversiones financieras a largo plazo en instrumentos de patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4156, 'PCG08-PYME', 'ACTIVO', '251', '4154', 'Valores representativos de deuda a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4157, 'PCG08-PYME', 'ACTIVO', '252', '4154', 'Créditos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4158, 'PCG08-PYME', 'ACTIVO', '253', '4154',
         'Créditos a largo plazo por enajenación de inmovilizado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4159, 'PCG08-PYME', 'ACTIVO', '254', '4154', 'Créditos a largo plazo al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4160, 'PCG08-PYME', 'ACTIVO', '255', '4154', 'Activos por derivados financieros a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4161, 'PCG08-PYME', 'ACTIVO', '258', '4154', 'Imposiciones a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4162, 'PCG08-PYME', 'ACTIVO', '259', '4154',
         'Desembolsos pendientes sobre participaciones en el patrimonio neto a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4163, 'PCG08-PYME', 'ACTIVO', '26', '4002', 'Fianzas y depósitos constituidos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4164, 'PCG08-PYME', 'ACTIVO', '260', '4163', 'Fianzas constituidas a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4165, 'PCG08-PYME', 'ACTIVO', '261', '4163', 'Depósitos constituidos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4166, 'PCG08-PYME', 'ACTIVO', '28', '4002', 'Amortización acumulada del inmovilizado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4167, 'PCG08-PYME', 'ACTIVO', '280', '4166', 'Amortización acumulado del inmovilizado intangible',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4168, 'PCG08-PYME', 'ACTIVO', '2800', '4167', 'Amortización acumulada de investigación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4169, 'PCG08-PYME', 'ACTIVO', '2801', '4167', 'Amortización acumulada de desarrollo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4170, 'PCG08-PYME', 'ACTIVO', '2802', '4167',
         'Amortización acumulada de concesiones administrativas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4171, 'PCG08-PYME', 'ACTIVO', '2803', '4167', 'Amortización acumulada de propiedad industrial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4172, 'PCG08-PYME', 'ACTIVO', '2805', '4167', 'Amortización acumulada de derechos de transpaso',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4173, 'PCG08-PYME', 'ACTIVO', '2806', '4167',
         'Amortización acumulada de aplicaciones informáticas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4174, 'PCG08-PYME', 'ACTIVO', '281', '4166', 'Amortización acumulado del inmovilizado material',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4175, 'PCG08-PYME', 'ACTIVO', '2811', '4174', 'Amortización acumulada de construcciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4176, 'PCG08-PYME', 'ACTIVO', '2812', '4174', 'Amortización acumulada de instalaciones técnicas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4177, 'PCG08-PYME', 'ACTIVO', '2813', '4174', 'Amortización acumulada de maquinaria', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4178, 'PCG08-PYME', 'ACTIVO', '2814', '4174', 'Amortización acumulada de utillaje', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4179, 'PCG08-PYME', 'ACTIVO', '2815', '4174', 'Amortización acumulada de otras instalaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4180, 'PCG08-PYME', 'ACTIVO', '2816', '4174', 'Amortización acumulada de mobiliario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4181, 'PCG08-PYME', 'ACTIVO', '2817', '4174',
         'Amortización acumulada de equipos para proceso de información', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4182, 'PCG08-PYME', 'ACTIVO', '2818', '4174', 'Amortización acumulada de elementos de transporte',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4183, 'PCG08-PYME', 'ACTIVO', '2819', '4175',
         'Amortización acumulada de otro inmovilizado material', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4184, 'PCG08-PYME', 'ACTIVO', '282', '4166',
         'Amortización acumulada de las inversiones inmobiliarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4185, 'PCG08-PYME', 'ACTIVO', '29', '4002', 'Deterioro de valor de activos no corrientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4186, 'PCG08-PYME', 'ACTIVO', '290', '4185', 'Deterioro de valor del inmovilizado intangible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4187, 'PCG08-PYME', 'ACTIVO', '2900', '4186', 'Deterioro de valor de investigación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4188, 'PCG08-PYME', 'ACTIVO', '2901', '4186', 'Deterioro de valor de desarrollo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4189, 'PCG08-PYME', 'ACTIVO', '2902', '4186', 'Deterioro de valor de concesiones administrativas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4190, 'PCG08-PYME', 'ACTIVO', '2903', '4186', 'Deterioro de valor de propiedad industrial', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4191, 'PCG08-PYME', 'ACTIVO', '2905', '4186', 'Deterioro de valor de derechos de transpaso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4192, 'PCG08-PYME', 'ACTIVO', '2906', '4186', 'Deterioro de valor de aplicaciones informáticas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4193, 'PCG08-PYME', 'ACTIVO', '291', '4185', 'Deterioro de valor del inmovilizado material', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4194, 'PCG08-PYME', 'ACTIVO', '2910', '4193', 'Deterioro de valor de terrenos y bienes naturales',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4195, 'PCG08-PYME', 'ACTIVO', '2911', '4193', 'Deterioro de valor de construcciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4196, 'PCG08-PYME', 'ACTIVO', '2912', '4193', 'Deterioro de valor de instalaciones técnicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4197, 'PCG08-PYME', 'ACTIVO', '2913', '4193', 'Deterioro de valor de maquinaria', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4198, 'PCG08-PYME', 'ACTIVO', '2914', '4193', 'Deterioro de valor de utillajes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4199, 'PCG08-PYME', 'ACTIVO', '2915', '4194', 'Deterioro de valor de otras instalaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4200, 'PCG08-PYME', 'ACTIVO', '2916', '4194', 'Deterioro de valor de mobiliario', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4201, 'PCG08-PYME', 'ACTIVO', '2917', '4194',
         'Deterioro de valor de equipos para proceso de información', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4202, 'PCG08-PYME', 'ACTIVO', '2918', '4194', 'Deterioro de valor de elementos de transporte', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4203, 'PCG08-PYME', 'ACTIVO', '2919', '4194', 'Deterioro de valor de otro inmovilizado material',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4204, 'PCG08-PYME', 'ACTIVO', '292', '4185', 'Deterioro de valor de las inversiones inmobiliarias',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4205, 'PCG08-PYME', 'ACTIVO', '2920', '4204', 'Deterioro de valor de terrenos y bienes naturales',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4206, 'PCG08-PYME', 'ACTIVO', '2921', '4204', 'Deterioro de valor de construcciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4207, 'PCG08-PYME', 'ACTIVO', '293', '4185',
         'Deterioro de valor de participaciones a largo plazo en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4208, 'PCG08-PYME', 'ACTIVO', '2933', '4207',
         'Deterioro de valor de participaciones a largo plazo en empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4209, 'PCG08-PYME', 'ACTIVO', '2934', '4207',
         'Deterioro de valor de sobre participaciones a largo plazo en empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4210, 'PCG08-PYME', 'ACTIVO', '2935', '4207',
         'Deterioro de valor de sobre participaciones a largo plazo en otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4211, 'PCG08-PYME', 'ACTIVO', '294', '4185',
         'Deterioro de valor de valores representativos de deuda a largo plazo en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4212, 'PCG08-PYME', 'ACTIVO', '2943', '4211',
         'Deterioro de valor de valores representativos de deuda a largo plazo en empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4213, 'PCG08-PYME', 'ACTIVO', '2944', '4211',
         'Deterioro de valor de valores representativos de deuda a largo plazo en empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4214, 'PCG08-PYME', 'ACTIVO', '2945', '4211',
         'Deterioro de valor de valores representativos de deuda a largo plazo en otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4215, 'PCG08-PYME', 'ACTIVO', '295', '4185',
         'Deterioro de valor de créditos a largo plazo a partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4216, 'PCG08-PYME', 'ACTIVO', '2953', '4215',
         'Deterioro de valor de créditos a largo plazo a empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4217, 'PCG08-PYME', 'ACTIVO', '2954', '4215',
         'Deterioro de valor de créditos a largo plazo a empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4218, 'PCG08-PYME', 'ACTIVO', '2955', '4215',
         'Deterioro de valor de créditos a largo plazo a otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4219, 'PCG08-PYME', 'ACTIVO', '296', '4185',
         'Deterioro de valor de participaciones en el patrimonio netoa largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4220, 'PCG08-PYME', 'ACTIVO', '297', '4185',
         'Deterioro de valor de valores representativos de deuda a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4221, 'PCG08-PYME', 'ACTIVO', '298', '4185', 'Deterioro de valor de créditos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4222, 'PCG08-PYME', 'EXISTENCIAS', '30', '4003', 'Comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4223, 'PCG08-PYME', 'EXISTENCIAS', '300', '4222', 'Mercaderías A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4224, 'PCG08-PYME', 'EXISTENCIAS', '301', '4222', 'Mercaderías B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4225, 'PCG08-PYME', 'EXISTENCIAS', '31', '4003', 'Materias primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4226, 'PCG08-PYME', 'EXISTENCIAS', '310', '4225', 'Materias primas A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4227, 'PCG08-PYME', 'EXISTENCIAS', '311', '4225', 'Materias primas B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4228, 'PCG08-PYME', 'EXISTENCIAS', '32', '4003', 'Otros aprovisionamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4229, 'PCG08-PYME', 'EXISTENCIAS', '320', '4228', 'Elementos y conjuntos incorporables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4230, 'PCG08-PYME', 'EXISTENCIAS', '321', '4228', 'Combustibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4231, 'PCG08-PYME', 'EXISTENCIAS', '322', '4228', 'Repuestos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4232, 'PCG08-PYME', 'EXISTENCIAS', '325', '4228', 'Materiales diversos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4233, 'PCG08-PYME', 'EXISTENCIAS', '326', '4228', 'Embalajes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4234, 'PCG08-PYME', 'EXISTENCIAS', '327', '4228', 'Envases', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4235, 'PCG08-PYME', 'EXISTENCIAS', '328', '4229', 'Material de oficina', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4236, 'PCG08-PYME', 'EXISTENCIAS', '33', '4003', 'Productos en curso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4237, 'PCG08-PYME', 'EXISTENCIAS', '330', '4236', 'Productos en curos A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4238, 'PCG08-PYME', 'EXISTENCIAS', '331', '4236', 'Productos en curso B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4239, 'PCG08-PYME', 'EXISTENCIAS', '34', '4003', 'Productos semiterminados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4240, 'PCG08-PYME', 'EXISTENCIAS', '340', '4239', 'Productos semiterminados A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4241, 'PCG08-PYME', 'EXISTENCIAS', '341', '4239', 'Productos semiterminados B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4242, 'PCG08-PYME', 'EXISTENCIAS', '35', '4003', 'Productos terminados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4243, 'PCG08-PYME', 'EXISTENCIAS', '350', '4242', 'Productos terminados A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4244, 'PCG08-PYME', 'EXISTENCIAS', '351', '4242', 'Productos terminados B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4245, 'PCG08-PYME', 'EXISTENCIAS', '36', '4003', 'Subproductos, residuos y materiales recuperados',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4246, 'PCG08-PYME', 'EXISTENCIAS', '360', '4245', 'Subproductos A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4247, 'PCG08-PYME', 'EXISTENCIAS', '361', '4245', 'Subproductos B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4248, 'PCG08-PYME', 'EXISTENCIAS', '365', '4245', 'Residuos A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4249, 'PCG08-PYME', 'EXISTENCIAS', '366', '4245', 'Residuos B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4250, 'PCG08-PYME', 'EXISTENCIAS', '368', '4245', 'Materiales recuperados A', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4251, 'PCG08-PYME', 'EXISTENCIAS', '369', '4245', 'Materiales recuperados B', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4252, 'PCG08-PYME', 'EXISTENCIAS', '39', '4003', 'Deterioro de valor de las existencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4253, 'PCG08-PYME', 'EXISTENCIAS', '390', '4252', 'Deterioro de valor de las mercaderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4254, 'PCG08-PYME', 'EXISTENCIAS', '391', '4252', 'Deterioro de valor de las materias primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4255, 'PCG08-PYME', 'EXISTENCIAS', '392', '4252', 'Deterioro de valor de otros aprovisionamientos',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4256, 'PCG08-PYME', 'EXISTENCIAS', '393', '4252', 'Deterioro de valor de los productos en curso',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4257, 'PCG08-PYME', 'EXISTENCIAS', '394', '4252',
         'Deterioro de valor de los productos semiterminados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4258, 'PCG08-PYME', 'EXISTENCIAS', '395', '4252', 'Deterioro de valor de los productos terminados',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4259, 'PCG08-PYME', 'EXISTENCIAS', '396', '4252',
         'Deterioro de valor de los subproductos, residuos y materiales recuperados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4260, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '40', '4004', 'Proveedores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4261, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '400', '4260', 'Proveedores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4262, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4000', '4261', 'Proveedores euros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4263, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4004', '4261', 'Proveedores moneda extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4264, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4009', '4261',
         'Proveedores facturas pendientes de recibir o formalizar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4265, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '401', '4260',
         'Proveedores efectos comerciales a pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4266, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '403', '4260', 'Proveedores empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4267, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4030', '4266', 'Proveedores empresas del grupo euros',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4268, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4031', '4266',
         'Efectos comerciales a pagar empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4269, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4034', '4266',
         'Proveedores empresas del grupo moneda extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4270, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4036', '4266',
         'Envases y embalajes a devolver a proveedores empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4271, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4039', '4266',
         'Proveedores empresas del grupo facturas pendientes de recibir o de formalizar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4272, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '404', '4260', 'Proveedores empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4273, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '405', '4260', 'Proveedores otras partes vinculadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4274, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '406', '4260',
         'Envases y embalajes a devolver a proveedores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4275, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '407', '4260', 'Anticipos a proveedores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4276, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '41', '4004', 'Acreedores varios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4277, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '410', '4276',
         'Acreedores por prestaciones de servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4278, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4100', '4277',
         'Acreedores por prestaciones de servicios euros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4279, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4104', '4277',
         'Acreedores por prestaciones de servicios moneda extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4280, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4109', '4277',
         'Acreedores por prestaciones de servicios facturas pendientes de recibir o formalizar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4281, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '411', '4276', 'Acreedores efectos comerciales a pagar',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4282, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '419', '4276', 'Acreedores por operaciones en común',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4283, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '43', '4004', 'Clientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4284, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '430', '4283', 'Clientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4285, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4300', '4284', 'Clientes euros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4286, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4304', '4284', 'Clientes moneda extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4287, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4309', '4284',
         'Clientes facturas pendientes de formalizar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4288, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '431', '4283', 'Clientes efectos comerciales a cobrar',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4289, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4310', '4288', 'Efectos comerciales en cartera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4290, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4311', '4288', 'Efectos comerciales descontados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4291, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4312', '4288',
         'Efectos comerciales en gestión de cobro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4292, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4315', '4288', 'Efectos comerciales impagados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4293, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '432', '4283', 'Clientes operaciones de factoring', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4294, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '433', '4283', 'Clientes empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4295, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4330', '4294', 'Clientes empresas del grupo euros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4296, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4331', '4294',
         'Efectos comerciales a cobrar empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4297, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4332', '4294',
         'Clientes empresas del grupo operaciones de factoring', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4298, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4334', '4294',
         'Clientes empresas del grupo moneda extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4299, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4336', '4294',
         'Clientes empresas del grupo dudoso cobro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4300, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4337', '4294',
         'Envases y embalajes a devolver a clientes empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4301, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4339', '4294',
         'Clientes empresas del grupo facturas pendientes de formalizar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4302, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '434', '4283', 'Clientes empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4303, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '435', '4283', 'Clientes otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4304, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '436', '4283', 'Clientes de dudoso cobro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4305, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '437', '4283',
         'Envases y embalajes a devolver por clientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4306, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '438', '4283', 'Anticipos de clientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4307, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '44', '4004', 'Deudores varios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4308, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '440', '4307', 'Deudores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4309, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4400', '4308', 'Deudores euros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4310, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4404', '4308', 'Deudores moneda extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4311, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4409', '4308',
         'Deudores facturas pendientes de formalizar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4312, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '441', '4307', 'Deudores efectos comerciales a cobrar',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4313, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4410', '4312',
         'Deudores efectos comerciales en cartera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4314, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4411', '4312',
         'Deudores efectos comerciales descontados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4315, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4412', '4312',
         'Deudores efectos comerciales en gestión de cobro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4316, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4415', '4312',
         'Deudores efectos comerciales impagados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4317, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '446', '4307', 'Deudores de dusoso cobro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4318, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '449', '4307', 'Deudores por operaciones en común', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4319, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '46', '4004', 'Personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4320, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '460', '4319', 'Anticipos de renumeraciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4321, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '465', '4319', 'Renumeraciones pendientes de pago', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4322, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '47', '4004', 'Administraciones Públicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4323, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '470', '4322',
         'Hacienda Pública deudora por diversos conceptos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4324, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4700', '4323', 'Hacienda Pública deudora por IVA', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4325, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4708', '4323',
         'Hacienda Pública deudora por subvenciones concedidas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4326, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4709', '4323',
         'Hacienda Pública deudora por devolución de impuestos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4327, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '471', '4322',
         'Organismos de la Seguridad Social deudores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4328, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '472', '4322', 'Hacienda Pública IVA soportado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4329, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '473', '4322',
         'Hacienda Pública retenciones y pagos a cuenta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4330, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '474', '4322', 'Activos por impuesto diferido', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4331, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4740', '4330',
         'Activos por diferencias temporarias deducibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4332, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4742', '4330',
         'Derechos por deducciones y bonificaciones pendientes de aplicar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4333, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4745', '4330',
         'Crédito por pérdidasa compensar del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4334, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '475', '4322',
         'Hacienda Pública acreedora por conceptos fiscales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4335, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4750', '4334', 'Hacienda Pública acreedora por IVA',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4336, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4751', '4334',
         'Hacienda Pública acreedora por retenciones practicadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4337, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4752', '4334',
         'Hacienda Pública acreedora por impuesto sobre sociedades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4338, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4758', '4334',
         'Hacienda Pública acreedora por subvenciones a integrar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4339, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '476', '4322',
         'Organismos de la Seguridad Social acreedores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4340, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '477', '4322', 'Hacienda Pública IVA repercutido', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4341, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '479', '4322',
         'Pasivos por diferencias temporarias imponibles', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4342, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '48', '4004', 'Ajustes por periodificación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4343, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '480', '4342', 'Gastos anticipados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4344, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '485', '4342', 'Ingresos anticipados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4345, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '49', '4004',
         'Deterioro de valor de créditos comerciales y provisiones a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4346, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '490', '4345',
         'Deterioro de valor de créditos por operaciones comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4347, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '493', '4345',
         'Deterioro de valor de créditos por operaciones comerciales con partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4348, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4933', '4347',
         'Deterioro de valor de créditos por operaciones comerciales con empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4349, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4934', '4347',
         'Deterioro de valor de créditos por operaciones comerciales con empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4350, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4935', '4347',
         'Deterioro de valor de créditos por operaciones comerciales con otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4351, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '499', '4345',
         'Provisiones por operaciones comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4352, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4994', '4351', 'Provisión para contratos anerosos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4353, 'PCG08-PYME', 'ACREEDORES_DEUDORES', '4999', '4351',
         'Provisión para otras operaciones comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4354, 'PCG08-PYME', 'FINAN', '50', '4005',
         'Emprésitos deudas con características especiales y otras emisiones análogas a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4355, 'PCG08-PYME', 'FINAN', '500', '4354', 'Obligaciones y bonos a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4356, 'PCG08-PYME', 'FINAN', '502', '4354',
         'Acciones o participaciones a corto plazo consideradas como pasivos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4357, 'PCG08-PYME', 'FINAN', '505', '4354',
         'Deudas representadas en otros valores negociables a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4358, 'PCG08-PYME', 'FINAN', '506', '4354',
         'Intereses a corto plazo de emprésitos y otras emisiones analógicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4359, 'PCG08-PYME', 'FINAN', '507', '4354',
         'Dividendos de acciones o participaciones consideradas como pasivos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4360, 'PCG08-PYME', 'FINAN', '509', '4354', 'Valores negociables amortizados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4361, 'PCG08-PYME', 'FINAN', '5090', '4360', 'Obligaciones y bonos amortizados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4362, 'PCG08-PYME', 'FINAN', '5095', '4360', 'Otros valores negociables amortizados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4363, 'PCG08-PYME', 'FINAN', '51', '4005', 'Deudas a corto plazo con partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4364, 'PCG08-PYME', 'FINAN', '510', '4363',
         'Deudas a corto plazo con entidades de crédito vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4365, 'PCG08-PYME', 'FINAN', '5103', '4364',
         'Deudas a corto plazo con entidades de crédito empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4366, 'PCG08-PYME', 'FINAN', '5104', '4364',
         'Deudas a corto plazo con entidades de crédito empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4367, 'PCG08-PYME', 'FINAN', '5105', '4364',
         'Deudas a corto plazo con otras entidades de crédito vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4368, 'PCG08-PYME', 'FINAN', '511', '4363',
         'Proveedores de inmovilizado a corto plazo partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4369, 'PCG08-PYME', 'FINAN', '5113', '4368',
         'Proveedores de inmovilizado a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4370, 'PCG08-PYME', 'FINAN', '5114', '4368',
         'Proveedores de inmovilizado a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4371, 'PCG08-PYME', 'FINAN', '5115', '4368',
         'Proveedores de inmovilizado a corto plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4372, 'PCG08-PYME', 'FINAN', '512', '4363',
         'Acreedores por arrendamiento financiero a corto plazo partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4373, 'PCG08-PYME', 'FINAN', '5123', '4372',
         'Acreedores por arrendamiento financiero a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4374, 'PCG08-PYME', 'FINAN', '5124', '4372',
         'Acreedores por arrendamiento financiero a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4375, 'PCG08-PYME', 'FINAN', '5125', '4372',
         'Acreedores por arrendamiento financiero a corto plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4376, 'PCG08-PYME', 'FINAN', '513', '4363', 'Otras deudas a corto plazo con partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4377, 'PCG08-PYME', 'FINAN', '5133', '4376', 'Otras deudas a corto plazo con empresas del grupo',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4378, 'PCG08-PYME', 'FINAN', '5134', '4376', 'Otras deudas a corto plazo con empresas asociadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4379, 'PCG08-PYME', 'FINAN', '5135', '4376', 'Otras deudas a corto plazo con partes vinculadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4380, 'PCG08-PYME', 'FINAN', '514', '4363', 'Intereses a corto plazo con partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4381, 'PCG08-PYME', 'FINAN', '5143', '4380', 'Intereses a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4382, 'PCG08-PYME', 'FINAN', '5144', '4380', 'Intereses a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4383, 'PCG08-PYME', 'FINAN', '5145', '4380', 'Intereses deudas a corto plazo partes vinculadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4384, 'PCG08-PYME', 'FINAN', '52', '4005',
         'Deudas a corto plazo por préstamos recibidos y otros conceptos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4385, 'PCG08-PYME', 'FINAN', '520', '4384', 'Deudas a corto plazo con entidades de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4386, 'PCG08-PYME', 'FINAN', '5200', '4385', 'Préstamos a corto plazo de entidades de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4387, 'PCG08-PYME', 'FINAN', '5201', '4385', 'Deudas a corto plazo por crédito dispuesto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4388, 'PCG08-PYME', 'FINAN', '5208', '4385', 'Deudas por efectos descontados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4389, 'PCG08-PYME', 'FINAN', '5209', '4385', 'Deudas por operaciones de factoring', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4390, 'PCG08-PYME', 'FINAN', '521', '4384', 'Deudas a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4391, 'PCG08-PYME', 'FINAN', '522', '4384',
         'Deudas a corto plazo transformables en subvenciones donaciones y legados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4392, 'PCG08-PYME', 'FINAN', '523', '4384', 'Proveedores de inmovilizado a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4393, 'PCG08-PYME', 'FINAN', '526', '4384', 'Dividendo activo a pagar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4394, 'PCG08-PYME', 'FINAN', '527', '4384',
         'Intereses a corto plazo de deudas con entidades de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4395, 'PCG08-PYME', 'FINAN', '528', '4384', 'Intereses a corto plazo de deudas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4396, 'PCG08-PYME', 'FINAN', '529', '4384', 'Provisiones a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4397, 'PCG08-PYME', 'FINAN', '5291', '4396', 'Provisión a corto plazo para impuestos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4398, 'PCG08-PYME', 'FINAN', '5292', '4396',
         'Provisión a corto plazo para otras responsabilidades', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4399, 'PCG08-PYME', 'FINAN', '5293', '4396',
         'Provisión a corto plazo por desmantelamiento retiro o rehabilitación del inmovilizado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4400, 'PCG08-PYME', 'FINAN', '5295', '4396',
         'Provisión a corto plazo para actuaciones medioambientales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4401, 'PCG08-PYME', 'FINAN', '53', '4005',
         'Inversiones financieras a corto plazo en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4402, 'PCG08-PYME', 'FINAN', '530', '4401', 'Participaciones a corto plazo en partes vinculadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4403, 'PCG08-PYME', 'FINAN', '5303', '4402', 'Participaciones a corto plazo en empresas del grupo',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4404, 'PCG08-PYME', 'FINAN', '5304', '4402', 'Participaciones a corto plazo en empresas asociadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4405, 'PCG08-PYME', 'FINAN', '5305', '4402',
         'Participaciones a corto plazo en otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4406, 'PCG08-PYME', 'FINAN', '531', '4401',
         'Valores representativos de deuda a corto plazo de partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4407, 'PCG08-PYME', 'FINAN', '5313', '4406',
         'Valores representativos de deuda a corto plazo de empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4408, 'PCG08-PYME', 'FINAN', '5314', '4406',
         'Valores representativos de deuda a corto plazo de empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4409, 'PCG08-PYME', 'FINAN', '5315', '4406',
         'Valores representativos de deuda a corto plazo de otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4410, 'PCG08-PYME', 'FINAN', '532', '4401', 'Créditos a corto plazo a partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4411, 'PCG08-PYME', 'FINAN', '5323', '4410', 'Créditos a corto plazo a empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4412, 'PCG08-PYME', 'FINAN', '5324', '4410', 'Créditos a corto plazo a empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4413, 'PCG08-PYME', 'FINAN', '5325', '4410', 'Créditos a corto plazo a otras partes vinculadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4414, 'PCG08-PYME', 'FINAN', '533', '4401',
         'Intereses a corto plazo de valores representativos de deuda de partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4415, 'PCG08-PYME', 'FINAN', '5333', '4414',
         'Intereses a corto plazo de valores representativos de deuda en empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4416, 'PCG08-PYME', 'FINAN', '5334', '4414',
         'Intereses a corto plazo de valores representativos de deuda en empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4417, 'PCG08-PYME', 'FINAN', '5335', '4414',
         'Intereses a corto plazo de valores representativos de deuda en otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4418, 'PCG08-PYME', 'FINAN', '534', '4401',
         'Intereses a corto plazo de créditos a partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4419, 'PCG08-PYME', 'FINAN', '5343', '4418',
         'Intereses a corto plazo de créditos a empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4420, 'PCG08-PYME', 'FINAN', '5344', '4418',
         'Intereses a corto plazo de créditos a empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4421, 'PCG08-PYME', 'FINAN', '5345', '4418',
         'Intereses a corto plazo de créditos a otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4422, 'PCG08-PYME', 'FINAN', '535', '4401',
         'Dividendo a cobrar de inversiones financieras en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4423, 'PCG08-PYME', 'FINAN', '5353', '4422', 'Dividendo a cobrar de empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4424, 'PCG08-PYME', 'FINAN', '5354', '4422', 'Dividendo a cobrar de empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4425, 'PCG08-PYME', 'FINAN', '5355', '4422', 'Dividendo a cobrar de otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4426, 'PCG08-PYME', 'FINAN', '539', '4401',
         'Desembolsos pendientes sobre participaciones a corto plazo en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4427, 'PCG08-PYME', 'FINAN', '5393', '4426',
         'Desembolsos pendientes sobre participaciones a corto plazo en empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4428, 'PCG08-PYME', 'FINAN', '5394', '4426',
         'Desembolsos pendientes sobre participaciones a corto plazo en empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4429, 'PCG08-PYME', 'FINAN', '5395', '4426',
         'Desembolsos pendientes sobre participaciones a corto plazo en otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4430, 'PCG08-PYME', 'FINAN', '54', '4005', 'Otras inversiones financieras a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4431, 'PCG08-PYME', 'FINAN', '540', '4430',
         'Inversiones financieras a corto plazo en instrumentos de patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4432, 'PCG08-PYME', 'FINAN', '541', '4430', 'Valores representativos de deuda a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4433, 'PCG08-PYME', 'FINAN', '542', '4430', 'Créditos a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4434, 'PCG08-PYME', 'FINAN', '543', '4430',
         'Créditos a corto plazo por enejenación de inmovilizado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4435, 'PCG08-PYME', 'FINAN', '544', '4430', 'Créditos a corto plazo al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4436, 'PCG08-PYME', 'FINAN', '545', '4430', 'Dividendo a cobrar', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4437, 'PCG08-PYME', 'FINAN', '546', '4430',
         'Intereses a corto plazo de valores reprsentativos de deuda', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4438, 'PCG08-PYME', 'FINAN', '547', '4430', 'Intereses a corto plazo de créditos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4439, 'PCG08-PYME', 'FINAN', '548', '4430', 'Imposiciones a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4440, 'PCG08-PYME', 'FINAN', '549', '4430',
         'Desembolsos pendientes sobre participaciones en el patrimonio neto a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4441, 'PCG08-PYME', 'FINAN', '55', '4005', 'Otras cuentas no bancarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4442, 'PCG08-PYME', 'FINAN', '550', '4441', 'Titular de la explotación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4443, 'PCG08-PYME', 'FINAN', '551', '4441', 'Cuenta corriente con socios y administradores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4444, 'PCG08-PYME', 'FINAN', '552', '4441',
         'Cuenta corriente otras personas y entidades vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4445, 'PCG08-PYME', 'FINAN', '5523', '4444', 'Cuenta corriente con empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4446, 'PCG08-PYME', 'FINAN', '5524', '4444', 'Cuenta corriente con empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4447, 'PCG08-PYME', 'FINAN', '5525', '4444', 'Cuenta corriente con otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4448, 'PCG08-PYME', 'FINAN', '554', '4441',
         'Cuenta corriente con uniones temporales de empresas y comunidades de bienes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4449, 'PCG08-PYME', 'FINAN', '555', '4441', 'Partidas pendientes de aplicación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4450, 'PCG08-PYME', 'FINAN', '556', '4441',
         'Desembolsos exigidos sobre participaciones en el patrimonio neto', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4451, 'PCG08-PYME', 'FINAN', '5563', '4450',
         'Desembolsos exigidos sobre participaciones empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4452, 'PCG08-PYME', 'FINAN', '5564', '4450',
         'Desembolsos exigidos sobre participaciones empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4453, 'PCG08-PYME', 'FINAN', '5565', '4450',
         'Desembolsos exigidos sobre participaciones otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4454, 'PCG08-PYME', 'FINAN', '5566', '4450',
         'Desembolsos exigidos sobre participaciones otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4455, 'PCG08-PYME', 'FINAN', '557', '4441', 'Dividendo activo a cuenta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4456, 'PCG08-PYME', 'FINAN', '558', '4441', 'Socios por desembolsos exigidos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4457, 'PCG08-PYME', 'FINAN', '5580', '4456',
         'Socios por desembolsos exigidos sobre acciones o participaciones ordinarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4458, 'PCG08-PYME', 'FINAN', '5585', '4456',
         'Socios por desembolsos exigidos sobre acciones o participaciones consideradas como pasivos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4459, 'PCG08-PYME', 'FINAN', '559', '4441', 'Derivados financieros a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4460, 'PCG08-PYME', 'FINAN', '5590', '4459', 'Activos por derivados financieros a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4461, 'PCG08-PYME', 'FINAN', '5595', '4459', 'Pasivos por derivados financieros a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4462, 'PCG08-PYME', 'FINAN', '56', '4005',
         'Finanzas y depósitos recibidos y constituidos a corto plazo y ajustes por periodificación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4463, 'PCG08-PYME', 'FINAN', '560', '4462', 'Finanzas recibidas a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4464, 'PCG08-PYME', 'FINAN', '561', '4462', 'Depósitos recibidos a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4465, 'PCG08-PYME', 'FINAN', '565', '4462', 'Finanzas constituidas a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4466, 'PCG08-PYME', 'FINAN', '566', '4462', 'Depósitos constituidos a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4467, 'PCG08-PYME', 'FINAN', '567', '4462', 'Intereses pagados por anticipado', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4468, 'PCG08-PYME', 'FINAN', '568', '4462', 'Intereses cobrados a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4469, 'PCG08-PYME', 'FINAN', '57', '4005', 'Tesorería', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4470, 'PCG08-PYME', 'FINAN', '570', '4469', 'Caja euros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4471, 'PCG08-PYME', 'FINAN', '571', '4469', 'Caja moneda extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4472, 'PCG08-PYME', 'FINAN', '572', '4469', 'Bancos e instituciones de crédito cc vista euros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4473, 'PCG08-PYME', 'FINAN', '573', '4469',
         'Bancos e instituciones de crédito cc vista moneda extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4474, 'PCG08-PYME', 'FINAN', '574', '4469',
         'Bancos e instituciones de crédito cuentas de ahorro euros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4475, 'PCG08-PYME', 'FINAN', '575', '4469',
         'Bancos e instituciones de crédito cuentas de ahorro moneda extranjera', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4476, 'PCG08-PYME', 'FINAN', '576', '4469', 'Inversiones a corto plazo de gran liquidez', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4477, 'PCG08-PYME', 'FINAN', '59', '4005',
         'Deterioro del valor de las inversiones financieras a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4478, 'PCG08-PYME', 'FINAN', '593', '4477',
         'Deterioro del valor de participaciones a corto plazo en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4479, 'PCG08-PYME', 'FINAN', '5933', '4478',
         'Deterioro del valor de participaciones a corto plazo en empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4480, 'PCG08-PYME', 'FINAN', '5934', '4478',
         'Deterioro del valor de participaciones a corto plazo en empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4481, 'PCG08-PYME', 'FINAN', '5935', '4478',
         'Deterioro del valor de participaciones a corto plazo en otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4482, 'PCG08-PYME', 'FINAN', '594', '4477',
         'Deterioro del valor de valores representativos de deuda a corto plazo en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4483, 'PCG08-PYME', 'FINAN', '5943', '4482',
         'Deterioro del valor de valores representativos de deuda a corto plazo en empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4484, 'PCG08-PYME', 'FINAN', '5944', '4482',
         'Deterioro del valor de valores representativos de deuda a corto plazo en empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4485, 'PCG08-PYME', 'FINAN', '5945', '4482',
         'Deterioro del valor de valores representativos de deuda a corto plazo en otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4486, 'PCG08-PYME', 'FINAN', '595', '4477',
         'Deterioro del valor de créditos a corto plazo en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4487, 'PCG08-PYME', 'FINAN', '5953', '4486',
         'Deterioro del valor de créditos a corto plazo en empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4488, 'PCG08-PYME', 'FINAN', '5954', '4486',
         'Deterioro del valor de créditos a corto plazo en empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4489, 'PCG08-PYME', 'FINAN', '5955', '4486',
         'Deterioro del valor de créditos a corto plazo en otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4490, 'PCG08-PYME', 'FINAN', '596', '4477', 'Deterioro del valor de participaciones a corto plazo',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4491, 'PCG08-PYME', 'FINAN', '597', '4477',
         'Deterioro del valor de valores representativos de deuda a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4492, 'PCG08-PYME', 'FINAN', '598', '4477', 'Deterioro de valor de créditos a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4493, 'PCG08-PYME', 'EXPENSE', '60', '4006', 'Compras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4494, 'PCG08-PYME', 'EXPENSE', '600', '4493', 'Compras de mercaderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4495, 'PCG08-PYME', 'EXPENSE', '601', '4493', 'Compras de materias primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4496, 'PCG08-PYME', 'EXPENSE', '602', '4493', 'Compras de otros aprovisionamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4497, 'PCG08-PYME', 'EXPENSE', '606', '4493', 'Descuentos sobre compras por pronto pago', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4498, 'PCG08-PYME', 'EXPENSE', '6060', '4497',
         'Descuentos sobre compras por pronto pago de mercaderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4499, 'PCG08-PYME', 'EXPENSE', '6061', '4497',
         'Descuentos sobre compras por pronto pago de materias primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4500, 'PCG08-PYME', 'EXPENSE', '6062', '4497',
         'Descuentos sobre compras por pronto pago de otros aprovisionamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4501, 'PCG08-PYME', 'EXPENSE', '607', '4493', 'Trabajos realizados por otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4502, 'PCG08-PYME', 'EXPENSE', '608', '4493', 'Devoluciones de compras y operaciones similares',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4503, 'PCG08-PYME', 'EXPENSE', '6080', '4502', 'Devoluciones de compras de mercaderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4504, 'PCG08-PYME', 'EXPENSE', '6081', '4502', 'Devoluciones de compras de materias primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4505, 'PCG08-PYME', 'EXPENSE', '6082', '4502',
         'Devoluciones de compras de otros aprovisionamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4506, 'PCG08-PYME', 'EXPENSE', '609', '4493', 'Rappels por compras', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4507, 'PCG08-PYME', 'EXPENSE', '6090', '4506', 'Rappels por compras de mercaderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4508, 'PCG08-PYME', 'EXPENSE', '6091', '4506', 'Rappels por compras de materias primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4509, 'PCG08-PYME', 'EXPENSE', '6092', '4506', 'Rappels por compras de otros aprovisionamientos',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4510, 'PCG08-PYME', 'EXPENSE', '61', '4006', 'Variación de existencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4511, 'PCG08-PYME', 'EXPENSE', '610', '4510', 'Variación de existencias de mercaderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4512, 'PCG08-PYME', 'EXPENSE', '611', '4510', 'Variación de existencias de materias primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4513, 'PCG08-PYME', 'EXPENSE', '612', '4510',
         'Variación de existencias de otros aprovisionamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4514, 'PCG08-PYME', 'EXPENSE', '62', '4006', 'Servicios exteriores', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4515, 'PCG08-PYME', 'EXPENSE', '620', '4514', 'Gastos en investigación y desarrollo del ejercicio',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4516, 'PCG08-PYME', 'EXPENSE', '621', '4514', 'Arrendamientos y cánones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4517, 'PCG08-PYME', 'EXPENSE', '622', '4514', 'Reparaciones y conservación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4518, 'PCG08-PYME', 'EXPENSE', '623', '4514', 'Servicios profesionales independientes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4519, 'PCG08-PYME', 'EXPENSE', '624', '4514', 'Transportes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4520, 'PCG08-PYME', 'EXPENSE', '625', '4514', 'Primas de seguros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4521, 'PCG08-PYME', 'EXPENSE', '626', '4514', 'Servicios bancarios y similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4522, 'PCG08-PYME', 'EXPENSE', '627', '4514', 'Publicidad, propaganda y relaciones públicas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4523, 'PCG08-PYME', 'EXPENSE', '628', '4514', 'Suministros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4524, 'PCG08-PYME', 'EXPENSE', '629', '4514', 'Otros servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4525, 'PCG08-PYME', 'EXPENSE', '63', '4006', 'Tributos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4526, 'PCG08-PYME', 'EXPENSE', '630', '4525', 'Impuesto sobre benecifios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4527, 'PCG08-PYME', 'EXPENSE', '6300', '4526', 'Impuesto corriente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4528, 'PCG08-PYME', 'EXPENSE', '6301', '4526', 'Impuesto diferido', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4529, 'PCG08-PYME', 'EXPENSE', '631', '4525', 'Otros tributos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4530, 'PCG08-PYME', 'EXPENSE', '633', '4525',
         'Ajustes negativos en la imposición sobre beneficios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4531, 'PCG08-PYME', 'EXPENSE', '634', '4525', 'Ajustes negativos en la imposición indirecta', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4532, 'PCG08-PYME', 'EXPENSE', '6341', '4531', 'Ajustes negativos en IVA de activo corriente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4533, 'PCG08-PYME', 'EXPENSE', '6342', '4531', 'Ajustes negativos en IVA de inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4534, 'PCG08-PYME', 'EXPENSE', '636', '4525', 'Devolución de impuestos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4535, 'PCG08-PYME', 'EXPENSE', '638', '4525',
         'Ajustes positivos en la imposición sobre beneficios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4536, 'PCG08-PYME', 'EXPENSE', '639', '4525', 'Ajustes positivos en la imposición directa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4537, 'PCG08-PYME', 'EXPENSE', '6391', '4536', 'Ajustes positivos en IVA de activo corriente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4538, 'PCG08-PYME', 'EXPENSE', '6392', '4536', 'Ajustes positivos en IVA de inversiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4539, 'PCG08-PYME', 'EXPENSE', '64', '4006', 'Gastos de personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4540, 'PCG08-PYME', 'EXPENSE', '640', '4539', 'Sueldos y salarios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4541, 'PCG08-PYME', 'EXPENSE', '641', '4539', 'Indemnizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4542, 'PCG08-PYME', 'EXPENSE', '642', '4539', 'Seguridad social a cargo de la empresa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4543, 'PCG08-PYME', 'EXPENSE', '649', '4539', 'Otros gastos sociales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4544, 'PCG08-PYME', 'EXPENSE', '65', '4006', 'Otros gastos de gestión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4545, 'PCG08-PYME', 'EXPENSE', '650', '4544', 'Pérdidas de créditos comerciales incobrables', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4546, 'PCG08-PYME', 'EXPENSE', '651', '4544', 'Resultados de operaciones en común', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4547, 'PCG08-PYME', 'EXPENSE', '6510', '4546', 'Beneficio transferido gestor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4548, 'PCG08-PYME', 'EXPENSE', '6511', '4546', 'Pérdida soportada participe o asociado no gestor',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4549, 'PCG08-PYME', 'EXPENSE', '659', '4544', 'Otras pérdidas en gestión corriente', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4550, 'PCG08-PYME', 'EXPENSE', '66', '4006', 'Gastos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4551, 'PCG08-PYME', 'EXPENSE', '660', '4550',
         'Gastos financieros por actualización de provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4552, 'PCG08-PYME', 'EXPENSE', '661', '4550', 'Intereses de obligaciones y bonos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4553, 'PCG08-PYME', 'EXPENSE', '6610', '4452',
         'Intereses de obligaciones y bonos a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4554, 'PCG08-PYME', 'EXPENSE', '6611', '4452',
         'Intereses de obligaciones y bonos a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4555, 'PCG08-PYME', 'EXPENSE', '6612', '4452',
         'Intereses de obligaciones y bonos a largo plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4556, 'PCG08-PYME', 'EXPENSE', '6613', '4452',
         'Intereses de obligaciones y bonos a largo plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4557, 'PCG08-PYME', 'EXPENSE', '6615', '4452',
         'Intereses de obligaciones y bonos a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4558, 'PCG08-PYME', 'EXPENSE', '6616', '4452',
         'Intereses de obligaciones y bonos a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4559, 'PCG08-PYME', 'EXPENSE', '6617', '4452',
         'Intereses de obligaciones y bonos a corto plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4560, 'PCG08-PYME', 'EXPENSE', '6618', '4452',
         'Intereses de obligaciones y bonos a corto plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4561, 'PCG08-PYME', 'EXPENSE', '662', '4550', 'Intereses de deudas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4562, 'PCG08-PYME', 'EXPENSE', '6620', '4561', 'Intereses de deudas empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4563, 'PCG08-PYME', 'EXPENSE', '6621', '4561', 'Intereses de deudas empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4564, 'PCG08-PYME', 'EXPENSE', '6622', '4561', 'Intereses de deudas otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4565, 'PCG08-PYME', 'EXPENSE', '6623', '4561', 'Intereses de deudas con entidades de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4566, 'PCG08-PYME', 'EXPENSE', '6624', '4561', 'Intereses de deudas otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4567, 'PCG08-PYME', 'EXPENSE', '663', '4550',
         'Pérdidas por valorización de activos y pasivos financieros por su valor razonable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4568, 'PCG08-PYME', 'EXPENSE', '664', '4550',
         'Gastos por dividendos de acciones o participaciones consideradas como pasivos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4569, 'PCG08-PYME', 'EXPENSE', '6640', '4568', 'Dividendos de pasivos empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4570, 'PCG08-PYME', 'EXPENSE', '6641', '4568', 'Dividendos de pasivos empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4571, 'PCG08-PYME', 'EXPENSE', '6642', '4568', 'Dividendos de pasivos otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4572, 'PCG08-PYME', 'EXPENSE', '6643', '4568', 'Dividendos de pasivos otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4573, 'PCG08-PYME', 'EXPENSE', '665', '4550',
         'Intereses por descuento de efectos y operaciones de factoring', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4574, 'PCG08-PYME', 'EXPENSE', '6650', '4573',
         'Intereses por descuento de efectos en entidades de crédito del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4575, 'PCG08-PYME', 'EXPENSE', '6651', '4573',
         'Intereses por descuento de efectos en entidades de crédito asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4576, 'PCG08-PYME', 'EXPENSE', '6652', '4573',
         'Intereses por descuento de efectos en entidades de crédito vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4577, 'PCG08-PYME', 'EXPENSE', '6653', '4573',
         'Intereses por descuento de efectos en otras entidades de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4578, 'PCG08-PYME', 'EXPENSE', '6654', '4573',
         'Intereses por operaciones de factoring con entidades de crédito del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4579, 'PCG08-PYME', 'EXPENSE', '6655', '4573',
         'Intereses por operaciones de factoring con entidades de crédito asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4580, 'PCG08-PYME', 'EXPENSE', '6656', '4573',
         'Intereses por operaciones de factoring con otras entidades de crédito vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4581, 'PCG08-PYME', 'EXPENSE', '6657', '4573',
         'Intereses por operaciones de factoring con otras entidades de crédito', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4582, 'PCG08-PYME', 'EXPENSE', '666', '4550',
         'Pérdidas en participaciones y valores representativos de deuda', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4583, 'PCG08-PYME', 'EXPENSE', '6660', '4582',
         'Pérdidas en valores representativos de deuda a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4584, 'PCG08-PYME', 'EXPENSE', '6661', '4582',
         'Pérdidas en valores representativos de deuda a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4585, 'PCG08-PYME', 'EXPENSE', '6662', '4582',
         'Pérdidas en valores representativos de deuda a largo plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4586, 'PCG08-PYME', 'EXPENSE', '6663', '4582',
         'Pérdidas en participaciones y valores representativos de deuda a largo plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4587, 'PCG08-PYME', 'EXPENSE', '6665', '4582',
         'Pérdidas en participaciones y valores representativos de deuda a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4588, 'PCG08-PYME', 'EXPENSE', '6666', '4582',
         'Pérdidas en participaciones y valores representativos de deuda a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4589, 'PCG08-PYME', 'EXPENSE', '6667', '4582',
         'Pérdidas en valores representativos de deuda a corto plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4590, 'PCG08-PYME', 'EXPENSE', '6668', '4582',
         'Pérdidas en valores representativos de deuda a corto plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4591, 'PCG08-PYME', 'EXPENSE', '667', '4550', 'Pérdidas de créditos no comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4592, 'PCG08-PYME', 'EXPENSE', '6670', '4591',
         'Pérdidas de créditos a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4593, 'PCG08-PYME', 'EXPENSE', '6671', '4591',
         'Pérdidas de créditos a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4594, 'PCG08-PYME', 'EXPENSE', '6672', '4591',
         'Pérdidas de créditos a largo plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4595, 'PCG08-PYME', 'EXPENSE', '6673', '4591', 'Pérdidas de créditos a largo plazo otras empresas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4596, 'PCG08-PYME', 'EXPENSE', '6675', '4591',
         'Pérdidas de créditos a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4597, 'PCG08-PYME', 'EXPENSE', '6676', '4591',
         'Pérdidas de créditos a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4598, 'PCG08-PYME', 'EXPENSE', '6677', '4591',
         'Pérdidas de créditos a corto plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4599, 'PCG08-PYME', 'EXPENSE', '6678', '4591', 'Pérdidas de créditos a corto plazo otras empresas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4600, 'PCG08-PYME', 'EXPENSE', '668', '4550', 'Diferencias negativas de cambio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4601, 'PCG08-PYME', 'EXPENSE', '669', '4550', 'Otros gastos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4602, 'PCG08-PYME', 'EXPENSE', '67', '4006',
         'Pérdidas procedentes de activos no corrientes y gastos excepcionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4603, 'PCG08-PYME', 'EXPENSE', '670', '4602', 'Pérdidas procedentes del inmovilizado intangible',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4604, 'PCG08-PYME', 'EXPENSE', '671', '4602', 'Pérdidas procedentes del inmovilizado material', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4605, 'PCG08-PYME', 'EXPENSE', '672', '4602',
         'Pérdidas procedentes de las inversiones inmobiliarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4607, 'PCG08-PYME', 'EXPENSE', '673', '4602',
         'Pérdidas procedentes de participaciones a largo plazo en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4608, 'PCG08-PYME', 'EXPENSE', '6733', '4607',
         'Pérdidas procedentes de participaciones a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4609, 'PCG08-PYME', 'EXPENSE', '6734', '4607',
         'Pérdidas procedentes de participaciones a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4610, 'PCG08-PYME', 'EXPENSE', '6735', '4607',
         'Pérdidas procedentes de participaciones a largo plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4611, 'PCG08-PYME', 'EXPENSE', '675', '4602', 'Pérdidas por operaciones con obligaciones propias',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4612, 'PCG08-PYME', 'EXPENSE', '678', '4602', 'Gastos excepcionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4613, 'PCG08-PYME', 'EXPENSE', '68', '4006', 'Dotaciones para amortizaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4614, 'PCG08-PYME', 'EXPENSE', '680', '4613', 'Amortización del inmovilizado intangible', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4615, 'PCG08-PYME', 'EXPENSE', '681', '4613', 'Amortización del inmovilizado material', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4616, 'PCG08-PYME', 'EXPENSE', '682', '4613', 'Amortización de las inversiones inmobiliarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4617, 'PCG08-PYME', 'EXPENSE', '69', '4006', 'Pérdidas por deterioro y otras dotaciones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4618, 'PCG08-PYME', 'EXPENSE', '690', '4617', 'Pérdidas por deterioro del inmovilizado intangible',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4619, 'PCG08-PYME', 'EXPENSE', '691', '4617', 'Pérdidas por deterioro del inmovilizado material',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4620, 'PCG08-PYME', 'EXPENSE', '692', '4617',
         'Pérdidas por deterioro de las inversiones inmobiliarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4621, 'PCG08-PYME', 'EXPENSE', '693', '4617', 'Pérdidas por deterioro de existencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4622, 'PCG08-PYME', 'EXPENSE', '6930', '4621',
         'Pérdidas por deterioro de productos terminados y en curso de fabricación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4623, 'PCG08-PYME', 'EXPENSE', '6931', '4621', 'Pérdidas por deterioro de mercaderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4624, 'PCG08-PYME', 'EXPENSE', '6932', '4621', 'Pérdidas por deterioro de materias primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4625, 'PCG08-PYME', 'EXPENSE', '6933', '4621',
         'Pérdidas por deterioro de otros aprovisionamientos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4626, 'PCG08-PYME', 'EXPENSE', '694', '4617',
         'Pérdidas por deterioro de créditos por operaciones comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4627, 'PCG08-PYME', 'EXPENSE', '695', '4617',
         'Dotación a la provisión por operaciones comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4628, 'PCG08-PYME', 'EXPENSE', '6954', '4627', 'Dotación a la provisión por contratos onerosos',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4629, 'PCG08-PYME', 'EXPENSE', '6959', '4628',
         'Dotación a la provisión para otras operaciones comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4630, 'PCG08-PYME', 'EXPENSE', '696', '4617',
         'Pérdidas por deterioro de participaciones y valores representativos de deuda a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4631, 'PCG08-PYME', 'EXPENSE', '6960', '4630',
         'Pérdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo empresas del grupo',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4632, 'PCG08-PYME', 'EXPENSE', '6961', '4630',
         'Pérdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo empresas asociadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4633, 'PCG08-PYME', 'EXPENSE', '6962', '4630',
         'Pérdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo otras partes vinculadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4634, 'PCG08-PYME', 'EXPENSE', '6963', '4630',
         'Pérdidas por deterioro de participaciones en instrumentos de patrimonio neto a largo plazo otras empresas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4635, 'PCG08-PYME', 'EXPENSE', '6965', '4630',
         'Pérdidas por deterioro en valores representativos de deuda a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4636, 'PCG08-PYME', 'EXPENSE', '6966', '4630',
         'Pérdidas por deterioro en valores representativos de deuda a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4637, 'PCG08-PYME', 'EXPENSE', '6967', '4630',
         'Pérdidas por deterioro en valores representativos de deuda a largo plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4638, 'PCG08-PYME', 'EXPENSE', '6968', '4630',
         'Pérdidas por deterioro en valores representativos de deuda a largo plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4639, 'PCG08-PYME', 'EXPENSE', '697', '4617', 'Pérdidas por deterioro de créditos a largo plazo',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4640, 'PCG08-PYME', 'EXPENSE', '6970', '4639',
         'Pérdidas por deterioro de créditos a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4641, 'PCG08-PYME', 'EXPENSE', '6971', '4639',
         'Pérdidas por deterioro de créditos a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4642, 'PCG08-PYME', 'EXPENSE', '6972', '4639',
         'Pérdidas por deterioro de créditos a largo plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4643, 'PCG08-PYME', 'EXPENSE', '6973', '4639',
         'Pérdidas por deterioro de créditos a largo plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4644, 'PCG08-PYME', 'EXPENSE', '698', '4617',
         'Pérdidas por deterioro de participaciones y valores representativos de deuda a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4645, 'PCG08-PYME', 'EXPENSE', '6980', '4644',
         'Pérdidas por deterioro de participaciones en instrumentos de patrimonio neto a corto plazo empresas del grupo',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4646, 'PCG08-PYME', 'EXPENSE', '6981', '4644',
         'Pérdidas por deterioro de participaciones en instrumentos de patrimonio neto a corto plazo empresas asociadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4647, 'PCG08-PYME', 'EXPENSE', '6985', '4644',
         'Pérdidas por deterioro en valores representativos de deuda a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4648, 'PCG08-PYME', 'EXPENSE', '6986', '4644',
         'Pérdidas por deterioro en valores representativos de deuda a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4649, 'PCG08-PYME', 'EXPENSE', '6988', '4644',
         'Pérdidas por deterioro en valores representativos de deuda a corto plazo de otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4650, 'PCG08-PYME', 'EXPENSE', '699', '4617', 'Pérdidas por deterioro de crédito a corto plazo',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4651, 'PCG08-PYME', 'EXPENSE', '6990', '4650',
         'Pérdidas por deterioro de crédito a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4652, 'PCG08-PYME', 'EXPENSE', '6991', '4650',
         'Pérdidas por deterioro de crédito a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4653, 'PCG08-PYME', 'EXPENSE', '6992', '4650',
         'Pérdidas por deterioro de crédito a corto plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4654, 'PCG08-PYME', 'EXPENSE', '6993', '4650',
         'Pérdidas por deterioro de crédito a corto plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4655, 'PCG08-PYME', 'INCOME', '70', '4007', 'Ventas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4656, 'PCG08-PYME', 'INCOME', '700', '4655', 'Ventas de mercaderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4657, 'PCG08-PYME', 'INCOME', '701', '4655', 'Ventas de productos terminados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4658, 'PCG08-PYME', 'INCOME', '702', '4655', 'Ventas de productos semiterminados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4659, 'PCG08-PYME', 'INCOME', '703', '4655', 'Ventas de subproductos y residuos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4660, 'PCG08-PYME', 'INCOME', '704', '4655', 'Ventas de envases y embalajes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4661, 'PCG08-PYME', 'INCOME', '705', '4655', 'Prestaciones de servicios', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4662, 'PCG08-PYME', 'INCOME', '706', '4655', 'Descuentos sobre ventas por pronto pago', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4663, 'PCG08-PYME', 'INCOME', '7060', '4662',
         'Descuentos sobre ventas por pronto pago de mercaderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4664, 'PCG08-PYME', 'INCOME', '7061', '4662',
         'Descuentos sobre ventas por pronto pago de productos terminados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4665, 'PCG08-PYME', 'INCOME', '7062', '4662',
         'Descuentos sobre ventas por pronto pago de productos semiterminados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4666, 'PCG08-PYME', 'INCOME', '7063', '4662',
         'Descuentos sobre ventas por pronto pago de subproductos y residuos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4667, 'PCG08-PYME', 'INCOME', '708', '4655', 'Devoluciones de ventas y operacioes similares', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4668, 'PCG08-PYME', 'INCOME', '7080', '4667', 'Devoluciones de ventas de mercaderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4669, 'PCG08-PYME', 'INCOME', '7081', '4667', 'Devoluciones de ventas de productos terminados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4670, 'PCG08-PYME', 'INCOME', '7082', '4667', 'Devoluciones de ventas de productos semiterminados',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4671, 'PCG08-PYME', 'INCOME', '7083', '4667', 'Devoluciones de ventas de subproductos y residuos',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4672, 'PCG08-PYME', 'INCOME', '7084', '4667', 'Devoluciones de ventas de envases y embalajes', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4673, 'PCG08-PYME', 'INCOME', '71', '4007', 'Variación de existencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4674, 'PCG08-PYME', 'INCOME', '710', '4673', 'Variación de existencias de productos en curso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4675, 'PCG08-PYME', 'INCOME', '711', '4673',
         'Variación de existencias de productos semiterminados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4676, 'PCG08-PYME', 'INCOME', '712', '4673', 'Variación de existencias de productos terminados',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4677, 'PCG08-PYME', 'INCOME', '713', '4673',
         'Variación de existencias de subproductos, residuos y materiales recuperados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4678, 'PCG08-PYME', 'INCOME', '73', '4007', 'Trabajos realizados para la empresa', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4679, 'PCG08-PYME', 'INCOME', '730', '4678', 'Trabajos realizados para el inmovilizado intangible',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4680, 'PCG08-PYME', 'INCOME', '731', '4678', 'Trabajos realizados para el inmovilizado tangible',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4681, 'PCG08-PYME', 'INCOME', '732', '4678', 'Trabajos realizados en inversiones inmobiliarias',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4682, 'PCG08-PYME', 'INCOME', '733', '4678',
         'Trabajos realizados para el inmovilizado material en curso', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4683, 'PCG08-PYME', 'INCOME', '74', '4007', 'Subvenciones, donaciones y legados', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4684, 'PCG08-PYME', 'INCOME', '740', '4683', 'Subvenciones, donaciones y legados a la explotación',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4685, 'PCG08-PYME', 'INCOME', '746', '4683',
         'Subvenciones, donaciones y legados de capital transferidos al resultado del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4686, 'PCG08-PYME', 'INCOME', '747', '4683',
         'Otras subvenciones, donaciones y legados transferidos al resultado del ejercicio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4687, 'PCG08-PYME', 'INCOME', '75', '4007', 'Otros ingresos de gestión', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4688, 'PCG08-PYME', 'INCOME', '751', '4687', 'Resultados de operaciones en común', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4689, 'PCG08-PYME', 'INCOME', '7510', '4688', 'Pérdida transferida gestor', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4690, 'PCG08-PYME', 'INCOME', '7511', '4688', 'Beneficio atribuido participe o asociado no gestor',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4691, 'PCG08-PYME', 'INCOME', '752', '4687', 'Ingreso por arrendamiento', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4692, 'PCG08-PYME', 'INCOME', '753', '4687',
         'Ingresos de propiedad industrial cedida en explotación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4693, 'PCG08-PYME', 'INCOME', '754', '4687', 'Ingresos por comisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4694, 'PCG08-PYME', 'INCOME', '755', '4687', 'Ingresos por servicios al personal', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4695, 'PCG08-PYME', 'INCOME', '759', '4687', 'Ingresos por servicios diversos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4696, 'PCG08-PYME', 'INCOME', '76', '4007', 'Ingresos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4697, 'PCG08-PYME', 'INCOME', '760', '4696',
         'Ingresos de participaciones en instrumentos de patrimonio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4698, 'PCG08-PYME', 'INCOME', '7600', '4697',
         'Ingresos de participaciones en instrumentos de patrimonio empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4699, 'PCG08-PYME', 'INCOME', '7601', '4697',
         'Ingresos de participaciones en instrumentos de patrimonio empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4700, 'PCG08-PYME', 'INCOME', '7602', '4697',
         'Ingresos de participaciones en instrumentos de patrimonio otras partes asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4701, 'PCG08-PYME', 'INCOME', '7603', '4697',
         'Ingresos de participaciones en instrumentos de patrimonio otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4702, 'PCG08-PYME', 'INCOME', '761', '4696', 'Ingresos de valores representativos de deuda', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4703, 'PCG08-PYME', 'INCOME', '7610', '4702',
         'Ingresos de valores representativos de deuda empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4704, 'PCG08-PYME', 'INCOME', '7611', '4702',
         'Ingresos de valores representativos de deuda empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4705, 'PCG08-PYME', 'INCOME', '7612', '4702',
         'Ingresos de valores representativos de deuda otras partes asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4706, 'PCG08-PYME', 'INCOME', '7613', '4702',
         'Ingresos de valores representativos de deuda otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4707, 'PCG08-PYME', 'INCOME', '762', '4696', 'Ingresos de créditos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4708, 'PCG08-PYME', 'INCOME', '7620', '4707', 'Ingresos de créditos a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4709, 'PCG08-PYME', 'INCOME', '76200', '4708',
         'Ingresos de crédito a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4710, 'PCG08-PYME', 'INCOME', '76201', '4708',
         'Ingresos de crédito a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4711, 'PCG08-PYME', 'INCOME', '76202', '4708',
         'Ingresos de crédito a largo plazo otras partes asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4712, 'PCG08-PYME', 'INCOME', '76203', '4708', 'Ingresos de crédito a largo plazo otras empresas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4713, 'PCG08-PYME', 'INCOME', '7621', '4707', 'Ingresos de créditos a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4714, 'PCG08-PYME', 'INCOME', '76210', '4713',
         'Ingresos de crédito a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4715, 'PCG08-PYME', 'INCOME', '76211', '4713',
         'Ingresos de crédito a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4716, 'PCG08-PYME', 'INCOME', '76212', '4713',
         'Ingresos de crédito a corto plazo otras partes asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4717, 'PCG08-PYME', 'INCOME', '76213', '4713', 'Ingresos de crédito a corto plazo otras empresas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4718, 'PCG08-PYME', 'INCOME', '763', '4696',
         'Beneficios por valorización de activos y pasivos financieros por su valor razonable', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4719, 'PCG08-PYME', 'INCOME', '766', '4696',
         'Beneficios en participaciones y valores representativos de deuda', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4720, 'PCG08-PYME', 'INCOME', '7660', '4719',
         'Beneficios en participaciones y valores representativos de deuda a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4721, 'PCG08-PYME', 'INCOME', '7661', '4719',
         'Beneficios en participaciones y valores representativos de deuda a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4722, 'PCG08-PYME', 'INCOME', '7662', '4719',
         'Beneficios en participaciones y valores representativos de deuda a largo plazo otras partes asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4723, 'PCG08-PYME', 'INCOME', '7663', '4719',
         'Beneficios en participaciones y valores representativos de deuda a largo plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4724, 'PCG08-PYME', 'INCOME', '7665', '4719',
         'Beneficios en participaciones y valores representativos de deuda a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4725, 'PCG08-PYME', 'INCOME', '7666', '4719',
         'Beneficios en participaciones y valores representativos de deuda a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4726, 'PCG08-PYME', 'INCOME', '7667', '4719',
         'Beneficios en participaciones y valores representativos de deuda a corto plazo otras partes asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4727, 'PCG08-PYME', 'INCOME', '7668', '4719',
         'Beneficios en participaciones y valores representativos de deuda a corto plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4728, 'PCG08-PYME', 'INCOME', '768', '4696', 'Diferencias positivas de cambio', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4729, 'PCG08-PYME', 'INCOME', '769', '4696', 'Otros ingresos financieros', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4730, 'PCG08-PYME', 'INCOME', '77', '4007',
         'Beneficios procedentes de activos no corrientes e ingresos excepcionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4731, 'PCG08-PYME', 'INCOME', '770', '4730', 'Beneficios procedentes del inmovilizado intangible',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4732, 'PCG08-PYME', 'INCOME', '771', '4730', 'Beneficios procedentes del inmovilizado material',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4733, 'PCG08-PYME', 'INCOME', '772', '4730',
         'Beneficios procedentes de las inversiones inmobiliarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4734, 'PCG08-PYME', 'INCOME', '773', '4730',
         'Beneficios procedentes de participaciones a largo plazo en partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4735, 'PCG08-PYME', 'INCOME', '7733', '4734',
         'Beneficios procedentes de participaciones a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4736, 'PCG08-PYME', 'INCOME', '7734', '4734',
         'Beneficios procedentes de participaciones a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4737, 'PCG08-PYME', 'INCOME', '7735', '4734',
         'Beneficios procedentes de participaciones a largo plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4738, 'PCG08-PYME', 'INCOME', '775', '4730', 'Beneficios por operaciones con obligaciones propias',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4739, 'PCG08-PYME', 'INCOME', '778', '4730', 'Ingresos excepcionales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4741, 'PCG08-PYME', 'INCOME', '79', '4007',
         'Excesos y aplicaciones de provisiones y pérdidas por deterioro', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4742, 'PCG08-PYME', 'INCOME', '790', '4741', 'Revisión del deterioro del inmovilizado intangible',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4743, 'PCG08-PYME', 'INCOME', '791', '4741', 'Revisión del deterioro del inmovilizado material',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4744, 'PCG08-PYME', 'INCOME', '792', '4741',
         'Revisión del deterioro de las inversiones inmobiliarias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4745, 'PCG08-PYME', 'INCOME', '793', '4741', 'Revisión del deterioro de las existencias', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4746, 'PCG08-PYME', 'INCOME', '7930', '4745',
         'Revisión del deterioro de productos terminados y en curso de fabricación', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4747, 'PCG08-PYME', 'INCOME', '7931', '4745', 'Revisión del deterioro de mercaderías', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4748, 'PCG08-PYME', 'INCOME', '7932', '4745', 'Revisión del deterioro de materias primas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4749, 'PCG08-PYME', 'INCOME', '7933', '4745', 'Revisión del deterioro de otros aprovisionamientos',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4750, 'PCG08-PYME', 'INCOME', '794', '4741',
         'Revisión del deterioro de créditos por operaciones comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4751, 'PCG08-PYME', 'INCOME', '795', '4741', 'Exceso de provisiones', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4752, 'PCG08-PYME', 'INCOME', '7951', '4751', 'Exceso de provisión para impuestos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4753, 'PCG08-PYME', 'INCOME', '7952', '4751', 'Exceso de provisión para otras responsabilidades',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4755, 'PCG08-PYME', 'INCOME', '7954', '4751', 'Exceso de provisión para operaciones comerciales',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4756, 'PCG08-PYME', 'INCOME', '79544', '4755', 'Exceso de provisión por contratos onerosos', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4757, 'PCG08-PYME', 'INCOME', '79549', '4755',
         'Exceso de provisión para otras operaciones comerciales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4758, 'PCG08-PYME', 'INCOME', '7955', '4751',
         'Exceso de provisión para actuaciones medioambienteales', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4759, 'PCG08-PYME', 'INCOME', '796', '4741',
         'Revisión del deterioro de participaciones y valores representativos de deuda a largo plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4760, 'PCG08-PYME', 'INCOME', '7960', '4759',
         'Revisión del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo empresas del grupo',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4761, 'PCG08-PYME', 'INCOME', '7961', '4759',
         'Revisión del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo empresas asociadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4762, 'PCG08-PYME', 'INCOME', '7962', '4759',
         'Revisión del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo otras partes vinculadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4763, 'PCG08-PYME', 'INCOME', '7963', '4759',
         'Revisión del deterioro de participaciones en instrumentos de patrimonio neto a largo plazo otras empresas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4764, 'PCG08-PYME', 'INCOME', '7965', '4759',
         'Revisión del deterioro de valores representativos a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4765, 'PCG08-PYME', 'INCOME', '7966', '4759',
         'Revisión del deterioro de valores representativos a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4766, 'PCG08-PYME', 'INCOME', '7967', '4759',
         'Revisión del deterioro de valores representativos a largo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4767, 'PCG08-PYME', 'INCOME', '7968', '4759',
         'Revisión del deterioro de valores representativos a largo plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4768, 'PCG08-PYME', 'INCOME', '797', '4741', 'Revisión del deterioro de créditos a largo plazo',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4769, 'PCG08-PYME', 'INCOME', '7970', '4768',
         'Revisión del deterioro de créditos a largo plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4770, 'PCG08-PYME', 'INCOME', '7971', '4768',
         'Revisión del deterioro de créditos a largo plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4771, 'PCG08-PYME', 'INCOME', '7972', '4768',
         'Revisión del deterioro de créditos a largo plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4772, 'PCG08-PYME', 'INCOME', '7973', '4768',
         'Revisión del deterioro de créditos a largo plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4773, 'PCG08-PYME', 'INCOME', '798', '4741',
         'Revisión del deterioro de participaciones y valores representativos de deuda a corto plazo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4774, 'PCG08-PYME', 'INCOME', '7980', '4773',
         'Revisión del deterioro de participaciones en instrumentos de patrimonio neto a corto plazo empresas del grupo',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4775, 'PCG08-PYME', 'INCOME', '7981', '4773',
         'Revisión del deterioro de participaciones en instrumentos de patrimonio neto a corto plazo empresas asociadas',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4776, 'PCG08-PYME', 'INCOME', '7985', '4773',
         'Revisión del deterioro de valores representativos de deuda a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4777, 'PCG08-PYME', 'INCOME', '7986', '4773',
         'Revisión del deterioro de valores representativos de deuda a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4778, 'PCG08-PYME', 'INCOME', '7987', '4773',
         'Revisión del deterioro de valores representativos de deuda a corto plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4779, 'PCG08-PYME', 'INCOME', '7988', '4773',
         'Revisión del deterioro de valores representativos de deuda a corto plazo otras empresas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4780, 'PCG08-PYME', 'INCOME', '799', '4741', 'Revisión del deterioro de créditos a corto plazo',
         1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4781, 'PCG08-PYME', 'INCOME', '7990', '4780',
         'Revisión del deterioro de créditos a corto plazo empresas del grupo', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4782, 'PCG08-PYME', 'INCOME', '7991', '4780',
         'Revisión del deterioro de créditos a corto plazo empresas asociadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4783, 'PCG08-PYME', 'INCOME', '7992', '4780',
         'Revisión del deterioro de créditos a corto plazo otras partes vinculadas', 1);
INSERT INTO llx_accounting_account (entity, rowid, fk_pcg_version, pcg_type, account_number, account_parent, label,
                                    active)
VALUES (__ ENTITY__, 4784, 'PCG08-PYME', 'INCOME', '7993', '4780',
         'Revisión del deterioro de créditos a corto plazo otras empresas', 1);
