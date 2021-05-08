<%
if trim(codUsuarioPerfil) = "" then
codUsuario = rs_usuario("codUsuario")
else
codUsuario = codUsuarioPerfil
end if
%>
<div class="profile-menu-area bg-white">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-3">
                            <div class="profile-picture-box">
                                <figure class="profile-picture">
                                    <a href="/Perfil/<%=codUsuario%>/">
                                        <%
    if fs.FileExists(server.MapPath("/db/fotos/"&codUsuario&"_P.jpg")) then
    %>
        <img src="/db/fotos/<%=codUsuario%>_P.jpg" style="width:100%; max-width:270px;">
    <%
    else
    %>
        <img src="/Views/css/profile_files/_img/profile-1.jpg" alt="Foto do Artigo">
    <%
    end if
    %>
                                        
                                        
                                    </a>
                                </figure>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 offset-lg-1">
                            <div class="profile-menu-wrapper">
                                <div class="main-menu-inner header-top-navigation">
                                    <nav>
                                        <ul class="main-menu">
                                            <li class="active"><a href="/Index">Atividades</a></li>
                                            <li><a href="/Livros">Livros</a></li>
                                            <li><a href="/Series">Series</a></li>
                                            <li><a href="/Filmes">Filmes</a></li> 
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <%if trim(rs_usuario("codUsuario")) = trim(codUsuario) then%>
                        <div class="col-lg-2 col-md-3 d-none d-md-block">
                            <div class="profile-edit-panel">
                                <a href="#"  onclick="fnEditPerfil()" class="edit-btn">Editar Perfil</a>
                            </div>
                        </div>
                        <%else%>
                        <%
SQL = "select * from tbl_usuarios_amigos Where Habil = 1 and codUsuario = "&rs_usuario("codUsuario")&" and codAmigo = "&codUsuario&""
set rs = DbConn.Execute(sql)
%>
                        <div class="col-lg-2 col-md-3 d-none d-md-block">
                            <div class="profile-edit-panel">
                                <a href="#"  onclick="fnAmigo(<%=codUsuario%>)" class="edit-btn"><%if rs.eof and rs.bof then%>Solicitar<%else%>Desfazer<%end if%> Amizade</a>
                            </div>
                        </div>
                        <%end if%>
                    </div>
                </div>
            </div>