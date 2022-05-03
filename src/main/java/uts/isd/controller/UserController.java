package uts.isd.controller;

import uts.isd.model.User;
import uts.isd.model.dao.UserAccessLogManager;
import uts.isd.model.dao.UserManager;
import uts.isd.utils.DB;
import uts.isd.utils.Helper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    DB db;
    UserManager userManager;
    SimpleDateFormat dateFormat;
    UserAccessLogManager userAccessLogManager;

    public UserController() throws SQLException {
        super();
        db = new DB();
        userManager = new UserManager(db);
        userAccessLogManager = new UserAccessLogManager(db);
        dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String[] queries = req.getQueryString().split("=");
        String query = queries[1].toLowerCase();
        System.out.println(query);
        switch(query){
            case "signup": handleSignUp(req, res); break;
            case "delete": handleDelete(req, res); break;
            case "edit": handleEdit(req, res); break;
            default: return;
        }
    }


    private void handleEdit(HttpServletRequest req, HttpServletResponse res) throws IOException {
        User user =  (User) req.getSession().getAttribute("user");
        user.setPassword(req.getParameter("password"));
        user.setUserFirstName(req.getParameter("firstname"));
        user.setUserLastName(req.getParameter("lastname"));
        user.setPhoneNumber(req.getParameter("phone"));
        user.setStreet(req.getParameter("street"));
        user.setCity(req.getParameter("city"));
        user.setState(req.getParameter("state"));
        user.setPostalCode(req.getParameter("postalcode"));
        if(req.getParameter("priorityLevel") != null){
            user.setPriorityLevel(Integer.parseInt(req.getParameter("priorityLevel")));
        } else {
            user.setPriorityLevel(1);
        }
        if(req.getParameter("role") != null) {
            user.setRole(req.getParameter("role"));
        } else{
            user.setRole("customer");
        }
        try {
            user.setDob(dateFormat.parse((req.getParameter("dob"))));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try{
            userManager.update(user);
            userAccessLogManager.create(user.getId(), "edit profile");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            Helper.alert(res.getWriter(), "fail to update");
            return;
        }
        res.sendRedirect("main.jsp");
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
        User user = (User) req.getSession().getAttribute("user");
        try {
            userManager.delete(user.getId());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            Helper.alert(res.getWriter(), "fail to delete");
            return;
        }
        req.getSession().removeAttribute("user");
        req.getSession().invalidate();
        res.sendRedirect("index.jsp");
    }

    private void handleSignUp(HttpServletRequest req, HttpServletResponse res) throws IOException {
        User user = new User();
        int userId = 0;
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));
        user.setUserName(req.getParameter("username"));
        user.setUserFirstName(req.getParameter("firstname"));
        user.setUserLastName(req.getParameter("lastname"));
        user.setPhoneNumber(req.getParameter("phone"));
        user.setStreet(req.getParameter("street"));
        user.setCity(req.getParameter("city"));
        user.setState(req.getParameter("state"));
        user.setPostalCode(req.getParameter("postalcode"));
        if(req.getParameter("priorityLevel") != null){
            user.setPriorityLevel(Integer.parseInt(req.getParameter("priorityLevel")));
        } else {
            user.setPriorityLevel(1);
        }
        if(req.getParameter("role") != null) {
            user.setRole(req.getParameter("role"));
        } else{
            user.setRole("customer");
        }
        try {
            user.setDob(dateFormat.parse((req.getParameter("dob"))));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try {
            userId = userManager.create(user);
        } catch (SQLException throwables) {
            if (throwables.getErrorCode() == 1062) {
                Helper.alert(res.getWriter(), "email already exist"); // fix later!!!!!
            } else {
                throwables.printStackTrace();
                Helper.alert(res.getWriter(), "fail to Sign up" );
            }
            return;
        }
        user.setId(userId);
        try {
            userAccessLogManager.create(userId, "sign up");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        res.sendRedirect("welcome.jsp");
    }

}
