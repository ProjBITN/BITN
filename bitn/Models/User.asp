<%

' 
' This files defines the User model 
'

class User

 '=============================
 'Private properties
  private mId

  private  mFirstName
  private  mLastName
  private  mUserName
  private  mProjectID
  'You may extend the model (private, public get properties, and sql select query) to get the fields from referenced tables. 
  'It is convenient to display text values (instead of codes) when display lists.
  
  private sub Class_Initialize()
  end sub

  private sub Class_Terminate()
  end sub
 
 '=============================
 'public properties

   public property get codUsuario()
      codUsuario = mId
   end property
 
   public property let codUsuario(val)
      mId = val
   end property
  

   public property get NomeCompleto()
      NomeCompleto = mFirstName
   end property  

   public property let NomeCompleto(val)
      mFirstName = val
   end property  

   public property get DataNascimento()
      DataNascimento = mLastName
   end property  

   public property let DataNascimento(val)
      mLastName = val
   end property  

   public property get Usuario()
      Usuario = mUserName
   end property  

   public property let Usuario(val)
      mUserName = val
   end property  

   public property get Senha()
      Senha = mProjectID
   end property  

   public property let Senha(val)
      mProjectID = val
   end property  


end class


'======================
class UserHelper

  Dim selectSQL

  private sub Class_Initialize()
    selectSQL = " SELECT * FROM [tbl_usuarios] "
  end sub

  private sub Class_Terminate()
  end sub

 '=============================
 'public Functions



  ' Create a new User. 
  ' true - if successful, false otherwise
  public function Insert(obj)
      Dim strSQL 
      strSQL=   " Insert into [tbl_usuarios] ( NomeCompleto, DataNascimento, Usuario, Senha) Values ('{0}','{1}','{2}',{3}) " & _
                " SELECT SCOPE_IDENTITY();  " 
      obj.codUsuario = DbExecute (StringFormat(strSQL, array( obj.NomeCompleto, obj.DataNascimento, obj.Usuario, obj.Senha)))
      Insert = true
      DbCloseConnection
  end function

  ' Update the User
  public function Update(obj)
     Dim strSQL 
     strSQL= "Update [tbl_usuarios] set  NomeCompleto = '{0}', DataNascimento = '{1}', Usuario = '{2}', Senha = {3}  Where codUsuario = {4} " 
     DbExecute StringFormat(strSQL, array( obj.NomeCompleto, obj.DataNascimento, obj.Usuario, obj.Senha, obj.codUsuario))
     Update = true
     DbCloseConnection
  end function
  
  ' Delete the User
  public function Delete(codUsuario)
     Dim strSQL 
     strSQL= "update [tbl_usuarios] set Habil = 0 WHERE codUsuario = {0}"
     DbExecute StringFormat(strSQL, array(codUsuario))
     Delete = true 
     DbCloseConnection
  end function
  
  ' Select the User by ID
  ' return User object - if successful, Nothing otherwise
  public function SelectById(id)
    Dim record
    set record = DbExecute(StringFormat(selectSQL + " WHERE codUsuario = {0}", array(id)))
    Set SelectById = PopulateObjectFromRecord(record)
    record.Close
    set record = nothing
    DbCloseConnection
  end function
  
  ' Select all Users into a Dictionary
  ' return a Dictionary of User objects - if successful, Nothing otherwise
  public function SelectAll()
    Dim records
    set records = DbExecute(selectSQL)
    if records.eof then 
        Set SelectAll = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
            results.Add obj.codUsuario, obj
            records.movenext 
        wend 
        set SelectAll = results
        records.Close
    End If
    set record = nothing
    DbCloseConnection
  end function
 
  ' Select all Users into a Dictionary
  ' return a Dictionary of User objects - if successful, Nothing otherwise
  public function SelectByField(fieldName, value)
    Dim records, txtSQL
    txtSQL = StringFormat(selectSQL + " where " + fieldName + "={0}" , array(value))
    set records = DbExecute(txtSQL)
    if records.eof then 
        Set SelectByField = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
            results.Add obj.codUsuario, obj
            records.movenext 
        wend 
        set SelectByField = results
        records.Close
    End If
    set record = nothing
    DbCloseConnection
  end function

  private function PopulateObjectFromRecord(record)
    if record.eof then
       Set PopulateObjectFromRecord = Nothing
    else
        Dim obj
        set obj = new User
        obj.codUsuario                       = record("codUsuario") 
        obj.NomeCompleto = record("NomeCompleto")  
        obj.DataNascimento = record("DataNascimento")  
        obj.Usuario = record("Usuario")  
        obj.Senha = record("Senha") 
        set PopulateObjectFromRecord = obj
    end if
  end function

end class 'UserHelper


%>

