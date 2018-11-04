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

    <title>Recomendações | This.Game</title>

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
        
        <div class="shop_sidebar_area">
            <div class="widget catagory mb-30">
                <h6 class="widget-title mb-10">Você visualizou: </h6>
                <div class="catagories-menu">
                    <%                
                        out.println("<ul>");
                        
                        for (int i = 0; i < 10; i++) 
                        {
                            Game g = new GameDAO().selectGameByID(i + 1);
                            
                            out.println("<li><a href='#'>" + g.getTitulo() + "</a></li>");
                        }
                        
                        out.println("</ul>");
                    %>
                </div>
            </div>
        </div>
        
        <div class="amado_product_area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                <%
                    for (int i = 0; i < 5; i++) {
                        Game game = new GameDAO().selectGameByID(i + 1);
                        
                        out.println("<div class='col-12 col-sm-6 col-md-12 col-xl-6'>");
                        out.println("    <div class='single-product-wrapper'>");
                        out.println("        <div class='product-img'>");
                        out.println("            <a href='produto.jsp?id=" + game.getId() + "'>");
                        out.println("                <img src='" + game.getImagemUrl() + "' alt='" + game.getTitulo() + "' />");
                        out.println("            </a>");
                        out.println("        </div>");
                        out.println("        <div class='product-description d-flex align-items-center justify-content-between'>");
                        out.println("            <div class='product-meta-data'>");
                        out.println("                <div class='line'></div>");
                        out.println("                <p class='product-price'>" + game.getPrecoFormatado() + "</p>");
                        out.println("                <a href='produto.jsp?id=" + game.getId() + "'>");
                        out.println("                    <h6>" + game.getTitulo() + " - " + game.getPlataforma().getNome() + "</h6>");
                        out.println("                </a>");
                        out.println("            </div>");
                        out.println("            <div class='ratings-cart text-right'>");
                        out.println("                <div class='cart'>");
                        out.println("                    <a href='#' data-toggle='tooltip' data-placement='left' title='Adicionar ao Carrinho'><img src='assets/img/core-img/cart.png' alt=''></a>");
                        out.println("                </div>");
                        out.println("            </div>");
                        out.println("        </div>");
                        out.println("    </div>");
                        out.println("</div>");
                    }
                %>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <jsp:include page="views/parciais/footer.jsp" />
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <jsp:include page="views/parciais/scripts.jsp" />
</body>

</html>