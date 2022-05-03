import com.mysql.cj.protocol.Resultset;
import uts.isd.model.User;
import uts.isd.model.dao.UserManager;
import uts.isd.utils.DB;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class test {


    public static void main (String args[]) throws Exception{
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        DB db = new DB();
        Connection con = db.connection();
        String query = "DELETE FROM user_access_log WHERE user_id = ?";
        PreparedStatement statement = con.prepareStatement(query);
        statement.setInt(1, 8);
        statement.execute();

        //delete user
        query = "DELETE FROM user WHERE user_id = ?";
        statement = con.prepareStatement(query);
        statement.setInt(1, 8);
        statement.execute();
        con.close();
    }
}
