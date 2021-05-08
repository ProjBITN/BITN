<!--#include file="../../Connections/conn.asp" -->
<%
Dim MM_editAction
MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Server.HTMLEncode(Request.QueryString)
End If

' boolean to abort record edit
Dim MM_abortEdit
MM_abortEdit = false
%>
<%
' *** Redirect if username exists
MM_flag = "MM_insert"
If (CStr(Request(MM_flag)) <> "") Then
  Dim MM_rsKey
  Dim MM_rsKey_cmd
    
  MM_dupKeyRedirect = "/Logar"
  MM_dupKeyUsernameValue = CStr(Request.Form("Usuario"))
  Set MM_rsKey_cmd = Server.CreateObject ("ADODB.Command")
  MM_rsKey_cmd.ActiveConnection = MM_conn_STRING
  MM_rsKey_cmd.CommandText = "SELECT Usuario FROM tbl_usuarios WHERE Usuario = ? and Habil = 1"
  MM_rsKey_cmd.Prepared = true
  MM_rsKey_cmd.Parameters.Append MM_rsKey_cmd.CreateParameter("param1", 200, 1, 255, MM_dupKeyUsernameValue) ' adVarChar
  Set MM_rsKey = MM_rsKey_cmd.Execute
  If Not MM_rsKey.EOF Or Not MM_rsKey.BOF Then 
    ' the username was found - can not add the requested username
    MM_qsChar = "?"
    If (InStr(1, MM_dupKeyRedirect, "?") >= 1) Then MM_qsChar = "&"
    MM_dupKeyRedirect = MM_dupKeyRedirect & MM_qsChar & "requsername=" & MM_dupKeyUsernameValue
	Session("Msg") = "Usuário Invalido"
    Response.Redirect("/Logar")
  End If
  MM_rsKey.Close
End If
%>

<%
If (CStr(Request("MM_insert")) = "form2") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_conn_STRING
    MM_editCmd.CommandText = "INSERT INTO tbl_usuarios (NomeCompleto, Email, DataNascimento, Cidade, Estado, Usuario, Senha, AlteradoEm, CriadoEm, Habil, Likes, Tipo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 202, 1, 255, Request.Form("NomeCompleto")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 202, 1, 255, Request.Form("Email")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 135, 1, -1, Request.Form("DataNascimento")) ' adDBTimeStamp
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param4", 202, 1, 255, Request.Form("Cidade")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param5", 202, 1, 255, Request.Form("Estado")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param6", 202, 1, 255, Request.Form("Usuario")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param7", 202, 1, 255, Request.Form("Senha")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param8", 135, 1, -1, Request.Form("AlteradoEm")) ' adDBTimeStamp
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param9", 135, 1, -1, Request.Form("CriadoEm")) ' adDBTimeStamp
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param10", 202, 1, 255, Request.Form("Habil")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param11", 5, 1, -1, Request.Form("Likes")) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param12", 202, 1, 255, Request.Form("Tipo")) ' adVarWChar
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "/Index"
	Session("MM_Username") = Request.Form("Usuario")
	Session("NomeCompleto") = Request.Form("NomeCompleto")
	Session("Cidade") = Request.Form("Cidade")
	Session("Estado") = Request.Form("Estado")
	Session("codUsuario") = 0
	Session("Tipo") = Request.Form("Tipo")
	
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl 
      Else
        MM_editRedirectUrl = MM_editRedirectUrl 
      End If
    End If
    Response.Redirect(MM_editRedirectUrl)
  End If
End If
%>
<%
' *** Validate request to log in to this site.
MM_LoginAction = Request.ServerVariables("URL")
If Request.QueryString <> "" Then MM_LoginAction = MM_LoginAction + "?" + Server.HTMLEncode(Request.QueryString)
MM_valUsername = CStr(Request.Form("Usuario"))
If MM_valUsername <> "" Then
  Dim MM_fldUserAuthorization
  Dim MM_redirectLoginSuccess
  Dim MM_redirectLoginFailed
  Dim MM_loginSQL
  Dim MM_rsUser
  Dim MM_rsUser_cmd
  
  MM_fldUserAuthorization = ""
  MM_redirectLoginSuccess = "/Index"
  MM_redirectLoginFailed = "/Logar/Erro"

  MM_loginSQL = "SELECT * "
  If MM_fldUserAuthorization <> "" Then MM_loginSQL = MM_loginSQL & "," & MM_fldUserAuthorization
  MM_loginSQL = MM_loginSQL & " FROM tbl_usuarios WHERE Usuario = ? AND Senha = ? and Habil = 1"
  Set MM_rsUser_cmd = Server.CreateObject ("ADODB.Command")
  MM_rsUser_cmd.ActiveConnection = MM_conn_STRING
  MM_rsUser_cmd.CommandText = MM_loginSQL
  MM_rsUser_cmd.Parameters.Append MM_rsUser_cmd.CreateParameter("param1", 200, 1, 255, MM_valUsername) ' adVarChar
  MM_rsUser_cmd.Parameters.Append MM_rsUser_cmd.CreateParameter("param2", 200, 1, 255, Request.Form("Senha")) ' adVarChar
  MM_rsUser_cmd.Prepared = true
  Set MM_rsUser = MM_rsUser_cmd.Execute

  If Not MM_rsUser.EOF Or Not MM_rsUser.BOF Then 
    ' username and password match - this is a valid user
    Session("MM_Username") = MM_valUsername
	Session("NomeCompleto") = MM_rsUser("NomeCompleto")
	Session("codUsuario") = MM_rsUser("codUsuario")
	Session("Tipo") = MM_rsUser("Tipo")
	Session("Cidade") = MM_rsUser("Cidade")
	Session("Estado") = MM_rsUser("Estado")
	
    If (MM_fldUserAuthorization <> "") Then
      Session("MM_UserAuthorization") = CStr(MM_rsUser.Fields.Item(MM_fldUserAuthorization).Value)
    Else
      Session("MM_UserAuthorization") = ""
    End If
    if CStr(Request.QueryString("accessdenied")) <> "" And true Then
      MM_redirectLoginSuccess = Request.QueryString("accessdenied")
    End If
    MM_rsUser.Close
    Response.Redirect(MM_redirectLoginSuccess)
  End If
  MM_rsUser.Close
  Session("Msg") = "Login ou senha Invalida"
  Response.Redirect(MM_redirectLoginFailed)
End If
%>
<html class="js sizes customelements history pointerevents postmessage webgl websockets cssanimations csscolumns csscolumns-width csscolumns-span csscolumns-fill csscolumns-gap csscolumns-rule csscolumns-rulecolor csscolumns-rulestyle csscolumns-rulewidth csscolumns-breakbefore csscolumns-breakafter csscolumns-breakinside flexbox picture srcset webworkers" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>BITn - Sua Rede de Conhecimento Social</title>
<meta name="robots" content="noindex, follow">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="/Views/css/login_files/_img/logo.png">

<!-- CSS
	============================================ -->
<!-- google fonts -->
<link href="/Views/css/login_files/_css/css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/Views/css/login_files/_css/bootstrap.min.css">
<!-- Icon Font CSS -->
<link rel="stylesheet" href="/Views/css/login_files/_css/bicon.min.css">
<!-- Flat Icon CSS -->
<link rel="stylesheet" href="/Views/css/login_files/_css/flaticon.css">
<!-- audio & video player CSS -->
<link rel="stylesheet" href="/Views/css/login_files/_css/plyr.css">
<!-- Slick CSS -->
<link rel="stylesheet" href="/Views/css/login_files/_css/slick.min.css">
<!-- nice-select CSS -->
<link rel="stylesheet" href="/Views/css/login_files/_css/nice-select.css">
<!-- perfect scrollbar css -->
<link rel="stylesheet" href="/Views/css/login_files/_css/perfect-scrollbar.css">
<!-- light gallery css -->
<link rel="stylesheet" href="/Views/css/login_files/_css/lightgallery.min.css">
<!-- Main Style CSS -->
<link rel="stylesheet" href="/Views/css/login_files/_css/style.css">
</head>

<body class="bg-transparent">
<main>
  <div class="main-wrapper pb-0 mb-0">
    <div class="timeline-wrapper">
      <div class="timeline-header">
        <div class="container-fluid p-0">
          <div class="row no-gutters align-items-center">
            <div class="col-lg-6">
              <div class="timeline-logo-area d-flex align-items-center">
                <div class="timeline-logo">
               	  <img src="/Views/css/login_files/_img/logo.png" alt="timeline logo">
               </div>
                <div class="timeline-tagline">
                  <h6 class="tagline">Ajudando pessoas a conectar seu conhecimento</h6>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <form id="form1" name="form1" method="POST" action="<%=MM_LoginAction%>">
                <div class="login-area">
                  <div class="row align-items-center">
                    <div class="col-12 col-sm">
                      <input type="text" placeholder="Digite seu Usuário" required name="Usuario" id="Usuario" autocomplete="off" class="single-field">
                    </div>
                    <div class="col-12 col-sm">
                      <input type="password" placeholder="Senha" name="Senha" required id="Senha" class="single-field" autocomplete="off">
                    </div>
                    <div class="col-12 col-sm">
                      <button class="login-btn">Entrar</button>
                    </div>
                    <div class="col-12 col-sm-auto" style="text-align:center;">
                      <span class="login-btn" onClick="fnSenha()" style="text-align:center;">Esqueci Minha Senha</span>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="timeline-page-wrapper">
        <div class="container-fluid p-0">
          <div class="row no-gutters">
            <div class="col-lg-6 order-2 order-lg-1">
              <div class="timeline-bg-content bg-img" data-bg="/Views/css/login_files/_img/social-media-icons-3d-cubes.jpg" style="background-image:url(/Views/css/login_files/_img/social-media-icons-3d-cubes.jpg);">
                <h3 class="timeline-bg-title" style="text-shadow: 1px 1px #000; color:#DC4734;">Sua Rede Social com Conteúdo de Qualidade. Filmes, Series e Livros com seus amigos</h3>
              </div>
            </div>
            <div class="col-lg-6 order-1 order-lg-2 d-flex align-items-center justify-content-center">
              <div class="signup-form-wrapper">
                 <%if trim(Session("Msg")) <> "" then%>
                 <div class="alert alert-danger text-center"><%=Session("Msg")%></div>
                 <%end if%>
                <div class="signup-inner">
                  <h3 class="title text-center">Bem Vindo ao BITn. Cadastre-se</h3>
                  <form action="<%=MM_editAction%>" method="POST" name="form2" id="form2">
                    <div class="row" style="padding:10px;">
                      <div class="col-12">
                      <label for="NomeCompleto">Nome Completo</label>
                        <input type="text" name="NomeCompleto" required id="NomeCompleto" class="form-control" placeholder="Nome Completo">
                      </div>
                      <div class="col-md-6">
                      <label for="Email">E-mail</label>
                        <input type="email" name="Email" required  id="Email" class="form-control" placeholder="Email Válido">
                      </div>
                      <div class="col-md-6">
                      <label for="DataNascimento">Data Nascimento</label>
                        <input type="date" name="DataNascimento" required  id="DataNascimento" class="form-control" placeholder="Data Nascimento" style="width:100%; height:40px;">
                      </div>
                      <div class="col-md-6">
                      <label for="Cidade">Cidade</label>
                        <input type="text" name="Cidade" id="Cidade" required  class="form-control" placeholder="Cidade">
                      </div>
                       
                      <div class="col-md-6">
                      <label for="Estado">Estado</label>
                      <div style="width:100%;">
                        <select class="form-control" name="Estado" style="width:100%;" required id="Estado">
                          <option value="">Selecione...</option>
                          <option value="SP">SP</option>
                          <option value="RJ">RJ</option>
                          <option value="RJ">ES</option>
                        </select>
                      </div>   
                      </div>
                      
                      <div class="col-6">
                      <label for="Usuario">Usuário</label>
                        <input type="text" name="Usuario" required  id="Usuario" class="form-control" placeholder="Usuario">
                      </div>
                      <div class="col-6">
                      <label for="Senha">Senha</label>
                        <input type="password" name="Senha" required  id="Senha" class="form-control" placeholder="Senha">
                      </div>
                      
                      <div class="col-12">
                        <button class="submit-btn">Criar Conta</button>
                      </div>
                    </div>
                     
                  <input type="hidden" name="AlteradoEm" value="<%=now%>" />
  <input type="hidden" name="CriadoEm" value="<%=now%>" />
  <input type="hidden" name="Habil" value="1" />
  <input type="hidden" name="Likes" value="1" />
  <input type="hidden" name="Tipo" value="Usuario" />
  <input type="hidden" name="MM_insert" value="form2" />
</form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<%Session.Abandon()%>

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
  
</body>
</html>



<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
	function fnSenha(){
		Swal.fire({
  html:
    '<iframe width=100% widthwidth="560" height="250" src="/EsqueciSenha" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' ,
  width: 640,
  height: 200,
})
	}
	</script>