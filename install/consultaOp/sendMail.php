<?php
require_once ("PHPMailer_v5.1/class.phpmailer.php");
function sendMail($Assunto,$Dest1,$Dest2,$Mensagem){
$system = parse_ini_file("config.ini");
$mail = new PHPMailer;
$mail->CharSet="utf-8";
$mail->IsSMTP();
$mail->SMTPAuth   = $system['smtp_auth'];
$mail->SMTPSecure = $system['smtp_secure'];
$mail->Port       = $system['smtp_port']; 
$mail->Host       = $system['smtp_server']; 
$mail->Username   = $system['remetente']; 
$mail->Password   = $system['remetente_pass']; 
$mail->Subject    = $Assunto;
$mail->From       = $system['remetente'];
$mail->FromName   = $system['rem_name'];
$mail->AddAddress($Dest1);
$mail->AddAddress($Dest2);
//$mail->AddReplyTo($addReplyTo);
//$mail->AddAttachment('diretorio arquivo', 'nome do arquivo');
//$mail->MsgHTML(file_get_contents('http://www.brfonetelecom.com.br'));
$mail->IsHTML(true);
$mail->Body = $Mensagem;
$mail->AltBody = $mail->Body;
$envio = $mail->Send();

if($envio){
return 1;
    } else {
return 0;
	}
}
