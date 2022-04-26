import com.mysql.cj.protocol.Resultset;
import uts.isd.utils.DB;

import java.sql.*;
import java.util.ArrayList;

public class test {

    public static void main (String args[]) throws Exception{
        DB db = new DB();
        Connection con = db.connection();
        String sql = "SELECT * FROM ITEM";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while(rs.next()) {
            System.out.println(rs.getInt(1) + " " +  rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4));
        }
        st.close();
        con.close();
    }
}
