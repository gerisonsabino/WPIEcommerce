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

        <title>Exloprar | This.Game</title>

        <link rel="icon" href="img/core-img/favicon.ico">

        <link href="assets/css/core-style.css" rel="stylesheet" type="text/css" />
        <link href="assets/style.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <!-- Search Wrapper Area Start -->
        <jsp:include page="parciais/pesquisa.jsp" />
        <!-- Search Wrapper Area End -->

        <!-- ##### Main Content Wrapper Start ##### -->
        <div class="main-content-wrapper d-flex clearfix">
            <!-- Header Area Start -->
            <jsp:include page="parciais/header.jsp" />
            <!-- Header Area End -->

            <jsp:include page="parciais/categorias.jsp" />

            <div class="amado_product_area section-padding-100">
                <div class="container-fluid">
                    <div class="row" id="lista">
                        <% out.println("<input type='hidden' id='JSON' value='" + request.getAttribute("JSON").toString() + "' />"); %>
                        <%
                           /* ArrayList<Game> games = new GameDAO().selectGames();

                            for (int i = 0; i < games.size(); i++) {
                                Game game = games.get(i);

                                out.println("<div class='col-12 col-sm-6 col-md-12 col-xl-6'>");
                                out.println("    <div class='single-product-wrapper'>");
                                out.println("        <div class='product-img'>");
                                out.println("            <a href='produto?id=" + game.getId() + "'>");
                                out.println("                <img src='" + game.getImagemUrl() + "' alt='" + game.getTitulo() + "' />");
                                out.println("            </a>");
                                out.println("        </div>");
                                out.println("        <div class='product-description d-flex align-items-center justify-content-between'>");
                                out.println("            <div class='product-meta-data'>");
                                out.println("                <div class='line'></div>");
                                out.println("                <p class='product-price'>" + game.getPrecoFormatado() + "</p>");
                                out.println("                <a href='produto?id=" + game.getId() + "'>");
                                out.println("                    <h6>" + game.getTitulo() + " - " + game.getPlataforma().getNome() + "</h6>");
                                out.println("                </a>");
                                out.println("            </div>");
                                out.println("            <div class='ratings-cart text-right'>");
                                out.println("                <div class='cart'>");
                                out.println("                    <a href='#' data-add-carrinho='" + game.getId() + "' data-toggle='tooltip' data-placement='right' title='Adicionar ao Carrinho'><img src='assets/img/core-img/cart.png' alt=''></a>");
                                out.println("                </div>");
                                out.println("            </div>");
                                out.println("        </div>");
                                out.println("    </div>");
                                out.println("</div>");
                            }*/
                        %>
                    </div>
                </div>
            </div>
        </div>
        <form id="addcarrinho" action="addcart" method="post">
            <input type="hidden" id="idGame" name="idGame" value=""/>
        </form>
        <!-- ##### Main Content Wrapper End ##### -->

        <!-- ##### Footer Area Start ##### -->
        <jsp:include page="parciais/footer.jsp" />
        <!-- ##### Footer Area End ##### -->

        <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
        <jsp:include page="parciais/scripts.jsp" />
        <script src="scripts/explorar.js" type="text/javascript"></script>
    </body>

</html>