package servlets;

import classes.Carrinho;
import classes.ItemCarrinho;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RemoveCarrinhoServlet", urlPatterns = {"/removecart"})
public class RemoveCarrinhoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");

        int posicao = Integer.parseInt(request.getParameter("posicao"));

        ItemCarrinho item = carrinho.getItens().get(posicao);
        carrinho.getItens().remove(item);

        session.removeAttribute("carrinho");
        session.setAttribute("carrinho", carrinho);
        response.sendRedirect("carrinho.jsp");
    }
}
