package uts.isd.model;

public class Device {
    private Integer item_id;
    private String item_name;
    private String item_location;
    private Double item_price;
    private String vendor_id;
    private String item_description;
    private Integer cate_id;
    private Integer item_quantity;

    public Device(String item_name, String item_location, Double item_price, Integer item_quantity) {
    }

    public Device() {

    }

    public Integer getItemId(){
        return item_id;
    }
    public void setItemId(Integer item_id){
        this.item_id = item_id;
    }
    public String getItemName(){
        return item_name;
    }
    public void setItemName(String item_name){
        this.item_name = item_name;
    }
    public String getItemLocation(){
        return item_location;
    }
    public void setItemLocation(String item_location){
        this.item_location = item_location;
    }
    public Double getItemPrice(){
        return item_price;
    }
    public void setItemPrice(Double item_price){
        this.item_price = item_price;
    }
    public String getVendorId(){
        return vendor_id;
    }
    public void setVendorId(String vendor_id){
        this.vendor_id = vendor_id;
    }
    public String getItemDescription(){
        return item_description;
    }
    public void setItemDescription(String item_description){
        this.item_description = item_description;
    }
    public Integer getCateId(){
        return cate_id;
    }
    public void setCateId(Integer cate_id){
        this.cate_id = cate_id;
    }
    public Integer getItemQuantity(){
        return item_quantity;
    }
    public void setItemQuantity(Integer item_quantity){
        this.item_quantity = item_quantity;
    }
    @Override
    public String toString(){
        return "Device [id = "+ item_id + ", name = " + item_name + ", location = " + item_location +", price =  " + item_price + ", vendor = " + vendor_id + ", description = " + item_description + ", categoryID = " + cate_id + ", quantity = " + item_quantity + "]";

    }
}
