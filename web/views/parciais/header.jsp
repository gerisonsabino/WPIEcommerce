<%@page import="classes.Carrinho"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="mobile-nav">
    <div class="amado-navbar-brand">
        <a href="index.jsp">
            <img src="assets/img/tg.png" alt="This.Games" />
        </a>
    </div>
    <div class="amado-navbar-toggler">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<header class="header-area clearfix">
    <div class="nav-close">
        <i class="fa fa-close" aria-hidden="true"></i>
    </div>
    <div class="logo">
        <a href="index.jsp">
            <img src="assets/img/tg.png" alt="This.Games" />
        </a>
    </div>
    <div class="cart-fav-search mb-50">
        <a href="index.jsp" class="cart-nav">
            <img src="assets/img/core-img/inicio.png" alt="Início"/>Início
        </a>
        <a href="explorar.jsp" class="cart-nav">
            <img src="assets/img/core-img/explorar.png" alt="Explorar"/>Explorar
        </a>
        <a href="#" class="search-nav" onclick="$('#search').focus();">
            <img src="assets/img/core-img/search.png" alt="Pesquisar" />Pesquisar
        </a>
        <a href="carrinho.jsp" class="cart-nav">
            <img src="assets/img/core-img/cart.png" alt="Carrinho" />Carrinho 
            <%
                try {
                    Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
                    out.println("<span>("+ carrinho.getItens().size() +")</span>");
                }catch(Exception e){
                    out.println("<span>(0)</span>");
                }
            %>
            
        </a>
    </div>
    <div class="amado-btn-group mt-30 mb-100">
        <a href="recomendacoes.jsp" class="btn amado-btn mb-15">Recomendações</a>
    </div>
</header>