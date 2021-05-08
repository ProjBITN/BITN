<% 
class PerfilController
 Dim Model
 Dim ViewData
 private sub Class_Initialize()
    Set ViewData = Server.CreateObject("Scripting.Dictionary")
 end sub

 private sub Class_Terminate()
 end sub
 
 public Sub Index(vars)
    codUsuario = request.QueryString("codUsuario")
     %>   <!--#include file="../views/Perfil/Index.asp" --> <%
 End Sub
 
 End Class
%>
