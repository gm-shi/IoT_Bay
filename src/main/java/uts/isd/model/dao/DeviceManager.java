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
        String sqlQuery = "INSERT INTO item" + "(item_id, item_name, item_location, item_price, vendor_id, item_description, cate_id, item_quantity)" + "VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement statement = conn().prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        statement.setInt(1, device.getItemId());
        statement.setString(2, device.getItemName());
        statement.setString(3, device.getItemLocation());
        statement.setDouble(4, device.getItemPrice());
        statement.setString(5, device.getVendorId());
        statement.setString(6, device.getItemDescription());
        statement.setInt(7, device.getCateId());
        statement.setInt(8, device.getItemQuantity());

        statement.executeUpdate();
        return 0;


    }
}
