<%@page import="classes.Util"%>
<%@page import="dao.GameDAO"%>
<%@page import="classes.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Carrinho | This.Game</title>

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

            <div class="cart-table-area section-padding-100">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-lg-8">
                            <div class="cart-title">
                                <h2>Meu Carrinho</h2>
                            </div>

                            <div class="cart-table clearfix">
                                <table class="table table-responsive">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Produto</th>
                                            <th>Preço</th>
                                            <th>Opções</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList<Game> games = new GameDAO().selectGames();
                                            
                                            Double total = 0.0d; 
                                            
                                            for (int i = 0; i < games.size(); i++) 
                                            {
                                                Game game = games.get(i);
                                                
                                                out.println("<tr data-produto='" + game.getId() + "' data-preco='" + game.getPreco() + "' data-quantidade='1'>");
                                                out.println("    <td class='cart_product_img'>");
                                                out.println("        <a href='produto.jsp?id=" + game.getId() + "' target='_blank'><img src='" + game.getImagemUrl() + "' alt='" + game.getTitulo() + "'></a>");
                                                out.println("    </td>");
                                                out.println("    <td class='cart_product_desc'>");
                                                out.println("        <h5>" + game.getTitulo() + " - " + game.getPlataforma().getNome() + "</h5>");
                                                out.println("    </td>");
                                                out.println("    <td class='price'>");
                                                out.println("        <span>" + game.getPrecoFormatado() + "</span>");
                                                out.println("    </td>");
                                                out.println("    <td class='qty'>");
                                                out.println("        <button class='btn'>Remover</button>");
                                                out.println("    </td>");
                                                /*out.println("    <td class='qty'>");
                                                out.println("        <div class='qty-btn d-flex'>");
                                                out.println("            <p>Qtde.</p>");
                                                out.println("            <div class='quantity'>");
                                                out.println("                <span class='qty-minus' onclick=\"var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;\"><i class='fa fa-minus' aria-hidden='true'></i></span>");
                                                out.println("                <input type='number' class='qty-text' id='qty' step='1' min='1' max='300' name='quantity' value='1'>");
                                                out.println("                <span class='qty-plus' onclick=\"var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;\"><i class='fa fa-plus' aria-hidden='true'></i></span>");
                                                out.println("            </div>");
                                                out.println("        </div>");
                                                out.println("    </td>");*/
                                                out.println("</tr>");
                                                
                                                total += game.getPreco();
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4">
                            <div class="cart-title">
                                <h2>Pedido</h2>
                            </div>
                            <div class="cart-summary">
                                <h5>Resumo do Pedido</h5>
                                <ul class="summary-table">
                                    <li><span>Subtotal:</span> <span><% out.println(Util.toStringCurrency(total)); %></span></li>
                                    <li><span>Frete:</span> <span>Grátis</span></li>
                                    <li><span>Total:</span> <span><% out.println(Util.toStringCurrency(total)); %></span></li>
                                </ul>
                                <div class="cart-btn mt-100">
                                    <a href="#" class="btn amado-btn w-100">Finalizar Pedido</a>
                                </div>
                            </div>
                        </div>
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
