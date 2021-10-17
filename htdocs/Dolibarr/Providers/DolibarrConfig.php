<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2020 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Dolibarr\Providers;

use Alxarafe\Core\Base\Singleton;
use Alxarafe\Dolibarr\Base\DolibarrFilefunc;
use Alxarafe\Dolibarr\Classes\Conf;
use Alxarafe\Dolibarr\Libraries\DolibarrMaster;

class DolibarrConfig extends Singleton
{
    static protected array $vars;
    static protected Conf $conf;
    static private DolibarrFilefunc $filefunc;

    public function __construct(string $index = 'main')
    {
        parent::__construct($index);
        self::$filefunc = new DolibarrFilefunc();

        self::$vars = self::$filefunc->defineVars();
        self::$conf = DolibarrMaster::getConf(self::getVars());
    }

    public function getVars()
    {
        return self::$vars;
    }

    public function getConf()
    {
        return self::$conf;
    }

}