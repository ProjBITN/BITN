<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../../Connections/conn.asp" --> 
<%
Dim rs_usuario__MMColParam2
rs_usuario__MMColParam2 = "1"
If (Session("MM_Username") <> "") Then 
  rs_usuario__MMColParam2 = Session("MM_Username")
End If
%>
<%
Dim rs_usuario
Dim rs_usuario_cmd
Dim rs_usuario_numRows

Set rs_usuario_cmd = Server.CreateObject ("ADODB.Command")
rs_usuario_cmd.ActiveConnection = MM_conn_STRING
rs_usuario_cmd.CommandText = "SELECT * FROM tbl_usuarios WHERE Usuario = ? and [Habil] = 1" 
rs_usuario_cmd.Prepared = true
rs_usuario_cmd.Parameters.Append rs_usuario_cmd.CreateParameter("param1", 200, 1, 255, rs_usuario__MMColParam2) ' adVarChar

Set rs_usuario = rs_usuario_cmd.Execute
rs_usuario_numRows = 0
%>
<html class="js sizes customelements history pointerevents postmessage webgl websockets cssanimations csscolumns csscolumns-width csscolumns-span csscolumns-fill csscolumns-gap csscolumns-rule csscolumns-rulecolor csscolumns-rulestyle csscolumns-rulewidth csscolumns-breakbefore csscolumns-breakafter csscolumns-breakinside flexbox picture srcset webworkers" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>BITn - Sua Rede de Conhecimento Social</title>
<meta name="robots" content="noindex, follow">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="/Views/css/login_files/_img/logo.png">

<!-- CSS
	============================================ -->
<!-- google fonts -->
<link href="/Views/css/login_files/_css/css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/Views/css/login_files/_css/bootstrap.min.css">
<!-- Icon Font CSS -->
<style>
*{
	font-size:12px;
	padding:2px;
	margin:2px;
}
</style>
</head>

<body class="bg-transparent">
<%
if rs_usuario.eof and rs_usuario.bof then
%>
<div class="alert alert-danger text-center">Dados Inválidos. E-mail e Usuário não conferem ou não cadastrado</div>
<br>
<center>
  <a href="/Index" target="_parent" class="btn btn-success">Tentar novamente</a>
</center>
<%
else
  %>  
  <b>Editar Post: </b>
   
<%
end if
%>
</body>
</html>
<%
rs_usuario.Close()
Set rs_usuario = Nothing
%>
