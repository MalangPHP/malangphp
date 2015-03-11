<?php

/**
 * Phile CMS configuration
 * @author Achmad Mahardi
 * @license http://opensource.org/licenses/MIT
 * @package Phile
 */

$config = [
    'site_title'    => 'Malang PHP User Group',
    'theme'         => 'default',
    'date_format'   => 'js M Y',
    'pages_order'   => 'meta.date:desc',
    'charset'       => 'utf-8',
    'encryptionKey' => '{]]kK3tSli])fNk3LLWPNt)9LF?MWAlrL=g7d)JXdIEfd75!GgJuyI36TqIcNQ)M',
    'plugins'       => [
        'phile\\parserMarkdown' => ['active' => false],
        'phile\\parsedown'      => ['active' => true]
    ]
];

return $config;
