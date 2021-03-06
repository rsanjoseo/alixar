-- Copyright (C) ---Put here your own copyright and developer email---
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see https://www.gnu.org/licenses/.


-- BEGIN MODULEBUILDER INDEXES
ALTER TABLE llx_emailcollector_emailcollectoraction
    ADD INDEX idx_emailcollector_fk_emailcollector (fk_emailcollector);
ALTER TABLE llx_emailcollector_emailcollectoraction
    ADD CONSTRAINT fk_emailcollectoraction_fk_emailcollector FOREIGN KEY (fk_emailcollector) REFERENCES llx_emailcollector_emailcollector (rowid);
-- END MODULEBUILDER INDEXES

ALTER TABLE llx_emailcollector_emailcollectoraction
    ADD UNIQUE INDEX uk_emailcollector_emailcollectoraction (fk_emailcollector, type);
