<%--
  Created by IntelliJ IDEA.
  User: hinana
  Date: 9/5/2022
  Time: 4:21 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="ISD Assignment">
    <meta name="author" content="Hina Zhou">
    <title>IoTBay - Order</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/order.css">
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

<div class="card-body">
    <table class="table table-hover table-bordered fixed-centre caption-top">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Product Name</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Total</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <tr class=" align-middle">
            <th scope="row">1</th>
            <td>Item One</td>
            <td>20.00</td>
            <td>
                <div class="col-auto">
                    <select class="form-select" id="autoSizingSelect">
                        <option selected>0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
            </td>
            <td>0.00</td>
            <td>
                <button type="button" class="btn btn-link">Add</button>
                <button type="button" class="btn btn-link">Delete</button>
            </td>
        </tr>
        <tr class=" align-middle">
            <th scope="row">2</th>
            <td>Item Two</td>
            <td>10.00</td>
            <td>
                <div class="col-auto">
                    <select class="form-select" id="autoSizingSelect">
                        <option selected>0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
            </td>
            <td>0.00</td>
            <td>
                <button type="button" class="btn btn-link">Add</button>
                <button type="button" class="btn btn-link">Delete</button>
            </td>
        </tr>
        <tr class=" align-middle">
            <th scope="row">3</th>
            <td>Item Three</td>
            <td>5.00</td>
            <td>
                <div class="col-auto">
                    <select class="form-select" id="autoSizingSelect">
                        <option selected>0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
            </td>
            <td>0.00</td>
            <td>
                <button type="button" class="btn btn-link">Add</button>
                <button type="button" class="btn btn-link">Delete</button>
            </td>
        </tr>
        <tr class=" align-middle">
            <th scope="row">4</th>
            <td>Item Four</td>
            <td>10.00</td>
            <td>
                <div class="col-auto">
                    <select class="form-select" id="autoSizingSelect">
                        <option selected>0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
            </td>
            <td>0.00</td>
            <td>
                <button type="button" class="btn btn-link">Add</button>
                <button type="button" class="btn btn-link">Delete</button>
            </td>
        </tr>
        <tr class=" align-middle">
            <th scope="row">5</th>
            <td>Item Five</td>
            <td>25.00</td>
            <td>
                <div class="col-auto">
                    <select class="form-select" id="autoSizingSelect">
                        <option selected>0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
            </td>
            <td>0.00</td>
            <td>
                <button type="button" class="btn btn-link">Add</button>
                <button type="button" class="btn btn-link">Delete</button>
            </td>
        </tr>
        <tr class=" align-middle">
            <th scope="row">6</th>
            <td>Item Six</td>
            <td>25.00</td>
            <td>
                <div class="col-auto">
                    <select class="form-select" id="autoSizingSelect">
                        <option selected>0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
            </td>
            <td>0.00</td>
            <td>
                <button type="button" class="btn btn-link">Add</button>
                <button type="button" class="btn btn-link">Delete</button>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="btn justify-content-end">
        <button type="button" class="btn btn-info" >Add</button>
        <button type="button" class="btn btn-info" onclick="window.location='OrderMagmt.jsp'">Submit</button>
    </div>
</div>















<footer class="text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
        <p>IoTBay - Online Shop &copy;</p>
    </div>
</footer>
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
