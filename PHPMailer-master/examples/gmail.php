<?php
	require("../PHPMailerAutoload.php");
	 
	$mail = new PHPMailer(); // create a new object
	$mail->SMTPOptions = array(
'ssl'=> array(
'verify_peer'=> false,
'verify_peer_name'=> false,
'allow_self_signed'=> true 
)
);
	$mail->IsSMTP(); // enable SMTP
	$mail->SMTPDebug = 2; // debugging: 1 = errors and messages, 2 = messages only
	$mail->SMTPAuth = true; // authentication enabled
	$mail->SMTPSecure = 'tls'; // secure transfer enabled REQUIRED for Gmail
	$mail->Host = "smtp.gmail.com";
	$mail->Port = 587; // or 587
	$mail->IsHTML(true);
	$mail->Username = "vavarrm@gmail.com";
	$mail->Password = "A29760615a";
	$mail->SetFrom("vavarrm@gmail.com");
	$mail->Subject = "Test";
	$mail->Body = "hello";
	$mail->AddAddress("vavarrm@gmail.com");

	 if(!$mail->Send()) {
		echo "Mailer Error: " . $mail->ErrorInfo;
	 } else {
		echo "Message has been sent";
	 }
?>

