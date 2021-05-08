<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../../Connections/conn.asp" -->

<%
Dim rs_usuario__MMColParam2
Dim rs_usuario
Dim rs_usuario_cmd
Dim rs_usuario_numRows

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
%>
<%if rs_usuario.eof and rs_usuario.bof then%>
<center>
É preciso estar Logago para fazer essa pesquisa
</center>
<%else%>
<%
Dim rs__MMColParam
rs__MMColParam = "1"
If (Request.QueryString("Valor") <> "") Then 
  rs__MMColParam = Request.QueryString("Valor")
End If
%>
<%
Dim rs
Dim rs_cmd
Dim rs_numRows

Set rs_cmd = Server.CreateObject ("ADODB.Command")
rs_cmd.ActiveConnection = MM_conn_STRING
rs_cmd.CommandText = "SELECT top 3 * FROM tbl_usuarios WHERE NomeCompleto LIKE ? and Habil = 1 and Tipo = 'Usuario' and codUsuario not in (select codAmigo from tbl_usuarios_amigos Where codUsuario = "&rs_usuario("codAmigo")&")" 
rs_cmd.Prepared = true
rs_cmd.Parameters.Append rs_cmd.CreateParameter("param1", 200, 1, 255, "%" + rs__MMColParam + "%") ' adVarChar

Set rs = rs_cmd.Execute
rs_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
rs_numRows = rs_numRows + Repeat1__numRows
%>
<%
dim fs
set fs=Server.CreateObject("Scripting.FileSystemObject")
%>
<% 
While ((Repeat1__numRows <> 0) AND (NOT rs.EOF)) 
%>
  <%
if fs.FileExists(server.MapPath("/db/fotos/"&rs("codUsuario")&"_01.jpg")) then
	CaminhoFoto = "/db/fotos/"&rs("codUsuario")&"_01.jpg"
else
	CaminhoFoto = "/db/fotos/nophoto.png"
end if
%>
  <li class="d-flex align-items-center profile-active"> 
    <!-- profile picture end -->
    
    <div class="profile-thumb">
      <figure class="profile-thumb-small"> <img src="<%=CaminhoFoto%>" alt=""> </figure>
    </div>
    <!-- profile picture end -->
    
    <div class="posted-author">
      <h6 class="author"><%=rs("NomeCompleto")%></h6>
      <p><%=rs("Cidade")%> - <%=rs("Estado")%></p>
      <p><a href="/Perfil/<%=rs("codUsuario")%>/" class="edit-btn">Perfil</a></p>
    </div>
  </li>
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  rs.MoveNext()
Wend
%>
<%if rs.eof and rs.bof then%>
<center>
  <%IF TRIM(Request.QueryString("Valor")) = "" THEN%>
  Digite e pesquise novos amigos
  <%else%>
  Nenhum amigo Localizado com <%=TRIM(Request.QueryString("Valor"))%>
  <%end if%>
</center>
<%end if%>
<%
rs.Close()
Set rs = Nothing
%>
<%
set fs=nothing
%>
<%end if%>
<%
rs_usuario.Close()
Set rs_usuario = Nothing
%>
