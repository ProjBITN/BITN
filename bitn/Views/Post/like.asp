<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../../Connections/conn.asp" -->


<%
Set DbConn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")
DbConn.Open MM_conn_STRING
%>

<%
Dim rs_usuario__MMColParam
rs_usuario__MMColParam = "1"
If (Session("MM_Username") <> "") Then 
  rs_usuario__MMColParam = Session("MM_Username")
End If
%>
<%
Dim rs_usuario
Dim rs_usuario_cmd
Dim rs_usuario_numRows

Set rs_usuario_cmd = Server.CreateObject ("ADODB.Command")
rs_usuario_cmd.ActiveConnection = MM_conn_STRING
rs_usuario_cmd.CommandText = "SELECT * FROM tbl_usuarios WHERE Usuario = ? and Habil = 1" 
rs_usuario_cmd.Prepared = true
rs_usuario_cmd.Parameters.Append rs_usuario_cmd.CreateParameter("param1", 200, 1, 255, rs_usuario__MMColParam) ' adVarChar

Set rs_usuario = rs_usuario_cmd.Execute
rs_usuario_numRows = 0
%>
<%
'Verificar se esta logado
if not rs_usuario.eof and not rs_usuario.bof then

'Verificar se já tem algum like
SQL = "select * from tbl_midia_likes Where codUsuario = "&rs_usuario("codUsuario")&" and Habil = 1 and codMidia = "&request.QueryString("codMidia")
set rs = DbConn.Execute(sql)

'Se tiver tira.
if not rs.eof and not rs.bof then
	SQL = "update tbl_midia_likes set Habil = 0 Where codUsuario = "&rs_usuario("codUsuario")&" and codMidia = "&request.QueryString("codMidia")
	corLike = "#CCC"
else
'Se nao adiciona
	SQL = "insert into tbl_midia_likes (codUsuario, codMidia, Habil) values ("&rs_usuario("codUsuario")&", "&request.QueryString("codMidia")&",1)"
	corLike = "#069"
end if
set rs = DbConn.Execute(sql)

'Conta a quantidade de Likes
	SQL = "select count(codMidia) as Likes from tbl_midia_likes Where codMidia= "&request.QueryString("codMidia")&" and Habil = 1"
	set rs = DbConn.Execute(sql)

	Likes = rs("Likes")

'Atualiza o artigo
	SQL = "update tbl_midia set Likes = "&Likes&" Where codMidia= "&request.QueryString("codMidia")&""
	set rs = DbConn.Execute(sql)

'Mostra o icone
%>

<i class="fa fa-thumbs-up" aria-hidden="true" style="color:<%=corLike%>"></i>
<span><%=Likes%></span>

<%
else
response.Write("Precisa estar Logado")
end if
%> 
    
<%
rs_usuario.Close()
Set rs_usuario = Nothing
%>

<%
DbConn.Close()
Set rs = Nothing
%>