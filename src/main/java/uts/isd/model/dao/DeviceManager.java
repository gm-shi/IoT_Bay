package uts.isd.model.dao;

import uts.isd.model.Device;
import uts.isd.utils.DB;

import java.sql.*;

public class DeviceManager {
    private DB db;

    public DeviceManager(DB db){
        this.db = db;
    }
    private Connection conn() throws SQLException {
        return db.connection();
    }

}
