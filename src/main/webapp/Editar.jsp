<%-- 
    Document   : Editar
    Created on : 17/05/2020, 07:05:46 PM
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"
        import ="java.sql.Connection"        
        import ="java.sql.DriverManager"        
        import ="java.sql.ResultSet"        
        import ="java.sql.Statement"        
        import ="java.sql.SQLException"        

        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Editando diario</title>
    </head>
    <body background="imagen2.jpg">
        
        <h1><strong><center><font color="Sienna">Editando mi diario ...</font></center></strong></h1>

<table border bgcolor="#F0F8FF" style="margin: 0 auto;">
            <p><strong><center><font color="SaddleBrown">¿Qué entrada deseas editar?</font></center></strong></strong></p>
 <center>
            <tr>
                <th><font color="Peru">ID de la entrada</font></th>
                <th><font color="Peru">Entradas del diario</font></th>
                <th><font color="Peru">Fecha de creación</font></th>
                <th><font color="Peru">Estado de Ánimo</font></th>
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
                    <% if (Integer.parseInt(data.getString("Estados_id")) == 1) {
                            
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
<center>
        <p></p>
        <form name="Registro" action="dataSobreescritura.jsp" method="get">
            
            <textarea name="Entrada" rows="60" cols="100" wrap="hard" placeholder="Modifica tu entrada aquí"></textarea>

				
            <p>Selecciona un estado de ánimo:</p>

            <img src="ok.png" style="max-width:03%;width:auto;height:auto;"><input type="radio" id="1" name="Estado" value="1">
            <label for="male">Bueno</label><br>
			<br/>

            <img src="reg.png" style="max-width:02.6%;width:auto;height:auto;"><input type="radio" id="2" name="Estado" value="2">
            <label for="female">Regular</label><br>
			<br/>
            <img src="mal.png" style="max-width:02.6%;width:auto;height:auto;"><input type="radio" id="3" name="Estado" value="3">
            <label for="other">Malo</label><br>
			<br/>

            
            Ingresa el ID de tu entrada: <input type="text" name="ID" value=""/> <p><br>
                </center>
				<center>
            <input type="submit" value="Editar entrada del diario">
            
            <p></p>
            
        </form>
        
       
        <button onclick="window.location.href = 'Eliminar.jsp';">Eliminar una entrada</button>
        

        <button onclick="window.location.href = 'index.html';">Regresar al menú principal</button>
</center>
    </body>
</html>
