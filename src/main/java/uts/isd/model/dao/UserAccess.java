package uts.isd.model.dao;

import uts.isd.utils.DB;

import java.sql.Connection;
import java.sql.SQLException;

public class UserAccess {
    private DB db;

    public UserAccess(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException {
        return db.connection();
    }

}
