package servlets;

import classes.Conexao;
import classes.Game;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
            Integer id = Integer.parseInt(request.getParameter("id"));
            
            request.setAttribute("Game", GetGameInWS(id));
            
            //REGISTRAR NO COOKIE
            Cookie cookie = null;

            for (Cookie c : request.getCookies()) {
                if (c.getName().equals("idgames")) {
                    cookie = c;
                }
            }

            if (cookie == null) 
            {
                cookie = new Cookie("idgames", "[\"" + id + "\"]");
                cookie.setMaxAge(606024 * 31);
            } 
            else 
            {
                String a = cookie.getValue();
                ArrayList<String> ids = new ArrayList<>();
                ids = new Gson().fromJson(cookie.getValue(), ids.getClass());
                
                boolean b = false;
                for (int i = 0; i < ids.size(); i++) {
                    if (ids.get(i).toString().equals(id.toString())) {
                        b = true;
                    }
                }
                
                if (!b) {
                    ids.add(id.toString());
                }
                
                cookie.setValue(new Gson().toJson(ids));
            }
            
            response.addCookie(cookie);
            
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/produto.jsp?id=" + id);
            dispatcher.forward(request, response);
        }
        catch (Exception e) 
        {
            response.sendRedirect("explorar");
        }
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
