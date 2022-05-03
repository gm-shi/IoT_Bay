<%@ page import="uts.isd.model.User" %>
<%@ page import="uts.isd.utils.Helper" %><%--
  Created by IntelliJ IDEA.
  User: sgm49
  Date: 18/03/2022
  Time: 12:54 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="ISD Assignment">
    <meta name="author" content="Gongming Shi">
    <title>IoTBay - Sign up</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link  rel="stylesheet" href="CSS/signUP.css">
</head>
<body>
<%
    String name = "admin";
    User user = null;
    if(session.getAttribute("user") != null){
        user = (User)session.getAttribute("user");
        name = user.getUserName();
    }
    if(!user.getRole().equalsIgnoreCase("admin") || user.getPriorityLevel() < 10){
        Helper.alert(response.getWriter(), "Invalid Access");
        response.sendRedirect("index.jsp");
    }


%>
<header>
    <div class="navbar navbar-light shadow-sm" style="background-color: steelblue">
        <div class="container d-flex justify-content-between">
            <% if (user.getRole().equalsIgnoreCase("admin"))
            {
            %>
            <a href="admin.jsp" class="navbar-brand d-flex align-items-center">
                    <%
                            }
                            else if (user.getRole().equalsIgnoreCase("staff")){
                %>
                <a href="staff.jsp" class="navbar-brand d-flex align-items-center">
                        <%
                        } else {
                    %>
                    <a href="staff.jsp" class="navbar-brand d-flex align-items-center">
                        <%}%>
                        <img style=" width:30px; height: 30px; fill: currentColor;" src="img/shop.png" alt="logo">
                        <strong style="margin-left:5px">IoTBay</strong>
                    </a>
        </div>

        <div class="dropdown" >
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
                <%=name%>
            </button>
            <div class="dropdown-menu-right dropdown-menu" aria-labelledby="dropdownMenuButton">
                <%
                    if (!user.getRole().equalsIgnoreCase("admin")){
                %>
                <a class="dropdown-item" href="userProfile.jsp">Personal Information</a>
                <%}%>
                <%
                    if (!user.getRole().equalsIgnoreCase("staff") && !user.getRole().equalsIgnoreCase("admin")){
                %>
                <a class="dropdown-item" href="#">Chart</a>
                <%}%>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item"  href="LogoutController" >Log out</a>
            </div>
        </div>
    </div>
    </div>
</header>

<main role="main">
    <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">
        <form  method="post" action="UserController?action=signup">
            <div class="form-group" >
                <label for="inputEmail4">Email</label>
                <input type="email" name="email" class="form-control" id="inputEmail4" required>
            </div>
            <div class="form-group">
                <label for="inputPassword4">Password</label>
                <input type="password" name="password" class="form-control" id="inputPassword4" required>
            </div>
            <div class="form-group">
                <label for="inputUserName">User Name</label>
                <input type="text" name="username" class="form-control" id="inputUserName" required>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputFirstName">First Name</label>
                    <input type="text" name="firstname" class="form-control" id="inputFirstName" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputLastName">Last Name</label>
                    <input type="text" name="lastname" class="form-control" id="inputLastName" required>
                </div>
            </div>
            <div class="form-group">
                <label for="inputUserDOB">Date of Birth</label>
                <input type="date" name="dob" class="form-control" id="inputUserDOB" required>
            </div>
            <div class="form-group">
                <label for="inputAddress">Address</label>
                <input type="text" name="street" class="form-control" id="inputAddress" placeholder="1234 Main St">
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputCity">City</label>
                    <input type="text" name="city" class="form-control" id="inputCity">
                </div>
                <div class="form-group col-md-4">
                    <label for="state">State</label>
                    <select class="custom-select" name="state" id="state">
                        <option selected>Choose...</option>
                        <option value="NSW">NSW</option>
                        <option value="ACT">ACT</option>
                        <option value="VIC">VIC</option>
                    </select>
                </div>
                <div class="form-group col-md-2">
                    <label for="inputPostalCode">Postal Code</label>
                    <input type="text" name="postalcode" class="form-control" id="inputPostalCode">
                </div>
            </div>
            <div class="form-group">
                <label for="inputUserPhone">Phone Number</label>
                <input type="text" name="phone" class="form-control" pattern="[04]{2}[0-9]{8}" value="04"  id="inputUserPhone" title=" Phone number with 04 and remaing 8 digit with 0-9" required>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="role">Position</label>
                    <select class="custom-select" name="role" id="role">
                        <option selected>Choose...</option>
                        <option value="staff">Staff</option>
                        <option value="customer">Customer</option>
                        <option value="delivery">Delivery</option>
                    </select>
                </div>
                <div>
                    <div class="form-group col-md-12">
                        <label for="priorityLevel">Priority Level</label>
                        <select class="custom-select" name="priorityLevel" id="priorityLevel">
                            <option selected>0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                        </select>
                    </div>
                </div>

            </div>

            <div>
                <button style="margin: 20px" type="submit"  class="btn btn-primary">Sign up</button>
                <a href="admin.jsp" class="btn btn-danger">Cancel</a>
            </div>

        </form>
    </section>
</main>



<footer class="text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
        <p>IoTBay - Online Shop &copy;</p>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
