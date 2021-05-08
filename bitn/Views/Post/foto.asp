<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../../Connections/conn.asp" -->
<%
Dim rs__MMColParam
rs__MMColParam = "1"
If (Request.QueryString("codMidia") <> "") Then 
  rs__MMColParam = Request.QueryString("codMidia")
End If
%>
<%
Dim rs
Dim rs_cmd
Dim rs_numRows

Set rs_cmd = Server.CreateObject ("ADODB.Command")
rs_cmd.ActiveConnection = MM_conn_STRING
rs_cmd.CommandText = "SELECT * FROM tbl_midia WHERE codMidia = ?" 
rs_cmd.Prepared = true
rs_cmd.Parameters.Append rs_cmd.CreateParameter("param1", 5, 1, -1, rs__MMColParam) ' adDouble

Set rs = rs_cmd.Execute
rs_numRows = 0
%>
<%
Dim rs_usuarios__MMColParam
rs_usuarios__MMColParam = "1"
If (Session("codUsuario") <> "") Then 
  rs_usuarios__MMColParam = Session("codUsuario")
End If
%>
<%
Dim rs_usuarios
Dim rs_usuarios_cmd
Dim rs_usuarios_numRows

Set rs_usuarios_cmd = Server.CreateObject ("ADODB.Command")
rs_usuarios_cmd.ActiveConnection = MM_conn_STRING
rs_usuarios_cmd.CommandText = "SELECT * FROM tbl_usuarios WHERE codUsuario = ?" 
rs_usuarios_cmd.Prepared = true
rs_usuarios_cmd.Parameters.Append rs_usuarios_cmd.CreateParameter("param1", 5, 1, -1, rs_usuarios__MMColParam) ' adDouble

Set rs_usuarios = rs_usuarios_cmd.Execute
rs_usuarios_numRows = 0
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link rel="shortcut icon" type="image/x-icon" href="/Views/css/login_files/_img/logo.png">

    <!-- CSS
	============================================ -->
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/Views/css/profile_files/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="https://demo.hasthemes.com/adda-preview/adda/assets/css/vendor/bicon.min.css">
    <!-- Flat Icon CSS -->
    <link rel="stylesheet" href="https://demo.hasthemes.com/adda-preview/adda/assets/css/vendor/flaticon.css">
    <!-- audio & video player CSS -->
    <link rel="stylesheet" href="/Views/css/profile_files/plyr.css">
    <!-- Slick CSS -->
    <link rel="stylesheet" href="/Views/css/profile_files/slick.min.css">
    <!-- nice-select CSS -->
    <link rel="stylesheet" href="/Views/css/profile_files/nice-select.css">
    <!-- perfect scrollbar css -->
    <link rel="stylesheet" href="/Views/css/profile_files/perfect-scrollbar.css">
    <!-- light gallery css -->
    <link rel="stylesheet" href="/Views/css/profile_files/lightgallery.min.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="/Views/css/profile_files/style.css">
	<script src="https://kit.fontawesome.com/37bb99279b.js" crossorigin="anonymous"></script>
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Foto</title>
</head>

<body style="background-color:#FFF;">
<% If Not rs.EOF Or Not rs.BOF Then %>
  <%TipoMidia		=	(rs.Fields.Item("TipoMidia").Value)%>
  <%Titulo		=	(rs.Fields.Item("Titulo").Value)%>
  <%Descricao		=	(rs.Fields.Item("Descricao").Value)%>
  <%Nota			=	(rs.Fields.Item("Nota").Value)%>
  <%TituloMidia	=	(rs.Fields.Item("TituloMidia").Value)%>
  <%AutorDiretor	=	(rs.Fields.Item("AutorDiretor").Value)%>
  <%Editora		=	(rs.Fields.Item("Editora").Value)%>
  <%Pais			=	(rs.Fields.Item("Pais").Value)%>
  <%Ano			=	(rs.Fields.Item("Ano").Value)%>
  <%Elenco		=	(rs.Fields.Item("Elenco").Value)%>
  <%Temporadas	=	(rs.Fields.Item("Temporadas").Value)%>
  <%Likes			=	(rs.Fields.Item("Likes").Value)%>
  <%Comentarios	=	(rs.Fields.Item("Comentarios").Value)%>
  <%Compartilhamentos =	(rs.Fields.Item("Compartilhamentos").Value)%>
  <%ValidarEdit		=	(rs.Fields.Item("Validar").Value)%>


<form name="frmAddFoto" id="frmAddFoto" target="_parent" action="foto_upload.asp?codMidia=<%=rs("codMidia")%>" method="post" enctype="multipart/form-data">
     
  <table width="100%">
    <tr>
      <td  align="center" style="text-align:center; background-color:#FFF;">
        <div>
        <%
dim fs
set fs=Server.CreateObject("Scripting.FileSystemObject")
%> 

          <%
    if fs.FileExists(server.MapPath("/db/midia/"&rs("codMidia")&".jpg")) then
    %>
    <strong>Gerenciar Foto</strong>
    <br />
    <img src="<%="/db/midia/"&rs("codMidia")&".jpg"%>" alt="<%=rs("Titulo")%>" height="180"  title="<%=rs("Titulo")%>" style="padding-bottom:10px;"> 
<center>
<input type="file" name="arquivo" required="required" class="form-control" placeholder="Adicione uma foto ao seu post"><br />
<input type="submit" class="post-share-btn" value="Carregar Imagem">
<a href="foto_del.asp?codMidia=<%=rs("codMidia")%>" target="_parent" class="post-share-btn" style="background-color:#900;">Excluir Imagem</a>
</center>
    <%
    else
    %><strong>Adicionar Foto</strong>
    <br />
        <img src="<%="/db/midia/"&rs("TipoMidia")&".png"%>" alt="<%=rs("Titulo")%>" height="200" title="<%=rs("Titulo")%>"> 
<center>
<input type="file" name="arquivo" required="required" class="form-control" placeholder="Adicione uma foto ao seu post"><br />
<input type="submit" class="post-share-btn" value="Carregar Imagem">
</center>
    <%
    end if
    %>
<%
set fs=nothing
%>

          
        </div></td>     
    </tr>
  </table> 
</form>  
  <% End If ' end Not rs.EOF Or NOT rs.BOF %>
   
<%
rs.Close()
Set rs = Nothing
%>
<%
rs_usuarios.Close()
Set rs_usuarios = Nothing
%>
</body>
</html>
