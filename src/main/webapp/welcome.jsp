<%--
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
    <title>IoTBay - Welcome</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
<header>
    <div class="navbar navbar-light shadow-sm" style="background-color: steelblue">
        <div class="container d-flex justify-content-between">
            <a href="index.jsp" class="navbar-brand d-flex align-items-center">
                <img style=" width:30px; height: 30px; fill: currentColor;" src="img/shop.png" alt="logo">
                <strong style="margin-left:5px">IoTBay</strong>
            </a>
        </div>
    </div>
</header>
<main role="main">
    <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">

    <%
        String name = request.getParameter("userName");
        session.setAttribute("name", name);
        String email = request.getParameter("email");
        session.setAttribute("email", email);
        String password = request.getParameter("password");
        session.setAttribute("password", password);
        String dob = request.getParameter("dob");
        session.setAttribute("dob", dob);
        String firstName = request.getParameter("firstName");
        session.setAttribute("firstName", firstName);
        String lastName = request.getParameter("lastName");
        session.setAttribute("lastName", lastName);
        String phoneNumber = request.getParameter("phone");
        session.setAttribute("phoneNumber", phoneNumber);

    %>
    <h1>Welcome <%= name %></h1>
        <p>Your name is: <%= session.getAttribute("firstName") + " " + session.getAttribute("lastName")%></p>
        <p>Your email is: <%= session.getAttribute("email") %></p>
        <p>Your password is: <%= session.getAttribute("password") %></p>
        <p>Your Date of birth is: <%= session.getAttribute("dob") %></p>
        <p>Your Phone number is: <%= session.getAttribute("phoneNumber") %></p>
        <%--        content goes here--%>
 <a href="index.jsp"  class="btn btn-success">Login</a>
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
