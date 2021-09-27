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

namespace Alxarafe\Modules\Main\Models;

use Alxarafe\Core\Base\Table;

/**
 * Class Users
 *
 * @package Alxarafe\Models
 */
class Users extends Table
{

    /**
     * User constructor.
     */
    public function __construct()
    {
        parent::__construct('users', ['create' => true]);
    }

    /**
     * TODO: Undocumented
     */
    public function getFields(): array
    {
        return [
            'id' => [
                'label' => 'id',
                'type' => 'int',
                'extra' => 'auto_increment' // It is assumed to be the primary key
            ],
            'username' => [
                'label' => 'username',
                'type' => 'varchar',
            ],
            'email' => [
                'label' => 'email',
                'type' => 'varchar',
            ],
            'password' => [
                'label' => 'password',
                'type' => 'varchar',
            ],
            'register_date' => [
                'label' => 'Fecha de registro',
                'type' => 'timestamp',
                'default' => 'CURRENT_TIMESTAMP',
            ],
            'active' => [
                'label' => 'Activo',
                'type' => 'tinyint',
                'null' => 'YES',
                'default' => 0,
            ],
        ];
    }

    /**
     * TODO: Undocumented
     *
     * @return array
     */
    public function getKeys(): array
    {
        return [
            'user_name' => [
                'INDEX' => 'username',
            ],
        ];
    }

    /**
     * TODO: Undocumented
     *
     * @return array
     */
    public function getDefaultValues(): array
    {
        return [
            [
                'id' => 1,
                'username' => 'admin',
                'email' => 'admin@alxarafe.com',
                'password' => md5('admin'),
                'active' => 1,
            ],
            [
                'id' => 2,
                'username' => 'user',
                'email' => 'user@alxarafe.com',
                'password' => md5('user'),
                'active' => 1,
            ],
        ];
    }
}
