#!/usr/bin/php -q
<?php
$config = parse_ini_file("config.ini");
$numero = $argv[1];
$chave  = $config['cli_chave'];
$url="http://localhost/.consulta/consultaOperadora.php?chave=$chave&numero=$numero";
$operadora = trim(file_get_contents($url));

echo $operadora . "\n";

exit();

?>
