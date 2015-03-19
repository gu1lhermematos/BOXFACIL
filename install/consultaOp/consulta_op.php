#!/usr/bin/php -q
<?php
$arch=`uname -a | grep x86_64`;
if($arch = ""){
include("/var/lib/asterisk/agi-bin/phpagi.php");
} else {
include("/usr/share/asterisk/agi-bin/phpagi.php");
}
$config = parse_ini_file("config.ini");
$agi = new AGI();
$numero = $argv[1];
$chave  = $config['cli_chave'];
$url="http://localhost/.consulta/consultaOperadora.php?chave=$chave&numero=$numero";
$operadora = trim(file_get_contents($url));

$agi->set_variable("OPERADORA", $operadora);

exit();
?>
