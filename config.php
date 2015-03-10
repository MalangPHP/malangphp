<?php

/**
 * Phile CMS configuration
 * @author Achmad Mahardi
 * @license http://opensource.org/licenses/MIT
 * @package Phile
 */

$config = [
    'encryptionKey' => '{]]kK3tSli])fNk3LLWPNt)9LF?MWAlrL=g7d)JXdIEfd75!GgJuyI36TqIcNQ)M',
    'plugins'       => [
        'phile\\parserMarkdown' => ['active' => false],
        'phile\\parsedown' => ['active' => true]
    ]
];

return $config;
