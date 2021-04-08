<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
     <script type="text/javascript">
         function Submit_page() {
             if ($("#Name").val() == "") {
                 alert("Enter Name.");
                 return false;
             }
             if ($("#Text1").val() == "") {
                 alert("Enter Mobile.");
                 return false;
             }
             if ($("#Text2").val() == "") {
                 alert("Enter Email.");
                 return false;
             }
             if ($("#Text6").val() == "") {
                 alert("Enter Password.");
                 return false;
             }
             else
                 return true;
         }

        </script>
   

  

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
Name = request.QueryString("Name")
    if Name <> "" then
       sSQL = "SELECT top 1 * FROM Address where Name = '" & Name & "'"
       'response.Write sSQL
       set rs = Conn.execute(sSQL)
      
       if not(rs.bof and rs.eof) then
         Mobile = rs("Mobile")
              Email = rs("Email")
              Country =rs("Country")    
              State = rs("State")
              City = rs("City")
              Password = rs("Password")
        Address = rs("Address")
    Id=rs("Id")
       end if
end if

    %>
  
   
     </head>
<body>
   
    <form action="posting.asp" name="frm_config" id="frm_config" method="post">
    <table>
        <tr>
            <td>
                Name
            </td>
            <td>
                <% if Id <> "" then %><input type="hidden" name="Id" id="Id" value="<%=Id%>" /><% end if %>
           <input type="text" id="Name" name="Name"  value="<%=Name%>" /></td>
        </tr>
         <tr>
            <td>
                Mobile
            </td>
            <td><input type="text" id="Text1" name="Mobile" maxlength="10" value="<%=Mobile%>"/></td>
        </tr>
         <tr>
            <td>
                Email
            </td>
            <td><input type="text" id="Text2" name="Email" value="<%=Email%>"/></td>
        </tr>
         <tr>
            <td>
                Country
            </td>
            <td><input type="text" id="Text3" name="Country" value="<%=Country%>"/></td>
        </tr>
         <tr>
            <td>
                State
            </td>
            <td><input type="text" id="Text4" name="State" value="<%=State%>"/></td>
        </tr>
         <tr>
            <td>
               City
            </td>
            <td><input type="text" id="Text5" name="City" value="<%=City%>"/></td>
        </tr>
         <tr>
            <td>
                Password
            </td>
            <td><input type="text" id="Text6" name="Password" value="<%=Password%>"/></td>
        </tr>
         <tr>
            <td>
                Address
            </td>
            <td><input type="text" id="Text7" name="Address" value="<%=Address%>"/></td>
        </tr>
       
        <tr>
         
            <td>
                <input type="submit" id="btnsubmit" value="Submit" onclick="Submit_page()" /><div id="post_result"></div>
            </td>
            <td>
               
            </td>
        </tr>
    </table>
        </form>
  
</body>
  

</html>