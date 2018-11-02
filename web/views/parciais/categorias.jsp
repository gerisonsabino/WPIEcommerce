<%-- 
    Document   : categorias
    Created on : 01/11/2018, 18:17:41
    Author     : geris
--%>

<%@page import="dao.DesenvolvedorDAO"%>
<%@page import="classes.Desenvolvedor"%>
<%@page import="dao.PlataformaDAO"%>
<%@page import="classes.Plataforma"%>
<%@page import="dao.GeneroDAO"%>
<%@page import="classes.Genero"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="shop_sidebar_area">
    <div class="widget catagory mb-50">
        <h6 class="widget-title mb-30">Plataformas</h6>
        <div class="catagories-menu">
            <%
                ArrayList<Plataforma> plataformas = new PlataformaDAO().SelectPlataformas();

                out.println("<ul>");
                for (int i = 0; i < plataformas.size(); i++) 
                {
                    Plataforma plataforma = plataformas.get(i);
                    out.println("<li classs='active'><a href='explorar.jsp?plataforma=" + plataforma.getId() + "'>" + plataforma.getNome().toLowerCase() + "</a></li>");
                }
                out.println("</ul>");
            %>
        </div>
    </div>
    <div class="widget catagory mb-50">
        <h6 class="widget-title mb-30">Gêneros</h6>
        <div class="catagories-menu">
            <%
                ArrayList<Genero> generos = new GeneroDAO().SelectGeneros();

                out.println("<ul>");
                for (int i = 0; i < generos.size(); i++) 
                {
                    Genero genero = generos.get(i);
                    out.println("<li classs='active'><a href='explorar.jsp?genero=" + genero.getId() + "'>" + genero.getDescricao().toLowerCase() + "</a></li>");
                }
                out.println("</ul>");
            %>
        </div>
    </div>
    <div class="widget catagory mb-50">
        <h6 class="widget-title mb-30">Desenvolvedores</h6>
        <div class="catagories-menu">
            <%
                ArrayList<Desenvolvedor> desenvolvedores = new DesenvolvedorDAO().SelectDesenvolvedores();

                out.println("<ul>");
                for (int i = 0; i < desenvolvedores.size(); i++) 
                {
                    Desenvolvedor desenvolvedor = desenvolvedores.get(i);
                    out.println("<li classs='active'><a href='explorar.jsp?desenvolvedor=" + desenvolvedor.getId() + "'>" + desenvolvedor.getNome().toLowerCase() + "</a></li>");
                }
                out.println("</ul>");
            %>
        </div>
    </div>
</div>