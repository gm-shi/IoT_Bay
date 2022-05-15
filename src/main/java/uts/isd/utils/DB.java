package uts.isd.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//
public class DB {
    // !adjust these para according to your setting
    protected String URL = "jdbc:mysql://localhost:3306/";
    protected String db = "order_management";
    protected String dbUser = "root";
    protected String dbPassword = "12345678";
    protected String dbDriver = "com.mysql.cj.jdbc.Driver";
    protected Connection conn;

    public DB() throws SQLException {
        try {
            Class.forName(this.dbDriver).newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.conn = DriverManager.getConnection(URL + db + "?serverTimezone=Australia/Sydney", dbUser, dbPassword);
    }

    public Connection connection() throws SQLException {
        if (!this.conn.isClosed()) {
            return this.conn;
        }
        this.conn = DriverManager.getConnection(URL + db, dbUser, dbPassword);
        return this.conn;
    }

    public void dispose() throws SQLException {
        this.conn.close();
    }
}
