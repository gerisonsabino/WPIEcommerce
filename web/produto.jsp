<%@page import="java.util.ArrayList"%>
<%@page import="classes.Util"%>
<%@page import="classes.Game"%>
<%@page import="dao.GameDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Game game = new GameDAO().selectGameByID(Integer.parseInt(request.getParameter("id")));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title><% out.println(game.getTitulo() + " - " + game.getPlataforma().getNome()); %> | This.Game</title>

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

            <!-- Product Details Area Start -->
            <div class="single-product-area section-padding-100 clearfix">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-lg-7">
                            <div class="single_product_thumb">
                                <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <a class="gallery_img" href="<%out.println(game.getImagemUrl());%>">
                                                <img class="d-block w-100" src="<%out.println(game.getImagemUrl());%>" alt="<%out.println(game.getTitulo() + " - " + game.getPlataforma().getNome());%>">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-5">
                            <div class="single_product_desc">
                                <!-- Product Meta Data -->
                                <div class="product-meta-data mb-30">
                                    <div class="line"></div>
                                    <p class="product-price"><% out.println(game.getPrecoFormatado()); %></p>
                                    <a href="produto.jsp?id=<% out.println(game.getId()); %>">
                                        <h6><%out.println(game.getTitulo() + " - " + game.getPlataforma().getNome());%></h6>
                                    </a>
                                    <!-- Avaiable -->
                                    <p class="avaibility"><i class="fa fa-circle"></i> Em estoque</p>
                                </div>

                                <form class="cart clearfix" action="AddCarrinhoServlet" method="post">
                                    <!-- 
                                    <div class="cart-btn d-flex mb-50">
                                        <p>Quantidade</p>
                                        <div class="quantity">
                                            <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                                            <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
                                            <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                                        </div>
                                    </div> 
                                    -->
                                    <input type="hidden" id="idGame" name="idGame" value="<% out.print(game.getId()); %>"/>
                                    <button type="submit" name="addtocart" class="btn amado-btn">Adicionar ao Carrinho</button>
                                </form>

                                <div class="short_overview my-5 descricao">
                                    <p><% out.println(game.getDescricao()); %></p>
                                    <strong><small>Lançamento: </small><% out.println(Util.toShortDateString(game.getLancamento())); %></strong>
                                    <strong><small>Desenvolvedor: </small><% out.println(game.getDesenvolvedor().getNome()); %></strong>
                                    <strong><small>Gênero: </small><% out.println(game.getGenero().getDescricao()); %></strong>
                                    <strong><small>Plataforma: </small><% out.println(game.getPlataforma().getNome()); %></strong>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Product Details Area End -->
        </div>

        <!-- ##### Main Content Wrapper End ##### -->

        <!-- ##### Footer Area Start ##### -->
        <jsp:include page="views/parciais/footer.jsp" />
        <!-- ##### Footer Area End ##### -->
        <jsp:include page="views/parciais/scripts.jsp" />
    </body>
</html>
