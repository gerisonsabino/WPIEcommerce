package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Recomendacoes", urlPatterns = {"/recomendacoes"})
public class RecomendacoesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try 
        {
            Cookie cookie = null;
            for (Cookie c : request.getCookies()) {
                if (c.getName().equals("idgames")) {
                    cookie = c;
                }
            }

            if(cookie != null){
              request.setAttribute("cookie", cookie.getValue());
            }else{
            request.setAttribute("cookie", "[]");
            }
            
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/recomendacoes.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception e) 
        {
            response.sendRedirect("explorar");
        }
    }
}
