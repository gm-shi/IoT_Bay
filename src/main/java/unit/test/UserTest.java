//
//
//package unit.test;
//
//
//import junit.framework.Assert;
//
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//import uts.isd.model.User;
//import uts.isd.model.dao.UserManager;
//import uts.isd.utils.DB;
//
//import java.sql.SQLException;
//import java.util.Date;
//
//import static org.junit.Assert.*;
//
//
//public class UserTest {
//    private User user;
//    private UserManager userManager;
//    private DB db;
//    private int id;
//    private String userName;
//    private String userFirstName;
//    private String userLastName;
//    private String email;
//    private String phoneNumber;
//    private String password;
//    private Date dob;
//    private String street;
//    private String city;
//    private String state;
//    private String postalCode;
//    private int priorityLevel = 0;
//    private String role;
//    private int paymentPreference;
//    private Date timeCreated;
//
//
//    public UserTest() throws SQLException {
//        db = new DB();
//        userManager = new UserManager(db);
//        this.userName = "test";
//        this.email = "test@test.com";
//        this.password = "test123";
//        this.role = "customer";
//        this.priorityLevel = 1;
//        this.userLastName = "TestLastName";
//    }
//
//    @Before
//    public void setup() throws SQLException {
//        this.id = userManager.create(userName, "", "", email, new java.sql.Date(2020, 02, 02), "", password, "", "", "", "", priorityLevel, role);
//        assertTrue(this.id != 0);
//    }
//    @After
//    public void cleanup() throws SQLException{
//        userManager.delete(this.id);
//        User testUser = userManager.getUser(this.email);
//        assertNull(testUser);
//    }
//    @Test
//    public void readUserTest() throws SQLException{
//        User testUser = userManager.getUser(email);
//        assertNotNull(testUser);
//        assertEquals(testUser.getId(), this.id);
//        assertEquals(testUser.getUserName(), this.userName);
//        assertEquals(testUser.getPassword(), this.password);
//        assertEquals(testUser.getRole(), this.role);
//        assertEquals(testUser.getPriorityLevel(), this.priorityLevel);
//
//    }
//    @Test
//    public void updateUserTest() throws SQLException{
//        User testUser = userManager.getUser(email);
//        testUser.setUserLastName(this.userLastName);
//        userManager.update(testUser);
//        User updateUser = userManager.getUser(email);
//        assertEquals(testUser.getUserLastName(), updateUser.getUserLastName());
//    }
//}
