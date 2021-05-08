
    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="bi bi-finger-index"></i>
    </div>
    <!-- Scroll to Top End -->

    <!-- footer area start -->
    <footer class="d-none d-lg-block">
        <div class="footer-area reveal-footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="footer-wrapper">
                            <div class="footer-card position-relative">
                                <div class="friends-search">
                                    
                                        <input type="text" id="txtPesquisar" name="txtPesquisar" placeholder="Pesquise seus amigos" class="search-field" onkeyup="fnPesquisar(this.value)" onblur="fnPesquisar(this.value)">
                                        <button class="search-btn" onClick="fnPesquisar(document.getElementById('txtPesquisar').value)"><i class="flaticon-search"></i></button>
                                     
                                </div>
                                <div class="friend-search-list">
                                    <div class="frnd-search-title">
                                        <button class="frnd-search-icon"><i class="flaticon-settings"></i></button>
                                        <p>Buscar novos amigos</p>
                                        <button class="close-btn" data-close="friend-search-list"><i class="flaticon-cross-out"></i></button>
                                    </div>
                                    <div class="frnd-search-inner custom-scroll">
                                        <ul id="divPesquisa">
                                            Digite e pesquise em nossa base de amigos                                               
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card card-small mb-0 active-profile-wrapper"><strong>Posso ser seu amigo?</strong>
                                <div class="active-profiles-wrapper">
                                    <div class="active-profile-carousel slick-row-20 slick-arrow-style">
                                    
                                    
                                     <%
SQL = "select top 6 * from tbl_usuarios b Where Habil = 1 and Tipo = 'Usuario' and codUsuario not in (select codAmigo from tbl_usuarios_amigos Where Habil = 1 and codUsuario = "&rs_usuario("codUsuario")&") and codUsuario <> "&rs_usuario("codUsuario")&" order by Rnd(Int(Now()*[codUsuario])-Now()*[codUsuario])"


set rs = DbConn.Execute(sql)
%>

                                        <!-- profile picture end -->
                                                     <%

i = 0 
if rs.eof and rs.bof then
%>
              <div class="single-slide">
                                            <div class="profile-thumb">
                                            <img src="../../db/fotos/nophoto.png" onclick="alert('Nenhuma nova sugestão até o momento.')">
                                            </div>
                                            </div>
                                             
              <%
end if
%>

                                       <%while not rs.eof%>
                                       
                                        <%
                            if fs.FileExists(server.MapPath("/db/fotos/"&rs("codUsuario")&"_01.jpg")) then
								CaminhoFoto = "/db/fotos/"&rs("codUsuario")&"_01.jpg"
							else
								CaminhoFoto = "/db/fotos/nophoto.png"
                            end if
                            %>
                            
                            
                                        <div class="single-slide">
                                            <div class="profile-thumb active profile-active" onclick="fnPerfil('<%=rs("codUsuario")%>','<%=rs("NomeCompleto")%>','<%=CaminhoFoto%>','<%=rs("Cidade")%>','<%=rs("Estado")%>','<%=rs("Profissao")%>')">
                                                 
                                                    <figure class="profile-thumb-small" title="<%=rs("NomeCompleto")%>">
                                                       <img src="<%=CaminhoFoto%>">
                                                    </figure>
                                                    
                                                 
                                            </div>
                                        </div>
                                        <%rs.movenext
										wend%>
                                        <!-- profile picture end -->
 
                                    </div>
                                </div>
                            </div>
                            <div class="footer-card position-relative">
                                <div class="live-chat-inner">
                                    <div class="chat-text-field">
                                     
                                        <textarea class="live-chat-field custom-scroll share-text-field" placeholder="Deixe sua Dica" readonly="" name="share"  aria-disabled="true" data-toggle="modal" data-target="#textbox"></textarea>
                                        <button class="chat-message-send share-text-field"  aria-disabled="true" data-toggle="modal" data-target="#textbox" type="button" value="Enviar">
                                            <img src="/Views/css/profile_files/_img/plane.png" alt="">
                                        </button>
                                    </div>
                                    <div class="chat-output-box">
                                        <div class="live-chat-title">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb active">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="/db/fotos/nophoto.png" alt="" id="lblFoto" >
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->
                                            <div class="posted-author">
                                                <h6 class="author"><a href="#" id="lblNomeCompleto"></a></h6>
                                                <span class="active-pro" id="lblProfissao">Ativar</span>
                                            </div>
                                            <div class="live-chat-settings ml-auto">
                                                <button class="close-btn" data-close="chat-output-box"><i class="flaticon-cross-out"></i></button>
                                            </div>
                                        </div>
                                        <div class="message-list-inner">
                                            <ul class="message-list custom-scroll">
                                                <li class="text-friends">
                                                    <p id="lblTexto"></p>
                                                    <div class="message-time" id="lblData"></div>
                                                    <input name="lblcodPerfil" id="lblcodPerfil" type="hidden" value="0" />
                                                    <center>
                                                    <a href="javascript:fnAmigo2()" class="edit-btn">Amizade</a>
                                                    <a href="" class="edit-btn" id="lblNomeCompleto2">Ver Perfil</a>
                                                    </center>
                                                </li>
                                                     
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer area end -->
    <!-- footer area start -->
    <footer class="d-block d-lg-none">
        <div class="footer-area reveal-footer">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="mobile-footer-inner d-flex">
                            <div class="mobile-frnd-search">
                                <button class="search-toggle-btn"><i class="flaticon-search"></i></button>
                            </div>
                            <div class="mob-frnd-search-inner">
                                <form class="mob-frnd-search-box d-flex" action="/MeusAmigos" method="post">
                                    <input type="text" id="q" name="q" placeholder="Pesquise seus amigos" class="mob-frnd-search-field">
                                </form>
                                   
                            </div>
                            <div class="card card-small mb-0 active-profile-mob-wrapper">
                                <div class="active-profiles-mob-wrapper slick-row-10">
                                    <div class="active-profile-mobile">
                                    
                                    
                                    
                                    
                                    


<%
SQL = "select top 6 * from tbl_usuarios b Where Habil = 1 and Tipo = 'Usuario' and codUsuario not in (select codAmigo from tbl_usuarios_amigos Where Habil = 1 and codUsuario = "&rs_usuario("codUsuario")&") and codUsuario <> "&rs_usuario("codUsuario")&" order by Rnd(Int(Now()*[codUsuario])-Now()*[codUsuario])"


set rs = DbConn.Execute(sql)
%>

<!-- profile picture end -->
<%

i = 0 
if rs.eof and rs.bof then
%>
<div class="single-slide">
<div class="profile-thumb">
</div>
</div>

<div class="single-slide">
    <div class="profile-thumb active profile-active">
            <figure class="profile-thumb-small profile-active">
               <img src="../../db/fotos/nophoto.png" onclick="alert('Nenhuma nova sugestão até o momento.')">
            </figure>
    </div>
</div>
<%
end if
%>

<%while not rs.eof%>

<%
if fs.FileExists(server.MapPath("/db/fotos/"&rs("codUsuario")&"_01.jpg")) then
CaminhoFoto = "/db/fotos/"&rs("codUsuario")&"_01.jpg"
else
CaminhoFoto = "/db/fotos/nophoto.png"
end if
%>

 <div class="single-slide">
    <div class="profile-thumb active profile-active">
        <a href="/Perfil/<%=rs("codUsuario")%>">
            <figure class="profile-thumb-small profile-active">
                <img src="<%=CaminhoFoto%>">
            </figure>
        </a>
    </div>
</div>

 <%rs.movenext
wend%>
                                    
                                              
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer area end -->

    <!-- JS
============================================ -->

    <!-- Modernizer JS -->
    <script src="/Views/css/login_files/_js/modernizr-3.6.0.min.js"></script>
    <!-- jQuery JS -->
    <script src="/Views/css/login_files/_js/jquery-3.3.1.min.js"></script>
    <!-- Popper JS -->
    <script src="/Views/css/login_files/_js/popper.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="/Views/css/login_files/_js/bootstrap.min.js"></script>
    <!-- Slick Slider JS -->
    <script src="/Views/css/login_files/_js/slick.min.js"></script>
    <!-- nice select JS -->
    <script src="/Views/css/login_files/_js/nice-select.min.js"></script>
    <!-- audio video player JS -->
    <script src="/Views/css/login_files/_js/plyr.min.js"></script>
    <!-- perfect scrollbar js -->
    <script src="/Views/css/login_files/_js/perfect-scrollbar.min.js"></script>
    <!-- light gallery js -->
    <script src="/Views/css/login_files/_js/lightgallery-all.min.js"></script>
    <!-- image loaded js -->
    <script src="/Views/css/login_files/_js/imagesloaded.pkgd.min.js"></script>
    <!-- isotope filter js -->
    <script src="/Views/css/login_files/_js/isotope.pkgd.min.js"></script>
    <!-- Main JS -->
    <script src="/Views/css/login_files/_js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
	function fnEditPerfil(){
		Swal.fire({
			html:
			'<iframe width=100% height="550" src="/Editar" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' ,
			width: 700,
			height: 550,
			showConfirmButton: false
		})
	}
	function fnEditFoto(codMidia){
		Swal.fire({
			html:
			'<iframe width=100% height="350" src="/Views/Post/foto.asp?codMidia='+codMidia+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' ,
			width: 700,
			height: 350,
			showConfirmButton: false
		})
	}
	function fnAmigo(codAmigo){
		Swal.fire({
			html:
			'<iframe width=100% height="130" src="/Views/Perfil/Amigos.asp?codAmigo='+codAmigo+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' ,
			width: 500,
			height: 130,
			showConfirmButton: false
		})
	}
 	function fnEdit(codMidia){
		URLAjax = '/Post/Edit/'+codMidia+'';
		carregaAjax('divEdit',URLAjax)
		//alert(URLAjax);
	}
 	function fnComentarios(codMidia){
		Swal.fire({
		  html:
			'<iframe width=100% height="350" src="/Views/Post/Comentario.asp?codMidia='+codMidia+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' ,
		  width: 700,
		  height: 350,
		  showConfirmButton: false
		})
	}
	
<%
if session("Editar") <> "" then
%>
fnEdit("<%=session("Editar")%>")
$("#textboxEdit").modal({
    show: true
  });
<%
session("Editar") = ""
end if
%>	
	</script>

<%if trim(rs_usuario("Tipo")) = "Administrador" then%>
<script>
	function fnEditPerfilAdm(codUsuario){
		Swal.fire({
  html:
    '<iframe width=100% height="550" src="/Views/User/Editar.asp?codUsuario='+codUsuario+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' ,
  width: 700,
  height: 550,
  showConfirmButton: false
})
	}
	</script>
<%end if%>    
</body>

</html>
<%
rs_usuario.Close()
Set rs_usuario = Nothing
%>

<%
set fs=nothing
%>
<%
DbConn.Close()
Set rs = Nothing
%>

