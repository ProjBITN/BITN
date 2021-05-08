
<aside class="widget-area profile-sidebar">
 <!--#include file="inc_user.asp"-->
                            <!-- widget single item start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">Meus Últimos Posts</h4>
                                <div class="widget-body">
                                    <div class="sweet-galley img-gallery">
                                        <div class="row row-5">
                                         <%
SQL = "select top 8 a.*, b.NomeCompleto from tbl_midia a, tbl_usuarios b Where a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario  and a.codUsuario = "&rs_usuario("codUsuario")&" order by a.codMidia desc"
set rs = DbConn.Execute(sql)
%>
<%while not rs.eof%>
                                            <div class="col-4">
                                                <div class="gallery-tem">
                                                    <figure class="post-thumb">
                                                        <a class="gallery-selector" href="/Post/<%=rs("codMidia")%>">
                                                           
                                                           <%
    if fs.FileExists(server.MapPath("/db/midia/"&rs("codMidia")&".jpg")) then
    %>
    <img src="<%="/db/midia/"&rs("codMidia")&".jpg"%>" alt="<%=rs("Titulo")%>" style="max-height:70px;" title="<%=rs("Titulo")%>">
    <%
    else
    %>
        <img src="<%="/db/midia/"&rs("TipoMidia")&".png"%>" alt="<%=rs("Titulo")%>" title="<%=rs("Titulo")%>">
    <%
    end if
    %>
                                                           
                                                            
                                                        </a>
                                                    </figure>
                                                </div>
                                            </div>
                                            <%rs.movenext
											wend
											%>
                                            <div class="col-4">
                                                <div class="gallery-tem">
                                                    <figure class="post-thumb">
                                                        <a class="gallery-selector"  data-toggle="modal" data-target="#textbox" style="cursor:pointer;" >
                                                            <img src="/db/midia/add.png" alt="Adicionar Post" title="Adicionar Post">
                                                        </a>
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- widget single item end -->

                            <!-- widget single item start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">Últimos Visitados</h4>
                                <div class="widget-body">
                                
                                   <%
SQL = "select top 10 a.codMidia, a.Titulo, a.TipoMidia from tbl_midia a, tbl_midia_visitas b Where a.Habil = 1 and a.codMidia = b.codMidia and b.codUsuario = "&rs_usuario("codUsuario")&" group by a.codMidia, a.Titulo, a.TipoMidia order by max(b.DataVisita) desc"
set rs = DbConn.Execute(sql)
%>
<%if rs.eof and rs.bof then%>Nenhum post visitado<%else%>

                                    <ul class="like-page-list-wrapper">

<%while not rs.eof%>
		<li class="unorder-list">
                                            <!-- Foto do Artigo end -->
                                            <div class="profile-thumb">
                                                <a href="/Post/<%=rs("codMidia")%>">
                                                    <figure class="profile-thumb-small">
                                                         <%
    if fs.FileExists(server.MapPath("/db/midia/"&rs("codMidia")&".jpg")) then
    %>
    <img src="<%="/db/midia/"&rs("codMidia")&".jpg"%>" alt="<%=rs("Titulo")%>"  title="<%=rs("Titulo")%>">
    <%
    else
    %>
        <img src="<%="/db/midia/"&rs("TipoMidia")&".png"%>" alt="<%=rs("Titulo")%>" title="<%=rs("Titulo")%>">
    <%
    end if
    %>
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- Foto do Artigo end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="/Post/<%=rs("codMidia")%>"><%=rs("Titulo")%></a></h3>
                                                <p class="list-subtitle"><a href="/Post/<%=rs("codMidia")%>"><%=rs("TipoMidia")%></a></p>
                                            </div>
                                        </li>
                                        <%rs.movenext
										wend%>
                                        
                                    </ul>
                                    <%end if%>
                                </div>
                            </div>
                            <!-- widget single item end -->
                        </aside>
<!--#include file="addPost.asp"-->