package uts.isd.model.dao;

import uts.isd.model.User;
import uts.isd.utils.DB;

import java.sql.*;


public class UserManager {
    private DB db;

    public UserManager(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException {
        return db.connection();
    }
    public int create(User user) throws SQLException {
        String sqlQuery = "INSERT INTO user" +
                " (user_name, first_name, last_name, email, " +
                "dob, phone_number, " +
                "password, street, city," +
                " state, postal_code, privilege_num, role, payment_preference)" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement statement = conn().prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, user.getUserName());
        statement.setString(2, user.getUserFirstName());
        statement.setString(3, user.getUserLastName());
        statement.setString(4, user.getEmail());
        statement.setString(5, user.getDob());
        statement.setString(6, user.getPhoneNumber());
        statement.setString(7, user.getPassword());
        statement.setString(8, user.getStreet());
        statement.setString(9, user.getCity());
        statement.setString(10, user.getState());
        statement.setString(11, user.getPostalCode());
        if (user.getPriorityLevel() != 0){
            statement.setString(12, user.getPriorityLevel()+"");
        } else {
            statement.setString(12,"1");
        }
        statement.setString(13, user.getRole());
        statement.setString(14, user.getPaymentPreference()+"");

        statement.executeUpdate();
        ResultSet resultSet = statement.getGeneratedKeys();
        if (resultSet.next()){
            return resultSet.getInt(1);
        }
        return 0;
    }

    public int create(String name, String firstName, String lastName, String email
            , Date dob, String phoneNumber, String password, String street
            , String city, String state, String postalCode, int privilege_num, String role)
            throws SQLException{
        String query = "INSERT INTO user" +
                " (user_name, first_name, last_name, email, " +
                "dob, phone_number, " +
                "password, street, city," +
                " state, postal_code, privilege_num, role )" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement statement = conn().prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, name);
        statement.setString(2, firstName);
        statement.setString(3, lastName);
        statement.setString(4, email);
        statement.setString(5, String.valueOf(dob));
        statement.setString(6, phoneNumber );
        statement.setString(7, password);
        statement.setString(8, street);
        statement.setString(9, city);
        statement.setString(10, state);
        statement.setString(11, postalCode);
        statement.setString(12, String.valueOf(privilege_num));
        statement.setString(13, role);

        statement.executeUpdate();
        ResultSet resultSet = statement.getGeneratedKeys();
        if (resultSet.next()){
            return resultSet.getInt(1);
        }
        return 0;
    }

    public void delete(int userid) throws SQLException {
        //delete access log
        String query = "DELETE FROM user_access_log WHERE user_id = ?";
        PreparedStatement statement = conn().prepareStatement(query);
        statement.setInt(1, userid);
        statement.execute();

        //delete user
        query = "DELETE FROM user WHERE user_id = ?";
        statement = conn().prepareStatement(query);
        statement.setInt(1, userid);
        statement.execute();
    }

    public User getUser(String email) throws SQLException {
        User user;
        String query = "SELECT * FROM user WHERE email = ?";
        PreparedStatement statement = conn().prepareStatement(query);
        statement.setString(1, email);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()){
            user = getUser(resultSet);
            return user;
        }
        return null;
    }

    public User getUser(ResultSet resultSet) throws SQLException {
        User user;
        user = new User();
        user.setId(resultSet.getInt("user_id"));
        user.setUserName(resultSet.getString("user_name"));
        user.setUserFirstName(resultSet.getString("first_name"));
        user.setUserLastName(resultSet.getString("last_name"));
        user.setEmail(resultSet.getString("email"));
        user.setDob(resultSet.getDate("dob"));
        user.setPhoneNumber(resultSet.getString("phone_number"));
        user.setPassword(resultSet.getString("password"));
        user.setStreet(resultSet.getString("street"));
        user.setCity(resultSet.getString("city"));
        user.setState(resultSet.getString("state"));
        user.setPostalCode(resultSet.getString("postal_code"));
        user.setPriorityLevel(resultSet.getInt("privilege_num"));
        user.setRole(resultSet.getString("role"));
        user.setPaymentPreference(resultSet.getInt("payment_preference"));
        user.setTimeCreated(resultSet.getDate("time_created"));

        return user;
    }
    public void update(User user) throws SQLException {
        String query = "UPDATE user SET password = ?, first_name = ?, last_name = ?, " +
                "dob = ?, phone_number = ?, street = ?, city = ?, state = ?, postal_code = ?," +
                "privilege_num = ?, role = ?, payment_preference = ? WHERE email = ?";
        PreparedStatement statement = conn().prepareStatement(query);
        statement.setString(1, user.getPassword());
        statement.setString(2, user.getUserFirstName());
        statement.setString(3, user.getUserLastName());
        statement.setString(4, user.getDob());
        statement.setString(5, user.getPhoneNumber());
        statement.setString(6, user.getStreet());
        statement.setString(7, user.getCity());
        statement.setString(8, user.getState());
        statement.setString(9, user.getPostalCode());
        statement.setString(10, String.valueOf(user.getPriorityLevel()));
        statement.setString(11, user.getRole());
        statement.setString(12, String.valueOf(user.getPaymentPreference()));
        statement.setString(13, user.getEmail());
        statement.execute();
    }

}
