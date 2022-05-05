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
    <title>IoTBay - Delete</title>
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
    <div class="navbar navbar-light shadow-sm" style="background-color: steelblue; flex-wrap: nowrap;">
        <div class="container d-flex justify-content-between">
            <% if (user != null && user.getRole().equalsIgnoreCase("admin")) {
            %>
            <a href="admin.jsp" class="navbar-brand d-flex align-items-center">
                    <%
                            }
                            else {
                %>
                <a href="main.jsp" class="navbar-brand d-flex align-items-center">
                    <%
                        }
                    %>
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
                <a class="dropdown-item" href="#">Chart</a>
                <%
                    if (user != null) {
                %>
                <a class="dropdown-item" href="userProfile.jsp">Personal Information</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="LogoutController">Log out</a>
            </div>
            <%
                }
            %>
        </div>
    </div>
</header>
<main role="main">
    <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">

        <div class="card bg-light mb-auto" style="max-width: 35rem;">
            <div class="card-header"><h3>Confirm to <strong>DELETE</strong></h3></div>
            <div class="card-body">
                <h5 class="card-title">IMPORTANT!</h5>
                <p class="card-text">This action cannot be undone. This will permanently delete the User
                    <strong><%=user.getUserFirstName() + " " + user.getUserLastName()%>
                    </strong></p>
            </div>
            <label for="verifyEmail">Please type your email: <strong><%=user.getEmail()%>
            </strong> to confirm.</label>
            <input type="text" id="verifyEmail" class="form-control" oninput="verifyEmail()">
            <button type="button" id="deleteButton" disabled onclick="handleDelete()" class="btn btn-danger">Delete my
                account
            </button>
        </div>

        <%--        content goes here--%>
        <div style="text-align: right; margin-top: 50px">
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
    const input = document.getElementById("verifyEmail");
    const deleteButton = document.getElementById("deleteButton");

    const verifyEmail = () => {
        input.value === "<%=user.getEmail()%>" ? deleteButton.disabled = false : deleteButton.disabled = true;
        console.log("<%=session.getAttribute("user")%>");
    }
    const handleDelete = () => {
        const form = document.createElement("form");
        form.method = "post";
        form.style.display = "none";
        form.action = "UserController?action=delete";
        $(document.body).append(form);
        form.submit();
        return form;
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
