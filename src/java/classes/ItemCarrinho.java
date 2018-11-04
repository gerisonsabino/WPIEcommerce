
package classes;

public class ItemCarrinho {

    private Game game;
    private Integer quantidade;

    public Game getProduto() {
        return game;
    }

    public void setProduto(Game produto) {
        this.game = produto;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public Double getTotal() {
        Double total = this.game.getPreco() * quantidade;
        return total;
    }
}
