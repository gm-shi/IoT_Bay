package uts.isd.model.dao;


import uts.isd.model.UserAccessLog;
import uts.isd.utils.DB;

import java.sql.*;
import java.util.ArrayList;


public class UserAccessLogManager {
    private final DB db;

    public UserAccessLogManager(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException {
        return db.connection();
    }

    public int create(int userId, String accessType)
            throws SQLException {
        String sqlQuery = "INSERT INTO user_access_log" +
                " (user_id, user_access_type)" +
                "VALUES (?, ?);";
        PreparedStatement statement = conn().prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, String.valueOf(userId));
        statement.setString(2, accessType);
        statement.executeUpdate();
        ResultSet resultSet = statement.getGeneratedKeys();
        if (resultSet.next()) {
            return resultSet.getInt(1);
        }
        return 0;
    }
//
    public ArrayList<UserAccessLog> getUserAccessLog(int userId) throws SQLException {
        ArrayList<UserAccessLog> userAccessLogs = new ArrayList<>();
        String query = "SELECT * FROM user_access_log WHERE user_id = ?";
        PreparedStatement statement = conn().prepareStatement(query);
        statement.setInt(1, userId);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            userAccessLogs.add(new UserAccessLog((resultSet.getInt("user_id")),
                    resultSet.getString("user_access_type"),
                    new Date(resultSet.getTimestamp("user_access_time").getTime())));
        }
        return userAccessLogs;
    }

    public ArrayList<UserAccessLog> getUserAccessLogByDate(int userId, String date) throws SQLException {
        ArrayList<UserAccessLog> userAccessLogs = new ArrayList<>();
        String query = "SELECT * FROM user_access_log WHERE user_id = ? AND user_access_time LIKE ?";
        PreparedStatement statement = conn().prepareStatement(query);
        statement.setInt(1, userId);
        statement.setString(2, date + "%");
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            userAccessLogs.add(new UserAccessLog((resultSet.getInt("user_id")),
                    resultSet.getString("user_access_type"),
                    new Date(resultSet.getTimestamp("user_access_time").getTime())));
        }
        return userAccessLogs;
    }

}
