const idP = parseInt($("#plataforma").val());
const idG = parseInt($("#genero").val());
const idD = parseInt($("#desenvolvedor").val());

$(function(){
    listarPlataformas();
    listarGeneros();
    listarDesenvolvedores();
});

function listarPlataformas() {
    if (idP > 0) {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/WSPIEcommerce/thisgame/plataforma/selectplataformabyid/" + idP,
            success: function(plataforma) {
                var html = "";

                html += "<ul>";
                html += "<li><a href='explorar?plataforma=" + (plataforma.id + (idG > 0 ? "&genero=" + idG : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + plataforma.nome.toLowerCase() + "<small data-count-plataforma='" + plataforma.id + "'></small></a></li>";
                html += "</ul>";

                $("#cat-plataformas").html(html);
                getCountPlataformas();
            }
        });
    }
    else
    {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/WSPIEcommerce/thisgame/plataforma/selectplataformas/",
            success: function(json) {
                var html = "";

                html += "<ul>";

                for (var i = 0; i < json.length; i++) 
                {
                    var plataforma = json[i];

                    html += "<li><a href='explorar?plataforma=" + (plataforma.id + (idG > 0 ? "&genero=" + idG : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + plataforma.nome.toLowerCase() + "<small data-count-plataforma='" + plataforma.id + "'></small></a></li>";
                }

                html += "</ul>";

                $("#cat-plataformas").html(html);
                getCountPlataformas();
            }
        });
    }
    
}

function getCountPlataformas() {
    $("[data-count-plataforma]").each(function(){
        var small = $(this);
        var id = $(small).attr("data-count-plataforma");
        
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/WSPIEcommerce/thisgame/game/selectcountbyidplataforma/" + id + "/" + idG + "/" + idD,
            success: function(json) {
                $(small).text(" (" + json.count + ")");
            }
        });   
    });
}

function listarGeneros() {
    if (idG > 0) {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/WSPIEcommerce/thisgame/genero/selectgenerobyid/" + idG,
            success: function(genero) {
                var html = "";

                html += "<ul>";
                html += "<li><a href='explorar?genero=" + (genero.id + (idP > 0 ? "&plataforma=" + idP : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + genero.descricao.toLowerCase() + "<small data-count-genero='" + genero.id + "'></small></a></li>";
                html += "</ul>";

                $("#cat-generos").html(html);
                getCountGeneros();
            }
        });
    }
    else
    {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/WSPIEcommerce/thisgame/genero/selectgeneros/",
            success: function(json) {
                var html = "";

                html += "<ul>";

                for (var i = 0; i < json.length; i++) 
                {
                    var genero = json[i];

                    html += "<li><a href='explorar?genero=" + (genero.id + (idP > 0 ? "&plataforma=" + idP : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + genero.descricao.toLowerCase() + "<small data-count-genero='" + genero.id + "'></small></a></li>";

                }

                html += "</ul>";

                $("#cat-generos").html(html);
                getCountGeneros();
            }
        });
    }
    
}

function getCountGeneros() {
    $("[data-count-genero]").each(function(){
        var small = $(this);
        var id = $(small).attr("data-count-genero");
        
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/WSPIEcommerce/thisgame/game/selectcountbyidgenero/" + id + "/" + idP + "/" + idD,
            success: function(json) {
                $(small).text(" (" + json.count + ")");
            }
        });   
    });
}

function listarDesenvolvedores() {
    if (idD > 0) {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/WSPIEcommerce/thisgame/desenvolvedor/selectdesenvolvedorbyid/" + idD,
            success: function(desenvolvedor) {
                var html = "";

                html += "<ul>";
                html += "<li><a href='explorar?desenvolvedor=" + (desenvolvedor.id) + ((idG > 0 ? "&genero=" + idG : "") + (idP > 0 ? "&plataforma=" + idP : "")) +  "'>" + desenvolvedor.nome.toLowerCase() + "<small data-count-desenvolvedor='" + desenvolvedor.id + "'></small></a></li>";
                html += "</ul>";

                $("#cat-desenvolvedores").html(html);
                getCountDesenvolvedores();
            }
        });
    }
    else
    {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/WSPIEcommerce/thisgame/desenvolvedor/selectdesenvolvedores/",
            success: function(json) {
                var html = "";

                html += "<ul>";

                for (var i = 0; i < json.length; i++) 
                {
                    var desenvolvedor = json[i];

                    html += "<li><a href='explorar?desenvolvedor=" + (desenvolvedor.id + (idG > 0 ? "&genero=" + idG : "") + (idP > 0 ? "&plataforma=" + idP : "")) +  "'>" + desenvolvedor.nome.toLowerCase() + "<small data-count-desenvolvedor='" + desenvolvedor.id + "'></small></a></li>";

                }

                html += "</ul>";

                $("#cat-desenvolvedores").html(html);
                getCountDesenvolvedores();
            }
        });
    }
    
}

function getCountDesenvolvedores() {
    $("[data-count-desenvolvedor]").each(function(){
        var small = $(this);
        var id = $(small).attr("data-count-desenvolvedor");
        
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/WSPIEcommerce/thisgame/game/selectcountbyiddesenvolvedor/" + id + "/" + idG + "/" + idP,
            success: function(json) {
                $(small).text(" (" + json.count + ")");
            }
        });   
    });
}