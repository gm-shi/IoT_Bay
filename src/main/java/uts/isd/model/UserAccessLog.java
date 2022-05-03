package uts.isd.model;

import java.io.Serializable;
import java.sql.Date;
import java.text.SimpleDateFormat;

public class UserAccessLog implements Serializable {
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

    public String getUserAccessTime() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(userAccessTime);
    }
}
