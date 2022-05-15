
<%@ page import="uts.isd.model.User" %><%--
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
    <title>IoTBay - Main</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="CSS/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
<%
    String name = "Guest";
    User user = null;
    if (session.getAttribute("user") != null) {
        user = (User) session.getAttribute("user");
        name = user.getUserName();
    }

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
    <section class="jumbotron text-center">
        <div class="container">
            <h1 style="margin-bottom: 20px">Device Collection</h1>

        </div>

    </section>

    <table class="table table-striped" id="table">
        <thead class="thead-dark">
        <tr>
                <th class="text-center" scope = "col">Device ID</th>
                <th scope="col">Name</th>
                <th scope="col">Location</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>



            <!-- Button trigger modal -->

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Edit
    </button>

    <!-- Modal -->

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-dialog" style="width: 500px">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit Device</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group col-xs-6">
                        <label class="col-xs-4 control-label">ItemID</label>
                        <div class="col-xs-8">
                            <input id="item_id" name="item_id" class="input-text form-control">
                        </div>
                    </div>

                    <div class="form-group col-xs-6">
                        <label class="col-xs-4 control-label">ItemName</label>
                        <div class="col-xs-8">
                            <input id="item_name" name="item_name" class="input-text form-control">
                        </div>
                    </div>

                    <div class="form-group col-xs-6">
                        <label class="col-xs-4 control-label">ItemLocation</label>
                        <div class="col-xs-8">
                            <input id="item_location" name="item_location" class="input-text form-control">
                        </div>
                    </div>

                    <div class="form-group col-xs-6">
                        <label class="col-xs-4 control-label">ItemPricen</label>
                        <div class="col-xs-8">
                            <input id="item_price" name="item_price" class="input-text form-control">
                        </div>
                    </div>

                    <div class="form-group col-xs-6">
                        <label class="col-xs-4 control-label">ItemQuantity</label>
                        <div class="col-xs-8">
                            <input id="item_quantity" name="item_quantity" class="input-text form-control">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    </div>
<%--    <div class ="input-text col-md-3">--%>
<%--        <br>--%>
<%--        <button class="btn btn-success" onclick="edit()"--%>
<%--                style="margin-right: 5px">EDIT</button>--%>
<%--        <br>--%>
<%--    </div>--%>

<%--        <div class="modal-dialog">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <h3 class="modal-title" id="exampleModalLabel">EDIT</h3>--%>
<%--                    <button type="button" class="close" data-dismiss="modal" aria-label="close">--%>
<%--                        <span aria-hidden="true">&times;</span>--%>
<%--                    </button>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>







    <script type="text/javascript">

    function edit(){
        $('#add').modal('show');
    }

    </script>




    <button class="btn btn-success" onclick="window.location='main.jsp'" style=""margin-left>Back</button>

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
