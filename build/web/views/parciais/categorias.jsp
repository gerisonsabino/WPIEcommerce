<%@page import="classes.Desenvolvedor"%>
<%@page import="classes.Plataforma"%>
<%@page import="classes.Genero"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    /*parametros para criação da QueryString de filtro*/
    
    String p = request.getParameter("plataforma");
    String g = request.getParameter("genero");
    String d = request.getParameter("desenvolvedor");
    
    int idP = 0;
    if (p != null && p != "")
        idP = Integer.parseInt(p);

    int idG = 0;
    if (g != null && g != "")
        idG = Integer.parseInt(g);

    int idD = 0;
    if (d != null && d != "")
        idD = Integer.parseInt(d);
%>



<div class="shop_sidebar_area">
    <% 
        if ((idD + idG + idP) > 0) {
            out.println("<div class='widget catagory mb-30'>");
            out.println("   <div class='amado-btn-group'>");
            out.println("       <a class='btn amado-btn-sm' href='explorar'>Limpar Filtros</a>");
            out.println("   </div>");
            out.println("</div>");
        }
    %>
    <div class="widget catagory mb-30">
        <h6 class="widget-title mb-10">Plataforma</h6>
        <div class="catagories-menu" id="cat-plataformas">
            <%                
               /* ArrayList<Plataforma> plataformas = new PlataformaDAO().selectPlataformas();

                out.println("<ul>");
                
                if (idP > 0) 
                {
                    Plataforma plataforma = new PlataformaDAO().selectPlataformaByID(idP);
                    out.println("<li class='active'><a href='explorar?plataforma=" + (plataforma.getId() + (idG > 0 ? "&genero=" + idG : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + plataforma.getNome().toLowerCase()  + "<small> (" + plataforma.countGames(idG, idD) + ")</small></a></li>");
                }
                else
                {
                    for (int i = 0; i < plataformas.size(); i++) 
                    {
                        Plataforma plataforma = plataformas.get(i);
                        out.println("<li><a href='explorar?plataforma=" + (plataforma.getId() + (idG > 0 ? "&genero=" + idG : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + plataforma.getNome().toLowerCase() + "<small> (" + plataforma.countGames(idG, idD) + ")</small></a></li>");
                    }
                }
                
                out.println("</ul>");*/
            %>
        </div>
    </div>
    <div class="widget catagory mb-30">
        <h6 class="widget-title mb-10">Gênero</h6>
        <div class="catagories-menu" id="cat-generos">
            <%
               /* ArrayList<Genero> generos = new GeneroDAO().selectGeneros();

                out.println("<ul>");
                
                if (idG > 0) 
                {
                    Genero genero = new GeneroDAO().selectGeneroByID(idG);
                    out.println("<li class='active'><a href='explorar?genero=" + (genero.getId() + (idP > 0 ? "&plataforma=" + idP : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + genero.getDescricao().toLowerCase() + "<small> (" + genero.countGames(idP, idD) + ")</small></a></li>");
                }
                else
                {
                    for (int i = 0; i < generos.size(); i++) 
                    {                    
                        Genero genero = generos.get(i);
                        out.println("<li><a href='explorar?genero=" + (genero.getId() + (idP > 0 ? "&plataforma=" + idP : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + genero.getDescricao().toLowerCase() + "<small> (" + genero.countGames(idP, idD) + ")</small></a></li>");
                    }
                }
                
                out.println("</ul>");*/
            %>
        </div>
    </div>
    <div class="widget catagory mb-30">
        <h6 class="widget-title mb-10">Desenvolvedor</h6>
        <div class="catagories-menu" id="cat-desenvolvedores">
            <%
                /*ArrayList<Desenvolvedor> desenvolvedores = new DesenvolvedorDAO().selectDesenvolvedores();

                out.println("<ul>");
                
                if (idD > 0) 
                {
                    Desenvolvedor desenvolvedor = new DesenvolvedorDAO().selectDesenvolvedorByID(idD);
                    out.println("<li class='active'><a href='explorar?desenvolvedor=" + (desenvolvedor.getId() + (idG > 0 ? "&genero=" + idG : "") + (idP > 0 ? "&plataforma=" + idP : "")) +  "'>" + desenvolvedor.getNome().toLowerCase() + "<small> (" + desenvolvedor.countGames(idG, idP) + ")</small></a></li>");
                }
                else
                {
                    for (int i = 0; i < desenvolvedores.size(); i++) 
                    {
                        Desenvolvedor desenvolvedor = desenvolvedores.get(i);
                        out.println("<li><a href='explorar?desenvolvedor=" + (desenvolvedor.getId() + (idG > 0 ? "&genero=" + idG : "") + (idP > 0 ? "&plataforma=" + idP : "")) +  "'>" + desenvolvedor.getNome().toLowerCase() + "<small> (" + desenvolvedor.countGames(idG, idP) + ")</small></a></li>");
                    }
                }
                
                out.println("</ul>");*/
            %>
        </div>
    </div>
</div>