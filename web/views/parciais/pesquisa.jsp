<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/listapesquisa.css" rel="stylesheet" type="text/css"/>
<div class="search-wrapper section-padding-100">
    <div class="search-close">
        <i class="fa fa-close" aria-hidden="true"></i>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="search-content">
                    <form action="#" method="get">
                        <input type="search" name="search" id="search" placeholder="Busque pelo nome do jogo..."  onkeyup="pesquisarGames()" autocomplete="off" />
                        
                        <button type="button">
                            <img src="img/core-img/search.png" alt="">
                        </button>
                    </form>
                </div>
                <div id="resultados">
                    
                </div>    
            </div>
        </div>
    </div>
</div>
<script src="scripts/pesquisa.js" type="text/javascript"></script>