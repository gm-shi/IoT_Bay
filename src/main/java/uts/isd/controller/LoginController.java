package uts.isd.controller;

import uts.isd.model.User;
import uts.isd.model.dao.UserAccessLogManager;
import uts.isd.model.dao.UserManager;
import uts.isd.utils.DB;
import uts.isd.utils.Helper;

import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    DB db;
    SimpleDateFormat dateFormat;
    UserManager userManager;
    UserAccessLogManager userAccessLogManager;

    public LoginController() throws SQLException{
        super();
        db = new DB();
        dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        userManager = new UserManager(db);
        userAccessLogManager = new UserAccessLogManager(db);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String email = req.getParameter("email");
        String passwd = req.getParameter("password");
        if(email == null || !isValidEmailFormat(email)){
            Helper.alert(res.getWriter(), "Wrong Email format");
            return;
        }
        if (passwd == null || !isValidPasswordFormat(passwd)){
            Helper.alert(res.getWriter(), "Wrong Password format");
            return;
        }
        handleUserLogin(email, passwd, req, res);
    }

    private void handleUserLogin(String email, String passwd, HttpServletRequest req, HttpServletResponse res) throws IOException {
        User user = null;
        try {
            user = userManager.getUser(email);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        if (user == null) {
            Helper.alert(res.getWriter(), "Email does not exist");
            return;
        }
        if (!user.getPassword().equals(passwd)){
            Helper.alert(res.getWriter(), "Wrong Password");
            return;
        }
        try {
            userAccessLogManager.create(user.getId(), "login");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.getSession().setAttribute("user", user);

        if(user.getRole().equalsIgnoreCase("staff")){
            res.sendRedirect("staff.jsp");
        } else if(user.getRole().equalsIgnoreCase("admin")){
            res.sendRedirect("admin.jsp");
        } else{
            res.sendRedirect("main.jsp");
        }
    }

    private boolean isValidPasswordFormat(String passwd) {
        return passwd.length() >= 6;
    }

    private boolean isValidEmailFormat(String email) {
        return email.contains("@");
    }
}
