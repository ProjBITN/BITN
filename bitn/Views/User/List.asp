List Users

<%=Html.ActionLink("Create new User", "User", "Create" , "") %> <br/>

<table>
    <tr>

        <td>NomeCompleto</td>

        <td>DataNascimento</td>

        <td>Usuario</td>

        <td>Senha</td>

        <td></td>
    </tr>

    <%
    if  IsNothing(Model) then
        %> <tr><td colspan="4">No records</td> </tr><%
    Else
        Dim obj
        For each obj in Model.Items
        %>

        <tr>

            <td><%=Html.Encode(obj.NomeCompleto) %></td>

            <td><%=Html.Encode(obj.DataNascimento) %></td>

            <td><%=Html.Encode(obj.Usuario) %></td>

            <td><%=Html.Encode(obj.Senha) %></td>

            <td>
                <%=Html.ActionLink("Edit", "User", "Edit" , "id=" + CStr(obj.Id)) %> |
                <%=Html.ActionLink("Delete", "User", "Delete" , "id=" + CStr(obj.Id)) %> |
                <%=Html.ActionLink("Details", "User", "Details" , "id=" + CStr(obj.Id)) %>
                
            </td>
        </tr>
        <% 
        Next
     End If
     %>
</table>

