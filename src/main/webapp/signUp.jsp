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
    <title>IoTBay - Sign up</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link  rel="stylesheet" href="CSS/signUP.css">
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
        <form>
                <div class="form-group" >
                    <label for="inputEmail4">Email</label>
                    <input type="email" class="form-control" id="inputEmail4" required>
                </div>
                <div class="form-group">
                    <label for="inputPassword4">Password</label>
                    <input type="password" class="form-control" id="inputPassword4" required>
                </div>
            <div class="form-group">
                <label for="inputUserName">User Name</label>
                <input type="text" class="form-control" id="inputUserName" required>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputFirstName">First Name</label>
                    <input type="text" class="form-control" id="inputFirstName" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputLastName">Last Name</label>
                    <input type="text" class="form-control" id="inputLastName" required>
                </div>
            </div>
            <div class="form-group">
                <label for="inputUserDOB">Date of Birth</label>
                <input type="date" class="form-control" id="inputUserDOB" required>
            </div>
            <div class="form-group">
                <label for="inputAddress">Address</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
            </div>
            <div class="form-group">
                <label for="inputAddress2">Address 2</label>
                <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputCity">City</label>
                    <input type="text" class="form-control" id="inputCity">
                </div>
                <div class="form-group col-md-4">
                    <label for="inputCity">State</label>
                    <input type="text" class="form-control" id="inputState">
                </div>
                <div class="form-group col-md-2">
                    <label for="inputZip">Zip</label>
                    <input type="text" class="form-control" id="inputZip">
                </div>
            </div>
            <div class="form-group">
                <label for="inputUserPhone">Phone Number</label>
                <input type="text" class="form-control" pattern="[04]{2}[0-9]{8}" value="04"  id="inputUserPhone" title=" Phone number with 04 and remaing 8 digit with 0-9" required>
            </div>
            <div style="margin-bottom: 20px">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                <label class="form-check-label" for="invalidCheck">
                    Agree to terms and conditions
                </label>
            </div>
            <button type="submit" onclick="window.location='index.jsp'; handleSignUp" class="btn btn-primary">Sign up</button>
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
