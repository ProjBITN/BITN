<!--#include file="../inc/topo.asp"-->
<!--#include file="../../Connections/conn.asp" -->
<%
Dim rs_lista__MMColParam
rs_lista__MMColParam = "1"
If (Request("MM_EmptyValue") <> "") Then 
  rs_lista__MMColParam = Request("MM_EmptyValue")
End If
%>
<%
Dim rs_lista
Dim rs_lista_cmd
Dim rs_lista_numRows

Set rs_lista_cmd = Server.CreateObject ("ADODB.Command")
rs_lista_cmd.ActiveConnection = MM_conn_STRING
rs_lista_cmd.CommandText = "SELECT * FROM tbl_midia WHERE Habil = ? and Validar = 0 ORDER BY codMidia ASC" 
rs_lista_cmd.Prepared = true
rs_lista_cmd.Parameters.Append rs_lista_cmd.CreateParameter("param1", 200, 1, 255, rs_lista__MMColParam) ' adVarChar

Set rs_lista = rs_lista_cmd.Execute
rs_lista_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 10
Repeat1__index = 0
rs_lista_numRows = rs_lista_numRows + Repeat1__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim rs_lista_total
Dim rs_lista_first
Dim rs_lista_last

' set the record count
rs_lista_total = rs_lista.RecordCount

' set the number of rows displayed on this page
If (rs_lista_numRows < 0) Then
  rs_lista_numRows = rs_lista_total
Elseif (rs_lista_numRows = 0) Then
  rs_lista_numRows = 1
End If

' set the first and last displayed record
rs_lista_first = 1
rs_lista_last  = rs_lista_first + rs_lista_numRows - 1

' if we have the correct record count, check the other stats
If (rs_lista_total <> -1) Then
  If (rs_lista_first > rs_lista_total) Then
    rs_lista_first = rs_lista_total
  End If
  If (rs_lista_last > rs_lista_total) Then
    rs_lista_last = rs_lista_total
  End If
  If (rs_lista_numRows > rs_lista_total) Then
    rs_lista_numRows = rs_lista_total
  End If
End If
%>
<%
' *** Recordset Stats: if we don't know the record count, manually count them

If (rs_lista_total = -1) Then

  ' count the total records by iterating through the recordset
  rs_lista_total=0
  While (Not rs_lista.EOF)
    rs_lista_total = rs_lista_total + 1
    rs_lista.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (rs_lista.CursorType > 0) Then
    rs_lista.MoveFirst
  Else
    rs_lista.Requery
  End If

  ' set the number of rows displayed on this page
  If (rs_lista_numRows < 0 Or rs_lista_numRows > rs_lista_total) Then
    rs_lista_numRows = rs_lista_total
  End If

  ' set the first and last displayed record
  rs_lista_first = 1
  rs_lista_last = rs_lista_first + rs_lista_numRows - 1
  
  If (rs_lista_first > rs_lista_total) Then
    rs_lista_first = rs_lista_total
  End If
  If (rs_lista_last > rs_lista_total) Then
    rs_lista_last = rs_lista_total
  End If

End If
%>
<%
Dim MM_paramName 
%>
<%
' *** Move To Record and Go To Record: declare variables

Dim MM_rs
Dim MM_rsCount
Dim MM_size
Dim MM_uniqueCol
Dim MM_offset
Dim MM_atTotal
Dim MM_paramIsDefined

Dim MM_param
Dim MM_index

Set MM_rs    = rs_lista
MM_rsCount   = rs_lista_total
MM_size      = rs_lista_numRows
MM_uniqueCol = ""
MM_paramName = ""
MM_offset = 0
MM_atTotal = false
MM_paramIsDefined = false
If (MM_paramName <> "") Then
  MM_paramIsDefined = (Request.QueryString(MM_paramName) <> "")
End If
%>
<%
' *** Move To Record: handle 'index' or 'offset' parameter

if (Not MM_paramIsDefined And MM_rsCount <> 0) then

  ' use index parameter if defined, otherwise use offset parameter
  MM_param = Request.QueryString("index")
  If (MM_param = "") Then
    MM_param = Request.QueryString("offset")
  End If
  If (MM_param <> "") Then
    MM_offset = Int(MM_param)
  End If

  ' if we have a record count, check if we are past the end of the recordset
  If (MM_rsCount <> -1) Then
    If (MM_offset >= MM_rsCount Or MM_offset = -1) Then  ' past end or move last
      If ((MM_rsCount Mod MM_size) > 0) Then         ' last page not a full repeat region
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While ((Not MM_rs.EOF) And (MM_index < MM_offset Or MM_offset = -1))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
  If (MM_rs.EOF) Then 
    MM_offset = MM_index  ' set MM_offset to the last possible record
  End If

End If
%>
<%
' *** Move To Record: if we dont know the record count, check the display range

If (MM_rsCount = -1) Then

  ' walk to the end of the display range for this page
  MM_index = MM_offset
  While (Not MM_rs.EOF And (MM_size < 0 Or MM_index < MM_offset + MM_size))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend

  ' if we walked off the end of the recordset, set MM_rsCount and MM_size
  If (MM_rs.EOF) Then
    MM_rsCount = MM_index
    If (MM_size < 0 Or MM_size > MM_rsCount) Then
      MM_size = MM_rsCount
    End If
  End If

  ' if we walked off the end, set the offset based on page size
  If (MM_rs.EOF And Not MM_paramIsDefined) Then
    If (MM_offset > MM_rsCount - MM_size Or MM_offset = -1) Then
      If ((MM_rsCount Mod MM_size) > 0) Then
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' reset the cursor to the beginning
  If (MM_rs.CursorType > 0) Then
    MM_rs.MoveFirst
  Else
    MM_rs.Requery
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While (Not MM_rs.EOF And MM_index < MM_offset)
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
End If
%>
<%
' *** Move To Record: update recordset stats

' set the first and last displayed record
rs_lista_first = MM_offset + 1
rs_lista_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (rs_lista_first > MM_rsCount) Then
    rs_lista_first = MM_rsCount
  End If
  If (rs_lista_last > MM_rsCount) Then
    rs_lista_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
<%
' *** Go To Record and Move To Record: create strings for maintaining URL and Form parameters

Dim MM_keepNone
Dim MM_keepURL
Dim MM_keepForm
Dim MM_keepBoth

Dim MM_removeList
Dim MM_item
Dim MM_nextItem

' create the list of parameters which should not be maintained
MM_removeList = "&index="
If (MM_paramName <> "") Then
  MM_removeList = MM_removeList & "&" & MM_paramName & "="
End If

MM_keepURL=""
MM_keepForm=""
MM_keepBoth=""
MM_keepNone=""

' add the URL parameters to the MM_keepURL string
For Each MM_item In Request.QueryString
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepURL = MM_keepURL & MM_nextItem & Server.URLencode(Request.QueryString(MM_item))
  End If
Next

' add the Form variables to the MM_keepForm string
For Each MM_item In Request.Form
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepForm = MM_keepForm & MM_nextItem & Server.URLencode(Request.Form(MM_item))
  End If
Next

' create the Form + URL string and remove the intial '&' from each of the strings
MM_keepBoth = MM_keepURL & MM_keepForm
If (MM_keepBoth <> "") Then 
  MM_keepBoth = Right(MM_keepBoth, Len(MM_keepBoth) - 1)
End If
If (MM_keepURL <> "")  Then
  MM_keepURL  = Right(MM_keepURL, Len(MM_keepURL) - 1)
End If
If (MM_keepForm <> "") Then
  MM_keepForm = Right(MM_keepForm, Len(MM_keepForm) - 1)
End If

' a utility function used for adding additional parameters to these strings
Function MM_joinChar(firstItem)
  If (firstItem <> "") Then
    MM_joinChar = "&"
  Else
    MM_joinChar = ""
  End If
End Function
%>
<%
' *** Move To Record: set the strings for the first, last, next, and previous links

Dim MM_keepMove
Dim MM_moveParam
Dim MM_moveFirst
Dim MM_moveLast
Dim MM_moveNext
Dim MM_movePrev

Dim MM_urlStr
Dim MM_paramList
Dim MM_paramIndex
Dim MM_nextParam

MM_keepMove = MM_keepBoth
MM_moveParam = "index"

' if the page has a repeated region, remove 'offset' from the maintained parameters
If (MM_size > 1) Then
  MM_moveParam = "offset"
  If (MM_keepMove <> "") Then
    MM_paramList = Split(MM_keepMove, "&")
    MM_keepMove = ""
    For MM_paramIndex = 0 To UBound(MM_paramList)
      MM_nextParam = Left(MM_paramList(MM_paramIndex), InStr(MM_paramList(MM_paramIndex),"=") - 1)
      If (StrComp(MM_nextParam,MM_moveParam,1) <> 0) Then
        MM_keepMove = MM_keepMove & "&" & MM_paramList(MM_paramIndex)
      End If
    Next
    If (MM_keepMove <> "") Then
      MM_keepMove = Right(MM_keepMove, Len(MM_keepMove) - 1)
    End If
  End If
End If

' set the strings for the move to links
If (MM_keepMove <> "") Then 
  MM_keepMove = Server.HTMLEncode(MM_keepMove) & "&"
End If

MM_urlStr = Request.ServerVariables("URL") & "?" & MM_keepMove & MM_moveParam & "="

MM_moveFirst = MM_urlStr & "0"
MM_moveLast  = MM_urlStr & "-1"
MM_moveNext  = MM_urlStr & CStr(MM_offset + MM_size)
If (MM_offset - MM_size < 0) Then
  MM_movePrev = MM_urlStr & "0"
Else
  MM_movePrev = MM_urlStr & CStr(MM_offset - MM_size)
End If
%>
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
                <h4 class="widget-title">Validar Posts</h4>
					<div style="text-align:right; width:100%;">Registro <%=(rs_lista_first)%> a <%=(rs_lista_last)%> totalizando <%=(rs_lista_total)%> usuários</div>
                
<div class="table-responsive">                
<table border="1" class="table table-bordered table-borderless table-hover table-striped table-responsive" style="width:100%;">
  <thead>
  <tr>
    <th>ID</th> 
    <th>Titulo</th>
    <th>Descrição</th>  	
    <th>Numeros</th>
    <th>&nbsp;</th>
  </tr>
  </thead>
  <tbody>
  <% While ((Repeat1__numRows <> 0) AND (NOT rs_lista.EOF)) %>
    <tr style="font-size:12px;">
      <td><strong><%=(rs_lista.Fields.Item("codMidia").Value)%></strong></td>
      <td nowrap><strong><%=(rs_lista.Fields.Item("Titulo").Value)%></strong>
      <div><i><%=(rs_lista.Fields.Item("TipoMidia").Value)%></i></div>
	  <div style="font-size:10px;">Criado: <%=(rs_lista.Fields.Item("CriadoEm").Value)%></div>
      <div style="font-size:10px;">Alterado: <%=(rs_lista.Fields.Item("AlteradoEm").Value)%></div></td>
      <td><div style="font-size:10px;"><%=left(rs_lista.Fields.Item("Descricao").Value,100)%>...</div></td>
       
      <td style="text-align:left;" nowrap>
      <div><strong>Likes:</strong> <%Likes=(rs_lista.Fields.Item("Likes").Value)%><%if isNull(Likes) or trim(Likes) = "" then%>0<%else%><%=Likes%><%end if%></div>
      <div><strong>Comentarios:</strong> <%Comentarios=(rs_lista.Fields.Item("Comentarios").Value)%><%if isNull(Comentarios) or trim(Comentarios) = "" then%>0<%else%><%=Comentarios%><%end if%></div>
      </td>
      <td style="text-align:center;"><button  class="edit-btn" onclick="fnEdit(<%=(rs_lista.Fields.Item("codMidia").Value)%>)" data-toggle="modal" data-target="#textboxEdit">Autorizar</button></td>
    </tr>
    <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  rs_lista.MoveNext()
Wend
%>
</tbody>
</table>
</div>
<table border="0" style="width:80%;" align="center">
  <tr>
    <td width="25%" align="center"><% If MM_offset <> 0 Then %>
        <a href="<%=MM_moveFirst%>">Primeio</a>
        <% End If ' end MM_offset <> 0 %></td>
    <td width="25%" align="center"><% If MM_offset <> 0 Then %>
        <a href="<%=MM_movePrev%>">Anterior</a>
        <% End If ' end MM_offset <> 0 %></td>
    <td width="25%" align="center"><% If Not MM_atTotal Then %>
        <a href="<%=MM_moveNext%>">Próximo</a>
        <% End If ' end Not MM_atTotal %></td>
    <td width="25%" align="center"><% If Not MM_atTotal Then %>
        <a href="<%=MM_moveLast%>">Último</a>
        <% End If ' end Not MM_atTotal %></td>
  </tr>
</table>
            </div>
            </div>
              </div>
            </div> 
        
      </div>
    </div>
  </div>
</main>
<!--#include file="../inc/rodape.asp"-->
<%
rs_lista.Close()
Set rs_lista = Nothing
%>
