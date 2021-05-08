<div class="col-lg-3 order-3">
                        <aside class="widget-area">
                            <!-- widget single item start -->
                                <%
SQL = "select top 5 a.*, b.NomeCompleto from tbl_midia a, tbl_usuarios b Where a.Habil = 1 and b.Habil = 1 and a.Validar = 1 and a.codUsuario = b.codUsuario and a.codMidia not in (select codMidia from tbl_midia_visitas Where codUsuario = "&rs_usuario("codUsuario")&") order by Rnd(Int(Now()*[codMidia])-Now()*[codMidia])"


set rs = DbConn.Execute(sql)
%>
                            <div class="card widget-item">
                                <h4 class="widget-title">Recomendadas</h4>
                                <div class="widget-body">
                                    <ul class="like-page-list-wrapper">
                                    
                     <%if rs.eof and rs.bof then%>Nenhuma publicação recomendada no momento<%end if%>           

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
                                                <h3 class="list-title"><a href="/Post/<%=rs("codMidia")%>"><%=rs("Titulo")%></a></h3>
                                                <div><a href="/Post/<%=rs("codMidia")%>"><em><%=left(rs("TituloMidia"),200)%>...</em></a></div>
                                                <p class="list-subtitle">
    <%minutos=abs(datediff("n", now, rs("CriadoEm")))%> 
	<%horas=abs(datediff("h", now, rs("CriadoEm")))%> 
	<%dias=abs(datediff("d", now, rs("CriadoEm")))%> 
	<%if cdbl(minutos) = 0 then%>Agora<%end if%>
	<%if cdbl(minutos) = 1 then%>1 minuto atr&aacute;s<%end if%>
	<%if cdbl(minutos) > 1 and cdbl(minutos) < 60 then%><%=minutos%> minutos atr&aacute;s<%end if%>
	<%if cdbl(minutos) >=61 and cdbl(horas) <=23 then%><%=horas%> horas atr&aacute;s<%end if%>
	<%if cdbl(dias) >=2 then%><%=dias%> atr&aacute;s<%end if%> </p>
                                            </div>
                                        </li>
<%rs.movenext
wend%>                                        
    
    
                                    </ul>
                                </div>
                            </div>
                            
                                <%
SQL = "select top 8 c.titulo , a.*, b.NomeCompleto from tbl_midia_comentarios a, tbl_usuarios b, tbl_midia c Where a.codMidia = c.codMidia and a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario  and a.codMidia in (select codMidia from tbl_midia Where codUsuario = "&rs_usuario("codUsuario")&") order by a.codComentario desc"


set rs = DbConn.Execute(sql)
%>
                            <div class="card widget-item">
                                <h4 class="widget-title">Avaliações Recentes</h4>
                                <div class="widget-body">
                                    <ul class="like-page-list-wrapper">
                                    
                     <%if rs.eof and rs.bof then%>Nenhuma Avaliação no momento<%end if%>           

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
                                                <h3 class="list-title"><a href="/Post/<%=rs("codMidia")%>"><%=rs("Titulo")%></a></h3>
                                                <div><a href="/Post/<%=rs("codMidia")%>"><em><%=left(rs("Comentario"),200)%>...</em></a></div>
                                                <p class="list-subtitle">
    <%minutos=abs(datediff("n", now, rs("CriadoEm")))%> 
	<%horas=abs(datediff("h", now, rs("CriadoEm")))%> 
	<%dias=abs(datediff("d", now, rs("CriadoEm")))%> 
	<%if cdbl(minutos) = 0 then%>Agora<%end if%>
	<%if cdbl(minutos) = 1 then%>1 minuto atr&aacute;s<%end if%>
	<%if cdbl(minutos) > 1 and cdbl(minutos) < 60 then%><%=minutos%> minutos atr&aacute;s<%end if%>
	<%if cdbl(minutos) >=61 and cdbl(horas) <=23 then%><%=horas%> horas atr&aacute;s<%end if%>
	<%if cdbl(dias) >=2 then%><%=dias%> atr&aacute;s<%end if%> </p>
                                            </div>
                                        </li>
<%rs.movenext
wend%>                                        
    
    
                                    </ul>
                                </div>
                            </div>
                            <!-- widget single item end -->
 
                            <!-- widget single item end -->
<%
SQL = "select top 8 * from tbl_usuarios b Where Habil = 1 and Tipo = 'Usuario' and codUsuario in (select codAmigo from tbl_usuarios_amigos Where codUsuario = "&rs_usuario("codUsuario")&") order by Rnd(Int(Now()*[codUsuario])-Now()*[codUsuario])"
set rs = DbConn.Execute(sql)
%>
                            <!-- widget single item start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">Meus Amigos</h4>
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
                                            <button class="like-button">
                                                <img class="heart" src="/Views/css/profile_files/_img/heart.png" alt="">
                                                <img class="heart-color" src="/Views/css/profile_files/_img/heart-color.png" alt="">
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
                            <!-- widget single item end -->
                        </aside>
                    </div>