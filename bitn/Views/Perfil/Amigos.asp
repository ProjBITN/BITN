<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../../Connections/conn.asp" -->
<%
function fnContarAmigo()
	Set conn = server.createobject("adodb.connection") 'abre a conexão com o banco de dados 
	conn.open MM_conn_STRING
	set rs = conn.execute("select count(1) as Amigos from tbl_usuarios_amigos Where Habil >=1 and codUsuario = "&Request.Form("codUsuario")) 
	Amigos = rs("Amigos")
	set rs = conn.execute("update tbl_usuarios set Amigos = "&Amigos&" Where codUsuario = "&Request.Form("codUsuario")) 
	set rsquery = nothing 
	set conn = nothing 
end function
%>



<%
Dim MM_editAction
MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Server.HTMLEncode(Request.QueryString)
End If

' boolean to abort record edit
Dim MM_abortEdit
MM_abortEdit = false
%>
<%
' IIf implementation
Function MM_IIf(condition, ifTrue, ifFalse)
  If condition = "" Then
    MM_IIf = ifFalse
  Else
    MM_IIf = ifTrue
  End If
End Function
%>
<%
If (CStr(Request("MM_insert")) = "form1") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_conn_STRING
    MM_editCmd.CommandText = "INSERT INTO tbl_usuarios_amigos (codAmigo, codUsuario, Habil, Likes) VALUES (?, ?, ?, ?)" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 5, 1, -1, MM_IIF(Request.Form("codAmigo"), Request.Form("codAmigo"), null)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 5, 1, -1, MM_IIF(Request.Form("codUsuario"), Request.Form("codUsuario"), null)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 202, 1, 255, Request.Form("Habil")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param4", 5, 1, -1, MM_IIF(Request.Form("Likes"), Request.Form("Likes"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "/Perfil/"&Request.Form("codAmigo")&"/"
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
      Else
        MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
      End If
    End If
	fnContarAmigo()
    Response.Redirect(MM_editRedirectUrl)
  End If
End If
%>
<%
If (CStr(Request("MM_update")) = "form2") Then
  If (Not MM_abortEdit) Then
    ' execute the update
 
    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_conn_STRING
    MM_editCmd.CommandText = "UPDATE tbl_usuarios_amigos SET Habil = ? WHERE codUsuarioAmigo = ?" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 202, 1, 255, Request.Form("Habil")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 5, 1, -1, MM_IIF(Request.Form("MM_recordId"), Request.Form("MM_recordId"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL

    MM_editRedirectUrl = "/Perfil/"&Request.QueryString("codAmigo")&"/"
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
      Else
        MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
      End If
    End If
	fnContarAmigo()
    Response.Redirect(MM_editRedirectUrl)
  End If
End If
%>
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
<%
Dim rs_amigos__MMColParam
rs_amigos__MMColParam = "1"
If (Request.QueryString("codAmigo") <> "") Then 
  rs_amigos__MMColParam = Request.QueryString("codAmigo")
End If
%>
<%
Dim rs_amigos__MMColParam2
rs_amigos__MMColParam2 = "-1"
If (rs_usuario("codUsuario") <> "") Then 
  rs_amigos__MMColParam2 = rs_usuario("codUsuario")
End If
%>
<%
Dim rs_amigos
Dim rs_amigos_cmd
Dim rs_amigos_numRows

Set rs_amigos_cmd = Server.CreateObject ("ADODB.Command")
rs_amigos_cmd.ActiveConnection = MM_conn_STRING
rs_amigos_cmd.CommandText = "SELECT * FROM tbl_usuarios_amigos WHERE codAmigo = ? and codUsuario = ? and Habil = 1" 
rs_amigos_cmd.Prepared = true
rs_amigos_cmd.Parameters.Append rs_amigos_cmd.CreateParameter("param1", 5, 1, -1, rs_amigos__MMColParam) ' adDouble
rs_amigos_cmd.Parameters.Append rs_amigos_cmd.CreateParameter("param2", 5, 1, -1, rs_amigos__MMColParam2) ' adDouble

Set rs_amigos = rs_amigos_cmd.Execute
rs_amigos_numRows = 0
%>
<%
Dim rs_amiga__MMColParam
rs_amiga__MMColParam = "1"
If (Request.QueryString("codAmigo") <> "") Then 
  rs_amiga__MMColParam = Request.QueryString("codAmigo")
End If
%>
<%
Dim rs_amiga
Dim rs_amiga_cmd
Dim rs_amiga_numRows

Set rs_amiga_cmd = Server.CreateObject ("ADODB.Command")
rs_amiga_cmd.ActiveConnection = MM_conn_STRING
rs_amiga_cmd.CommandText = "SELECT * FROM tbl_usuarios WHERE codUsuario = ?" 
rs_amiga_cmd.Prepared = true
rs_amiga_cmd.Parameters.Append rs_amiga_cmd.CreateParameter("param1", 5, 1, -1, rs_amiga__MMColParam) ' adDouble

Set rs_amiga = rs_amiga_cmd.Execute
rs_amiga_numRows = 0
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
  <% If rs_amigos.EOF And rs_amigos.BOF Then %>
  <b>Fazer Amizade com <%=(rs_amiga.Fields.Item("NomeCompleto").Value)%>: </b>
  <form method="post" action="<%=MM_editAction%>" target="_parent" name="form1">
    <hr>
    <center>
      <input type="submit" value="Clique aqui para seguir" class="btn btn-success btn-lg">
    </center>
    <input type="hidden" name="codAmigo" value="<%=(rs_amiga.Fields.Item("codUsuario").Value)%>" >
    <input type="hidden" name="codUsuario" value="<%=(rs_usuario.Fields.Item("codUsuario").Value)%>" >
    <input type="hidden" name="Habil" value="1" >
    <input type="hidden" name="Likes" value="0" >
    <input type="hidden" name="MM_insert" value="form1">
  </form>
  <% else %>
  <b>Desfazer Amizade com <%=(rs_amiga.Fields.Item("NomeCompleto").Value)%>: </b>
<form method="post" action="<%=MM_editAction%>" name="form2" target="_parent">
  <center>
      <input type="submit" value="Clique aqui para desfazer amizade" class="btn btn-danger btn-lg">
    </center>
  <input type="hidden" name="Habil" value="0" >
  <input type="hidden" name="MM_update" value="form2">
  <input type="hidden" name="MM_recordId" value="<%= rs_amigos.Fields.Item("codUsuarioAmigo").Value %>">
</form>
  <% End If ' end rs_amigos.EOF And rs_amigos.BOF %>
<%
end if
%>
</body>
</html>
<%
rs_usuario.Close()
Set rs_usuario = Nothing
%>
<%
rs_amigos.Close()
Set rs_amigos = Nothing
%>
<%
rs_amiga.Close()
Set rs_amiga = Nothing
%>
