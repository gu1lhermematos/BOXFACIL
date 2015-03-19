<?php
$system = parse_ini_file("config.ini");
include 'functions.php';
$numero = addslashes($_GET['numero']); if(!is_numeric($numero)) exit("09"); //deve ser um string puramente numérica
$chave = addslashes($_GET['chave']);
if(strlen($numero) != 10 && strlen($numero) != 11) exit("01"); //preencha o campo com 10 ou 11 dígitos
if(!isset($chave)) exit("02"); if($chave != $system['cli_chave']) exit("03");
$operadora = consultaNumero($numero);
echo trim("$operadora");
