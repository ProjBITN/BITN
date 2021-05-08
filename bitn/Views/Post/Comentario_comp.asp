<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../../Connections/conn.asp" --> 
<%
Dim rs_contar__MMColParam
rs_contar__MMColParam = "1"
If (Request.QueryString("codMidia") <> "") Then 
  rs_contar__MMColParam = Request.QueryString("codMidia")
End If
%>
<%
Dim rs_contar
Dim rs_contar_cmd
Dim rs_contar_numRows

Set rs_contar_cmd = Server.CreateObject ("ADODB.Command")
rs_contar_cmd.ActiveConnection = MM_conn_STRING
rs_contar_cmd.CommandText = "SELECT count(codComentario) as Contar, avg(Nota) as NotasMedia FROM tbl_midia_comentarios WHERE codMidia = ? and Habil = 1" 
rs_contar_cmd.Prepared = true
rs_contar_cmd.Parameters.Append rs_contar_cmd.CreateParameter("param1", 5, 1, -1, rs_contar__MMColParam) ' adDouble

Set rs_contar = rs_contar_cmd.Execute
rs_contar_numRows = 0
%> 
<%
Comentarios = rs_contar("Contar")
Nota = rs_contar("NotasMedia")
%> 


<%
Set DbConn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")
DbConn.Open MM_conn_STRING
%>
<%
SQL = "update tbl_midia set Comentarios = "&Comentarios&", Nota = "&replace(formatNumber(Nota,2),",",".")&" Where codMidia = "&request.QueryString("codMidia")

set rs = DbConn.Execute(sql)
%>
<%
DbConn.Close()
Set rs = Nothing
%>

<%
rs_contar.Close()
Set rs_contar = Nothing
%>
<script>
alert("Dados atualizados")
window.parent.location = "/Post/<%=request.QueryString("codMidia")%>"
</script>