<!--#include file="../inc/topo.asp"-->
<%
Dim rs_usuario_post__MMColParam
rs_usuario_post__MMColParam = "1"
If (Request.QueryString("id") <> "") Then 
  rs_usuario_post__MMColParam = Request.QueryString("id")
End If
%>
<%
Dim rs_usuario_post
Dim rs_usuario_post_cmd
Dim rs_usuario_post_numRows

Set rs_usuario_post_cmd = Server.CreateObject ("ADODB.Command")
rs_usuario_post_cmd.ActiveConnection = MM_conn_STRING
rs_usuario_post_cmd.CommandText = "SELECT * FROM tbl_usuarios WHERE codUsuario = ?" 
rs_usuario_post_cmd.Prepared = true
rs_usuario_post_cmd.Parameters.Append rs_usuario_post_cmd.CreateParameter("param1", 5, 1, -1, rs_usuario_post__MMColParam) ' adDouble

Set rs_usuario_post = rs_usuario_post_cmd.Execute
rs_usuario_post_numRows = 0
%>
<main>
<%
    if fs.FileExists(server.MapPath("/db/fotos/"&rs_usuario_post("codUsuario")&"_F.jpg")) then
		bgBanner = "/db/fotos/"&rs_usuario_post("codUsuario")&"_F.jpg"
    else
		bgBanner = "/Views/css/profile_files/profile-banner.jpg"
    end if
    %>
<div class="main-wrapper">
  <div class="profile-banner-large bg-img" data-bg="<%=bgBanner%>"> </div>
  <%Ocultar = "Ocultar"
	codUsuarioPerfil = rs_usuario_post("codUsuario")
	NomeCompleto = rs_usuario_post("NomeCompleto")
	Descricao=(rs_usuario_post.Fields.Item("Descricao").Value)
	Profissao=(rs_usuario_post.Fields.Item("Profissao").Value)
	Cidade=(rs_usuario_post.Fields.Item("Cidade").Value)
	Estado=(rs_usuario_post.Fields.Item("Estado").Value)
	Amigos=(rs_usuario_post.Fields.Item("Amigos").Value)
  %>
  <!--#include file="../inc/regua.asp"-->
  <div>
    <div class="secondary-menu-wrapper bg-white d-none d-md-block">
      <div class="main-menu-inner header-top-navigation"> <br>
        <br>
      </div>
    </div>
  </div>
  <div class="about-author-details">
    <div class="container">
      <div class="row">
        <div class="col-lg-3"> 
          <!--#include file="../inc/inc_user.asp"--> 
        </div>
        <div class="col-lg-9">
          <div class="about-description">
            <div class="tab-content">
              <div class="tab-pane fade active show" id="one">
                <div class="work-zone">
                  <div class="author-desc-title d-flex" style="min-height:70px;">
                    <h6 class="author"><a><%=rs_usuario_post("NomeCompleto")%></a></h6>
                    <%if trim(rs_usuario("codUsuario")) = trim(rs_usuario_post("codUsuario")) then%>
                    <div class="post-settings-bar" onclick="fnEditPerfil()"> <span></span> <span></span> <span></span> </div>
                    <%end if%>
                  </div>
                  <p>
                    <%FaleSobreMim=rs_usuario_post("FaleSobreMim")%>
                    <%if trim(FaleSobreMim) = "" or isNull(FaleSobreMim) then%>
                    <%if trim(rs_usuario("codUsuario")) = trim(rs_usuario_post("codUsuario")) then%>
                    Descreva aqui um pouco sobre você. <span  onclick="fnEditPerfil()" style="cursor:pointer;"><strong>Complete seu perfil clicando aqui</strong></span>
                    <%else%>
                    O dono do perfil ainda não complementou os dados. Em breve.
                    <%end if%>
                    <%else%>
                    <%=FaleSobreMim%>
                    <%end if%>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="photo-section">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="content-box">
            <h5 class="content-title">Meus artigos</h5>
            <div class="content-body">
              <%
                                set fs=Server.CreateObject("Scripting.FileSystemObject")

	Set DbConn = Server.CreateObject("ADODB.Connection")
	Set rs = Server.CreateObject("ADODB.Recordset")
	DbConn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=\\windows-pd-0001.fs.locaweb.com.br\WNFS-0001\bitn1\web\db\dbBITN.mdb" 
	SQL = "select a.*, b.NomeCompleto from tbl_midia a, tbl_usuarios b Where a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario and (a.codUsuario = "&rs_usuario_post("codUsuario")&")  order by a.codMidia desc"
	set rs = DbConn.Execute(sql)
%>
              <%

i = 0 
if rs.eof and rs.bof then
%>
              <center style="width:90%; margin-left:5%; text-align:center;">
                <div class="alert alert-success center-text">Nenhum artigo disponível</div>
              </center>
              <%
end if
%>
              <div class="row">
                <%
while not rs.eof%>

<div class="col-12 d-block d-md-none">
                <div class="friend-list-view"> 
                  <!-- profile picture end -->
                  <div class="profile-thumb"> <a href="/Post/<%=rs("codMidia")%>">
                    <figure class="profile-thumb-middle">
                      <%
                            if fs.FileExists(server.MapPath("/db/midia/"&rs("codMidia")&".jpg")) then
                            %>
                      <img src="<%="/db/midia/"&rs("codMidia")&".jpg"%>" alt="<%=rs("Titulo")%>" style="max-height:250px;">
                      <%else%>
                      <img src="/db/midia/<%=rs("TipoMidia")%>.png" style="max-height:250px;">
                      <%end if%>
					  
                    </figure>
                    </a> </div>
                  <!-- profile picture end -->
                  
                  <div class="posted-author">
                    <h6 class="author"><a href="/Post/<%=rs("codMidia")%>"><%=rs("Titulo")%></a></h6> 
                  </div>
                </div>
              </div>
              
              
              
				 

                <div class="col-12 col-md-3 mb-5 mb-md-1 d-none d-md-block">
                  <div class="gallery-toggle" style="text-align:center; float:left;">
                    <div style="text-align:center;"> <a href="/Post/<%=rs("codMidia")%>">
                      <%
                            if fs.FileExists(server.MapPath("/db/midia/"&rs("codMidia")&".jpg")) then
                            %>
                      <img src="<%="/db/midia/"&rs("codMidia")&".jpg"%>" alt="<%=rs("Titulo")%>" style="max-height:250px;">
                      <%else%>
                      <img src="/db/midia/<%=rs("TipoMidia")%>.png" style="max-height:250px;">
                      <%end if%>
                      </a> </div>
                    <div class="photo-gallery-caption" style="text-align:center;">
                      <h3 class="photos-caption" style="text-align:center;"><%=rs("Titulo")%></h3>
                    </div>
                  </div>
                </div>
                
                
                <% 
rs.movenext
wend%>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="friends-section">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="content-box">
            <h5 class="content-title">Meus Amigos</h5>
            <div class="content-body">
              <%
SQL = "select * from tbl_usuarios b Where Habil = 1 and Tipo = 'Usuario' and codUsuario in (select codAmigo from tbl_usuarios_amigos Where codUsuario = "&rs_usuario_post("codUsuario")&") order by Rnd(Int(Now()*[codUsuario])-Now()*[codUsuario])"
set rs = DbConn.Execute(sql)
%>
              <%

i = 0 
if rs.eof and rs.bof then
%>
              <center style="width:90%; margin-left:5%; text-align:center;">
                <div class="alert alert-success center-text">Nenhum amigo disponível</div>
              </center>
              <%
end if
%>			<div class="row">
              <%while not rs.eof %>
              <div class="col-12 col-md-3">
                <div class="friend-list-view"> 
                  <!-- profile picture end -->
                  <div class="profile-thumb"> <a href="/Perfil/<%=rs("codUsuario")%>/">
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
                    </a> </div>
                  <!-- profile picture end -->
                  
                  <div class="posted-author">
                    <h6 class="author"><a href="/Perfil/<%=rs("codUsuario")%>/">Nome Completo</a></h6>
                    
                    <%if rs_usuario_post("codUsuario") = rs_usuario("codUsuario") then%>
                     <button class="edit-frnd" onclick="fnAmigo(<%=rs("codUsuario")%>)" style="font-size:9px;"><i class="fas fa-user-times"></i> Remover</button> 
                    <%end if%>
                    
                    
                  </div>
                </div>
              </div>
              <%rs.movenext
										wend
										%>
            </div></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="friends-section">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="content-box">
            <h5 class="content-title">Amigos em Comum</h5>
            <div class="content-body">
              <%
'Sejam Usuarios do Sistema			  
SQL = "select * from tbl_usuarios b Where Habil = 1 and Tipo = 'Usuario' "

' Amigos dos meus amigos
SQL = SQL&" and ((codUsuario in (select codAmigo from tbl_usuarios_amigos Where codUsuario in (select codAmigo from tbl_usuarios_amigos Where codUsuario = "&rs_usuario_post("codUsuario")&"))) or "

'Goste das coisas que gosto
SQL = SQL&" codUsuario in (select codUsuario from tbl_midia_visitas Where codMidia in (select codMidia from tbl_midia_visitas Where codUsuario = "&rs_usuario_post("codUsuario")&")))"

'Não seja meu amigos
SQL = SQL&" and codUsuario not in (select codAmigo from tbl_usuarios_amigos Where codUsuario = "&rs_usuario_post("codUsuario")&") "

'Ordenado randomigo
SQL = SQL&" order by Rnd(Int(Now()*[codUsuario])-Now()*[codUsuario])"

set rs = DbConn.Execute(sql)
%>
              <%

i = 0 
if rs.eof and rs.bof then
%>
              <center style="width:90%; margin-left:5%; text-align:center;">
                <div class="alert alert-success center-text">Nenhum amigo em comum disponível</div>
              </center>
              <%
end if
%>			<div class="row">
              <%while not rs.eof %>
              <div class="col-12 col-md-3">
                <div class="friend-list-view"> 
                  <!-- profile picture end -->
                  <div class="profile-thumb"> <a href="/Perfil/<%=rs("codUsuario")%>/">
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
                    </a> </div>
                  <!-- profile picture end -->
                  
                  <div class="posted-author">
                    <h6 class="author"><a href="/Perfil/<%=rs("codUsuario")%>/">Nome Completo</a></h6>
                    <%if rs_usuario_post("codUsuario") = rs_usuario("codUsuario") then%>
                    <button class="edit-frnd" onclick="fnAmigo(<%=rs("codUsuario")%>)"><i class="fas fa-people-arrows"></i></button>
                    <%end if%>
                  </div>
                </div>
              </div>
              <%rs.movenext
										wend
										%>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="friends-section">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="content-box">
            <h5 class="content-title">Minhas Avaliações</h5>
            <div class="content-body">
              <%
 SQL = "select top 8 c.Titulo, a.*, b.NomeCompleto from tbl_midia_comentarios a, tbl_usuarios b, tbl_midia c Where c.codMidia = a.codMidia and c.Habil >=1 and a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario  and (a.codMidia in (select codMidia from tbl_midia Where codUsuario = "&rs_usuario_post("codUsuario")&") or a.codUsuario = "&rs_usuario_post("codUsuario")&") order by a.codComentario desc"
set rs = DbConn.Execute(sql)
%>
              <%

i = 0 
if rs.eof and rs.bof then
%>
              <center style="width:90%; margin-left:5%; text-align:center;">
                <div class="alert alert-success center-text">Nenhum Comentário disponível</div>
              </center>
              <%
end if
%>
              <div class="row">
              <%while not rs.eof %>
              <div class="col-12 col-md-4">
                <div class="friend-list-view"> 
                  <!-- profile picture end -->
                  <div class="profile-thumb"> <a href="/Perfil/<%=rs("codUsuario")%>/">
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
                    </a> </div>
                  <!-- profile picture end -->
                  
                  <div class="posted-author">
                    <h6 class="author"><a href="/Perfil/<%=rs("codUsuario")%>/">Nome Completo</a></h6>
                    <div><a href="/Post/<%=rs("codMidia")%>/"><%=rs("Titulo")%></a>
                      <div></h6>
                      <i><%=rs("Comentario")%></i>
                        </h6></div>
                    </div>
                  </div>
                </div>
              </div>
                  <%rs.movenext
										wend
										%>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--#include file="../inc/rodape.asp"-->
<%
rs_usuario_post.Close()
Set rs_usuario_post = Nothing
%>
