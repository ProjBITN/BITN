<%
' *** Logout the current user.
MM_Logout = CStr(Request.ServerVariables("URL")) & "?MM_Logoutnow=1"
If (CStr(Request("MM_Logoutnow")) = "1") Then
  Session.Contents.Remove("MM_Username")
  Session.Contents.Remove("MM_UserAuthorization")
  MM_logoutRedirectPage = "/Sair"
  ' redirect with URL parameters (remove the "MM_Logoutnow" query param).
  if (MM_logoutRedirectPage = "") Then MM_logoutRedirectPage = CStr(Request.ServerVariables("URL"))
  If (InStr(1, UC_redirectPage, "?", vbTextCompare) = 0 And Request.QueryString <> "") Then
    MM_newQS = "?"
    For Each Item In Request.QueryString
      If (Item <> "MM_Logoutnow") Then
        If (Len(MM_newQS) > 1) Then MM_newQS = MM_newQS & "&"
        MM_newQS = MM_newQS & Item & "=" & Server.URLencode(Request.QueryString(Item))
      End If
    Next
    if (Len(MM_newQS) > 1) Then MM_logoutRedirectPage = MM_logoutRedirectPage & MM_newQS
  End If
  Response.Redirect(MM_logoutRedirectPage)
End If
%>
<%
if isNull(session("MM_Username")) or trim(session("MM_Username")) = "" then
	response.Redirect("/Logar")
end if
%>
<%
dim fs
set fs=Server.CreateObject("Scripting.FileSystemObject")
%>
<!--#include file="../../Connections/conn.asp" -->

<%
Set DbConn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")
DbConn.Open MM_conn_STRING
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
rs_usuario_cmd.CommandText = "SELECT * FROM tbl_usuarios WHERE Usuario = ? and Habil = 1 ORDER BY codUsuario ASC" 
rs_usuario_cmd.Prepared = true
rs_usuario_cmd.Parameters.Append rs_usuario_cmd.CreateParameter("param1", 200, 1, 255, rs_usuario__MMColParam) ' adVarChar

Set rs_usuario = rs_usuario_cmd.Execute
rs_usuario_numRows = 0
%>

<!doctype html> 
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>BITn - Sua Rede de Conhecimento Social</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="/Views/css/login_files/_img/logo.png">

    <!-- CSS
	============================================ -->
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/Views/css/profile_files/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="https://demo.hasthemes.com/adda-preview/adda/assets/css/vendor/bicon.min.css">
    <!-- Flat Icon CSS -->
    <link rel="stylesheet" href="https://demo.hasthemes.com/adda-preview/adda/assets/css/vendor/flaticon.css">
    <!-- audio & video player CSS -->
    <link rel="stylesheet" href="/Views/css/profile_files/plyr.css">
    <!-- Slick CSS -->
    <link rel="stylesheet" href="/Views/css/profile_files/slick.min.css">
    <!-- nice-select CSS -->
    <link rel="stylesheet" href="/Views/css/profile_files/nice-select.css">
    <!-- perfect scrollbar css -->
    <link rel="stylesheet" href="/Views/css/profile_files/perfect-scrollbar.css">
    <!-- light gallery css -->
    <link rel="stylesheet" href="/Views/css/profile_files/lightgallery.min.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="/Views/css/profile_files/style.css">
	<script src="https://kit.fontawesome.com/37bb99279b.js" crossorigin="anonymous"></script>
</head> 

<body>

    <!-- header area start -->
    <header>
        <div class="header-top sticky bg-white d-none d-lg-block">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-5">
                        <!-- header top navigation start -->
                        <div class="header-top-navigation">
                            <nav>
                                <ul>
                                    <li class="active"><a href="/Index">Pagina Inicial</a></li>
                                    <li class="msg-trigger"><a class="msg-trigger-btn" href="#a">Avaliações</a>
                                        <div class="message-dropdown" id="a">
                                            <div class="dropdown-title">
                                                <p class="recent-msg">Avaliações Recentes</p>
                                                
                                            </div>
                                            <ul class="dropdown-msg-list">
                                             <%
SQL = "select top 4 a.*, b.NomeCompleto from tbl_midia_comentarios a, tbl_usuarios b Where a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario  and a.codMidia in (select codMidia from tbl_midia Where codUsuario = "&rs_usuario("codUsuario")&") order by a.codComentario desc"
set rs = DbConn.Execute(sql)
%>
                                                    <!-- message content start -->
                                                    <%if rs.eof and rs.bof then%>
                                                    Nenhuma avaliação em seus posts até o momento
                                                    <%end if%>
                                                    <%while not rs.eof%>
                                                    
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <!-- profile picture end -->
                                                    <div class="profile-thumb">
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
                                                    </div>
                                                    <!-- profile picture end -->

                                                    <div class="msg-content">
                                                        <h6 class="author"><a href="/Perfil/<%=rs("codUsuario")%>"><%=rs("NomeCompleto")%></a></h6>
                                                        <p><%=rs("Comentario")%></p>
                                                    </div>
                                                    
                
                                                    <!-- message content end -->

                                                    <!-- message time start -->
                                                    <div class="msg-time">
                                                        <p><%minutos=abs(datediff("n", now, rs("CriadoEm")))%>
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
                <%end if%></p>
                                                    </div>
                                                    <!-- message time end -->
                                                </li>
                                                <%rs.movenext
												wend%>
                                                  
                                            </ul>
                                             
                                        </div>
                                    </li>
                                    <%if trim(rs_usuario("Tipo")) = "Administrador" then%>
                                    <li class="notification-trigger"><a class="msg-trigger-btn" href="#b">Validar Posts</a>
                                        <div class="message-dropdown" id="b">
                                            <div class="dropdown-title">
                                                <p class="recent-msg">Validar Posts</p>
                                                 
                                            </div>
                                            
                                             <%
'SQL = "select top 8 c.Titulo, a.*, b.NomeCompleto from tbl_midia_comentarios a, tbl_usuarios b, tbl_midia c Where a.codMidia = c.codMidia and c.Habil >=1 and a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario  order by a.codComentario desc"

SQL = "select top 8 a.*, b.NomeCompleto from tbl_midia a, tbl_usuarios b Where a.Habil = 1 and b.Habil = 1 and a.codUsuario = b.codUsuario and a.Validar = 0 order by a.codMidia asc"


set rs = DbConn.Execute(sql)
%>


                                            <ul class="dropdown-msg-list">
                                            <%if rs.eof and rs.bof then%>
                                                    Nenhuma autorização pendente até o momento
                                                    <%end if%>
                                                    
                                            <%while not rs.eof%>
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <!-- profile picture end -->
                                                    <div class="profile-thumb">
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
                                                    </div>
                                                    <!-- profile picture end -->

                                                    <!-- message content start -->
                                                    <div class="msg-content notification-content">
                                                        <a href="/Perfil/<%=rs("codUsuario")%>"><%=rs("NomeCompleto")%></a> 
                                                        <br><p><%=rs("Titulo")%></p>
                                                    </div>
                                                    <!-- message content end -->

                                                    <!-- message time start -->
                                                    <div class="msg-time">
                                                        <p><%minutos=abs(datediff("n", now, rs("CriadoEm")))%> 
	<%horas=abs(datediff("h", now, rs("CriadoEm")))%> 
	<%dias=abs(datediff("d", now, rs("CriadoEm")))%> 
	<%if cdbl(minutos) = 0 then%>Agora<%end if%>
	<%if cdbl(minutos) = 1 then%>1 minuto atr&aacute;s<%end if%>
	<%if cdbl(minutos) > 1 and cdbl(minutos) < 60 then%><%=minutos%> minutos atr&aacute;s<%end if%>
	<%if cdbl(minutos) >=61 and cdbl(horas) <=23 then%><%=horas%> horas atr&aacute;s<%end if%>
	<%if cdbl(dias) >=2 then%><%=dias%> atr&aacute;s<%end if%></p><%=rs("TipoMidia")%>
    <div><button onclick="fnEdit(<%=rs("codMidia")%>)" data-toggle="modal" data-target="#textboxEdit" >Autorizar</button></div>
                                                    </div>
                                                    <!-- message time end -->
                                                </li>
                                                <%rs.movenext
												wend%> 
                                            </ul> 
                                        </div>
                                    </li>
                                    <%end if%>
                                </ul>
                            </nav>
                        </div>
                        <!-- header top navigation start -->
                    </div>

                    <div class="col-md-2">
                        <!-- brand logo start -->
                        <div class="brand-logo text-center">
                            <a href="/Index">
                                <img src="/Views/css/login_files/_img/logo.png" alt="BITn">
                            </a>
                        </div>
                        <!-- brand logo end -->
                    </div>

                    <div class="col-md-5">
                        <div class="header-top-right d-flex align-items-center justify-content-end">
                            <!-- header top search start -->
                            <div class="header-top-search">
                                <form class="top-search-box" action="/Buscar" method="post">
                                    <input type="text" name="q" value="<%=trim(q)%>" style="text-transform: capitalize;" placeholder="Pesquisar Artigos" class="top-search-field">
                                    <button class="top-search-btn"><i class="flaticon-search"></i></button>
                                </form>
                            </div>
                            <!-- header top search end -->

                            <!-- profile picture start -->
                            <div class="profile-setting-box">
                                <div class="profile-thumb-small">
                                    <a href="javascript:void(0)" class="profile-triger">
                                        <figure>
                                            
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
                                    </a>
                                    <div class="profile-dropdown">
                                        <div class="profile-head">
                                            <h5 class="name"><a href="#"><%=(rs_usuario.Fields.Item("NomeCompleto").Value)%></a></h5>
                                            <a class="mail" href="#"><%=(rs_usuario.Fields.Item("Email").Value)%></a>
                                        </div>
                                        <div class="profile-body">
                                            <ul>
                                                <li><a href="/Perfil/<%=rs_usuario("codUsuario")%>/"><i class="flaticon-user"></i>Perfil</a></li>
                                                <li><a href="/Index"><i class="flaticon-document"></i>Atividades</a></li>
                                            </ul>
                                            <ul>
                                            <%if trim(rs_usuario("Tipo")) = "Administrador" then%>
            <li><a href="/Usuarios"><i class="flaticon-users"></i>Usuários</a></li>
            <li><a href="/Validar"><i class="flaticon-edit"></i>Validar Posts</a></li>                                                
            <li><a href="/Negados"><i class="fa fa-trash-o" aria-hidden="true"></i>Posts Negados</a></li>                                                      
            <li><a href="/Performance"><i class="flaticon-controls"></i>Performance</a></li>
                                            <%end if%>
                                                <li><a href="#" onClick="fnEditPerfil()"><i class="flaticon-settings"></i>Configuração</a></li>
                                                <li><a href="<%= MM_Logout %>"><i class="flaticon-unlock"></i>Logoff</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- profile picture end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header area end -->
    <!-- header area start -->
    <header>
        <div class="mobile-header-wrapper sticky d-block d-lg-none">
            <div class="mobile-header position-relative ">
                <div class="mobile-logo">
                    <a href="/Index">
                        <img src="/Views/css/login_files/_img/logo.png" alt="BITn">
                    </a>
                </div>
                <div class="mobile-menu w-100">
                    <ul>
                           
                        <li>
                            <button class="search-trigger">
                                <i class="search-icon flaticon-search"></i>
                                <i class="close-icon flaticon-cross-out"></i>
                            </button>
                            <div class="mob-search-box">
                                <form class="mob-search-inner" action="/Buscar" method="post"> 
                                    <input type="text" name="q" value="<%=trim(q)%>" style="text-transform: capitalize;" placeholder="Pesquisar Artigos" class="mob-search-field">
                                    <button class="mob-search-btn"><i class="flaticon-search"></i></button>
                                </form>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="mobile-header-profile">
                    <!-- profile picture end -->
                    <div class="profile-thumb profile-setting-box">
                        <a href="javascript:void(0)" class="profile-triger">
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
                        </a>
                        <div class="profile-dropdown text-left">
                            <div class="profile-head">
                                <h5 class="name"><a href="#"><%=rs_usuario("NomeCompleto")%></a></h5>
                                <a class="mail" href="#"><%=rs_usuario("Email")%></a>
                            </div>
                            <div class="profile-body">
                                <ul>
                                    <li><a href="/Perfil/<%=rs_usuario("codUsuario")%>/"><i class="flaticon-user"></i>Perfil</a></li>
                                    <li><a href="/Index"><i class="flaticon-document"></i>Atividades</a></li>
                                </ul>
                                <ul>
									<%if trim(rs_usuario("Tipo")) = "Administrador" then%>
            <li><a href="/Usuarios"><i class="flaticon-users"></i>Usuários</a></li>
            <li><a href="/Validar"><i class="flaticon-edit"></i>Validar Posts</a></li>                                                
            <li><a href="/Negados"><i class="fa fa-trash-o" aria-hidden="true"></i>Posts Negados</a></li>                                                
            <li><a href="/Performance"><i class="flaticon-controls"></i>Performance</a></li>
                                    <%end if%>
                                    
                                    <li><a href="#" onClick="fnEditPerfil()"><i class="flaticon-settings"></i>Configuração</a></li>
                                    <li><a href="<%= MM_Logout %>"><i class="flaticon-unlock"></i>Efetuar Logoff</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- profile picture end -->
                </div>
            </div>
        </div>
    </header>
    <!-- header area end -->
