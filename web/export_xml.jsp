<?xml version="1.0" encoding="UTF-8"?>
<%-- La línea anterior debe ir siempre la primera si se genera un XML --%>

<%@page import="java.util.ArrayList"%>
<%@page import="catalogo.Catalogo"%>

<%-- Se informa que el contenido va a ser XML --%>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>

<catalogos>
<% 
    ArrayList<Catalogo> catalogoList = (ArrayList)request.getAttribute("catalogoList"); 
    for(Catalogo catalogo: catalogoList) {
        out.println("<catalogo>");
        out.println("<id>"+catalogo.getId()+"</id>");
        out.println("<name>"+catalogo.getPrice()+"</name>");
        out.println("<comments>"+catalogo.getComments()+"</comments>");
        out.println("<photo_file_name>"+catalogo.getPhotoFileName()+"</photo_file_name>");
        out.println("</catalogo>");
    }
%>
</catalogos>
