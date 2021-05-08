<%
Dim DundasUpload, caminho, nomeArquivo, tamanho, contentType
Server.ScriptTimeOut = 90
Set DundasUpload = server.CreateObject("Dundas.Upload.2")
DundasUpload.UseVirtualDir = False
DundasUpload.UseUniqueNames = False
DundasUpload.SaveToMemory


caminho = Server.MapPath("\db\midia\")
novonome = Server.MapPath("\db\midia\")&"\"&request.QueryString("codMidia")&".jpg"

Dim i
i=0


for each UploadedFile in DundasUpload.Files
    i=i+1
    extensao = right(DundasUpload.GetFileName(UploadedFile.Originalpath),3)

	IF lcase(extensao) = "jpg" then
		UploadedFile.SaveAs novonome
	End IF    
next
%>
<% 'Remove a instancia do componente da memória
Set DundasUpload = Nothing

session("Editar") = request.QueryString("codMidia")
response.Redirect("/Post/"&request.QueryString("codMidia")&"")


%>