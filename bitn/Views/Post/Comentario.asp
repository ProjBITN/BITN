<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../../Connections/conn.asp" -->
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
    MM_editCmd.CommandText = "INSERT INTO tbl_midia_comentarios (Nota, Comentario, codMidia, codUsuario, Habil) VALUES (?, ?, ?, ?, ?)" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 5, 1, -1, MM_IIF(Request.Form("Nota"), Request.Form("Nota"), null)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 203, 1, 536870910, Request.Form("Comentario")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 5, 1, -1, MM_IIF(Request.Form("codMidia"), Request.Form("codMidia"), null)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param4", 5, 1, -1, MM_IIF(Request.Form("codUsuario"), Request.Form("codUsuario"), null)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param5", 5, 1, -1, MM_IIF(Request.Form("Habil"), Request.Form("Habil"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "Comentario_comp.asp"
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
      Else
        MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
      End If
    End If
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
  <b>Deixe sua Avaliação: </b>
  <form method="POST" action="<%=MM_editAction%>" name="form1">
    <table align="center" class="table">
      <tr>
        <td valign="baseline"><strong>Informe sua Nota</strong>
        <input type="number" class="form-control" name="Nota" required value="0" min="1" max="10"></td>
      </tr>
      <tr>
        <td valign="baseline"><strong>Comentário</strong>
        <textarea class="form-control" name="Comentario" maxlength="1024" required cols="50" rows="5"></textarea></td>
      </tr>
      <tr valign="baseline">
        <td align="right"><input type="submit" value="Inserir Avaliação" class="btn btn-success"></td>
      </tr>
    </table>
    <input type="hidden" name="codMidia" value="<%=Request.QueryString("codMidia")%>" >
    <input type="hidden" name="codUsuario" value="<%=(rs_usuario.Fields.Item("codUsuario").Value)%>" >
    <input type="hidden" name="Habil" value="1" >
    <input type="hidden" name="MM_insert" value="form1">
  </form> 
<%
end if
%>
</body>
</html>
<%
rs_usuario.Close()
Set rs_usuario = Nothing
%>
