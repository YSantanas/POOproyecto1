<%-- 
    Document   : Base de Datos
    Created on : 17/05/2020, 03:01:01 PM
    Author     : Jorge González
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
import ="java.sql.Connection"        
import ="java.sql.DriverManager"        
import ="java.sql.ResultSet"        
import ="java.sql.Statement"        
import ="java.sql.SQLException"        
        
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="imagen2.jpg">
        <table border bgcolor="#F0F8FF" style="margin: 0 auto;">
            <%
                   Connection conex = null;
                   Statement sql = null;
                   try{
                       Class.forName("com.mysql.cj.jdbc.Driver");
                       conex = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/diarywebapp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false","root","root");
                       sql = conex.createStatement();
                       
                       out.print("Conexión establecida");
                       
                       String qry = "select * from diarywebapp.registros";
                       ResultSet data = sql.executeQuery(qry);
                       while(data.next())
                       {
                       %>
                       <tr>
                           <td>
                               <% out.print(data.getInt("Id"));%>
                           </td>
                           <td>
                               <% out.print(data.getString("Entradas del diario"));%>
                           </td>
                           <td>
                               <% out.print(data.getString("Fecha de creación"));%>
                           </td>
                           <td>
                               <% out.print(data.getString("Estados_id"));%>
                           </td>
                           <td>
                               <% out.print(data.getString("Visibilidad"));%>
                           </td>
                       </tr>
                       <%
                       }
                       data.close();
                       
                   }
                   catch(Exception e)
                   {
                       out.print("Error en la conexión");
                       e.printStackTrace();
                   }

            %>
        </table>
    </body>
</html>
