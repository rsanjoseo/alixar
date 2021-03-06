-- ============================================================================
-- Copyright (C) 2015	Laurent Destailleur		<eldy@users.sourceforge.net>
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
-- ===========================================================================

create table llx_budget
(
    rowid         integer AUTO_INCREMENT PRIMARY KEY,
    entity        integer      NOT NULL DEFAULT 1,
    label         varchar(255) NOT NULL, -- For example 'Global budget for year' or 'Budget for each project'
    status        integer,
    note          text,
    date_start    date,
    date_end      date,
    datec         datetime,
    tms           timestamp             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    fk_user_creat integer,
    fk_user_modif integer,
    import_key    integer
)ENGINE=innodb;
