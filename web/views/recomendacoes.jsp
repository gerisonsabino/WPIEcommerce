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
    <% out.println("<input type='hidden' id='cookie' value='" + request.getAttribute("cookie") + "'>"); %>
    
    <!-- Search Wrapper Area Start -->
    <jsp:include page="parciais/pesquisa.jsp" />
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">
        <!-- Header Area Start -->
        <jsp:include page="parciais/header.jsp" />
        <!-- Header Area End -->
        
        <div class="shop_sidebar_area">
            <div class="widget catagory mb-30">
                <h6 class="widget-title mb-10">Você visualizou: </h6>
                <div class="catagories-menu" id="div-jogos-visualizados"></div>
            </div>
        </div>
        <div class="amado_product_area section-padding-100">
            <div class="container-fluid">
                <div class="row" id="div-jogos-recomendados"></div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <jsp:include page="parciais/footer.jsp" />
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <jsp:include page="parciais/scripts.jsp" />
    
    <script src="scripts/recomendacoes.js" type="text/javascript"></script>
</body>
</html>