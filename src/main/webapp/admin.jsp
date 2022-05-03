<%@ page import="uts.isd.model.User" %>
<%@ page import="uts.isd.utils.Helper" %><%--
  Created by IntelliJ IDEA.
  User: sgm49
  Date: 18/03/2022
  Time: 1:03 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="ISD Assignment">
    <meta name="author" content="Gongming Shi">
    <title>IoTBay - Admin</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="CSS/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
<%
    String name;
    User user;
    if(session.getAttribute("user") == null){
        response.sendRedirect("index.jsp");
    }
    user = (User)session.getAttribute("user");
    name = user.getUserName();
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

        <div class="dropdown" >
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
                <%=name%>
            </button>
            <div class="dropdown-menu-right dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item"  href="LogoutController" >Log out</a>
            </div>
        </div>
    </div>
</header>
<main role="main">
    <section class="jumbotron text-center">
        <div class="container">
            <h1 style="margin-bottom: 20px">Welcome Admin</h1>
            <div id="demo" class="carousel slide" data-ride="carousel">
                <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ul>

                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://static.runoob.com/images/mix/img_fjords_wide.jpg">
                    </div>
                    <div class="carousel-item">
                        <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg">
                    </div>
                    <div class="carousel-item">
                        <img src="https://static.runoob.com/images/mix/img_mountains_wide.jpg">
                    </div>
                </div>

                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
        </div>
    </section>
    <div class="container">
            <div class="row row-cols-1 row-cols-md-3" style="margin: 40px">
                <div class="col mb-4">
                    <div class="card" style="line-height: inherit">
                        <div class="card-body">
                            <h5 class="card-title">Account Manage</h5>
                            <p class="card-text">This allow you to manage your personal information, such as password, phone number and address</p>
                            <a href="userProfile.jsp" class="btn btn-primary">Profile</a>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card" style="line-height: inherit">
                        <div class="card-body">
                            <h5 class="card-title">Create Staff Account</h5>
                            <p class="card-text">This option allows you to create account</p>
                            <a href="staffSignUp.jsp" class="btn btn-primary">Create</a>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Search IoT Devices</h5>
                            <p class="card-text">You can browse IoT devices from our shop and add to your cart</p>
                            <a href="#" class="btn btn-primary">Search</a>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">View Access Log</h5>
                            <p class="card-text">You can view your access record</p>
                            <a href="accessLog.jsp" class="btn btn-primary">View</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</main>

<footer class="text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
        <p>IoTBay - Online Shop &copy;</p>
    </div>
</footer>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
