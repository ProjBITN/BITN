<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../../Connections/conn.asp" -->
<%
Dim rs_usuario__MMColParam
rs_usuario__MMColParam = "1"
If (Request.QueryString("Email") <> "") Then 
  rs_usuario__MMColParam = Request.QueryString("Email")
End If
%>
<%
Dim rs_usuario__MMColParam2
rs_usuario__MMColParam2 = "1"
If (Request.QueryString("Usuario") <> "") Then 
  rs_usuario__MMColParam2 = Request.QueryString("Usuario")
End If
%>
<%
Dim rs_usuario
Dim rs_usuario_cmd
Dim rs_usuario_numRows

Set rs_usuario_cmd = Server.CreateObject ("ADODB.Command")
rs_usuario_cmd.ActiveConnection = MM_conn_STRING
rs_usuario_cmd.CommandText = "SELECT * FROM tbl_usuarios WHERE Email = ? and Usuario = ?  and Habil = 1" 
rs_usuario_cmd.Prepared = true
rs_usuario_cmd.Parameters.Append rs_usuario_cmd.CreateParameter("param1", 200, 1, 255, rs_usuario__MMColParam) ' adVarChar
rs_usuario_cmd.Parameters.Append rs_usuario_cmd.CreateParameter("param2", 200, 1, 255, rs_usuario__MMColParam2) ' adVarChar

Set rs_usuario = rs_usuario_cmd.Execute
rs_usuario_numRows = 0
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
 
</head>

<body class="bg-transparent"> 
<%
if rs_usuario.eof and rs_usuario.bof then
%>
<%if request.QueryString("Email") = "" then%>
<form method="get" action="/Views/User/EsqueciSenha.asp">
<div style="padding:20px;">
<div>
<b>Digite seu e-mail para resgatar sua senha</b>
<input type="email" name="Email" id="Email" class="form-control" required>
</div>
<div>
<b>Digite seu Usuário</b>
<input type="text" name="Usuario" id="Usuario" class="form-control" required>
</div>
<div style="padding-top:5px; text-align:center;">
<input type="submit" value="Resgatar" class="btn btn-success" required>
</div>
</div>
</form>
<%else%>
<div class="alert alert-danger text-center">Dados Inválidos. E-mail e Usuário não conferem ou não cadastrado</div>
<br>
<center>
<a href="EsqueciSenha.asp" class="btn btn-success">Tentar novamente</a>
</center>
<%end if%>
<%
else


'Declaramos as váriaveis a serem utilizadas no script
Dim AspEmail, nomeRemetente, emailRemetente, nomeDestinatario, emailDestinatario, emailRetorno, assunto, mensagem, servidor
 
'Configuramos os dados a serem utilizados no cabeçalho da mensagem
nomeDestinatario="NomeDestinatario"
emailDestinatario="email@dominio"
nomeRemetente="NomeRemetente"
emailRemetente="webmaster@SeuDominio" 'O endereço de e-mail deve ser preenchido com uma conta existente em seu próprio domínio.
emailRetorno="webmaster@SeuDominio"
responderPara="webmaster@SeuDominio"
assunto="Teste AspEmail"
mensagem="Esta é uma mensagem de teste enviada através do componente AspEmail."
servidor="localhost"
 
'Agora configuramos o componente utilizando os dados informados nas variáveis
 
'Instancia o objeto na memória
SET AspEmail = Server.CreateObject("Persits.MailSender")
 
'Contfigura o servidor SMTP a ser utilizado
AspEmail.Host = servidor
 
'Configura o Nome do remetente da mensagem
AspEmail.FromName = "BITn"
 
'Configura o e-mail do remetente da mensagem que OBRIGATORIAMENTE deve ser um e-mail do seu próprio domínio
AspEmail.From = "minhasenha@bitn.com.br"
 
'Configura o E-mail de retorno para você ser avisado em caso de problemas no envio da mensagem
'AspEmail.MailFrom = "minhasenha@bitn.com.br"  'Desabilitar essa linha caso o servidor esteja configurado para rodar em 64 bits
 
 
'Configura o e-mail que receberá as respostas desta mensagem
'AspEmail.AddReplyTo "minhasenha@bitn.com.br"
 
'Configura os destinatários da mensagem
AspEmail.AddAddress rs_usuario("Email"), rs_usuario("NomeCompleto")
 
'Configura para enviar e-mail Com Cópia
'AspEmail.AddCC "nome0@dominio.com.br", "Nome"
'AspEmail.AddCC "nome1@dominio.com.br", "Nome"
'AspEmail.AddCC "nome2@dominio.com.br", "Nome"
 
'Configura o Assunto da mensagem enviada
AspEmail.Subject = "Resgate de Senha - BITn"
 
'Configura o formato da mensagem para HTML
AspEmail.IsHTML = True
 
'Configura o conteúdo da Mensagem
AspEmail.Body = "Conforme solicitado segue sua senha de acesso<br><br><strong>Senha</strong>: "&rs_usuario("Senha")
 
'Definir porta no caso de envio autenticado
'AspEmail.Port = 587
 
'Utilize este código caso queira enviar arquivo anexo
'AspEmail.AddAttachment("E:\home\SEU_LOGIN_FTP\Web\caminho_do_arquivo")
 
'Para quem utiliza serviços da REVENDA conosco
'AspEmail.AddAttachment("E:\vhosts\DOMINIO_COMPLETO\httpdocs\caminho_do_arquivo")
 
'#Ativa o tratamento de erros
On Error Resume Next
 
'Envia a mensagem
AspEmail.Send
 
'Caso ocorra problemas no envio, descreve os detalhes do mesmo.
If Err <> 0 Then
	erro = "<b><font color='red'> Erro ao enviar a mensagem.</font></b><br>"
	erro = erro & "<b>Erro.Description:</b> " & Err.Description & "<br>"
	erro = erro & "<b>Erro.Number:</b> "      & Err.Number & "<br>"
	erro = erro & "<b>Erro.Source:</b> "      & Err.Source & "<br>"
	response.write erro
Else
    %>
<div class="alert alert-success text-center">Dados Enviados para E-mail <%=rs_usuario("Email")%></div>
<br>
<center>
<a href="EsqueciSenha.asp" class="btn btn-success">Tentar novamente</a>
</center>

<%
End If
 
'## Remove a referência do componente da memória ##
SET AspEmail = Nothing

 

%>

<%
end if
%>

</body>
</html>
<%
rs_usuario.Close()
Set rs_usuario = Nothing
%>
