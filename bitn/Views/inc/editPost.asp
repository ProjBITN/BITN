<%@LANGUAGE="VBSCRIPT"%>
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
  <input type="hidden" name="codMidia" value="<%=rs("codMidia")%>" />
  <input type="hidden" name="codUsuario" value="<%=rs("codUsuario")%>" /> 
  <input type="hidden" name="Tipo" id="TipoEdit" value="<%=TipoMidia%>" /> 
  <div style="margin-bottom:5px;"> 
    <input type="text" name="Assunto" id="AssuntoEdit" class="form-control"  placeholder="Titulo do Post" value="<%=(rs.Fields.Item("Titulo").Value)%>">
  </div>
  <div style="margin-bottom:5px;">
     <div id="divComplementoLivrosEdit" style="display:<%if trim(TipoMidia) = "Livros" then%>block<%else%>none<%end if%>;">
      <table width="100%">
        <tr>
          <td colspan="2"><input type="text" name="TituloLivro" id="TituloLivroEdit"   placeholder="Titulo do Livro" class="form-control form-control-sm" value="<%=TituloMidia%>"></td>
        </tr>
        <tr>
          <td width="50%"><input type="text" name="AutorLivro" id="AutorLivroEdit"     placeholder="Nome do Autor" class="form-control form-control-sm" value="<%=AutorDiretor%>"></td>
          <td width="50%"><input type="text" name="EditoraLivro" id="EditoraLivroEdit"   placeholder="Nome da Editora" class="form-control form-control-sm" value="<%=Editora%>"></td>
        </tr>
        <tr>
          <td width="50%"><input type="text" name="PaisLivro" id="PaisLivroEdit"   placeholder="Pais de Origem" class="form-control form-control-sm" value="<%=Pais%>"></td>
          <td width="50%"><input type="text" name="AnoLancamentoLivro"   id="AnoLancamentoLivroEdit" placeholder="Ano de Lançamento do Livro" class="form-control form-control-sm" value="<%=Ano%>"></td>
        </tr>
      </table>
    </div>

    <div id="divComplementoSeriesEdit" style="display:<%if trim(TipoMidia) = "Series" then%>block<%else%>none<%end if%>;">
      <table width="100%">
        <tr>
          <td colspan="2"><input type="text" name="TituloSerie" id="TituloSerieEdit" placeholder="Titulo da Série"   class="form-control form-control-sm" value="<%=TituloMidia%>"></td>
        </tr>
        <tr>
          <td width="50%"><input type="text" name="DiretorSerie" id="DiretorSerieEdit" placeholder="Nome do Diretor"   class="form-control form-control-sm" value="<%=AutorDiretor%>"></td>
          <td width="50%"><input type="text" name="ElencoPrincipalSerie" id="ElencoPrincipalSerieEdit"   placeholder="Elenco Principal" class="form-control form-control-sm" value="<%=Elenco%>"></td>
        </tr>
      </table>
      <table width="100%">
        <tr>
          <td width="33%"><input type="text" name="PaisSerie" id="PaisSerieEdit" placeholder="Pais"   class="form-control form-control-sm" value="<%=Pais%>"></td>
          <td width="33%"><input type="text" name="AnoSerie" id="AnoSerieEdit" placeholder="Ano"   class="form-control form-control-sm" value="<%=Ano%>"></td>
          <td width="33%"><input type="text" name="TemporadaSerie" id="TemporadaSerieEdit"   placeholder="Temporada" class="form-control form-control-sm" value="<%=Temporadas%>"></td>
        </tr>
      </table>
    </div>

    <div id="divComplementoFilmesEdit" style="display:<%if trim(TipoMidia) = "Filmes" then%>block<%else%>none<%end if%>;">
      <table width="100%">
        <tr>
          <td colspan="2"><input type="text" name="TituloFilme" id="TituloFilmeEdit"   placeholder="Titulo do Filme" class="form-control form-control-sm" value="<%=TituloMidia%>"></td>
        </tr>
        <tr>
          <td width="50%"><input type="text" name="DiretorFilme" id="DiretorFilmeEdit"   placeholder="Nome do Diretor" class="form-control form-control-sm" value="<%=AutorDiretor%>"></td>
          <td width="50%"><input type="text" name="ElencoPrincipalFilme" id="ElencoPrincipalFilmeEdit"   placeholder="Elenco Principal" class="form-control form-control-sm" value="<%=Elenco%>"></td>
        </tr>
        <tr>
          <td width="50%"><input type="text" name="PaisFilme" id="PaisFilmeEdit" placeholder="Pais"   class="form-control form-control-sm" value="<%=Pais%>"></td>
          <td width="50%"><input type="text" name="AnoFilme" id="AnoFilmeEdit" placeholder="Ano"   class="form-control form-control-sm" value="<%=Ano%>"></td>
        </tr>
      </table>
    </div>

  </div>
  <table width="100%">
    <tr>
      <td width="30%" align="center" style="text-align:center;"><strong>Gerenciar Foto</strong>
        <div>
        <%
dim fs
set fs=Server.CreateObject("Scripting.FileSystemObject")
%> 

          <%
    if fs.FileExists(server.MapPath("/db/midia/"&rs("codMidia")&".jpg")) then
    %>
    <img src="<%="/db/midia/"&rs("codMidia")&".jpg"%>" alt="<%=rs("Titulo")%>" height="40"  title="<%=rs("Titulo")%>">
    <a onclick="fnEditFoto(<%=rs("codMidia")%>)" class="post-share-btn" style="padding:7px 15px 6px;border-radius: 20px;">Alterar Imagem</a>
    <%
    else
    %>
        <img src="<%="/db/midia/"&rs("TipoMidia")&".png"%>" alt="<%=rs("Titulo")%>" height="40" title="<%=rs("Titulo")%>">
        <a onclick="fnEditFoto(<%=rs("codMidia")%>)" class="post-share-btn" style="padding:7px 15px 6px;border-radius: 20px;">Criar Imagem</a>
    <%
    end if
    %>
<%
set fs=nothing
%>
          
        </div></td>
      <td width="25%"><strong>Nota</strong>
        <div>
          <Input type="number" min="1" max="10" name="Nota" id="NotaEdit" placeholder="Nota"   class="form-control form-control-sm"   value="<%=Nota%>">
        </div></td>
      <%if trim(rs_usuarios.Fields.Item("Tipo").Value) = "Administrador" then%>
        <td width="10%">
        <strong>Autorizar?</strong>
        <select name="ValidarEdit" onchange="fnVincularEdit(this.value)"  id="ValidarEdit" class="form-control form-control-sm">
        <option value="0" <%if trim(ValidarEdit) = "0" then%>selected="selected"<%end if%>>Pendente</option>
        <option value="1" <%if trim(ValidarEdit) = "1" then%>selected="selected"<%end if%>>Liberado</option>
        <option value="2" <%if trim(ValidarEdit) = "2" then%>selected="selected"<%end if%>>Negado</option>
        <option value="3" <%if trim(ValidarEdit) = "3" then%>selected="selected"<%end if%>>Vincular</option>
        </select>
        </td>
<%
Dim rs_outros
Dim rs_outros_cmd
Dim rs_outros_numRows

Set rs_outros_cmd = Server.CreateObject ("ADODB.Command")
rs_outros_cmd.ActiveConnection = MM_conn_STRING
rs_outros_cmd.CommandText = "SELECT * FROM tbl_midia Where Habil >=1 and Validar = 1 order by Titulo asc" 
rs_outros_cmd.Prepared = true

Set rs_outros = rs_outros_cmd.Execute
rs_outros_numRows = 0
%>
        <td width="20%">
        <strong>Vincular</strong>
        <select name="VincularEdit"  disabled="disabled" id="VincularEdit" class="form-control form-control-sm">
        <option value="">Selecione...</option>
        <%while not rs_outros.eof%>
        <option value="<%=rs_outros("codMidia")%>"><%=rs_outros("Titulo")%></option>
        <%
		rs_outros.movenext
		wend
		%>
        </select>
        </td>
        
        

<%
rs_outros.Close()
Set rs_outros = Nothing
%>
        
        
        <%else%>
        <input type="hidden" name="ValidarEdit" value="0" />
        <%end if%>
        
    </tr>
  </table>
  <div> 
    <hr>
    <textarea name="Conteudo" id="ConteudoEdit" autofocus class="share-field-big"  placeholder="Diga algo" style="height:15px; text-align:justify; padding:10px;"> <%=Descricao%></textarea>
  </div>
  <% End If ' end Not rs.EOF Or NOT rs.BOF %>
  <script>
  fnMostrarDivEdit('<%=Tipo%>')
  </script>
<%
rs.Close()
Set rs = Nothing
%>
<%
rs_usuarios.Close()
Set rs_usuarios = Nothing
%>