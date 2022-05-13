package uts.isd.model.dao;

import uts.isd.model.Order;
import uts.isd.utils.DB;

import java.sql.*;

public class OrderManager {
    private final DB db;

    public OrderManager(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException {
        return db.connection();
    }

    public void create(Order order) throws SQLException{
        String sqlQuery = "INSERT INTO order" + "(item" + "price," + "quantity）" +
                "VALUES (?, ?, ?);";
        PreparedStatement statement = conn().prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, order.getItem());
        statement.setDouble(2, order.getPrice());
        statement.setInt(3, order.getQuantity());
        return;
    }

    public void create(String item, Double price, int quantity) throws SQLException{
        String sqlQuery = "INSERT INTO" + "(item" + "price," + "quantity）" +
                "VALUES (?, ?, ?);";
        PreparedStatement statement = conn().prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, item);
        statement.setDouble(2, price);
        statement.setInt(3, quantity);
        return;
    }


}
