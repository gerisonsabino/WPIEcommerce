package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Inicio", urlPatterns = {"/inicio"})
public class InicioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        /*
        Cookie cookie = null;
        
        for (Cookie c : request.getCookies()) {
            if (c.getName().equals("idgames")) {
                cookie = c;
            }
        }
        
        cookie.setValue("[]");
        
        response.addCookie(cookie);
        */
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/inicio.jsp");
        dispatcher.forward(request, response);
    }
}
