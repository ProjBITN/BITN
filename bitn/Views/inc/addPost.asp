<div class="modal fade" id="textbox" aria-labelledby="textbox">
                                <form name="frmAdd" id="frmAdd" target="_parent" action="/addPost" method="post" enctype="multipart/form-data">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" style="font-size:14px">Deixe sua Dica</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body custom-scroll">
                                            <div>
<table width="100%">
<tr>
	<td width="33%" align="center"><input type="radio" name="Tipo" id="TipoLivros" value="Livros" checked onClick="fnMostrarDiv('Livros')"> <label for="TipoLivros"><i class="fa fa-book" aria-hidden="true"></i><br /><strong>Livros</strong></label></td>
    <td width="33%" align="center"><input type="radio" name="Tipo" id="TipoSeries" value="Series" onClick="fnMostrarDiv('Series')"> <label for="TipoSeries"><i class="fa fa-television" aria-hidden="true"></i><br /><strong>Séries</strong></label></td>
    <td width="33%" align="center"><input type="radio" name="Tipo" id="TipoFilmes" value="Filmes" onClick="fnMostrarDiv('Filmes')"> <label for="TipoFilmes"><i class="fa fa-film" aria-hidden="true"></i><br /><strong>Filmes</strong></label></td>
</tr>
</table>    
</div>
<div style="margin-bottom:5px;">  <hr>                                          
<input type="text" name="Assunto" id="Assunto" class="form-control" required placeholder="Titulo do Post">
</div>
<div style="margin-bottom:5px;">
<div id="divComplementoLivros" style="display:block;">
    <table width="100%">
    <tr><td colspan="2">
    <input type="text" name="TituloLivro" id="TituloLivro" required  placeholder="Titulo do Livro" class="form-control form-control-sm">
    </td>
    </tr>
    <tr>
    <td width="50%">
    <input type="text" name="AutorLivro" id="AutorLivro" required  placeholder="Nome do Autor" class="form-control form-control-sm">
    </td>
    <td width="50%">
    <input type="text" name="EditoraLivro" id="EditoraLivro" required  placeholder="Nome da Editora" class="form-control form-control-sm">
    </td>
    </tr>
    <tr>
    <td width="50%">
    <input type="text" name="PaisLivro" id="PaisLivro" required  placeholder="Pais de Origem" class="form-control form-control-sm">
    </td>
    <td width="50%">
    <input type="text" name="AnoLancamentoLivro" required  id="AnoLancamentoLivro" placeholder="Ano de Lançamento do Livro" class="form-control form-control-sm"></td>
    </tr></table>
</div>

<div id="divComplementoSeries" style="display:none;">
    <table width="100%">
    <tr><td colspan="2">
    <input type="text" name="TituloSerie" id="TituloSerie" placeholder="Titulo da Série"   class="form-control form-control-sm">
    </td>
    </tr>
    <tr>
    <td width="50%">
    <input type="text" name="DiretorSerie" id="DiretorSerie" placeholder="Nome do Diretor"   class="form-control form-control-sm">
    </td>
    <td width="50%">
    <input type="text" name="ElencoPrincipalSerie" id="ElencoPrincipalSerie"   placeholder="Elenco Principal" class="form-control form-control-sm">
    </td>
    </tr>
    </table>
    <table width="100%">
    <tr>
    <td width="33%">
    <input type="text" name="PaisSerie" id="PaisSerie" placeholder="Pais"   class="form-control form-control-sm">
    </td>
    <td width="33%">
    <input type="text" name="AnoSerie" id="AnoSerie" placeholder="Ano"   class="form-control form-control-sm"></td>
        <td width="33%">
    <input type="text" name="TemporadaSerie" id="TemporadaSerie"   placeholder="Temporada" class="form-control form-control-sm"></td>
    </tr></table>
    
    
</div>
<div id="divComplementoFilmes" style="display:none;">
	<table width="100%">
    <tr><td colspan="2">
    <input type="text" name="TituloFilme" id="TituloFilme"   placeholder="Titulo do Filme" class="form-control form-control-sm">
    </td>
    </tr>
    <tr>
    <td width="50%">
    <input type="text" name="DiretorFilme" id="DiretorFilme"   placeholder="Nome do Diretor" class="form-control form-control-sm">
    </td>
    <td width="50%">
    <input type="text" name="ElencoPrincipalFilme" id="ElencoPrincipalFilme"   placeholder="Elenco Principal" class="form-control form-control-sm">
    </td>
    </tr>
    <tr>
    <td width="50%">
    <input type="text" name="PaisFilme" id="PaisFilme" placeholder="Pais"   class="form-control form-control-sm">
    </td>
    <td width="50%">
    <input type="text" name="AnoFilme" id="AnoFilme" placeholder="Ano"   class="form-control form-control-sm">
    </td>
        </tr></table>
    
</div>
</div>
<div>

<table width="100%">
<tr>
<td width="70%">
<strong>Carregar Foto</strong>
<div><input type="file" name="arquivo" class="form-control" placeholder="Adicione uma foto ao seu post"></div>
</td>
<td><strong>Nota</strong><div><Input type="number" value="0" min="1" max="10" name="Nota" id="Nota" placeholder="Nota"   class="form-control form-control-sm" required /></div></td>
</tr>
</table>

</div>
<div style="margin-bottom:5px; height:90px;">
<hr>
<textarea name="Conteudo" autofocus class="share-field-big" required placeholder="Diga algo" style="height:90px;"></textarea>
</div>
<script>
function fnMostrarDiv(Tipo){
	 
		document.getElementById('divComplementoLivros').style.display='none';	
		document.getElementById('divComplementoSeries').style.display='none';	
		document.getElementById('divComplementoFilmes').style.display='none';	
		
		document.getElementById("TituloLivro").required = false;
		document.getElementById("AutorLivro").required = false;
		document.getElementById("EditoraLivro").required = false;
		document.getElementById("PaisLivro").required = false;
		document.getElementById("AnoLancamentoLivro").required = false;
		
		document.getElementById("TituloSerie").required = false;
		document.getElementById("DiretorSerie").required = false;
		document.getElementById("ElencoPrincipalSerie").required = false;
		document.getElementById("PaisSerie").required = false;
		document.getElementById("AnoSerie").required = false;
		document.getElementById("TemporadaSerie").required = false;
		
		
	
	
	if(Tipo=='Livros'){
		document.getElementById('divComplementoLivros').style.display='block';	
		document.getElementById("TituloLivro").required = true;
		document.getElementById("AutorLivro").required = true;
		document.getElementById("EditoraLivro").required = true;
		document.getElementById("PaisLivro").required = true;
		document.getElementById("AnoLancamentoLivro").required = true;
	}
	if(Tipo=='Series'){
		document.getElementById('divComplementoSeries').style.display='block';	
		document.getElementById("TituloSerie").required = true;
		document.getElementById("DiretorSerie").required = true;
		document.getElementById("ElencoPrincipalSerie").required = true;
		document.getElementById("PaisSerie").required = true;
		document.getElementById("AnoSerie").required = true;
		document.getElementById("TemporadaSerie").required = true;
	}
	if(Tipo=='Filmes'){
		document.getElementById('divComplementoFilmes').style.display='block';	
		document.getElementById("TituloFilme").required = true;
		document.getElementById("DiretorFilme").required = true;
		document.getElementById("ElencoPrincipalFilme").required = true;
		document.getElementById("PaisFilme").required = true;
		document.getElementById("AnoFilme").required = true; 
	}
}
</script>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="post-share-btn" data-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="post-share-btn">Postar</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>    
</div>
<script>
function openAjax(){var e;try{e=new XMLHttpRequest}catch(t){try{e=new ActiveXObject("Msxml2.XMLHTTP")}catch(t){try{e=new ActiveXObject("Microsoft.XMLHTTP")}catch(t){e=!1}}}return e}function carregaAjax(e,t){if(document.getElementById){var n=document.getElementById(e),a=openAjax();a.open("GET",t,!0),a.setRequestHeader("Content-Type","application/x-www-form-urlencoded"),a.setRequestHeader("encoding","ISO-8859-1"),a.onreadystatechange=function(){if(1==a.readyState&&(n.innerHTML="<div align=center><strong><table border=0 cellspacing=0 cellpadding=0><tr><td>Carregando...</strong></td></tr></table></div>"),4==a.readyState)if(200==a.status){var e=a.responseText;e=unescape(e),n.innerHTML=e}else n.innerHTML=""},a.send(null)}} 
</script>

<div class="modal fade" id="textboxEdit" style="height:100%;" aria-labelledby="textboxEdit">
<form name="frmEdit" id="frmEdit" target="_parent" action="/editPost.asp" method="post">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" style="font-size:14px">Alterar Post</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          </div>
        <div class="modal-body">
          <div id="divEdit" class="custom-scroll">
          
          
          
          
          </div>
        <div class="modal-footer">
          <button type="button" class="post-share-btn" data-dismiss="modal">Cancelar</button>
          <button type="submit" class="post-share-btn">Alterar</button>
          </div>
        </div>
      </div>
      </div>
</form>
          
          
           
</div>
<script>
function fnMostrarDivEdit(Tipo){
	 
		document.getElementById('divComplementoLivrosEdit').style.display='none';	
		document.getElementById('divComplementoSeriesEdit').style.display='none';	
		document.getElementById('divComplementoFilmesEdit').style.display='none';	
		
		document.getElementById("TituloLivroEdit").required = false;
		document.getElementById("AutorLivroEdit").required = false;
		document.getElementById("EditoraLivroEdit").required = false;
		document.getElementById("PaisLivroEdit").required = false;
		document.getElementById("AnoLancamentoLivroEdit").required = false;
		
		document.getElementById("TituloSerieEdit").required = false;
		document.getElementById("DiretorSerieEdit").required = false;
		document.getElementById("ElencoPrincipalSerieEdit").required = false;
		document.getElementById("PaisSerieEdit").required = false;
		document.getElementById("AnoSerieEdit").required = false;
		document.getElementById("TemporadaSerieEdit").required = false;
		
		
	
	
	if(Tipo=='Livros'){
		document.getElementById('divComplementoLivrosEdit').style.display='block';	
		document.getElementById("TituloLivroEdit").required = true;
		document.getElementById("AutorLivroEdit").required = true;
		document.getElementById("EditoraLivroEdit").required = true;
		document.getElementById("PaisLivroEdit").required = true;
		document.getElementById("AnoLancamentoLivroEdit").required = true;
	}
	if(Tipo=='Series'){
		document.getElementById('divComplementoSeriesEdit').style.display='block';	
		document.getElementById("TituloSerieEdit").required = true;
		document.getElementById("DiretorSerieEdit").required = true;
		document.getElementById("ElencoPrincipalSerieEdit").required = true;
		document.getElementById("PaisSerieEdit").required = true;
		document.getElementById("AnoSerieEdit").required = true;
		document.getElementById("TemporadaSerieEdit").required = true;
	}
	if(Tipo=='Filmes'){
		document.getElementById('divComplementoFilmesEdit').style.display='block';	
		document.getElementById("TituloFilmeEdit").required = true;
		document.getElementById("DiretorFilmeEdit").required = true;
		document.getElementById("ElencoPrincipalFilmeEdit").required = true;
		document.getElementById("PaisFilmeEdit").required = true;
		document.getElementById("AnoFilmeEdit").required = true; 
	}
}
</script>