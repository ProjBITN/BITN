Edit Developer
<br />
<%=Html.ActionLink("Index", "Home", "Index" , "") %>
<br />
<%=Html.ActionLink("About", "Home", "About" , "") %>
<br />
<%=Html.ActionLink("Abandon session", "Home", "AbandonSession" , "") %>
<br />
<form action="?controller=Developer&action=EditPost" id="EditPost" method="post">
<table>
    <tr>
        <td>id</td>
        <td>
            <%=Html.Encode(Model.Id)%>
            <%=Html.Hidden("id",Model.Id) %>
        </td>
    </tr>

    <tr>
        <td>NomeCompleto</td>
        <td> 
		<%=Html.TextBox("NomeCompleto", Model.NomeCompleto)%>
		<!--Html.TextArea("NomeCompleto", Model.NomeCompleto, 60, 15)-->
		<!--Html.TextBox("NomeCompleto", Model.NomeCompleto)-->
		<!--Html.CheckBox("NomeCompleto", Model.NomeCompleto)-->
		<!--Html.DropDownList("NomeCompleto", Model.NomeCompleto, new FirstNameHelper.SelectAll.Items, "Id", "FirstNameName")-->
		<!--String-->
	</td>
    </tr>

    <tr>
        <td>DataNascimento</td>
        <td> 
		<%=Html.TextBox("DataNascimento", Model.DataNascimento)%>
		<!--Html.TextArea("DataNascimento", Model.DataNascimento, 60, 15)-->
		<!--Html.TextBox("DataNascimento", Model.DataNascimento)-->
		<!--Html.CheckBox("DataNascimento", Model.DataNascimento)-->
		<!--Html.DropDownList("DataNascimento", Model.DataNascimento, new LastNameHelper.SelectAll.Items, "Id", "LastNameName")-->
		<!--String-->
	</td>
    </tr>




</table>
<button type="submit">Submit</button>
<%=Html.ActionLink("Back to list", "Developer", "List" , "") %> <br/>

</form>

