package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Produto", urlPatterns = {"/produto"})
public class ProdutoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try 
        {
            int id = Integer.parseInt(request.getParameter("id"));
        
            //REGISTRAR COOKIES

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/produto.jsp?id=" + id);
            dispatcher.forward(request, response);
        }
        catch (Exception e) 
        {
            response.sendRedirect("explorar");
        }
    }
}
