package uts.isd.controller;

import uts.isd.model.User;
import uts.isd.model.UserAccessLog;
import uts.isd.model.dao.UserAccessLogManager;
import uts.isd.model.dao.UserManager;
import uts.isd.utils.DB;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

@WebServlet("/UserAccessController")
public class UserAccessController extends HttpServlet {
    DB db;
    UserManager userManager;
    UserAccessLogManager userAccessLogManager;

    public UserAccessController() throws SQLException {
        super();
        db = new DB();
        userManager = new UserManager(db);
        userAccessLogManager = new UserAccessLogManager(db);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String[] queries = req.getQueryString().split("=");
        String query = queries[1].toLowerCase();
        switch (query) {
            case "search":
                handleSearch(req, res);
                break;
            case "all":
                handleAll(req, res);
                break;
            default:
                return;
        }
    }

    private void handleSearch(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        User user = (User) req.getSession().getAttribute("user");
        String date = req.getParameter("date");
        ArrayList<UserAccessLog> userAccessLogs = null;
        try {
            userAccessLogs = userAccessLogManager.getUserAccessLogByDate(user.getId(), date);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("userAccessLogs", userAccessLogs);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("accessLog.jsp");
        requestDispatcher.forward(req, res);
    }

    private void handleAll(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        ArrayList<UserAccessLog> userAccessLogs = null;
        try {
            userAccessLogs = userAccessLogManager.getUserAccessLog(user.getId());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("userAccessLogs", userAccessLogs);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("accessLog.jsp");
        requestDispatcher.forward(req, res);
    }


}
