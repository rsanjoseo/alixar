<?php
/**
 * Copyright (C) 2021-2021  Rafael San José Tovar   <info@rsanjoseo.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

namespace Alxarafe\Modules\Users\Controllers;

use Alxarafe\Core\Base\View;
use Alxarafe\Dolibarr\Base\DolibarrController;
use Alxarafe\Modules\Users\Views\LogoutView;

/**
 * Class Logout
 *
 * @package Alxarafe\Modules\Admin\Controllers
 */
class Logout extends DolibarrController
{
    public function setView(): View
    {
        unset($_SESSION['dol_login']);
        unset($_SESSION['dol_entity']);
        unset($_SESSION['urlfrom']);

        header('location: index.php?module=admin&controller=init');
        die();
    }

    function getDolibarrVars(): void
    {
        // TODO: Implement getDolibarrVars() method.
    }

    function getDolibarrActions(): void
    {
        // TODO: Implement getDolibarrActions() method.
    }
}
