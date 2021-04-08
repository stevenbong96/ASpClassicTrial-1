<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
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
Name = request.form("Name")
Mobile = request.form("Mobile")
Email= request.form("Email")
Address = request.form("Address")
Country = request.form("Country")
State= request.form("State")
City = request.form("City")
Password = request.form("Password")
  Id=request.Form("Id")

        if(Id>0) then
    
        sSQL="Update Address SET Mobile='" &Mobile& "',Email='" &Email& "', Country='" & Country & "',State='" & State & "',City='" & City & "',Password='" & Password & "',Address='" & Address& "'where Id='" & Id & "'"
       
        else
     sSQL= "INSERT INTO Address (Name,Mobile,Email,Address,Country,State,City,Password) values('" &(Name)& "','"&(Mobile) & "','"&(Email)&"','"&(Address)&"','"&(Country)&"','"&(State)&"','"&(City)&"','"&(Password)&"')"

end if
conn.execute(sSQL)
       response.Redirect("database.asp")
%>
</body>
   
</html>