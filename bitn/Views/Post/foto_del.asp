<%
 
caminho = Server.MapPath("\db\midia\")
novonome = Server.MapPath("\db\midia\")&"\"&request.QueryString("codMidia")&".jpg"


dim fs
Set fs=Server.CreateObject("Scripting.FileSystemObject")
if fs.FileExists(novonome) then
  fs.DeleteFile(novonome)
end if
set fs=nothing

session("Editar") = request.QueryString("codMidia") 
response.Redirect("/Post/"&request.QueryString("codMidia")&"")


%>