package servlets;

import classes.Carrinho;
import classes.Conexao;
import classes.Game;
import classes.ItemCarrinho;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Carrinho", urlPatterns = {"/carrinho"})
public class CarrinhoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        HttpSession session = request.getSession(true);
        Carrinho carrinho = (Carrinho)session.getAttribute("carrinho");
        
        if (request.getParameter("add") != null) 
        {
            int idGame = Integer.parseInt(request.getParameter("idGame"));
            carrinho = add(carrinho, idGame);
        }
        else if (request.getParameter("remove") != null) 
        {
            int posicao = Integer.parseInt(request.getParameter("posicao"));
            carrinho = remove(carrinho, posicao);
        }

        session.removeAttribute("carrinho");
        session.setAttribute("carrinho", carrinho);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/carrinho.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/carrinho.jsp");
        dispatcher.forward(request, response);
    }
    
    private Carrinho add(Carrinho carrinho, int idGame)
    {
        if(carrinho == null)
            carrinho = new Carrinho();
        
        Game game = GetGameInWS(idGame);
        
        ItemCarrinho item = new ItemCarrinho();
               
        item.setProduto(game);
        carrinho.getItens().add(item);
        
        return carrinho;
    }
    
    private Carrinho remove(Carrinho carrinho, int posicao)
    {
        ItemCarrinho item = carrinho.getItens().get(posicao);
        carrinho.getItens().remove(item);

        return carrinho;
    }
    
    private Game GetGameInWS(int idGame)
    {
        Game g = null;
        
        try 
        {
            URL url = new URL(Conexao.getWSConnection() + "/game/selectgamebyid/" + idGame);
            
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");
            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("Falhou : HTTP código de erro: " + conn.getResponseCode());
            }
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String output;
            String json = "";
            
            while ((output = br.readLine()) != null) 
            {
                json += output;
            }

            g = new Gson().fromJson(json, Game.class);
            
            return g;
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return g;
    }
}
