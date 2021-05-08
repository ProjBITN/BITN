<%
if trim(codUsuarioPerfil) = "" then
	NomeCompleto = rs_usuario("NomeCompleto")
	Descricao=(rs_usuario.Fields.Item("Descricao").Value)
	Profissao=(rs_usuario.Fields.Item("Profissao").Value)
	Cidade=(rs_usuario.Fields.Item("Cidade").Value)
	Estado=(rs_usuario.Fields.Item("Estado").Value)
	Amigos=(rs_usuario.Fields.Item("Amigos").Value)
end if
%>
<!-- widget single item start -->

<div class="card widget-item">
  <%if trim(Ocultar) = "" then%>
  <h4 class="widget-title"><%=NomeCompleto%> <span style="font-size:9px; color:#666;" onclick="fnEditPerfil()">(Editar)</span></h4>
  <%end if%>
  <div class="widget-body">
    <div class="about-author">
      <p>
        <%if trim(Descricao) = "" or isNull(Descricao) then%>
        <em style="color:#999;">Deixe sua frase ou defina você</em>
        <%else%>
        <%=Descricao%>
        <%end if%>
      </p>
      <ul class="author-into-list">
        <li><a href="#"><i class="bi bi-office-bag"></i>
          <%if trim(Profissao) = "" or isNull(Profissao) then%>
          <em style="color:#999;">Sua Profissão</em>
          <%else%>
          <%=Profissao%>
          <%end if%>
          </a></li>
        <li><a href="#"><i class="bi bi-home"></i><%=Cidade%>, <%=Estado%></a></li>
        <li><a href="#"><i class="bi bi-heart-beat"></i>
          <%%>
          <%if trim(Amigos) = "" or isNull(Amigos) then%>
          <em style="color:#999;">0 amigos</em>
          <%else%>
          <%=Amigos%> amigos
          <%end if%>
          </a></li>
      </ul>
    </div>
  </div>
</div>
<!-- widget single item end --> 
