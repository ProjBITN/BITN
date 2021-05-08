<!--#include file="../inc/topo.asp"-->
<main>
  <%
    if fs.FileExists(server.MapPath("/db/fotos/"&rs_usuario("codUsuario")&"_F.jpg")) then
		bgBanner = "/db/fotos/"&rs_usuario("codUsuario")&"_F.jpg"
    else
		bgBanner = "/Views/css/profile_files/profile-banner.jpg"
    end if
    %>
  <div class="main-wrapper">
    <div class="profile-banner-large bg-img" data-bg="<%=bgBanner%>"> </div>
    <!--#include file="../inc/regua.asp"-->
    <div class="container">
      <div class="row">
        <div class="col-lg-3 order-2 order-lg-1"> 
          <!--#include file="../inc/lateral.asp"--> 
        </div>
        <div class="col-lg-6 order-1 order-lg-2">
          <%if Session("msg") <> "" then%>
          <div class="alert alert-success"><%=Session("msg")%>
            <%Session("msg") = ""%>
          </div>
          <%end if%>
          <!-- share box start -->
          <div class="card card-small">
            <div class="share-box-inner"> 
              <!-- Foto do Artigo end -->
              <div class="profile-thumb"> <a href="#">
                <figure class="profile-thumb-middle">
                  <%
    if fs.FileExists(server.MapPath("/db/fotos/"&rs_usuario("codUsuario")&"_01.jpg")) then
    %>
                  <img src="/db/fotos/<%=rs_usuario("codUsuario")%>_01.jpg">
                  <%
    else
    %>
                  <img src="../../db/fotos/nophoto.png">
                  <%
    end if
    %>
                </figure>
                </a> </div>
              <!-- Foto do Artigo end --> 
              
              <!-- share content box start -->
              <div class="share-content-box w-100">
                <form class="share-text-box" action="#">
                  <textarea readonly name="share" class="share-text-field" aria-disabled="true" placeholder="Deixe sua dica" data-toggle="modal" data-target="#textbox" id="email"></textarea>
                  <button class="btn-share" type="button" data-toggle="modal" data-target="#textbox" >Compartilhe</button>
                </form>
              </div>
              
              <!-- share content box end --> 
              <!-- Modal start --> 
              
              <!-- Modal end --> 
            </div>
          </div>
          <!-- share box end --> 
          
          <!-- post status start -->
          
          <%
						if isNull(codMidia) or trim(codMidia) = "" then
							codMidia = 0
						end if
						
						if isNull(TipoMidia) or trim(TipoMidia) = "" then
							TipoMidia = ""
						end if
						
						
						if trim(TipoMidia) = "amigos" then
							
							call fnAmigos(rs_usuario("codUsuario"), rs_usuario("Tipo"), q)
						
						else
								
							
							
							
							call fnPosts(codMidia, TipoMidia, rs_usuario("codUsuario"), rs_usuario("Tipo"), q)
							if cdbl(codMidia) > 0 then
							response.Write("<hr><strong>Avaliações</strong>")
							%>
			  <%
	SQL = "select a.*, b.NomeCompleto from tbl_midia_comentarios a, tbl_usuarios b Where a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario  and a.codMidia = "&codMidia&" order by a.Likes desc, a.codComentario desc"
	set rs = DbConn.Execute(sql)
	%>
			  <div class="card"> 
				<!-- post title start -->
				<%if rs.eof and rs.bof then%>
				<div class="alert alert-primary">Seja o primeiro a comentar</div>
				<%end if%>
				<%while not rs.eof%>
				<div class="post-title d-flex align-items-center"> 
				  <!-- Foto do Artigo end -->
				  <div class="profile-thumb"> <a href="/Perfil/<%=rs("codUsuario")%>">
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
				  <!-- Foto do Artigo end -->
				  <div style=" width:100%; border-bottom:#999 solid 1px; padding-bottom:5px; margin-bottom:5px;">
				  <div class="row">
				  <div class="posted-author col-6">
					<h6 class="author"><a href="/Perfil/<%=rs("codUsuario")%>/"><%=rs("NomeCompleto")%></a></h6>
					<em><%=rs("Comentario")%></em> <span class="post-time">
					<%minutos=abs(datediff("n", now, rs("CriadoEm")))%>
					<%horas=abs(datediff("h", now, rs("CriadoEm")))%>
					<%dias=abs(datediff("d", now, rs("CriadoEm")))%>
					<%if cdbl(minutos) = 0 then%>
					Agora
					<%end if%>
					<%if cdbl(minutos) = 1 then%>
					1 minuto atr&aacute;s
					<%end if%>
					<%if cdbl(minutos) > 1 and cdbl(minutos) < 60 then%>
					<%=minutos%> minutos atr&aacute;s
					<%end if%>
					<%if cdbl(minutos) >=61 and cdbl(horas) <=23 then%>
					<%=horas%> horas atr&aacute;s
					<%end if%>
					<%if cdbl(dias) >=2 then%>
					<%=dias%> atr&aacute;s
					<%end if%>
					</span> </div>
				
				<!-- post title start -->
				
				
	<div class="post-meta col-5 text-right">
	<ul class="comment-share-meta">
	<%
	SQL = "select * from tbl_midia_comentarios_likes a Where a.Habil = 1 and a.codUsuario = "&rs_usuario("codUsuario")&" and a.codComentario = "&rs("codComentario")&""
	set rs2 = DbConn.Execute(sql)
	if rs2.eof and rs2.bof then
	corLike = "#CCC"
	else
	corLike = "#069"
	end if
	
	%>        
	<li title="Curtidas">
	<button class="post-share" id="divLikeCom<%=rs("codComentario")%>" onclick="fnCurtirCom(<%=rs("codMidia")%>,<%=rs("codComentario")%>)">
	<i class="fa fa-thumbs-up" aria-hidden="true" style="color:<%=corLike%>"></i>
	<span><%=rs("Likes")%></span>
	</button>
	</li>
	</ul>
	
	</div>
	</div>
	</div>
			  
		</div>        
				
				<%rs.movenext
	wend
	%>
	<center>
				<div style="text-align:right"> <span class="edit-btn" onclick="fnComentarios(<%=codMidia%>)"><i class="bi bi-chat-bubble"></i> <span>Adicionar Comentários</span></span> </div>
				</center>
			  </div>
			  <%
							end if
							%>
			  <%
	if cdbl(codMidia) > 0 then
		SQL = "insert into tbl_midia_visitas (codMidia, codUsuario) values ("&codMidia&","&rs_usuario("codUsuario")&")"
		set rs = DbConn.Execute(sql)
	
		SQL = "update tbl_midia set Visualizacoes = Visualizacoes + 1 Where codMidia = "&codMidia&""
		set rs = DbConn.Execute(sql)
	end if
end if
						
%>
        </div>
        <!--#include file="../inc/lateral2.asp"--> 
        
      </div>
    </div>
  </div>
</main>
<!--#include file="../inc/rodape.asp"-->