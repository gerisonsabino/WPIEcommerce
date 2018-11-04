package classes;

import java.util.ArrayList;

public class Carrinho {

    private ArrayList<ItemCarrinho> itens = new ArrayList<ItemCarrinho>();

    public ArrayList<ItemCarrinho> getItens() {
        return itens;
    }

    public void setItens(ArrayList<ItemCarrinho> itens) {
        this.itens = itens;
    }

    public void remove(ItemCarrinho item) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
