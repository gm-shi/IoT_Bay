<%@ page import="uts.isd.model.User" %>
<%@ page import="uts.isd.model.UserAccessLog" %>
<%@ page import="uts.isd.model.dao.UserAccessLogManager" %>
<%@ page import="uts.isd.utils.DB" %>
<%@ page import="java.util.ArrayList" %><%--
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
    <title>IoTBay - User Access Log</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
<%
    ArrayList<UserAccessLog> userAccessLogs;
    User user = (User) session.getAttribute("user");
    if (user == null)
        response.sendRedirect("main.jsp");
    String name = user.getUserName();
    if(request.getAttribute("userAccessLogs") == null){
        DB db = new DB();
        UserAccessLogManager userAccessLogManager = new UserAccessLogManager(db);
        userAccessLogs = userAccessLogManager.getUserAccessLog(user.getId());
    } else {
        userAccessLogs = (ArrayList<UserAccessLog>) request.getAttribute("userAccessLogs");

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
                    <a href="main.jsp" class="navbar-brand d-flex align-items-center">
                        <%}%>
                        <img style=" width:30px; height: 30px; fill: currentColor;" src="img/shop.png" alt="logo">
                        <strong style="margin-left:5px">IoTBay</strong>
                    </a>
        </div>
        <%
            if (user == null){
        %>
        <a class="btn btn-success" style="margin-right: 10px"  href="index.jsp" >Log in</a>
        <%} else {%>
        <a class="btn btn-danger" style="margin-right: 10px"  href="LogoutController" >Log out</a>
        <%}%>
        <div class="dropdown" >
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
                <%=name%>
            </button>
            <div class="dropdown-menu-right dropdown-menu" aria-labelledby="dropdownMenuButton">

                <%
                    if (!user.getRole().equalsIgnoreCase("staff") && !user.getRole().equalsIgnoreCase("admin")){
                %>
                <a class="dropdown-item" href="#">Chart</a>
                <%}%>
                <%
                    if (!user.getRole().equalsIgnoreCase("admin")){
                %>
                <a class="dropdown-item" href="userProfile.jsp">Personal Information</a>
                <%}%>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item"  href="LogoutController" >Log out</a>
            </div>
        </div>
    </div>
</header>
<main role="main">
    <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">
                <div class="col-md-8">
                    <form method="post" action="UserAccessController?action=search">
                    <div class="input-group mb-4">
                        <input type="date" class="form-control" id="date" name="date" aria-label="DATE" >
                        <button class="btn btn-outline-primary" type="submit" onclick="form.action='UserAccessController?action=all'" id="allButton">All</button>
                        <button class="btn btn-outline-primary" type="submit"  id="searchButton">Search</button>
                    </div>
                    </form>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped ">
                            <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Type</th>
                                <th>Time</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (userAccessLogs != null){
                                for (UserAccessLog log : userAccessLogs) {
                            %>
                            <tr>
                                <td><%=log.getUserID()%></td>
                                <td style="text-transform: capitalize"><%=log.getUserAccessType()%></td>
                                <td><%=log.getUserAccessTime()%></td>
                            </tr>
                            <%
                                }}
                            %>
                            </tbody>
                        </table>
                    </div>
                    <%
                        if (user.getRole().equalsIgnoreCase("admin")){
                    %>
                    <a href="admin.jsp" type="button" class="btn btn-success">Back to Home</a>
                    <%} else if (user.getRole().equalsIgnoreCase("staff")){
                    %>
                    <a href="staff.jsp" type="button" class="btn btn-success">Back to Home</a>
                    <%}else {
                    %>
                    <a href="main.jsp" type="button" class="btn btn-success">Back to Home</a>
                    <%}%>
                </div>

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

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
