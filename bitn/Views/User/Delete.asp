Delete User

<form action="?controller=User&action=DeletePost" id="DeletePost" method="post">
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
        <td><%=Html.Encode(Model.NomeCompleto)%></td>
    </tr>

    <tr>
        <td>DataNascimento</td>
        <td><%=Html.Encode(Model.DataNascimento)%></td>
    </tr>

    <tr>
        <td>Usuario</td>
        <td><%=Html.Encode(Model.Usuario)%></td>
    </tr>

    <tr>
        <td>Senha</td>
        <td><%=Html.Encode(Model.Senha)%></td>
    </tr>

</table>
<button type="submit">Submit</button>
<%=Html.ActionLink("Back to list", "User", "List" , "") %> <br/>
</form>

