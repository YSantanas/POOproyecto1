<%-- 
    Document   : Eliminar
    Created on : 18/05/2020, 07:04:04 AM
--%>

<%@page contentType="text/html; charset=ISO-8859-1"%>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Eliminar entrada</title>
    </head>
    <body background="imagen2.jpg">
        <h1><strong><center><font color="Sienna">Eliminando Entrada</font></center></strong></strong></h1>
        <p><strong><strong><center><font color="SaddleBrown">Selecciona la entrada que deseas eliminar: </font></center></strong></strong></p>
        
		 <center>
<table border bgcolor="#F0F8FF" style="margin: 0 auto;">

            <tr>
                <th><font color="Peru">ID de la entrada</font></th>
                <th><font color="Peru">Entradas del diario</font></th>
                <th><font color="Peru">Fecha de creación</font></th>
                <th><font color="Peru">Estado de ánimo</font></th>
            </tr>

            <%
                Connection conex = null;
                Statement sql = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conex = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1/diarywebapp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false", "root", "root");
                    sql = conex.createStatement();

                    String qry = "select * from diarywebapp.registros";
                    ResultSet data = sql.executeQuery(qry);
                    while (data.next()) {
            %>

            <% if(data.getInt("Visibilidad") == 1){ %>
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
                    <%  if (Integer.parseInt(data.getString("Estados_id")) == 1) {
                            
                                out.print("Bueno");
                                
                                }
                        
                            else 
                            if (Integer.parseInt(data.getString("Estados_id")) == 2) {
                                
                                out.print("Regular");
   
                            } else 
                            if (Integer.parseInt(data.getString("Estados_id")) == 3) {
                                out.print("Malo");
   
                            }%>
                </td>

            </tr>

            <%  } %>

            <%
                    }
                    data.close();

                } catch (Exception e) {
                    out.print("Error en la conexión con los registros. :( Intenta de nuevo!");
                    e.printStackTrace();
                }

            %>
        </table>
       </center>
        
        <p></p>
        <center>
        <form name="Registro" action="DataEliminar.jsp" method="get">
            
            Ingresa el ID de tu entrada: <input type="text" name="ID" value=""/> <p><br>
                
            <input type="submit" value="Eliminar">
            
            <p></p>
            
        </form>
        
        <p></p>

</br>
<a href="index.html">
  <img src="inicio.png" style="max-width:04%;width:auto;height:auto;">
</a>
</center>
    </body>
</html>
