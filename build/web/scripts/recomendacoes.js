$(document).ready(function(){ 
    listaHistorico();
    listaRecomendacao();
});


function listaHistorico() {
    var cookie = JSON.parse($("#cookie").val());
    
    $("#div-jogos-visualizados").html("<ul>");
    
    for (var i = 0; i < cookie.length; i++) {
        $.ajax({
            type: "GET",
            url: $("#ConexaoWS").val() + "/game/selectgamebyid/" + cookie[i],
            success: function (json) {
                $("#div-jogos-visualizados > ul").append("<li><a href='produto?id="+ json.id +"'>" + json.titulo + "</a></li>");
            }
        });        
    }
}

function listaRecomendacao() {

    $.ajax({
        type: "GET",
        url: $("#ConexaoWS").val() + "/game/selectrecomendacoes/" + $("#cookie").val(),
        success: function(json) {
            var html = "";
    
            for (var i = 0; i < json.length; i++) {
                var game = json[i];

                html += "<div class='col-12 col-sm-6 col-md-12 col-xl-6'>";
                html += "    <div class='single-product-wrapper'>";
                html += "        <div class='product-img'>";
                html += "            <a href='produto?id=" + game.id + "'>";
                html += "                <img src='" + game.imagemUrl + "' alt='" + game.titulo + "' />";
                html += "            </a>";
                html += "        </div>";
                html += "        <div class='product-description d-flex align-items-top justify-content-between'>";
                html += "            <div class='product-meta-data'>";
                html += "                <div class='line'></div>";
                html += "                <p class='product-price'>" + game.precoFormatado + "</p>";
                html += "                <a href='produto?id=" + game.id + "'>";
                html += "                    <h6>" + game.titulo + " - " + game.plataforma.nome + "</h6>";
                html += "                </a>";
                html += "            </div>";
                html += "            <div class='ratings-cart text-right'>";
                html += "                <div class='cart' data-add-carrinho='" + game.id + "' data-toggle='tooltip' data-placement='right' title='Adicionar ao Carrinho'>";
                html += "                    <img src='assets/img/core-img/cart.png' alt='carrinho' />";
                html += "                </div>";
                html += "            </div>";
                html += "        </div>";
                html += "    </div>";
                html += "</div>";
            }
            
            $("#div-jogos-recomendados").html(html);
            
            $("[data-add-carrinho]").click(function () {
                var id = $(this).attr("data-add-carrinho");
                $("#idGame").val(id);
                $("#addcarrinho").submit();
            });
        }
    });
       
}