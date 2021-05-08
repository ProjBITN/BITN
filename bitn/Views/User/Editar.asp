<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../../Connections/conn.asp" -->
<%
dim fs
set fs=Server.CreateObject("Scripting.FileSystemObject")
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
If (CStr(Request("MM_update")) = "form1") Then
  If (Not MM_abortEdit) Then
    ' execute the update
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_conn_STRING
    MM_editCmd.CommandText = "UPDATE tbl_usuarios SET NomeCompleto = ?, DataNascimento = ?, Profissao = ?, Email = ?, Cidade = ?, Estado = ?, Descricao = ?, Senha = ?, Tipo = ?, AlteradoEm = ?, Configuracao = ?, Habil = ?, FaleSobreMim = ? WHERE codUsuario = ?" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 202, 1, 255, Request.Form("NomeCompleto")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 135, 1, -1, MM_IIF(Request.Form("DataNascimento"), Request.Form("DataNascimento"), null)) ' adDBTimeStamp
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 202, 1, 255, Request.Form("Profissao")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param4", 202, 1, 255, Request.Form("Email")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param5", 202, 1, 255, Request.Form("Cidade")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param6", 202, 1, 255, Request.Form("Estado")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param7", 203, 1, 536870910, Request.Form("Descricao")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param8", 202, 1, 255, Request.Form("Senha")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param9", 202, 1, 255, Request.Form("Tipo")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param10", 135, 1, -1, MM_IIF(Request.Form("AlteradoEm"), Request.Form("AlteradoEm"), null)) ' adDBTimeStamp
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param11", 202, 1, 255, Request.Form("Configuracao")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param12", 202, 1, 255, Request.Form("Habil")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param13", 203, 1, 536870910, Request.Form("FaleSobreMim")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param14", 5, 1, -1, MM_IIF(Request.Form("MM_recordId"), Request.Form("MM_recordId"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
	if trim(request.QueryString("codUsuario")) = "" then
    	MM_editRedirectUrl = "/Index"
	else
		MM_editRedirectUrl = "/Usuarios"
	end if
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
Dim rs_usuario
Dim rs_usuario_cmd
Dim rs_usuario_numRows

if trim(request.QueryString("codUsuario")) = "" then
	rs_usuario__MMColParam2 = "1"
	If (Session("MM_Username") <> "") Then 
	  rs_usuario__MMColParam2 = Session("MM_Username")
	End If
	
	
	Set rs_usuario_cmd = Server.CreateObject ("ADODB.Command")
	rs_usuario_cmd.ActiveConnection = MM_conn_STRING
	rs_usuario_cmd.CommandText = "SELECT * FROM tbl_usuarios WHERE Usuario = ? and [Habil] = 1" 
	rs_usuario_cmd.Prepared = true
	rs_usuario_cmd.Parameters.Append rs_usuario_cmd.CreateParameter("param1", 200, 1, 255, rs_usuario__MMColParam2) ' adVarChar
	
	Set rs_usuario = rs_usuario_cmd.Execute
	rs_usuario_numRows = 0
else
	rs_usuario__MMColParam2 = "1"
	If (trim(request.QueryString("codUsuario")) <> "") Then 
	  rs_usuario__MMColParam2 = trim(request.QueryString("codUsuario"))
	End If
	
	
	Set rs_usuario_cmd = Server.CreateObject ("ADODB.Command")
	rs_usuario_cmd.ActiveConnection = MM_conn_STRING
	rs_usuario_cmd.CommandText = "SELECT * FROM tbl_usuarios WHERE codUsuario = ? and [Habil] = 1" 
	rs_usuario_cmd.Prepared = true
	rs_usuario_cmd.Parameters.Append rs_usuario_cmd.CreateParameter("param1", 200, 1, 255, rs_usuario__MMColParam2) ' adVarChar
	
	Set rs_usuario = rs_usuario_cmd.Execute
	rs_usuario_numRows = 0
end if	
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
<form method="POST" action="<%=MM_editAction%>" target="_parent" name="form1">
  <table align="center" class="table table-bordered table-sm">
    <tr valign="baseline">
      <td nowrap align="left" colspan="2">Nome Completo:<br><input type="text" name="NomeCompleto" class="form-control" required value="<%=(rs_usuario.Fields.Item("NomeCompleto").Value)%>" size="32"></td>
    </tr>
    </table>
      <table align="center" class="table table-bordered table-sm">

    <tr valign="baseline">
      <td width="33%" nowrap align="left">Data de Nascimento:<br><input type="text" name="DataNascimento" class="form-control" required  value="<%=(rs_usuario.Fields.Item("DataNascimento").Value)%>" size="32"></td>
      <td width="33%"  nowrap align="left">Profissão:<br><input type="text" name="Profissao" class="form-control" required  value="<%=(rs_usuario.Fields.Item("Profissao").Value)%>" size="32"></td>
     
      <td width="33%"  nowrap align="left" colspan="2">E-mail:<br>
<input type="email" name="Email" class="form-control" required  value="<%=(rs_usuario.Fields.Item("Email").Value)%>" size="32"></td>
    </tr>
    
    <tr valign="baseline">
      <td nowrap align="left">Cidade:<br><input type="text" name="Cidade" class="form-control" required  value="<%=(rs_usuario.Fields.Item("Cidade").Value)%>" size="32"></td>
     
      <td nowrap align="left">Estado:<br><input type="text" name="Estado" class="form-control" required  value="<%=(rs_usuario.Fields.Item("Estado").Value)%>" size="32"></td>
       <td nowrap align="left">Senha:<br><input type="password"  class="form-control" required  name="Senha" value="<%=(rs_usuario.Fields.Item("Senha").Value)%>" size="32"> 
      </td>
    </tr>
     </table>
     <table align="center" class="table table-bordered table-sm">
    <tr valign="baseline">
      <td>Deixe sua frase<br>
<textarea  class="form-control" required  name="Descricao" value="" size="32"><%=(rs_usuario.Fields.Item("Descricao").Value)%></textarea></td>
      <td>Fale um pouco sobre você<br>
<textarea  class="form-control" required  name="FaleSobreMim" value="" size="32"><%=(rs_usuario.Fields.Item("FaleSobreMim").Value)%></textarea></td>
     
      </tr>
      
      <% if trim(request.QueryString("codUsuario")) = "" then%><tr>
      <td colspan="2" nowrap align="right" >
      <input type="hidden" name="Tipo" value="<%=(rs_usuario.Fields.Item("Tipo").Value)%>">
      <input type="hidden" name="Habil" value="1" >
	    <input type="submit" value="Atualizar Cadastro" class="btn btn-warning">
</td>
    </tr>
    <%else%><tr>
      <td nowrap align="left" >
      <select name="Tipo" class="form-control custom-select-sm" style="width:40%; float:left;">
      <option value="Administrador" <%if trim((rs_usuario.Fields.Item("Tipo").Value)) = "Administrador" then%>selected<%end if%>>Administrador</option>
      <option value="Usuario" <%if trim((rs_usuario.Fields.Item("Tipo").Value)) = "Usuario" then%>selected<%end if%>>Usuario</option>
      </select>
      
      <select name="Habil" class="form-control custom-select-sm" style="width:40%; float:right;">
      <option value="1" <%if trim((rs_usuario.Fields.Item("Habil").Value)) = "1" then%>selected<%end if%>>Ativo</option>
      <option value="0" <%if trim((rs_usuario.Fields.Item("Habil").Value)) = "0" then%>selected<%end if%>>Inativo</option>
      </select>
      </td>
      <td nowrap align="right" >
      <input type="submit" value="Atualizar Cadastro" class="btn btn-warning">
</td>
    </tr>
      
      <%end if%>
  </table>
  <input type="hidden" name="AlteradoEm" value="<%=now%>" >
  <input type="hidden" name="Configuracao" value="<%=(rs_usuario.Fields.Item("Configuracao").Value)%>" >
  <input type="hidden" name="MM_update" value="form1">
  <input type="hidden" name="MM_recordId" value="<%= rs_usuario.Fields.Item("codUsuario").Value %>">
</form> 
<strong>Clique sobre a foto para alterar</strong>
  <table align="center" class="table table-bordered table-sm">
<tr>
	<td width="33%" align="center">
    <a href="/FotoF">
    <div>
	<%
    if fs.FileExists(server.MapPath("/db/fotos/"&rs_usuario("codUsuario")&"_F.jpg")) then
    %>
    <img src="/db/fotos/<%=rs_usuario("codUsuario")%>_F.jpg"  style="width:90%; max-height:70px;">
    <%
    else
    %>
    <img src="/Views/css/profile_files/_img/profile-banner.jpg" style="width:90%; max-height:70px;">
    <%
    end if
    %>
</div></a>
</td>
    <td width="33%" align="center">
    <a href="/FotoP">
    <div>
	<%
    if fs.FileExists(server.MapPath("/db/fotos/"&rs_usuario("codUsuario")&"_P.jpg")) then
    %>
    <img src="/db/fotos/<%=rs_usuario("codUsuario")%>_P.jpg"  style="max-height:70px;">
    <%
    else
    %>
    <img src="/Views/css/profile_files/_img/profile-1.jpg" style="max-height:70px;">
    <%
    end if
    %>
</div>
</a>
</td>
    <td width="33%" align="center">
    <a href="/Foto01">
    <div>
	<%
    if fs.FileExists(server.MapPath("/db/fotos/"&rs_usuario("codUsuario")&"_01.jpg")) then
    %>
        <img src="/db/fotos/<%=rs_usuario("codUsuario")%>_01.jpg"  style="max-height:70px;">
    <%
    else
    %>
        <img src="../../db/fotos/nophoto.png" style="max-height:70px;">
    <%
    end if
    %>
	</div>
    </a>

    </td>
</tr>
<tr>
  <td align="center"><strong>Fundo</strong><div style="font-size:10px;">(Sugerido 1920x370)</div></td>
  <td align="center"><strong>Principal</strong><div style="font-size:10px;">(Sugerido 270x270)</div></td>
  <td align="center"><strong>Retrato</strong><div style="font-size:10px;">(Sugerido 60x60)</div></td>
</tr>
</table>    
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
set fs=nothing
%>
