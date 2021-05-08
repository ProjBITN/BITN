Cleate User

<form action="?controller=User&action=CreatePost" id="CreatePost" method="post">
<table>
    <tr>
        <td>id</td>
        <td>
            <%=Html.Encode("New")%>
            <%=Html.Hidden("id",0) %>
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

    <tr>
        <td>Usuario</td>
        <td>
		<%=Html.TextBox("Usuario", Model.Usuario)%>
		<!--Html.TextArea("Usuario", Model.Usuario, 60, 15)-->
		<!--Html.TextBox("Usuario", Model.Usuario)-->
		<!--Html.CheckBox("Usuario", Model.Usuario)-->
		<!--Html.DropDownList("Usuario", Model.Usuario, new UserNameHelper.SelectAll.Items, "Id", "UserNameName")-->
		<!--String-->
	</td>
    </tr>

    <tr>
        <td>Senha</td>
        <td>
		<%=Html.TextBox("Senha", Model.Senha)%>
		<!--Html.TextArea("Senha", Model.Senha, 60, 15)-->
		<!--Html.TextBox("Senha", Model.Senha)-->
		<!--Html.CheckBox("Senha", Model.Senha)-->
		<!--Html.DropDownList("Senha", Model.Senha, new ProjectIDHelper.SelectAll.Items, "Id", "ProjectIDName")-->
		<!--int-->
	</td>
    </tr>



</table>
<button type="submit">Submit</button>
<%=Html.ActionLink("Back to list", "User", "List" , "") %> <br/>

</form>

