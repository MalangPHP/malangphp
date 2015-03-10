<?php

/*
 * khoaofgod@yahoo.com
 * Website: http://www.phpfastcache.com
 * Example at our website, any bugs, problems, please visit http://www.codehelper.io
 */

interface phpfastcache_driver
{
    /*
     * Check if this Cache driver is available for server or not
     */
    public function __construct($option = array());

    public function checkdriver();

    /*
     * SET
     * set a obj to cache
     */
    public function driver_set($keyword, $value = "", $time = 300, $option = array());

    /*
     * GET
     * return null or value of cache
     */
    public function driver_get($keyword, $option = array());

    /*
     * Stats
     * Show stats of caching
     * Return array ("info","size","data")
     */
    public function driver_stats($option = array());

    /*
     * Delete
     * Delete a cache
     */
    public function driver_delete($keyword, $option = array());

    /*
     * clean
     * Clean up whole cache
     */
    public function driver_clean($option = array());
}
