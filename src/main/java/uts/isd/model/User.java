package uts.isd.model;

import java.io.Serializable;

public class User implements Serializable {
    private int id;
    private String userName;
    private String userFirstName;
    private String userLastName;
    private String email;
    private String phoneNumber;
    private int priorityLevel;
    private String password;
    private String dob;
    public User(){};

    public User(int id, String userName, String userFirstName, String userLastName, String email, String phoneNumber, int priorityLevel, String password, String dob) {
        this.id = id;
        this.userName = userName;
        this.userFirstName = userFirstName;
        this.userLastName = userLastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.priorityLevel = priorityLevel;
        this.password = password;
        this.dob = dob;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getPriorityLevel() {
        return priorityLevel;
    }

    public void setPriorityLevel(int priorityLevel) {
        this.priorityLevel = priorityLevel;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserFirstName() {
        return userFirstName;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
    public String getDob(){
        return dob;
    }
}
