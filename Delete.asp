<%

dim db_connection

db_connection = "Provider=SQLOLEDB.1;Server=WEBDEL33\SQL2008R2;Database=Kavitha;Uid=sa; Pwd=Pwd4sql2008;"


set conn = server.createobject("adodb.connection")
set Cmd = Server.CreateObject("ADODB.Command")
'-------------------------------------------------------
conn.open (db_connection)
'-------------------------------------------------------
set rs = Server.CreateObject("ADODB.RecordSet")
%>
    <% 
        Id=request.QueryString("Id")
        if(Id>0) then
        sSQL="Exec sp_deleteaddress "&request.QueryString("Id")&""
     
        conn.execute(sSQL)
         response.Redirect("database.asp")
        end if
 %>
   <!--<script type="text/javascript">alert("Successful!");</script>-->
