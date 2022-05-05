package uts.isd.controller;

import uts.isd.model.User;
import uts.isd.model.dao.UserAccessLogManager;
import uts.isd.model.dao.UserManager;
import uts.isd.utils.DB;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
    DB db;
    UserAccessLogManager userAccessLogManager;
    User user;

    public LogoutController() throws SQLException {
        super();
        db = new DB();
        userAccessLogManager = new UserAccessLogManager(db);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //if is use exist redirect to log out page.
        if (req.getSession() != null && req.getSession().getAttribute("user") != null) {  //change later for guest
            try {
                user = (User) req.getSession().getAttribute("user");
                req.getSession().removeAttribute("user");
                try {
                    userAccessLogManager.create(user.getId(), "logout");
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                req.getSession().invalidate();
                res.sendRedirect("Logout.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            res.sendRedirect("index.jsp");
        }

    }
}
