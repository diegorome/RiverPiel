<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="catalogo.Catalogo"%>
<%@page import="catalogo.Main"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //En request se reciben los datos enviados desde Main
    Catalogo catalogo = (Catalogo)request.getAttribute("catalogo");    
    String action = request.getParameter("action");    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1 style="background-color:#666666"><font color="#FFFFFF">Nuevo Articulo</font></h1>
        <!-- Se añade enctype="multipart/form-data" para la subida de archivos -->
        <form method="post" action="Main" enctype="multipart/form-data">
        <!--<form method="post" action="Main">-->
            <input type="hidden" name="id" value="<%=catalogo.getId()%>">
            Nombre: <input type="text" name="name" value="<%=catalogo.getName()%>"><br>
            Precio: <input type="text" name="price" value="<%=catalogo.getPrice()%>"><br>
            Observaciones: <input type="text" name="comments" value="<%=catalogo.getComments()%>"><br>
            Foto:<br><img src='<%=Main.SAVE_DIR+"/"+catalogo.getPhotoFileName()%>' width="128px">
            <input type="checkbox" name="deletePhoto">Borrar foto (tendrá efecto después de guardar)<br>
            <input type="file" name="photoFileName"><br><br>
            
            <%  //Botón guardar para editar o insertar
                if(action.equals(Main.ACTION_EDIT_REQUEST)) {
                    out.print("<input type='submit' value='Guardar'>");
                    out.print("<input type='hidden' name='action' value='"+Main.ACTION_EDIT_RESPONSE+"'>");
                } else if(action.equals(Main.ACTION_INSERT_REQUEST)) {
                    out.print("<input type='submit' value='Añadir'>");
                    out.print("<input type='hidden' name='action' value='"+Main.ACTION_INSERT_RESPONSE+"'>");
                }
            %>
        </form>
        
        <%-- Botón para Cancelar cambios.
            Para que se muestre de nuevo la lista no hay que indicar 
            ninguna acción y volver a cargar Main --%>
        <form method="post" action="Main">
            <input type="hidden" name="action" value="Nuevo articulo">
            <input type="submit" value="Cancelar">
        </form>
    </center> 
    </body>
</html>
