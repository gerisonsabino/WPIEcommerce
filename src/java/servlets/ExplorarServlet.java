package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ws.WebService;

@WebServlet(name = "ExplorarServlet", urlPatterns = {"/explorar"})
public class ExplorarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String plataforma = request.getParameter("plataforma");
        String genero = request.getParameter("genero");
        String desenvolvedor = request.getParameter("desenvolvedor");
        
        int idP, idG, idD;
        idP = idG = idD = 0;
        
        if (plataforma != null && !plataforma.equals(""))
            idP = Integer.parseInt(plataforma);
        
        if (genero != null && !genero.equals(""))
            idG = Integer.parseInt(genero);
            
        if (desenvolvedor != null && !desenvolvedor.equals(""))
            idD = Integer.parseInt(desenvolvedor);
        
        String json = new WebService().getJson(idP, idG, idD);
        
        request.setAttribute("JSON", json);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/explorar.jsp?" + (idP > 0 ? "plataforma=" + idP : "") + (idG > 0 ? "&genero=" + idG : "") + (idD > 0 ? "&desenvolvedor=" + idD : ""));
        dispatcher.forward(request, response);
    }
}
