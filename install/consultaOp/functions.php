<?php
$system = parse_ini_file("config.ini");
$local  = dirname( realpath( __FILE__ ) );
include_once ("$local/conecta.php");
include "$local/vars.php";
include "$local/functionInsertMail.php";

function consultaNumero($numero){
	$consulta = consultaPortados($numero);
	if($consulta == '-1'){
	$dezdg = dezdg($numero);
	$consulta = consultaPortados($dezdg);
	if($consulta == '-1'){
	$consulta = consultaNaoPortados($numero);
	$operadora = $consulta;
		
	} else if ($consulta == '0'){
	$consulta = consultaNaoPortados($numero);
	$operadora = $consulta;
		
	} else {
	
	$operadora = $consulta; 	
	}
		
	} else {
	$operadora = $consulta;
	}

	switch(trim($operadora)){
        case '' :
        $operadora = '00' ;
        break;
	}
	
$operadora=str_replace("\r\n","",trim("$operadora"));
 return trim("$operadora");
	}


function dezdg($numero){
   $qtdDg= strlen($numero);
   if ($qtdDg ==11){
   $ddd = substr($numero,0,2); // extrai ddd
   $num = substr($numero,-8,9); // extrai numero sem ddd
   return $ddd.$num;
  }else{
   return $numero;
   }
}

function consultaPortados($numero){
        $portados = mysql_query("select rn1 from portados where numero='$numero' order by data_hora desc limit 1") or die(mysql_error());
        $row=mysql_fetch_array($portados);
        if ( !$row ){

   $rs='-1';
  return $rs;
  } else {
    mysql_data_seek($portados, 0);
  }
 if ( $row['acao']=='0' ){
   $rs='0';
  }
 if ( $rs !== '0' ){
  $rn1=$row['rn1'];
  $rs="$rn1";
 }
  return $rs;
}

function consultaNaoPortados($numero){
                $_76dg = substr($numero, 0, -4);
                $_65dg = substr($numero, 0, -5);
                $_54dg = substr($numero, 0, -6);
                $sql="select rn1 from nao_portados where prefixo like '$_76dg%' limit 1";
                $sql_query=@mysql_query("$sql") or die ('Erro ao consultar nao_portados');
                $row_operadora=mysql_fetch_array($sql_query);

                if ( ! $row_operadora ){
                $sql="select rn1 from nao_portados where prefixo like '$_65dg%' limit 1";
                $sql_query=@mysql_query("$sql") or die ('Erro ao consultar nao_portados');
                $row_operadora=mysql_fetch_array($sql_query);
                mysql_close($conn);
               }

                if ( ! $row_operadora ){
                $sql="select rn1 from nao_portados where prefixo like '$_54dg%' limit 1";
                $sql_query=@mysql_query("$sql") or die ('Erro ao consultar nao_portados');
                $row_operadora=mysql_fetch_array($sql_query);
                mysql_close($conn);
               }

                if ( ! $row_operadora ){
               return trim("");
            }else{
             mysql_data_seek($sql_query,0);
             $operadora=$row_operadora['rn1'];
             return trim($operadora);
            }
   }
