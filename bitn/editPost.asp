<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>

<%
Set conn = server.createobject("adodb.connection") 'abre a conexão com o banco de dados 
conn.open MM_conn_STRING 
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
rs_usuario_cmd.CommandText = "SELECT * FROM tbl_usuarios WHERE Usuario = ?" 
rs_usuario_cmd.Prepared = true
rs_usuario_cmd.Parameters.Append rs_usuario_cmd.CreateParameter("param1", 200, 1, 255, rs_usuario__MMColParam) ' adVarChar 
Set rs_usuario = rs_usuario_cmd.Execute
rs_usuario_numRows = 0
%>
<%if rs_usuario.eof and rs_usuario.bof then
Session("msg") = "É preciso estar logado para fazer seu post"
response.Redirect("/Logar")
else

 
 
Validar = Request("ValidarEdit")
if isNull(Validar) or trim(Validar) = "" then
Validar = 0
end if

 Nota = Request("Nota")
if isNull(Nota) or trim(Nota) = "" then
Nota = 0
end if


 


 
Tipo = Request("Tipo")
if trim(Tipo) = "Livros" then
	SQL = "update tbl_midia set TipoMidia = '"&Request("Tipo")&"', Validar = "&Validar&", Titulo = '"&Request("Assunto")&"', Descricao = '"&replace(Request("Conteudo"),"'","")&"', Nota = "&Nota&", AutorDiretor = '"&replace(trim(Request("AutorLivro")),"'","''")&"', Editora = '"&replace(trim(Request("EditoraLivro")),"'","''")&"', Pais = '"&replace(trim(Request("PaisLivro")),"'","''")&"', Ano = '"&trim(Request("AnoLancamentoLivro"))&"', TituloMidia = '"&replace(trim(Request("TituloLivro")),"'","''")&"' Where codMidia = "&trim(Request("codMidia"))
end if

 
if trim(Tipo) = "Series" then
	SQL = "update tbl_midia set TipoMidia = '"&Request("Tipo")&"', Validar = "&Validar&", Titulo = '"&Request("Assunto")&"', Descricao = '"&replace(Request("Conteudo"),"'","")&"', Nota = "&Nota&", AutorDiretor = '"&replace(trim(Request("DiretorSerie")),"'","''")&"', Pais = '"&replace(trim(Request("PaisSerie")),"'","''")&"', Ano = '"&trim(Request("AnoSerie"))&"', Elenco = '"&trim(Request("ElencoPrincipalSerie"))&"', TituloMidia = '"&replace(trim(Request("TituloSerie")),"'","''")&"', Temporadas = '"&replace(trim(Request("TemporadaSerie")),"'","''")&"' Where codMidia = "&trim(Request("codMidia"))
end if

'Ao cadastrar um filme, é necessário fornecer as seguintes informações: título, diretor, elenco principal, país, ano.


if trim(Tipo) = "Filmes" then
	SQL = "update tbl_midia set TipoMidia = '"&Request("Tipo")&"', Validar = "&Validar&", Titulo = '"&Request("Assunto")&"', Descricao = '"&replace(Request("Conteudo"),"'","")&"', Nota = "&Nota&", AutorDiretor = '"&replace(trim(Request("DiretorFilme")),"'","''")&"', Pais = '"&replace(trim(Request("PaisFilme")),"'","''")&"', Ano = '"&trim(Request("AnoFilme"))&"', TituloMidia = '"&replace(trim(Request("TituloFilme")),"'","''")&"' Where codMidia = "&trim(Request("codMidia"))
end if
response.Write(SQL)
set rs = conn.execute(SQL) 

'Atualizando data do ultimo post
UltimoPost = "'"&Year(now)&"-"&right("00"&month(now),2)&"-"&right("00"&day(now),2)&"T00:00:00.000'"
SQL = "update from tbl_usuarios set UltimoPost = "&UltimoPost&" Where codUsuario = "&(rs_usuario.Fields.Item("codUsuario").Value)&""
response.Write(Tipo)
response.Write(Nota)
'set rs = conn.execute(SQL) 


'Pegar o ultimo Post
codMidia = Request("codMidia")
'response.Write("<br>codMidia: "&codMidia)


if trim(Validar) = "3" then 'Vincular anuncio
set rs = conn.execute("insert into tbl_midia_usuarios(codMidia, codUsuario, Observacao) values ("&Request("codMidia")&", "&Request("codUsuario")&", '"&replace(Request("Conteudo"),"'","")&"') ") 

end if



'Fazer o upload

caminho = Server.MapPath("\db\midia\")
novonome = Server.MapPath("\db\midia\")&"\"&codMidia&".jpg"

Dim i
i=0

 %>
<% 'Remove a instancia do componente da memória
 
if trim(Validar) = "0" then
Session("msg") = "Post Alterado. Em breve o administrador do sistema ir&aacute; avaliar o conte&uacute;do."
end if
if trim(Validar) = "1" then
Session("msg") = "Post Autorizado com sucesso."
end if
if trim(Validar) = "2" then
Session("msg") = "Post Negado."
end if
if trim(Validar) = "3" then
Session("msg") = "Post Vinculado."
end if

response.redirect("/Post/"&codMidia)

%>  
<%end if%>
<%
set rsquery = nothing 
set conn = nothing 
%>
<%
rs_usuario.Close()
Set rs_usuario = Nothing
%>
</body>
</html>
