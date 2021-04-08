<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title></title>
    <script src="Scripts/jquery.fancybox-1.3.4.js"></script>
    <h1>Sample Classic Asp </h1>
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
sql="select * from Address"
set rs = Conn.execute(sql)

'if (rs.bof and rs.eof) then
       'response.Write "<span class=""error"">No Record Found</span>"
       'response.End
'end if
    %>
</head>
<body>
    <table border="1">
        <tr>
            <td>Edit</td>
            <td>Delete</td>
            <td>Name</td>
            <td>Mobile</td>
            <td>Email</td>
            <td>City</td>
        </tr>
        <%
             
              while not rs.eof
        %>
        <tr>

            <td><a href="add.asp?Name=<%=rs("Name")%>" class="news_frm"><%=rs("Name")%></a></td>
            <td><a href="Delete.asp?Id=<%=rs("Id")%>" class="news">Delete</a>
            </td>
            <td><%=rs("Name")%></td>
            <td><%=rs("Mobile")%></td>
            <td><%=rs("Email")%></td>
            <td><%=rs("City")%></td>

        </tr>

        <%
              rs.movenext
              wend
        %>
    </table>
    <div id="frmshow" style="display: none">
        <iframe src="/add.asp" width="400" height="400"></iframe>
    </div>


    <a href="add.asp">NewMember</a>