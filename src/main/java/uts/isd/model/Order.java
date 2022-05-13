package uts.isd.model;




public class Order {
    private int id;
    private String item;
    private Double price;
    private int quantity;

    public Order(){
    }

    public Order(int id,  String item, Double price, int quantity){
        super();
        this.id = id;
        this.item = item;
        this.price = price;
        this.quantity = quantity;
    }

    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }

    public String getItem(){
        return item;
    }

    public void setItem(String item){
        this.item = item;
    }

    public double getPrice(){
        return price;
    }

    public void setPrice(double price){
        this.price = price;
    }

    public int getQuantity(){
        return quantity;
    }

    public void setQuantity(int quantity){
        this.quantity = quantity;
    }


    @Override
    public String toString(){
        return "Order [id =" + ", item=" + item + ", price=" + price + ", quantity=" + quantity + "]";
    }
}
