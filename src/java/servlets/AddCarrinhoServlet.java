/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.Carrinho;
import classes.Game;
import classes.ItemCarrinho;
import dao.GameDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddCarrinhoServlet", urlPatterns = {"/AddCarrinhoServlet"})
public class AddCarrinhoServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Carrinho carrinho = (Carrinho)session.getAttribute("carrinho");
        
        if(carrinho == null){
            carrinho = new Carrinho();
        }
        
        int id = Integer.parseInt(request.getParameter("idGame"));
        
        Game game = new GameDAO().selectGameByID(id);
        ItemCarrinho item = new ItemCarrinho();
               
        item.setProduto(game);
        /*itemCart.setQuantidade(1);*/
        carrinho.getItens().add(item);

        session.removeAttribute("carrinho");
        session.setAttribute("carrinho", carrinho);
        response.sendRedirect("carrinho.jsp");
    }
    // </editor-fold>
}
