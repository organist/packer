#!/usr/bin/php -q
<?php
    /**
     * Deze private key is vereist voor het request
     */
    $private_key = 'ba297e356f3b65a78c63b789a6347d6c';
    
    /**
     * Zijn alle parameters geset?
     */
    if (count($_SERVER['argv']) != 3) {
        echo 'Usage: '.$_SERVER['argv'][0].' [hostname] [ip]'."\n\n";
        exit(1);
    }
    
    /**
     * DNS Entry om te wijzigen/toe te voegen
     */
    $hostname = $_SERVER['argv'][1];
    $ip = $_SERVER['argv'][2];
    $domain = 'nvsotap.nl';
    
    /**
     * Het uit te voeren request
     */
    $request  = 'http://dyndns.netvlies.nl/update.php';
    $request .= '?hostname='.rawurlencode($hostname);
    $request .= '&domain='.rawurlencode($domain);
    $request .= '&ip='.rawurlencode($ip);
    $request .= '&hash='.rawurlencode(strtolower(md5($private_key.$hostname.$ip.$domain)));
    
    /**
     * Voert het request uit. Mogelijke responses:
     * - OK: Update successfull, new serial: $new_serial
     * - OK: No changes required, serial is still $serial
     * - ERR 001: Missing one of the required fields: hostname, ip, hash
     * - ERR 002: Hostname unknown: $hostname
     * - ERR 003: Hash not correct: $hash
     * - ERR 004: Can't connect to MySQL: mysql_error()
     * - ERR 005: Can't open database: mysql_error()
     * - ERR 006: No result in table records while looking up hostname
     * - ERR 007: No result in table records while looking up SOA-record
     * - ERR 008: No result in table domains
     * - ERR 009: Update hostname failed: mysql_error()
     * - ERR 00a: Update SOA failed: mysql_error()
     * - ERR 00b: Update domain serial failed: mysql_error()
     * - ERR 00c: Insert hostname failed: mysql_error()  
     */
    $outp = @file_get_contents($request);
    echo $outp."\n";
?>