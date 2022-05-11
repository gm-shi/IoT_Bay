<%@ page import="uts.isd.model.User" %><%--
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
    <title>IoTBay - User Profile</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
<%
    String name;
    User user;
    if (session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
    }
    user = (User) session.getAttribute("user");
    name = user.getUserName();


%>
<header>
    <div class="navbar navbar-light shadow-sm" style="background-color: steelblue">
        <div class="container d-flex justify-content-between">
            <% if (user.getRole().equalsIgnoreCase("admin")) {
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
                    <a href="main.jsp" class="navbar-brand d-flex align-items-center">
                        <%}%>
                        <img style=" width:30px; height: 30px; fill: currentColor;" src="img/shop.png" alt="logo">
                        <strong style="margin-left:5px">IoTBay</strong>
                    </a>
        </div>
        <%
            if (user == null) {
        %>
        <a class="btn btn-success" style="margin-right: 10px" href="index.jsp">Log in</a>
        <%} else {%>
        <a class="btn btn-danger" style="margin-right: 10px" href="LogoutController">Log out</a>
        <%}%>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                    data-toggle="dropdown" aria-expanded="false">
                <%=name%>
            </button>
            <div class="dropdown-menu-right dropdown-menu" aria-labelledby="dropdownMenuButton">

                <%
                    if (!user.getRole().equalsIgnoreCase("staff") && !user.getRole().equalsIgnoreCase("admin")) {
                %>
                <a class="dropdown-item" href="#">Chart</a>
                <%}%>
                <%
                    if (!user.getRole().equalsIgnoreCase("admin")) {
                %>
                <a class="dropdown-item" href="userProfile.jsp">Personal Information</a>
                <%}%>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="LogoutController">Log out</a>
            </div>
        </div>

    </div>
</header>
<main role="main">
    <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">
        <form method="post" action="UserController?action=edit">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" class="form-control" id="email" disabled value="<%=user.getEmail()%>">
            </div>
            <div class="form-group">
                <label for="username">User Name</label>
                <input type="text" name="username" class="form-control" id="username" disabled required
                       value="<%=user.getUserName()%>">
            </div>

            <div class="form-group">
                                <label for="password">Password</label>
                <div class="input-group mb-3">
                <input type="password" name="password" class="form-control" id="password" required disabled
                       value="<%=user.getPassword()%>">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button" id="showPassword" disabled onclick="showPassword()">Show</button>
                </div>
            </div>
            </div>



            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="firstname">First Name</label>
                    <input type="text" name="firstname" class="form-control" id="firstname" required disabled
                           value="<%=user.getUserFirstName()%>">
                </div>
                <div class="form-group col-md-6">
                    <label for="lastname">Last Name</label>
                    <input type="text" name="lastname" class="form-control" id="lastname" required disabled
                           value="<%=user.getUserLastName()%>">
                </div>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="text" onfocus="this.type='Date'" name="dob" class="form-control" id="dob" required disabled
                       value="<%=user.getDob()%>">
            </div>
            <div class="form-group">
                <label for="street">Address</label>
                <input type="text" name="street" class="form-control" id="street" disabled
                       value="<%=user.getStreet()%>">
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="city">City</label>
                    <input type="text" name="city" class="form-control" id="city" disabled value="<%=user.getCity()%>">
                </div>
                <div class="form-group col-md-4">
                    <label for="state">State</label>
                    <input type="text" name="state" class="form-control" id="state" disabled
                           value="<%=user.getState()%>">
                </div>
                <div class="form-group col-md-2">
                    <label for="postalcode">Postal Code</label>
                    <input type="text" name="postalcode" class="form-control" id="postalcode" disabled
                           value="<%=user.getPostalCode()%>">
                </div>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" name="phone" class="form-control" pattern="[04]{2}[0-9]{8}" id="phone"
                       title=" Phone number with 04 and remaining 8 digit with 0-9" required disabled
                       value="<%=user.getPhoneNumber()%>">
            </div>
            <div class="form-group">
                <label for="paymentpreference">Payment Preference</label>
                <input type="text" name="phone" class="form-control" id="paymentpreference" disabled
                       value="<%=user.getPaymentPreference()%>">
            </div>
            <div>
                <button style="width: 40%; " type="button" onclick="HandleEdit()" class="btn btn-info">Edit</button>
            </div>
            <div style="text-align: right; margin-top: 40px">
                <button style="margin: 20px;" type="submit" disabled id="saveButton" class="btn btn-primary">Save
                    Change
                </button>
                <%
                    if (user.getRole().equalsIgnoreCase("admin")) {
                %>
                <a href="admin.jsp" type="button" class="btn btn-primary">Back to Home</a>
                <%
                } else if (user.getRole().equalsIgnoreCase("staff")) {
                %>
                <a href="staff.jsp" type="button" class="btn btn-primary">Back to Home</a>
                <%
                } else {
                %>
                <a href="main.jsp" type="button" class="btn btn-primary">Back to Home</a>
                <%}%>
            </div>
        </form>


        <%--        content goes here--%>

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
<script>
    let editable = (id) => {
        document.getElementById(id).removeAttribute("disabled");
    }
    let HandleEdit = () => {
        editable("firstname");
        editable("lastname");
        editable("password");
        editable("phone");
        editable("street");
        editable("dob");
        editable("city");
        editable("state");
        editable("postalcode");
        editable("paymentpreference");
        editable("saveButton");
        editable("showPassword");
    }
    function showPassword() {
        var x = document.getElementById("password");
        if (x.type === "password") {
            x.type = "text";
            document.getElementById("showPassword").innerHTML = 'Hide';
        } else {
            x.type = "password";
            document.getElementById("showPassword").innerHTML = 'Show';

        }
    }
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
        crossorigin="anonymous"></script>
</body>
</html>
