<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="ISD Assignment">
    <meta name="author" content="Gongming Shi">
    <title>IoTBay - Home</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>

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
<body>
<main role="main">
    <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">
        <h1 class="display-2">IoT Bay</h1>
        <div class="card" style="width: 600px; height:400px; margin: 40px; }">
            <div class="card-body" style="display: flex;flex-direction: column; justify-content: space-between">
                <form>
                    <div class="form-group" style="margin-top: 40px">
                        <label for="exampleInputEmail1" style="text-align: left; display: flex;">Email address</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label style="text-align: left; display: flex;" for="exampleInputPassword1">Password</label>
                        <input  type="password" class="form-control" id="exampleInputPassword1">
                    </div>
                    <button type="submit" class="btn btn-success btn-block">Login</button>
                </form>
                <button class="btn btn-primary" onclick="window.location='signUp.jsp'">Sign up</button>
                <button class="btn btn-link" onclick="window.location='main.jsp'">Continue as guest</button>
            </div>
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

</body>
</html>