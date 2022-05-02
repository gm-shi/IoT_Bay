package uts.isd.model;

import java.sql.Date;

public class UserAccessLog {
    private int userID;
    private String userAccessType;
    private Date userAccessTime;

    public UserAccessLog(int userID, String userAccessType, Date userAccessTime) {
        this.userID = userID;
        this.userAccessType = userAccessType;
        this.userAccessTime = userAccessTime;
    }

    public int getUserID() {
        return userID;
    }

    public String getUserAccessType() {
        return userAccessType;
    }

    public Date getUserAccessTime() {
        return userAccessTime;
    }
}
