var xmlHttp;
function pesquisarGames() {
    debugger;
     var jsGame = document.getElementById("search").value;

     if(jsGame == "") {
        document.getElementById("resultados").innerHTML = "";
        return;
     }

     //Cria url para a página que faz a pesquisa
     var url = "ajax/listapesquisa.jsp?termo=" + jsGame;

     // code for IE6, IE5
     if (window.ActiveXObject) {
         xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
     }
     //IE7+, Firefox, Chrome, Opera, Safari
     else if (window.XMLHttpRequest) {
         xmlHttp = new XMLHttpRequest();
     }
     else {
         alert("Navegador não suporta AJAX");
     }

     xmlHttp.open('GET', url, true);
     xmlHttp.onreadystatechange = capturaeventos;
     xmlHttp.send(null);
}

function capturaeventos() {
     //Mostra imagem de carregando na caixa
     if (xmlHttp.readyState == 1) {
         
     }
     //Quando terminar de carregar a resposta
     if (xmlHttp.readyState == 4) {
         if (xmlHttp.status == 200) {
             //Captura a resposta do AJAX
             xmlDoc = xmlHttp.responseText;

             document.getElementById("resultados").innerHTML = xmlDoc;
             
             $(".table-resultados tbody tr").click(function(){ 
                 location.href = "produto.jsp?id=" + $(this).attr("data-produto");
             });
             
             $(".search-close").click(function(){
                $("#resultados").html(""); 
             });
         }
     }
 }