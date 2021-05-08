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
rs_usuario_cmd.CommandText = "SELECT * FROM tbl_usuarios WHERE Usuario = ?  and Habil = 1" 
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
  
 <b>Carregar Imagem do Perfil</b>
<form action="?upload=sim&Tipo=<%=Request.QueryString("Tipo")%>" method="post" enctype="multipart/form-data"
name='upload' onSubmit="return verifica_arquivo()">
Carregar Imagem: <input type="file" name="arquivo" size="60" class="form-control" style="height:200px;"><br>
<div style="text-align:right"><input type='submit' value='Enviar' class="btn btn-success"></div>
</form>
</center>
<hr>
<%
'Declara as variaveis utilizadas no script
'DundasUpload, upload, caminho
If Request.QueryString("upload") = "sim" Then
'Define as variaveis a serem utilizadas no script
Dim DundasUpload, caminho, nomeArquivo, tamanho, contentType
'Determina o tempo máximo de execução do script em segundos
Server.ScriptTimeOut = 90
SplitTIpo = split(request.QueryString("Tipo"),", ")
'Define o caminho onde o arquivo sera salvo. Exemplo: "e:\home\loginFtp\web\caminhoDaSuaAplicacao"
caminho = Server.MapPath("\db\fotos\")
novonome = Server.MapPath("\db\fotos\")&"\"&(rs_usuario.Fields.Item("codUsuario").Value)&"_"&SplitTIpo(0)&".jpg"
'Instancia o objeto na memória
Set DundasUpload = server.CreateObject("Dundas.Upload.2")
'Determina o tamanho máximo do arquivo a ser carregado
'DundasUpload.MaxFileSize = 1048576
'Formata o nome do arquivo
'DundasUpload.UseUniqueNames = true
'Salva o arquivo no local especificado
'DundasUpload.Save caminho


DundasUpload.UseVirtualDir = False

DundasUpload.UseUniqueNames = False

DundasUpload.SaveToMemory



Dim i
i=0


for each UploadedFile in DundasUpload.Files
    i=i+1
    extensao = right(DundasUpload.GetFileName(UploadedFile.Originalpath),3)

IF NOT lcase(extensao) = "jpg" then

Response.write("<script>alert('Este tipo de arquivo não é permitido\n Envie fotos com extensão .jpg');</script>")

Else
    arquivo = foto & "_" & i & "." & extensao

    UploadedFile.SaveAs novonome
	
Response.write("<script>alert('Foto enviada com sucesso !'); window.parent.location='/Index'</script>")


End IF    

next

'Obtem o nome do arquivo carregado
nomeArquivo = DundasUpload.Files(0).OriginalPath
'Obtem o tamanho do arquivo carregado
tamanho = DundasUpload.Files(0).Size
'Obtem o tipo de arquivo/Content-Type
contentType = DundasUpload.Files(0).ContentType
%>
<center>
<h2><font color="blue">Upload realizado com sucesso.</font>
</h2> <table border=1>
<th>Arquivo</th> <th>Tamanho/Kbytes</th> <th>ContentType</th>
<tr>
<td><a href="/db/fotos/<%=nomeArquivo%>" target="blank"><%=nomeArquivo%></a></td>
<td><%=tamanho%></td>
<td><%=contentType%></td>
</tr>
</table>
<% 'Remove a instancia do componente da memória
Set DundasUpload = Nothing
End if
%>
</center>

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
