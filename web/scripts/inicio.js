$(document).ready(function(){ 
    vitrine();
});

function vitrine() { 
    $.ajax({
        type: "GET",
        url: $("#ConexaoWS").val() + "/game/selectgamesrandom/30/",
        success: function(json) {
            var html = "";
    
            for (var i = 0; i < json.length; i++) {
                var game = json[i];

                html += "<div class='single-products-catagory clearfix' style=\"background: url('"+ game.imagemUrl +"') center center / cover no-repeat #f5f7fa;\">";
                html += "    <a href='produto?id=" + game.id + "'>";
                html += "        <div class='hover-content'>";
                html += "            <div class='line'></div>";
                html += "            <p>" + game.precoFormatado + "</p>";
                html += "            <h4>" + game.titulo + "</h4>";
                html += "            <label>" + game.genero.descricao + "</label>";
                html += "            <label>" + game.plataforma.nome + "</label>";
                html += "            <label>" + game.desenvolvedor.nome + "</label>";
                html += "        </div>";
                html += "    </a>";
                html += "</div>";
            }
            
            $("#div-vitrine").html(html);
        }
    });
}