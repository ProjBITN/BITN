<!--#include file="../inc/topo.asp"-->
<!--#include file="../../Connections/conn.asp" --> 
<main>
  <%
    if fs.FileExists(server.MapPath("/db/fotos/"&rs_usuario("codUsuario")&"_F.jpg")) then
		bgBanner = "/db/fotos/"&rs_usuario("codUsuario")&"_F.jpg"
    else
		bgBanner = "/Views/css/profile_files/profile-banner.jpg"
    end if
    %>
  <div class="main-wrapper">
    <div class="profile-banner-large bg-img" data-bg="<%=bgBanner%>"> </div>
    <!--#include file="../inc/regua.asp"-->
    <div class="container">
      <div class="row">
        <div class="col-lg-3 order-2 order-lg-1"> 
          <!--#include file="../inc/lateral.asp"--> 
        </div>
        <div class="col-lg-9 order-1 order-lg-2">
              <%if Session("msg") <> "" then%>
              <div class="alert alert-success"><%=Session("msg")%>
                <%Session("msg") = ""%>
              </div>
              <%end if%>
              <!-- share box start -->
          <div class="card"> 
                <h4 class="widget-title">Performance</h4>
                
                <div class="row">
                    <div class="col-12 col-md-3"><div class="alert alert-success text-center">
                        <div class="row">
                        <div style="float:left; width:25%;">
                        <i class="fa fa-users" aria-hidden="true" style="font-size:60px;"></i>
                        </div>
                        <div style="float:right; width:75%;">
                        <strong>Amigos</strong><br>
                             <%
SQL = "select count(1) as Usuarios  from tbl_usuarios Where Habil = 1 and Tipo = 'Usuario' "
set rs = DbConn.Execute(sql)
Usuarios = rs("Usuarios")
%>     <div><%=Usuarios%></div>
                        ativos
                        </div>
                        </div>
                    </div>    
                </div>
                <div class="col-12 col-md-3"><div class="alert alert-warning text-center">
                <div class="row">
                	<div style="float:left; width:25%;">
                    <i class="fa fa-calculator" aria-hidden="true" style="font-size:60px;"></i>
                    </div>
                    <div style="float:right; width:75%;">
                    <strong>Média</strong><br>
                    	<%
SQL = "select count(1) as Amigos  from tbl_usuarios_amigos Where Habil = 1 "
set rs = DbConn.Execute(sql)
Amigos = rs("Amigos")
%>     <div><%=cint(cdbl(Amigos) / cdbl(Usuarios))%></div>
                    relacionados
                    </div>
                    </div>
                </div>    
                </div>
                <div class="col-12 col-md-3"><div class="alert alert-primary text-center">
                <div class="row">
                	<div style="float:left; width:25%;">
                    <i class="fa fa-clipboard" aria-hidden="true" style="font-size:60px;"></i>
                    </div>
                    <div style="float:right; width:75%;">
                    <strong>Total de Artigos</strong><br>
                    	<%
SQL = "select count(1) as Artigos  from tbl_midia Where Habil = 1 and Validar = 1"
set rs = DbConn.Execute(sql)
Artigos = rs("Artigos")
%>     <div><%=Artigos%></div>
                    ativos
                    </div>
                </div>
                </div>
                </div>
                 
                <div class="col-12 col-md-3"><div class="alert alert-danger text-center">
                <div class="row">
                	<div style="float:left; width:25%;">
                    <i class="fa fa-clipboard" aria-hidden="true" style="font-size:60px;"></i>
                    </div>
                    <div style="float:right; width:75%;">
                    <strong>Total de Artigos</strong><br>
                    	<%
SQL = "select count(1) as Artigos  from tbl_midia Where Habil = 1 and Validar = 0"
set rs = DbConn.Execute(sql)
Artigos = rs("Artigos")
%>     <div><%=Artigos%></div>
                    a validar
                    </div>
                </div>
                </div>
                </div>
                </div>    
                
                
                
                
					<div style="text-align:left; width:100%;"><strong>Top 10 - Membros mais conectados</strong></div>
 <%
SQL = "select top 10 * from tbl_usuarios Where Habil = 1 and Tipo = 'Usuario' order by Amigos desc"
set rs = DbConn.Execute(sql)
%>
<div class="table-responsive">                
<table border="1" class="table table-bordered table-borderless table-hover table-striped table-responsive" style="width:100%;">
  <thead>
  <tr>
    <th width="10%">Perfil</th> 
    <th width="30%">Nome Completo</th>
    <th width="30%">Origem</th>  	
    <th width="20%">Cadastrado em </th>
    <th width="10%">Amigos</th>
  </tr>
  </thead>
  <tbody> 
  <%while not rs.eof%>                

     <tr style="font-size:12px;">
        <td><a href="/Perfil/<%=rs("codUsuario")%>/"> 
                <figure class="profile-thumb-small">
                <%
                    if fs.FileExists(server.MapPath("/db/fotos/"&rs("codUsuario")&"_01.jpg")) then
                %>
                    <img src="/db/fotos/<%=rs("codUsuario")%>_01.jpg">
                <%
                    else
                %>
                    <img src="../../db/fotos/nophoto.png">
                <%
                    end if
                %>
                </figure>
        </a></td>
       <td nowrap><%=rs("NomeCompleto")%></td>
       <td><%=rs("Cidade")%> / <%=rs("Estado")%></td>
       <td style="text-align:left;" nowrap><%=rs("CriadoEm")%></td>
       <td style="text-align:center;"><%=rs("Amigos")%></td>
     </tr>
<%
rs.movenext
wend
%>                

  </tbody>
</table>
</div> 
					<div style="text-align:left; width:100%;"><strong>Densidade Demografica Usuários</strong></div>
                    
      <%
SQL = "select count(1) as Quant, Estado from tbl_usuarios Where Habil = 1 and Tipo = 'Usuario' group by Estado"
set rs = DbConn.Execute(sql)
%>               
                    
	<script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
    <script type='text/javascript'>google.load('visualization', '1', {
    'packages': ['geochart', 'table']
    });
    google.setOnLoadCallback(drawRegionsMap);
    
    function drawRegionsMap() {
    var data = google.visualization.arrayToDataTable([
    // Results For US States
    // State format must be "BR-**"
    // US represents region, while the ** section represents the individual state 
    ['State', 'Usuarios'],
    <%while not rs.eof%>['BR-<%=rs("Estado")%>', <%=rs("Quant")%>]<%rs.movenext%><%if not rs.eof then%>,<%end if%><%wend%>
    ]);
    
    var view = new google.visualization.DataView(data)
    view.setColumns([0, 1])
    
    var options = {
    region: 'BR',
    resolution: 'provinces',
    width: 700,
    height: 347
    };
    
    var chart = new google.visualization.GeoChart(
    document.getElementById('chart_div'));
    chart.draw(data, options);
    };
    
    </script>
    <center>
    <div id="chart_div" style="max-width:700px; overflow:auto; width:100%;height:500px;"></div>
  	</center>
  
            </div>
            </div>
              </div>
            </div> 
        
      </div>
    </div>
  </div>
</main>
<!--#include file="../inc/rodape.asp"-->