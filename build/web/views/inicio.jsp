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
    <jsp:include page="parciais/pesquisa.jsp" />
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">
        <!-- Header Area Start -->
        <jsp:include page="parciais/header.jsp" />
        <!-- Header Area End -->


        <!-- Product Catagories Area Start -->
        <div class="products-catagories-area clearfix">
            <div class="amado-pro-catagory clearfix" id="div-vitrine"></div>
        </div>
        <!-- Product Catagories Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <jsp:include page="parciais/footer.jsp" />
    
    <script src="scripts/inicio.js" type="text/javascript"></script>

    <!-- ##### Footer Area End ##### -->
    <jsp:include page="parciais/scripts.jsp" />
</body>
</html>