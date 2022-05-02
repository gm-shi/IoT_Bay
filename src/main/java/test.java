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
        User user = null;
        String email = "gongming.shi@outlook.com";
        String sql = "SELECT * from user where email = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, email);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            user = UserManager.getUser(resultSet);
        }
        System.out.println(user.toString());

        statement.close();
        con.close();
    }
}
