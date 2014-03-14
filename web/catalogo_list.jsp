<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="catalogo.Catalogo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            out.println("Aplicación ejecutada en la máquina: ");
            try {
                BufferedReader br = new BufferedReader(new FileReader("/etc/hostname"));
                out.println("<b>" + br.readLine() + "</b>");
            } catch(FileNotFoundException ex) {
                out.println("<b>Nombre de servidor no encontrado</b><br>");
                out.println("Sólo se detectarán los nombres de servidores Ubuntu");
            }
        %>
        <center>
            <h1 style="background-color:#666666"><font color="#FFFFFF">Catalogo RiverPiel</font></h1>
        <table border="1">
            <tr>
                <th bgcolor="#666666"><font color="#FFFFFF">Nombre</font></th>
                <th bgcolor="#666666"><font color="#FFFFFF">Precio</font></th>
                <th bgcolor="#666666"><font color="#FFFFFF">Observaciones</font></th>
            </tr>
        <% 
            ArrayList<Catalogo> catalogoList = (ArrayList)request.getAttribute("catalogoList"); 
            for(Catalogo catalogo: catalogoList) {
                out.println("<tr>");
                out.println("<td>"+catalogo.getName()+"</td>");
                out.println("<td>"+catalogo.getPrice()+"</td>");
                out.println("<td>"+catalogo.getComments()+"</td>");
                //Enlace para editar el registro
                String editLink = "Main?action=E&id="+catalogo.getId();
                out.println("<td><a href='"+editLink+"'>Editar</td>");
                //Enlace para eliminar el registro con confirmación por parte del usuario
                String deleteLink = "Main?action=D&id="+catalogo.getId();
                String deleteConfirmText = "Confirme que desea eliminar el contacto:\\n"+catalogo.getName()+" "+catalogo.getPrice();
                out.println("<td><a href='"+deleteLink+"' onCLick='return confirm(\""+deleteConfirmText+"\")'>Suprimir</td>");
                
                out.println("</tr>");
            }
        %>
        </table>
        <br>
        <form method="get" action="Main">
            <input type="hidden" name="action" value="I">
            <input type="submit" value="Nuevo Articulo">
        </form>
        <form method="get" action="Main" target="_blank">
            <input type="hidden" name="action" value="X">
            <input type="submit" value="Exportar XML">
        </form>
        </center>
    </body>
</html>
