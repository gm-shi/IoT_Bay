package uts.isd.utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

    public class DB {
        // !adjust these para according to ur setting
        private String URL = "jdbc:mysql://localhost:3306/";
        private String db = "iotbay";
        private String dbUser = "root";
        private String dbPassword = "123456";
        private String dbDriver = "com.mysql.cj.jdbc.Driver";

        private Connection conn;

        public DB() throws SQLException {
            try {
                Class.forName(this.dbDriver);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
            //add time zone
            this.conn = DriverManager.getConnection(URL+db+"?serverTimezone=UTC", dbUser, dbPassword);
        }

        public Connection connection() throws SQLException {
            if(!this.conn.isClosed()) {
                return this.conn;
            }
            this.conn = DriverManager.getConnection(URL+db, dbUser, dbPassword);
            return this.conn;
        }

        public void dispose() throws SQLException {
            this.conn.close();
        }
    }
