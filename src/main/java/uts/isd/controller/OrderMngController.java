package uts.isd.controller;

import uts.isd.model.Order;
import uts.isd.utils.DB;


import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/OrderMngController")
public class OrderMngController extends HttpServlet {
    DB db;
    Order order;

    public OrderMngController() throws SQLException{
        super();
        db = new DB();
        order = new Order();
    }

}
