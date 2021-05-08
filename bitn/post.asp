<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/conn.asp" -->
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

Dim DundasUpload, caminho, nomeArquivo, tamanho, contentType
Server.ScriptTimeOut = 90
Set DundasUpload = server.CreateObject("Dundas.Upload.2")
DundasUpload.UseVirtualDir = False
DundasUpload.UseUniqueNames = False
DundasUpload.SaveToMemory

if err.number <> 0 then
Response.write(err.description)
end if


Nota = DundasUpload.form("Nota")
if isNull(Nota) or trim(Nota) = "" then
Nota = 0
end if

Tipo = DundasUpload.form("Tipo")
if trim(Tipo) = "Livros" then
	SQL = "INSERT INTO tbl_midia(codUsuario, TipoMidia, Validar, Titulo, Descricao, Nota, AutorDiretor, Editora, Pais, Ano, CriadoPor, TituloMidia) values ("&(rs_usuario.Fields.Item("codUsuario").Value)&", '"&DundasUpload.form("Tipo")&"', 0, '"&replace(trim(DundasUpload.form("Assunto")),"'","''")&"', '"&replace(trim(DundasUpload.form("Conteudo")),"'","''")&"', "&Nota&", '"&replace(trim(DundasUpload.form("AutorLivro")),"'","''")&"', '"&replace(trim(DundasUpload.form("EditoraLivro")),"'","''")&"', '"&replace(trim(DundasUpload.form("PaisLivro")),"'","''")&"', '"&replace(trim(DundasUpload.form("AnoLancamentoLivro")),"'","''")&"', "&(rs_usuario.Fields.Item("codUsuario").Value)&", '"&replace(trim(DundasUpload.form("TituloLivro")),"'","''")&"')"
end if

 
if trim(Tipo) = "Series" then
	SQL = "INSERT INTO tbl_midia(codUsuario, TipoMidia, Validar, Titulo, Descricao, Nota, AutorDiretor, Pais, Ano, CriadoPor, TituloMidia, Temporadas, Elenco) values ("&(rs_usuario.Fields.Item("codUsuario").Value)&", '"&DundasUpload.form("Tipo")&"', 0, '"&replace(trim(DundasUpload.form("Assunto")),"'","''")&"', '"&replace(trim(DundasUpload.form("Conteudo")),"'","''")&"', "&Nota&", '"&replace(trim(DundasUpload.form("DiretorSerie")),"'","''")&"', '"&replace(trim(DundasUpload.form("PaisSerie")),"'","''")&"', '"&replace(trim(DundasUpload.form("AnoSerie")),"'","''")&"', "&(rs_usuario.Fields.Item("codUsuario").Value)&", '"&replace(trim(DundasUpload.form("TituloSerie")),"'","''")&"', '"&replace(trim(DundasUpload.form("TemporadaSerie")),"'","''")&"', '"&replace(trim(DundasUpload.form("ElencoPrincipalSerie")),"'","''")&"')"
end if

'Ao cadastrar um filme, é necessário fornecer as seguintes informações: título, diretor, elenco principal, país, ano.


if trim(Tipo) = "Filmes" then
	SQL = "INSERT INTO tbl_midia(codUsuario, TipoMidia, Validar, Titulo, Descricao, Nota, AutorDiretor, Pais, Ano, CriadoPor, TituloMidia, Elenco) values ("&(rs_usuario.Fields.Item("codUsuario").Value)&", '"&DundasUpload.form("Tipo")&"', 0, '"&replace(trim(DundasUpload.form("Assunto")),"'","''")&"', '"&replace(trim(DundasUpload.form("Conteudo")),"'","''")&"', "&Nota&", '"&replace(trim(DundasUpload.form("DiretorFilme")),"'","''")&"', '"&replace(trim(DundasUpload.form("PaisFilme")),"'","''")&"', '"&replace(trim(DundasUpload.form("AnoFilme")),"'","''")&"', "&(rs_usuario.Fields.Item("codUsuario").Value)&", '"&replace(trim(DundasUpload.form("TituloFilme")),"'","''")&"', '"&replace(trim(DundasUpload.form("ElencoPrincipalFilme")),"'","''")&"')"
end if
set rs = conn.execute(SQL) 

'Atualizando data do ultimo post
'set rs = conn.execute("update from tbl_usuario set UltimoPost = getDate() Where codUsuario = "&(rs_usuario.Fields.Item("codUsuario").Value)&"") 


'Pegar o ultimo Post
set rs = conn.execute("Select top 1 codMidia from tbl_midia Where codUsuario = "&(rs_usuario.Fields.Item("codUsuario").Value)&" and TipoMidia = '"&DundasUpload.form("Tipo")&"' order by codMidia desc") 

'Escrever o numero do artigo
codMidia = rs("codMidia")
'response.Write("<br>codMidia: "&codMidia)



'Fazer o upload

caminho = Server.MapPath("\db\midia\")
novonome = Server.MapPath("\db\midia\")&"\"&codMidia&".jpg"

Dim i
i=0


for each UploadedFile in DundasUpload.Files
    i=i+1
    extensao = right(DundasUpload.GetFileName(UploadedFile.Originalpath),3)

	IF lcase(extensao) = "jpg" then
		UploadedFile.SaveAs novonome
	End IF    
next
%>
<% 'Remove a instancia do componente da memória
Set DundasUpload = Nothing


Session("msg") = "Post Adicionado. Em breve o administrador do sistema ir&aacute; avaliar o conte&uacute;do."
response.Redirect("/Index")

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
