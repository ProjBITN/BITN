<% 
class HomeController
 Dim Model
 Dim ViewData
 private sub Class_Initialize()
    Set ViewData = Server.CreateObject("Scripting.Dictionary")
 end sub

 private sub Class_Terminate()
 end sub
 
 public Sub Index()
    Model = Session("NomeCompleto")
     %>   <!--#include file="../views/Home/Index.asp" --> <%
 End Sub
 
 public Sub About()
    if Session("sessionCounter")="" then
       Session("sessionCounter") = 1
    Else
        Session("sessionCounter") = Session("sessionCounter") + 1
    End If
    Model = Session("sessionCounter")
    %>   <!--#include file="../views/Home/About.asp" --> <%
 End Sub
 
 public Sub Post(vars)
codMidia=request.QueryString("id")
%> 
<!--#include file="../views/Home/Index.asp" -->  <%
 End Sub
 
 public Sub editPost(vars) 
codMidia=request.QueryString("id")
%> 
<!--#include file="../views/Home/Index.asp" -->  <%
 End Sub
 
public Sub Livros()
TipoMidia="Livros"
%> 
<!--#include file="../views/Home/Index.asp" -->  <%
 End Sub
 
public Sub Filmes()
TipoMidia="Filmes"
%> 
<!--#include file="../views/Home/Index.asp" -->  <%
 End Sub
 
public Sub Series()
TipoMidia="Series"
%> 
<!--#include file="../views/Home/Index.asp" -->  <%
 End Sub
 
 public Sub Buscar() 
 	TipoMidia = "busca"
	q=request.Form("q")
%> 
<!--#include file="../views/Home/Index.asp" -->  <%
 End Sub
 
 public Sub MeusAmigos()  
 	TipoMidia = "amigos"
	q=request.Form("q") 
%> 
<!--#include file="../views/Home/Index.asp" -->  <%
 End Sub
 Public Sub AbandonSession()
   Session.Abandon()
   Response.Redirect("?controller=Home&action=About")
 End Sub
%>
<%
function strReplaceBusca(Valor, q)
	if trim(q) <> "" then
		strReplaceBusca = "<span class=""capitalize"">"&trim(replace(lcase(Valor),lcase(q),"<span class=""vermelho"">"&lcase(q)&"</span>"))&"</span>"
		else
		strReplaceBusca = Valor
	end if
	
end function

function fnAmigos(codUsuario, TipoUsuario, q)
	%>
<style>
.capitalize{
	text-transform: capitalize;
}

.vermelho{
	color:#900;
	font-weight:bolder;
}
</style> 
<%
	'response.Write("codMidia: "&codMidia)
	'response.Write("TipoMidia: "&TipoMidia)
	'response.Write("codUsuario: "&codUsuario)
	'response.Write("TipoUsuario: "&TipoUsuario)
	'response.Write("q: "&q)
	
	set fs=Server.CreateObject("Scripting.FileSystemObject")

	Set DbConn = Server.CreateObject("ADODB.Connection")
	Set rs = Server.CreateObject("ADODB.Recordset")
	Set rs2 = Server.CreateObject("ADODB.Recordset")
	DbConn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=\\windows-pd-0001.fs.locaweb.com.br\WNFS-0001\bitn1\web\db\dbBITN.mdb" 
	SQL = "select * from tbl_usuarios Where Habil = 1 and NomeCompleto like '%"&q&"%' order by NomeCompleto desc"
	set rs = DbConn.Execute(sql)
%>

<%

i = 0 
if rs.eof and rs.bof then
	%>
<div class="card widget-item">
    <h4 class="widget-title">Pesquisando Amigos</h4>
	<div class="alert alert-success center-text">Nenhum amigo localizado</div>
</div>
	<%
else
%>
<div class="card widget-item">
<h4 class="widget-title">Pesquisando Amigos</h4>
<div class="widget-body">
    <%if rs.eof and rs.bof then%>
    Nenhum amigo adicionado
    <%else%>
    <ul class="like-page-list-wrapper">
    <%while not rs.eof%>
        <li class="unorder-list">
            <!-- Foto do Artigo end -->
            <div class="profile-thumb">
                <a href="/Perfil/<%=rs("codUsuario")%>/">
                    <figure class="profile-thumb-small">
<%
if fs.FileExists(server.MapPath("/db/fotos/"&rs("codUsuario")&"_01.jpg")) then
%>
<img src="/db/fotos/<%=rs("codUsuario")%>_01.jpg">
<%
else
%>
<img src="../../db/fotos/nophoto.png">
<%
end if
%>
                    </figure>
                </a>
            </div>
            <!-- Foto do Artigo end -->

            <div class="unorder-list-info">
                <h3 class="list-title"><a href="/Perfil/<%=rs("codUsuario")%>/"><%=rs("NomeCompleto")%></a></h3>
                <p class="list-subtitle"><a href="/Perfil/<%=rs("codUsuario")%>/"><%if isNull(rs("UltimoPost")) or trim(rs("UltimoPost")) = "" then%>Nenhum post no momento<%else%>Último Post em <%=day(rs("UltimoPost"))%>/<%=month(rs("UltimoPost"))%><%end if%></a></p>
            </div>
            <button class="like-button"><a href="/Perfil/<%=rs("codUsuario")%>/" class="edit-btn" style="padding:5px; color:#FFF;">Ver Perfil</a></button>
            </button>
        </li>
    <%
    rs.movenext
    wend
    %>    
    </ul>
    <%end if%>
</div>
</div>
<%    
end if

 %>
 <%
end function

function fnPosts(codMidia, TipoMidia, codUsuario, TipoUsuario, q)
%>
<style>
.capitalize{
	text-transform: capitalize;
}

.vermelho{
	color:#900;
	font-weight:bolder;
}
</style> 
<%
	'response.Write("codMidia: "&codMidia)
	'response.Write("TipoMidia: "&TipoMidia)
	'response.Write("codUsuario: "&codUsuario)
	'response.Write("TipoUsuario: "&TipoUsuario)
	'response.Write("q: "&q)
	
	set fs=Server.CreateObject("Scripting.FileSystemObject")

	Set DbConn = Server.CreateObject("ADODB.Connection")
	Set rs = Server.CreateObject("ADODB.Recordset")
	Set rs2 = Server.CreateObject("ADODB.Recordset")
	DbConn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=\\windows-pd-0001.fs.locaweb.com.br\WNFS-0001\bitn1\web\db\dbBITN.mdb" 
	if cdbl(codMidia) = 0 then
		if trim(TipoMidia) = "busca" then
			if trim(q) = "" then
				SQL = "select top 1 a.*, b.NomeCompleto from tbl_midia a, tbl_usuarios b Where a.Habil = -1 and b.Habil = 1 and a.codUsuario = b.codUsuario"
			else
				SQL = "select a.*, b.NomeCompleto  from tbl_midia a, tbl_usuarios b Where a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario and (a.Validar = 1 or a.codUsuario = "&codUsuario&") and (a.TipoMidia like '%"&q&"%' or a.Titulo like '%"&q&"%' or a.TituloMidia like '%"&q&"%' or b.NomeCompleto like '%"&q&"%') order by a.codMidia desc"
			end if
		elseif trim(TipoMidia) = "" then
			SQL = "select a.*, b.NomeCompleto  from tbl_midia a, tbl_usuarios b Where a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario and (a.Validar = 1 or a.codUsuario = "&codUsuario&") order by a.codMidia desc"
		else
			SQL = "select a.*, b.NomeCompleto  from tbl_midia a, tbl_usuarios b Where a.TipoMidia = '"&TipoMidia&"' and a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario  and (a.Validar = 1 or a.codUsuario = "&codUsuario&") order by a.codMidia desc"
		end if
	else
	SQL = "select a.*, b.NomeCompleto  from tbl_midia a, tbl_usuarios b Where a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario and a.codMidia = "&codMidia&" and (a.Validar = 1 or a.codUsuario = "&codUsuario&" or '"&TipoUsuario&"' = 'Administrador')  order by a.codMidia desc"
	end if
	set rs = DbConn.Execute(sql)
%>

<%

i = 0 
if rs.eof and rs.bof then
	if trim(TipoMidia) = "busca" then
	%>
	<div class="alert alert-success center-text">Nenhum post disponível para essa pesquisa</div>
	<%
	else
	%>
	<div class="alert alert-success center-text">Nenhum post disponível</div>
	<%
	end if
end if

while not rs.eof%>
<div class="card">
<!-- post title start -->
<div class="post-title d-flex align-items-center">
<!-- Foto do Artigo end -->
<div class="profile-thumb">
	<a href="/Perfil/<%=rs("codUsuario")%>/">
		<figure class="profile-thumb-middle">
		   <%
if fs.FileExists(server.MapPath("/db/fotos/"&rs("codUsuario")&"_01.jpg")) then
%>
<img src="/db/fotos/<%=rs("codUsuario")%>_01.jpg">
<%
else
%>
<img src="../../db/fotos/nophoto.png">
<%
end if
%>
		</figure>
	</a>
</div>
<!-- Foto do Artigo end -->

<div class="posted-author">
	<h6 class="author"><a href="/Perfil/<%=rs("codUsuario")%>/"><%=strReplaceBusca(rs("NomeCompleto"),q)%></a></h6>
	<span class="post-time">
	<%minutos=abs(datediff("n", now, rs("CriadoEm")))%> 
	<%horas=abs(datediff("h", now, rs("CriadoEm")))%> 
	<%dias=abs(datediff("d", now, rs("CriadoEm")))%> 
	<%if cdbl(minutos) = 0 then%>Agora<%end if%>
	<%if cdbl(minutos) = 1 then%>1 minuto atr&aacute;s<%end if%>
	<%if cdbl(minutos) > 1 and cdbl(minutos) < 60 then%><%=minutos%> minutos atr&aacute;s<%end if%>
	<%if cdbl(minutos) >=61 and cdbl(horas) <=23 then%><%=horas%> horas atr&aacute;s<%end if%>
	<%if cdbl(dias) >=2 then%><%=dias%> atr&aacute;s<%end if%>
	
	</span>
</div>

<div class="post-settings-bar">
	<span></span>
	<span></span>
	<span></span>
	<div class="post-settings arrow-shape">
		<ul>
			<li><button onclick="fnComentarios(<%=rs("codMidia")%>)">Avaliar</button></li>
            <%if trim(rs("codUsuario")) = trim(codUsuario) or  trim(TipoUsuario) = "Administrador" then%>
			<li><button onclick="fnEdit(<%=rs("codMidia")%>)" data-toggle="modal" data-target="#textboxEdit" >Editar Post</button></li> 
            <%end if%>
		</ul>
	</div>
</div>
</div>
<!-- post title start -->
<div class="post-content">
<a href="/Post/<%=rs("codMidia")%>" style="text-decoration:none; color:#333;">
<p class="title"><strong><%=strReplaceBusca(rs("Titulo"),q)%></strong></p>
<p class="post-desc" style="text-align:justify; text-justify:distribute;">
	<%=rs("Descricao")%>
</p>

<%
if fs.FileExists(server.MapPath("/db/midia/"&rs("codMidia")&".jpg")) then
%>

<div class="post-thumb-gallery img-gallery">
	<div class="row no-gutters">
		<div class="col-12">
			<figure class="post-thumb">
					<img src="<%="/db/midia/"&rs("codMidia")&".jpg"%>" alt="<%=rs("Titulo")%>">
			</figure>
		</div>
	</div>
</div>
<%
end if
%>
</a>

<%if cdbl(codMidia) > 0 then%>
<%if trim(rs("TipoMidia")) = "Livros" then%><br />
      <table width="100%" class="table table-stripped table-sm table-bordered">
        <tr>
          <td colspan="2"><strong>Título: </strong><%=rs("TituloMidia")%></td>
        </tr>
        <tr>
          <td width="50%"><strong>Autor</strong><div><%=rs("AutorDiretor")%></div></td>
          <td width="50%"><strong>Editora</strong><div><%=rs("Editora")%></div></td>
        </tr>
        <tr>
          <td width="50%"><strong>País</strong><div><%=rs("Pais")%></div></td>
          <td width="50%"><strong>Ano</strong><div><%=rs("Ano")%> </div></td>
        </tr>
      </table>
<%end if%>    

<%if trim(rs("TipoMidia")) = "Series" then%><br />
      <table width="100%" class="table table-stripped table-sm table-bordered">
        <tr>
          <td colspan="2"><strong>Título: </strong><%=rs("TituloMidia")%></td>
        </tr>
        <tr>
          <td width="50%"><strong>Diretor: </strong><div><%=rs("AutorDiretor")%></div></td>
          <td width="50%"><strong>Elenco: </strong><div><%=rs("Elenco")%></div></td>
        </tr>
      </table>
      <table width="100%" class="table table-stripped table-sm table-bordered">
        <tr>
          <td width="33%"><strong>País: </strong><div><%=rs("Pais")%></div></td>
          <td width="33%"><strong>Ano: </strong><div><%=rs("Ano")%></div></td>
          <td width="33%"><strong>Temporada: </strong><div><%=rs("Temporadas")%></div></td>
        </tr>
      </table>
<%end if%>    


<%if trim(rs("TipoMidia")) = "Filmes" then%><br />
      <table width="100%" class="table table-stripped table-sm table-bordered">
       <tr>
          <td colspan="2"><strong>Título: </strong> <%=rs("TituloMidia")%> </td>
        </tr>
        <tr>
          <td width="50%"><strong>Diretor: </strong><div><%=rs("AutorDiretor")%></div></td>
          <td width="50%"><strong>Elenco: </strong><div><%=rs("Elenco")%></div></td>
        </tr>
        <tr>
          <td width="50%"><strong>País</strong><div><%=rs("Pais")%></div></td>
          <td width="50%"><strong>Ano</strong><div><%=rs("Ano")%></div></td>
        </tr>
      </table>
<%end if%>    
      
 <%end if%>

<div class="post-meta">
	<button class="post-meta-like">
		<i class="fa fa-eye" aria-hidden="true"></i>
		<span><%=rs("Visualizacoes")%> visualizações</span>
		<strong><%=rs("Visualizacoes")%></strong>
	</button>
	<ul class="comment-share-meta">
		<li title="Comentários">
			<button class="post-comment" onclick="fnComentarios(<%=rs("codMidia")%>)">
				<i class="fa fa-commenting" aria-hidden="true"></i>
				<span><%=rs("Comentarios")%></span>
			</button>
		</li>

		<li title="Notas">
			<button class="post-share">
				<i class="fa fa-star" aria-hidden="true"></i>
				<span><%=rs("Nota")%></span>
			</button>
		</li>
<%
	SQL = "select * from tbl_midia_likes a Where a.Habil = 1 and a.codUsuario = "&codUsuario&" and a.codMidia = "&rs("codMidia")&""
	set rs2 = DbConn.Execute(sql)
	if rs2.eof and rs2.bof then
		corLike = "#CCC"
	else
		corLike = "#069"
	end if
	
%>        
        <li title="Curtidas">
			<button class="post-share" id="divLike<%=rs("codMidia")%>" onclick="fnCurtir(<%=rs("codMidia")%>)">
				<i class="fa fa-thumbs-up" aria-hidden="true" style="color:<%=corLike%>"></i>
				<span><%=rs("Likes")%></span>
			</button>
		</li>
	</ul>
    
</div>
</div> 
</div>  
<% 
rs.movenext
wend%>
<%end function%> 
<%
End Class
%>
