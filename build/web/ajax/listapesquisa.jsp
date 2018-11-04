<%@page import="java.util.ArrayList"%>
<%@page import="dao.GameDAO"%>
<%@page import="classes.Game"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");

    String termo = request.getParameter("termo");

    ArrayList<Game> lista = new GameDAO().pesquisarGames(termo);

    out.println("<table class='table-resultados' tabindex='1' style='overflow: hidden; outline: none;'>");
    out.println("<tbody>");
    for(int i=0; i<lista.size(); i++) {
        Game game = lista.get(i);
        
    out.println("<tr data-produto='" + game.getId() + "' data-preco='" + game.getPreco() + "'>");
    out.println("   <td class='cart_product_img'>");
    out.println("       <img width='40px' src='"+ game.getImagemUrl() +"' alt='" + game.getTitulo() + "'>");
    out.println("   </td>");
    out.println("   <td class='cart_product_desc td-titulo'>");
    out.println("       " + game.getTitulo()+ "");
    out.println("   </td>");
    out.println("</tr>");
    }
    
    out.println("</tbody>");
    out.println("</table>");
%>
