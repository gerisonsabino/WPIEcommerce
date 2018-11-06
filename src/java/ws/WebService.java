package ws;

import classes.Game;
import com.google.gson.Gson;
import dao.GameDAO;
import java.util.ArrayList;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

@Path("explorar")
public class WebService 
{
    @Context
    private UriInfo context;

    public WebService() 
    {
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/explorar/{plataforma}/{genero}/{desenvolvedor}")
    public String getJson(@PathParam("plataforma") int plataforma, @PathParam("genero") int genero, @PathParam("desenvolvedor") int desenvolvedor)
    {        
        ArrayList<Game> games = new GameDAO().selectGames(plataforma, genero, desenvolvedor);
        
        return new Gson().toJson(games);
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) 
    {
    }
}
