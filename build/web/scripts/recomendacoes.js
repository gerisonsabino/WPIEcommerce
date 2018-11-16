$(document).ready(function(){ 
    listaHistorico();
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
