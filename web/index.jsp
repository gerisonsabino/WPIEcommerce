<%@page import="dao.GameDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Game"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Início | This.Game</title>

    <link rel="icon" href="img/core-img/favicon.ico">

    <link href="assets/css/core-style.css" rel="stylesheet" type="text/css" />
    <link href="assets/style.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <!-- Search Wrapper Area Start -->
    <jsp:include page="views/parciais/pesquisa.jsp" />
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">
        <!-- Header Area Start -->
        <jsp:include page="views/parciais/header.jsp" />
        <!-- Header Area End -->


        <!-- Product Catagories Area Start -->
        <div class="products-catagories-area clearfix">
            <div class="amado-pro-catagory clearfix">
                <%
                    ArrayList<Game> games = new GameDAO().selectGames();
                    
                    for (int i = 0; i < games.size(); i++) {
                        Game game = games.get(i);
                        
                        out.println("<div class='single-products-catagory clearfix' style=\"background: url('"+ game.getImagemUrl() +"') center center / cover no-repeat #CCC;\">");
                        out.println("    <a href='produto?id=" + game.getId() + "'>");
                        out.println("        <div class='hover-content'>");
                        out.println("            <div class='line'></div>");
                        out.println("            <p>" + game.getPrecoFormatado() + "</p>");
                        out.println("            <h4>" + game.getTitulo() + "</h4>");
                        out.println("            <label>" + game.getGenero().getDescricao()+ "</label>");
                        out.println("            <label>" + game.getPlataforma().getNome() + "</label>");
                        out.println("            <label>" + game.getDesenvolvedor().getNome()+ "</label>");
                        out.println("        </div>");
                        out.println("    </a>");
                        out.println("</div>");
                    }
                %>
            </div>
        </div>
        <!-- Product Catagories Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <jsp:include page="views/parciais/footer.jsp" />
    <!-- ##### Footer Area End ##### -->
    <jsp:include page="views/parciais/scripts.jsp" />
</body>
</html>