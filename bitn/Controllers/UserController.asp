<% 

class UserController
 Dim Model
 Dim ViewData
  
 private sub Class_Initialize()
  Set ViewData = Server.CreateObject("Scripting.Dictionary")
 end sub

 private sub Class_Terminate()
 end sub

 public Sub Logar()
    Dim u 
    set u = new UserHelper
    set Model = u.SelectAll
 
    %>   <!--#include file="../views/User/Logar.asp" --> 
	<%
 End Sub


 public Sub List()
    Dim u 
    set u = new UserHelper
    set Model = u.SelectAll
 
    %>   <!--#include file="../views/User/List.asp" --> <%
 End Sub
 
 public Sub Create()
    set Model = new User
    %>   <!--#include file="../views/User/Create.asp" --> <%
 End Sub
 
  public Sub CreatePost(args)
    Dim obj, objh
    set objh = new UserHelper
    set obj = new User

    obj.NomeCompleto = args("NomeCompleto")
    obj.DataNascimento = args("DataNascimento")
    obj.Usuario = args("Usuario")
    obj.Senha = args("Senha")
    'form values should be cleaned from injections
    'checkboxes shoud use the syntax: obj.Senha = (args("Senha") = "on")
    obj.codUsuario = objh.Insert(obj)
 
    Response.Redirect("?controller=User&action=list")
 End Sub

 
 public Sub Edit(vars)

    Dim u
    set u = new UserHelper
    set Model = u.SelectById(vars("id"))
 
   %>   <!--#include file="../views/User/Edit.asp" --> <%
 End Sub
 
 public Sub EditPost(args)
    Dim obj, objh
    set objh = new UserHelper
    set obj = objh.SelectById(args("codUsuario"))

    obj.NomeCompleto = args("NomeCompleto")
    obj.DataNascimento = args("DataNascimento")
    obj.Usuario = args("Usuario")
    obj.Senha = args("Senha")
    'form values should be cleaned from injections
    'checkboxes shoud use the syntax: obj.Senha = (args("Senha") = "on")
    objh.Update(obj)
 
    Response.Redirect("?controller=User&action=list")
 End Sub

 
 public Sub Delete(vars)
     Dim u
    set u = new UserHelper
    set Model = u.SelectById(vars("id"))
   %>   <!--#include file="../views/User/Delete.asp" --> <%
 End Sub
 
 
  public Sub DeletePost(args)
    Dim res, objh
    set objh = new UserHelper
    res = objh.Delete(args("codUsuario"))
    if  res then
        Response.Redirect("?controller=User&action=list")
    else
        Response.Redirect("?controller=User&action=Delete&id=" + CStr(args("codUsuario")))
    end if
 End Sub


 public Sub Details(vars)
     Dim u
    set u = new UserHelper
    set Model = u.SelectById(vars("id"))

   %>   <!--#include file="../views/User/Details.asp" --> <%
 End Sub
 
 End Class
%>
