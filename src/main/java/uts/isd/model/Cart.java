package uts.isd.model;

import java.io.Serializable;

public class Cart implements Serializable{
    private int cartId;
    private int itemId;
    private Integer itemQuantity;


    public Cart(){
    }

    public Cart(int cartId,  int itemId, Integer itemQuantity){
        super();
        this.cartId = cartId;
        this.itemId = itemId;
        this.itemQuantity = itemQuantity;
    }

    public int getCartId(){return cartId;}
    public void setCartIdId(int cartId){this.cartId = cartId;}


    public int getItemId(){
        return itemId;
    }
    public void setItemId(int itemId){this.itemId = itemId;}


    public Integer getItemQuantity(){
        return itemQuantity;
    }
    public void setItemQuantity(int itemQuantity){
        this.itemQuantity = itemQuantity;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + cartId +
                ", itemId" + itemId +
                ", itemQuantity" + itemQuantity +
                "}";
    }

}
