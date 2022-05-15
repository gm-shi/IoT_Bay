package uts.isd.controller;

import uts.isd.model.User;
import uts.isd.model.Device;
import uts.isd.model.UserAccessLog;
import uts.isd.model.dao.UserAccessLogManager;
import uts.isd.model.dao.UserManager;
import uts.isd.model.dao.DeviceManager;
import uts.isd.utils.DB;
import uts.isd.utils.Helper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
@WebServlet("/DeviceController")
public class DeviceController {
    DB db;
    DeviceManager dc_manager;
    String view = "deviceCollection.jsp";
    public DeviceController() throws SQLException{
        super();
        db = new DB();
        dc_manager = new DeviceManager(db);
    }

//    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        res.setContentType("text/html;charset=utf-8");
        String operate = req.getParameter("operate");
        switch (operate){
            case"search":
                search(req, res);
                break;
            case "create":
                create(req, res);
                break;
            case "delete":
                delete(req, res);
                break;
            case "update":
                update(req,res);
                break;
            default:
        }
    }

    private void search(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String product = req.getParameter("device");
        String value = req.getParameter("value");
        Device c = new Device();
        if("item_name".equals(product)){
            c.setItemName(value);
            try{
                ArrayList<Device> search = dc_manager.search(c);
                req.setAttribute("list", search);
                req.getRequestDispatcher(view).forward(req, res);

            }
            catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
    private void create(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        HttpSession session = req.getSession();
        Object attribute = session.getAttribute("user");
        String item_name = req.getParameter("item_name");
        String item_location = req.getParameter("item_location");
        Double item_price = Double.valueOf(req.getParameter("item_price"));
        Integer item_quantity = Integer.valueOf(req.getParameter("item_quantity"));
        Device device = new Device(item_name, item_location, Double.valueOf(item_price), Integer.valueOf(item_quantity));
        try {
            int row = dc_manager.create(device);
            if(row>=1){
                req.getRequestDispatcher(view).forward(req, res);
                return;
            }

            }
            catch (SQLException e){
            e.printStackTrace();
                Helper.alert(res.getWriter(), "Unsuccessful, please try again.");

        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        HttpSession session = req.getSession();
        String x = req.getParameter("item_id");
        if(isEmpty(x)){
            Helper.alert(res.getWriter(), "ID can not be empty, please try again");
        }
        try{
            int row = dc_manager.delete(Integer.valueOf(x));
            if(row>=1){
                displayList(req, res);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
            Helper.alert(res.getWriter(), "Unsuccessful, please try again");
        }
    }
    private void update(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        HttpSession session = req.getSession();
        Integer item_id = Integer.valueOf(req.getParameter("item_id"));
        String item_name = req.getParameter("item_name");
        String item_location = req.getParameter("item_location");
        Double item_price = Double.valueOf(req.getParameter("item_price"));
        Integer item_quantity = Integer.valueOf(req.getParameter("item_quantity"));
        Device device;
        try{
            device = dc_manager.get(Integer.valueOf(item_id));
            if(device==null){
                Helper.alert(res.getWriter(), "Can not be empty, please try again");
            }
            if(isEmpty(item_name)){
                device.setItemName(item_name);
            }
            if(isEmpty(item_location)){
                device.setItemLocation(item_location);
            }
            if(isEmpty(String.valueOf(item_price))){
                device.setItemPrice(Double.valueOf(item_price));
            }
            if(isEmpty(String.valueOf(item_quantity))){
                device.setItemQuantity(Integer.valueOf(item_quantity));
            }
            int row = dc_manager.update(device);
            System.out.print(row);
            if(row>=1){
                req.getRequestDispatcher(view).forward(req, res);
                return;
            }
        }
        catch(SQLException e){
            e.printStackTrace();
            Helper.alert(res.getWriter(), "Unsuccessful, please try again");
        }
    }
    private void displayList(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        try{
            ArrayList<Device> list = dc_manager.search(null);
            System.out.println(list);
            req.setAttribute("list", list);
            req.getRequestDispatcher(view).forward(req, res);
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    private boolean isEmpty(String str){
        if(str.isEmpty() || str == null){
            return false;
        }
        return true;
    }
}
