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
                        <% out.println("<input type='hidden' id='plataforma' value='" + request.getAttribute("plataforma").toString() + "' />"); %>
                        <% out.println("<input type='hidden' id='genero' value='" + request.getAttribute("genero").toString() + "' />"); %>
                        <% out.println("<input type='hidden' id='desenvolvedor' value='" + request.getAttribute("desenvolvedor").toString() + "' />"); %>
                    </div>
                </div>
            </div>
        </div>
        <form id="addcarrinho" action="carrinho" method="post">
            <input type="hidden" id="add" name="add" value="add"/>
            <input type="hidden" id="idGame" name="idGame" value=""/>
        </form>
        <!-- ##### Main Content Wrapper End ##### -->

        <!-- ##### Footer Area Start ##### -->
        <jsp:include page="parciais/footer.jsp" />
        <!-- ##### Footer Area End ##### -->

        <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
        <jsp:include page="parciais/scripts.jsp" />
        
        <script src="scripts/categorias.js" type="text/javascript"></script>
        <script src="scripts/explorar.js" type="text/javascript"></script>
    </body>
</html>