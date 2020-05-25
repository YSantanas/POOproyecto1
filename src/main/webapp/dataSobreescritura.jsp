<%-- 
    Document   : dataSobreescritura
    Created on : 18/05/2020, 06:35:09 AM
--%>

<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Modificando entrada...</title>
    </head>
    <body background="imagen2.jpg">
 <h1><strong><center><font color="Sienna">En mi Diario</font></center></strong></h1>
        <%
            String ID = request.getParameter("ID");
            String entrada = request.getParameter("Entrada");
            String estado = request.getParameter("Estado");

            Connection con = null;
            Statement st = null;

            try {
                
                if (ID!=""){
                    
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1/diarywebapp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false", "root", "root");
                st= con.createStatement();
                
                String query ="UPDATE `diarywebapp`.`registros` SET `Entradas del diario` = '"+entrada+"', `Estados_id` = '"+estado+"' WHERE (`id` = '"+ID+"');";
                st.executeUpdate(query);
                
                out.println("\n ¡Tu entrada ha sido sobreescrita exitosamente!");
                
                
                }
                
                else
                    out.print("Oops! Parece que no introduciste el ID! Intenta de nuevo");
                
            } catch (Exception e) {
                out.print("Oops! Parece que los datos introducidos han sido incorrectos. Intenta de nuevo!");
                e.printStackTrace();
            }

        %>

        <p></p>
</br>
<center>
<a href="index.html">
  <img src="inicio.png" style="max-width:04%;width:auto;height:auto;">
</a>
</center>
    </body>
</html>
