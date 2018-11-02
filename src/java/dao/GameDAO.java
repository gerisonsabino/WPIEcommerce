package dao;

import classes.Desenvolvedor;
import classes.Game;
import classes.Genero;
import classes.Plataforma;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import classes.Conexao;

public class GameDAO 
{
    public Game selectGameByID(int id)
    {
        Game game = null;
        
        try 
        {
            Connection con = Conexao.getConnection();
            
            String sql = "SELECT * FROM game WHERE ID=?;";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) 
            {
                game = new Game();
                
                game.setDescricao(rs.getString("Descricao"));
                game.setId(rs.getInt("ID"));
                game.setIdDesenvolvedor(rs.getInt("IDDesenvolvedor"));
                game.setIdGenero(rs.getInt("IDGenero"));
                game.setIdPlataforma(rs.getInt("IDPlataforma"));
                game.setImagemUrl(rs.getString("ImagemURL"));
                game.setLancamento(rs.getDate("Lancamento"));
                game.setPreco(rs.getDouble("Preco"));
                game.setTitulo(rs.getString("Titulo"));
            }

            rs.close();
            ps.close();
            con.close();            
            
            game.setDesenvolvedor(new DesenvolvedorDAO().selectDesenvolvedorByID(game.getIdDesenvolvedor()));
            game.setGenero(new GeneroDAO().selectGeneroByID(game.getIdGenero()));
            game.setPlataforma(new PlataformaDAO().selectPlataformaByID(game.getIdPlataforma()));
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return game;
    }
    
    public ArrayList<Game> selectGames()
    {
        ArrayList<Game> games = new ArrayList<Game>();
        ArrayList<Desenvolvedor> desenvolvedores = new DesenvolvedorDAO().selectDesenvolvedores();
        ArrayList<Genero> generos = new GeneroDAO().selectGeneros();
        ArrayList<Plataforma> plataformas = new PlataformaDAO().selectPlataformas();
        
        try 
        {
            Connection con = Conexao.getConnection();
            
            String sql = "SELECT * FROM game ORDER BY Titulo";

            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) 
            {
                Game game = new Game();
                
                game.setDescricao(rs.getString("Descricao"));
                game.setId(rs.getInt("ID"));
                game.setIdDesenvolvedor(rs.getInt("IDDesenvolvedor"));
                game.setIdGenero(rs.getInt("IDGenero"));
                game.setIdPlataforma(rs.getInt("IDPlataforma"));
                game.setImagemUrl(rs.getString("ImagemURL"));
                game.setLancamento(rs.getDate("Lancamento"));
                game.setPreco(rs.getDouble("Preco"));
                game.setTitulo(rs.getString("Titulo"));

                int i = 0;
               
                do
                {
                    if (desenvolvedores.get(i).getId() == game.getIdDesenvolvedor())
                        game.setDesenvolvedor(desenvolvedores.get(i));
                    
                    i++;
                }
                while(game.getDesenvolvedor() == null);
                
                i = 0;

                do
                {
                    if (generos.get(i).getId() == game.getIdGenero())
                        game.setGenero(generos.get(i));
                    
                    i++;
                }
                while(game.getGenero() == null);
                
                i = 0;
                                
                do
                {
                    if (plataformas.get(i).getId() == game.getIdPlataforma())
                        game.setPlataforma(plataformas.get(i));
                    
                    i++;
                }
                while(game.getPlataforma() == null);
                
                games.add(game);
            }
            
            rs.close();
            ps.close();
            con.close();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return games;
    }
    
    public ArrayList<Game> selectGamesByIDPlataforma(int id)
    {
        ArrayList<Game> games = new ArrayList<Game>();
        ArrayList<Desenvolvedor> desenvolvedores = new DesenvolvedorDAO().selectDesenvolvedores();
        ArrayList<Genero> generos = new GeneroDAO().selectGeneros();
        ArrayList<Plataforma> plataformas = new PlataformaDAO().selectPlataformas();
        
        try 
        {
            Connection con = Conexao.getConnection();
            
            String sql = "SELECT * FROM game WHERE IDPlataforma=? ORDER BY Titulo;";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            
            
            ResultSet rs = ps.executeQuery(sql);
            
            while (rs.next()) 
            {
                Game game = new Game();
                
                game.setDescricao(rs.getString("Descricao"));
                game.setId(rs.getInt("ID"));
                game.setIdDesenvolvedor(rs.getInt("IDDesenvolvedor"));
                game.setIdGenero(rs.getInt("IDGenero"));
                game.setIdPlataforma(rs.getInt("IDPlataforma"));
                game.setImagemUrl(rs.getString("ImagemURL"));
                game.setLancamento(rs.getDate("Lancamento"));
                game.setPreco(rs.getDouble("Preco"));
                game.setTitulo(rs.getString("Titulo"));

                int i = 0;
               
                do
                {
                    if (desenvolvedores.get(i).getId() == game.getIdDesenvolvedor())
                        game.setDesenvolvedor(desenvolvedores.get(i));
                    
                    i++;
                }
                while(game.getDesenvolvedor() == null);
                
                i = 0;

                do
                {
                    if (generos.get(i).getId() == game.getIdGenero())
                        game.setGenero(generos.get(i));
                    
                    i++;
                }
                while(game.getGenero() == null);
                                
                i = 0;
                                
                do
                {
                    if (plataformas.get(i).getId() == game.getIdPlataforma())
                        game.setPlataforma(plataformas.get(i));
                    
                    i++;
                }
                while(game.getPlataforma() == null);
                
                games.add(game);
            }
            
            rs.close();
            ps.close();
            con.close();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return games;
    }
}
