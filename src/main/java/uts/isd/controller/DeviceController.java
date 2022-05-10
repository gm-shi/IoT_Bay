package uts.isd.controller;

import uts.isd.model.User;
import uts.isd.model.UserAccessLog;
import uts.isd.model.dao.UserAccessLogManager;
import uts.isd.model.dao.UserManager;
import uts.isd.model.dao.DeviceManager;
import uts.isd.utils.DB;

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



}
