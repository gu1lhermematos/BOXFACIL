<?php
$system = parse_ini_file("config.ini");
$system['db_connect'] = mysql_pconnect($system['db_host'],$system['db_user'],$system['db_pass']);
if (!$system['db_connect']) {
        die('Erro de conexão com mysql ' . mysql_error());
}
mysql_select_db($system['db_name'], $system['db_connect']);
mysql_query("SET NAMES 'utf8'");
mysql_query('SET character_set_connection=utf8');
mysql_query('SET character_set_client=utf8');
mysql_query('SET character_set_results=utf8');
?>
