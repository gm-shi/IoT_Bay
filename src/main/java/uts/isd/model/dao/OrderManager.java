package uts.isd.model.dao;

import uts.isd.utils.DB;

import java.sql.*;

public class OrderManager {
    private final DB db;

    public OrderManager(DB db){this.db = db;}

    private Connection conn() throws SQLException{return db.connection();}

    public void addOrder(int order_id, int user_id, int payment_id, Date date
            , int tracking_number, String status, String comment
            , int cart_id) throws SQLException{
        String query = "INSERT INTO order_management.`order`" +
                "(order_id, user_id, payment_id,date," +
                "tracking_number, status, comment, cart_id)" +
                "VALUES(?,?,?,?,?,?,?,?);";
        PreparedStatement statement = conn().prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        statement.setInt(1, order_id);
        statement.setInt(2, user_id);
        statement.setInt(3, payment_id);
        statement.setDate(4, date);
        statement.setInt(5, tracking_number);
        statement.setString(6, status);
        statement.setString(7, comment);
        statement.setInt(8, cart_id);


    }


}
