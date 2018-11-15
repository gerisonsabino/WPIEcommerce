function pesquisar() {
    var termo = $("#search").val();
    
    if (termo != "" && termo != null) {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/WSPIEcommerce/thisgame/game/pesquisargames/" + termo,
            success: function(json) {
                var html = "";

                if (json.length > 0) 
                {
                    html += "<table class='table-resultados' tabindex='1' style='overflow: hidden; outline: none;'>";
                    html += "<tbody>";

                    for(var i=0; i < json.length; i++) 
                    {
                        var game = json[i];

                        html += "<tr data-produto='" + game.id + "' data-preco='" + game.preco + "'>";
                        html += "   <td class='cart_product_img'>";
                        html += "       <img width='40px' src='"+ game.imagemUrl +"' alt='" + game.titulo + "'>";
                        html += "   </td>";
                        html += "   <td class='cart_product_desc td-titulo'>";
                        html += "       " + game.titulo + " - " + game.plataforma.nome + "";
                        html += "   </td>";
                        html += "</tr>";
                    }

                    html += "</tbody>";
                    html += "</table>";
                }
                else
                {
                    html += "<table tabindex='1' style='overflow: hidden; outline: none; margin-top: 20px; width: 100%;' class='text-center'>";
                    html += "   <tbody>";
                    html += "       <tr>";
                    html += "           <td>Não encontramos nenhum resultado para \"" + termo + "\" em nossos produtos.</td>";
                    html += "       </tr>";
                    html += "   </tbody>";
                    html += "</table>";
                }
                
                $("#resultados").html(html);
                
                $(".table-resultados tbody tr").click(function(){
                    location.href="produto?id=" + $(this).attr("data-produto");
                });
            }
        });
    }
    else
    {
        $("#resultados").html("");
    }
}