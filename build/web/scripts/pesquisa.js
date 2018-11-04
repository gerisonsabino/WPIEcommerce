var xmlHttp;
function pesquisarGames() {
    debugger;
     var jsGame = document.getElementById("search").value;

     if(jsGame == "") {
        document.getElementById("resultados").innerHTML = "";
        return;
     }

     var url = "ajax/listapesquisa.jsp?termo=" + jsGame;

     if (window.ActiveXObject) {
         xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
     }
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
     if (xmlHttp.readyState == 1) {
         
     }
     if (xmlHttp.readyState == 4) {
         if (xmlHttp.status == 200) {
             xmlDoc = xmlHttp.responseText;

             document.getElementById("resultados").innerHTML = xmlDoc;
             
             $(".table-resultados tbody tr").click(function(){ 
                 location.href = "produto?id=" + $(this).attr("data-produto");
             });
             
             $(".search-close").click(function(){
                $("#search").val(""); 
                $("#resultados").html(""); 
             });
         }
     }
 }