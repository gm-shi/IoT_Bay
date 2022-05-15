package uts.isd.model.dao;

import uts.isd.model.Device;
import uts.isd.utils.DB;

import java.sql.*;
import java.util.ArrayList;

public class DeviceManager {
    private DB db;

    public DeviceManager(DB db){
        this.db = db;
    }
    private Connection conn() throws SQLException {
        return db.connection();
    }
    public int create(Device device) throws SQLException{
        String sqlQuery = "INSERT INTO item" + "(item_name, item_location, item_price, item_quantity)" + "VALUES(?, ?, ?, ?);";
        PreparedStatement statement = conn().prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);

        statement.setString(1, device.getItemName());
        statement.setString(2, device.getItemLocation());
        statement.setDouble(3, device.getItemPrice());
        statement.setInt(4, device.getItemQuantity());

        statement.executeUpdate();
        return 0;


    }

    public int update(Device a) throws SQLException{
        String sqlQuery = "update device set item_name=? , item_location=?, item_price=?, item_description=?, cate_id=?, item_quantity=?, where item_id = ?";
        PreparedStatement statement = conn().prepareStatement(sqlQuery);
        statement.setString(1, a.getItemName());
        statement.setString(2, a.getItemLocation());
        statement.setDouble(3, a.getItemPrice());
        statement.setString(4, a.getItemDescription());
        statement.setInt(5, a.getCateId());
        statement.setInt(6, a.getItemQuantity());
        statement.setInt(7, a.getItemId());

        statement.executeUpdate();
        return 0;


    }

    public int delete(int item_id) throws SQLException{
        String sqlQuery = "DELETE FROM device where item_id = ?";
        PreparedStatement statement = conn().prepareStatement(sqlQuery);
        statement.setInt(1, item_id);

        statement.executeUpdate();
        return 0;
    }

//    public Device get(int item_id) throws SQLException{
//        String sqlQuery = "SELECT * FROM device where item_id = ?";
//        PreparedStatement statement = conn().prepareStatement(sqlQuery);
//        statement.setInt(1, item_id);
//        ResultSet resultSet = statement.executeQuery();
//        while(resultSet.next()){
//            int dbId = resultSet.getInt("item_id");
//            String item_name = resultSet.getString("item_name");
//            String item_location = resultSet.getString("item_location");
//            Double item_price = resultSet.getDouble("item_price");
//            Integer item_quantity = resultSet.getInt("item_quantity");
//            Device a = new Device(item_name, item_location, item_price, item_quantity);
//            return a;
//        }
//        return null;
//    }

    public ArrayList<Device> getAll() throws SQLException{
        ArrayList<Device> devices = new ArrayList<>();
        String sqlQuery = "SELECT * FROM item";
        PreparedStatement statement = conn().prepareStatement(sqlQuery);
        ResultSet resultSet = statement.executeQuery();
        while(resultSet.next()){
            String item_name = resultSet.getString("item_name");
            String item_location = resultSet.getString("item_location");
            Double item_price = resultSet.getDouble("item_price");
            Integer item_quantity = resultSet.getInt("item_quantity");
            Device b = new Device(item_name, item_location, item_price, item_quantity);
            devices.add(b);

        }
        return devices;
    }

    public ArrayList<Device> search(Device device) throws SQLException{
        ArrayList<Device> Device = new ArrayList<>();
        String sqlQuery = new String();
        if(device==null) {
            sqlQuery = "SELECT * FROM device";
        }
        else if(device.getItemName()!= null){
            sqlQuery = "SELECT * FROM device where item_name like '%" + device.getItemName() + "%'";

        }
        else if(device.getItemLocation()!= null){
            sqlQuery = "SELECT * FROM device where item_location like '%" + device.getItemLocation() + "%'";
        }
        PreparedStatement statement = conn().prepareStatement(sqlQuery);
        ResultSet resultSet = statement.executeQuery();
        while(resultSet.next()){
            int dbId = resultSet.getInt("item_id");
            String item_name = resultSet.getString("item_name");
            String item_location = resultSet.getString("item_location");
            Double item_price = resultSet.getDouble("item_price");
            Integer item_quantity = resultSet.getInt("item_quantity");
            Device b = new Device(item_name, item_location, item_price, item_quantity);
            Device.add(b);

        }
        return Device;
    }
}
