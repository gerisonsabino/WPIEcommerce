<%@page import="dao.DesenvolvedorDAO"%>
<%@page import="classes.Desenvolvedor"%>
<%@page import="dao.PlataformaDAO"%>
<%@page import="classes.Plataforma"%>
<%@page import="dao.GeneroDAO"%>
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
            out.println("   <div class='catagories-menu'>");
            out.println("       <ul>");
            out.println("           <li>");
            out.println("               <a href='explorar.jsp'>Limpar Filtros</a>");
            out.println("           </li>");
            out.println("       </ul>");
            out.println("   </div>");
            out.println("</div>");
        }
    %>
    <div class="widget catagory mb-30">
        <h6 class="widget-title mb-10">Plataforma</h6>
        <div class="catagories-menu">
            <%                
                ArrayList<Plataforma> plataformas = new PlataformaDAO().selectPlataformas();

                out.println("<ul>");
                
                for (int i = 0; i < plataformas.size(); i++) 
                {
                    Plataforma plataforma = plataformas.get(i);
                    
                    if (idP > 0 && idP == plataforma.getId())
                        out.println("<li class='active'><a href='explorar.jsp?plataforma=" + (plataforma.getId() + (idG > 0 ? "&genero=" + idG : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + plataforma.getNome().toLowerCase()  + "<span> (" + plataforma.countGames() + ")</span></a></li>");
                    else if (idP == 0)
                        out.println("<li><a href='explorar.jsp?plataforma=" + (plataforma.getId() + (idG > 0 ? "&genero=" + idG : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + plataforma.getNome().toLowerCase() + "<span> (" + plataforma.countGames() + ")</span></a></li>");
                }
                
                out.println("</ul>");
            %>
        </div>
    </div>
    <div class="widget catagory mb-30">
        <h6 class="widget-title mb-10">Gênero</h6>
        <div class="catagories-menu">
            <%
                ArrayList<Genero> generos = new GeneroDAO().selectGeneros();

                out.println("<ul>");
                for (int i = 0; i < generos.size(); i++) 
                {                    
                    Genero genero = generos.get(i);
                    
                    if (idG > 0 && idG == genero.getId())
                        out.println("<li class='active'><a href='explorar.jsp?genero=" + (genero.getId() + (idP > 0 ? "&plataforma=" + idP : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + genero.getDescricao().toLowerCase() + "</a></li>");
                    else if(idG == 0)
                        out.println("<li><a href='explorar.jsp?genero=" + (genero.getId() + (idP > 0 ? "&plataforma=" + idP : "") + (idD > 0 ? "&desenvolvedor=" + idD : "")) + "'>" + genero.getDescricao().toLowerCase() + "</a></li>");

                }
                out.println("</ul>");
            %>
        </div>
    </div>
    <div class="widget catagory mb-30">
        <h6 class="widget-title mb-10">Desenvolvedor</h6>
        <div class="catagories-menu">
            <%
                ArrayList<Desenvolvedor> desenvolvedores = new DesenvolvedorDAO().selectDesenvolvedores();

                out.println("<ul>");
                
                for (int i = 0; i < desenvolvedores.size(); i++) 
                {
                    Desenvolvedor desenvolvedor = desenvolvedores.get(i);
                    
                    if (idD > 0 && desenvolvedor.getId() == idD) 
                        out.println("<li class='active'><a href='explorar.jsp?desenvolvedor=" + (desenvolvedor.getId() + (idG > 0 ? "&genero=" + idG : "") + (idP > 0 ? "&plataforma=" + idP : "")) +  "'>" + desenvolvedor.getNome().toLowerCase() + "</a></li>");
                    else if(idD == 0)
                        out.println("<li><a href='explorar.jsp?desenvolvedor=" + (desenvolvedor.getId() + (idG > 0 ? "&genero=" + idG : "") + (idP > 0 ? "&plataforma=" + idP : "")) +  "'>" + desenvolvedor.getNome().toLowerCase() + "</a></li>");
                }
                
                out.println("</ul>");
            %>
        </div>
    </div>
</div>