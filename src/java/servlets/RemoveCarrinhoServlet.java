package servlets;

import classes.Carrinho;
import classes.ItemCarrinho;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RemoveCarrinhoServlet", urlPatterns = {"/RemoveCarrinhoServlet"})
public class RemoveCarrinhoServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");

        int idProduto = Integer.parseInt(request.getParameter("idGame"));

        int i = 0;
        boolean removido = false;
        
        do 
        {
            ItemCarrinho item = carrinho.getItens().get(i);

            if (item.getProduto().getId() == idProduto) 
            {
                carrinho.getItens().remove(item);
                removido = true;
            }
            
            i++;
        } 
        while (!removido);

        session.removeAttribute("carrinho");
        session.setAttribute("carrinho", carrinho);
        response.sendRedirect("carrinho.jsp");
    }
    // </editor-fold>
}
