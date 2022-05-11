<%--
  Created by IntelliJ IDEA.
  User: hinana
  Date: 8/5/2022
  Time: 2:55 pm
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


<nav>
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <button class="nav-link" id="nav-main-tab" data-bs-toggle="tab" data-bs-target="#nav-main"
                type="button" role="tab" aria-controls="nav-main" aria-selected="false"
                onclick="window.location='main.jsp'">Main</button>
        <button class="nav-link" id="nav-product-tab" data-bs-toggle="tab" data-bs-target="#nav-product"
                type="button" role="tab" aria-controls="nav-product" aria-selected="false">View Product</button>
        <button class="nav-link" id="nav-account-tab" data-bs-toggle="tab" data-bs-target="#nav-account"
                type="button" role="tab" aria-controls="nav-account" aria-selected="false">Account</button>
        <button class="nav-link" id="nav-cart-tab" data-bs-toggle="tab" data-bs-target="#nav-cart"
                type="button" role="tab" aria-controls="nav-cart" aria-selected="false">Cart</button>
        <button class="nav-link active" id="nav-order-tab" data-bs-toggle="tab" data-bs-target="#nav-order"
                type="button" role="tab" aria-controls="nav-order" aria-selected="true">Order</button>
        <button class="nav-link" id="nav-payment-tab" data-bs-toggle="tab" data-bs-target="#nav-payment"
                type="button" rold="tab" aria-controls="nav-invoice" aria-selected="false">Payment</button>
        <button class="nav-link" id="nav-invoice-tab" data-bs-toggle="tab" data-bs-target="#nav-invoice"
                type="button" rold="tab" aria-controls="nav-invoice" aria-selected="false">Invoice</button>
    </div>
</nav>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade" id="nav-main-tab" role="tabpanel" aria-labelledby="nav-main-tab"></div>
        <div class="tab-pane fade" id="nav-product-tab" role="tabpanel" aria-labelledby="nav-product-tab"></div>
        <div class="tab-pane fade" id="nav-account-tab" role="tabpanel" aria-labelledby="nav-account-tab"></div>
        <div class="tab-pane fade" id="nav-cart-tab" role="tabpanel" aria-labelledby="nav-cart-tab"></div>
        <div class="tab-pane fade show active" id="nav-order-tab" role="tabpanel" aria-labelledby="nav-order-tab"></div>
        <div class="tab-pane fade show" id="nav-payment-tab" role="tabpanel" aria-labelledby="nav-payment--tab"></div>
        <div class="tab-pane fade" id="nav-invoice-tab" role="tabpanel" aria-labelledby="nav-invoice-tab"></div>
    </div>


<div class="card">
    <div class="container-fluid p-5 text-center" style="background-color: powderblue; height: 4px;">
        <h2> My Order </h2>
    </div>
          <div class="btn-toolbar justify-content-around" role="toolbar" aria-label="Toolbar with button groups" >
              <div class="btn-group" role="group" aria-label="First group">
                  <div class="d-grid">
                  <button type="button" class="btn btn-info" style="position: static" onclick="window.location='MakeOrder.jsp'">New Order</button>
                     </div>
                          <div class="space" style="width: 10px"></div>
                              <div class="input-group mb-3">
                                  <input type="text" class="form-control" placeholder="Search by Order No." aria-label="Search" aria-describedby="btnGroupAddon2">
                                  <button class="btn btn-info btn-sm"type="button">Search</button>
                              </div>
                                    <div class="space" style="width: 6px"></div>
                                        <div class="input-group mb-3">
                                            <label for="inputDate6" class="p-1 col-from-label">Start:</label>
                                            <input type="text" class="form-control" placeholder="Date/Month/Year" aria-label="Search" aria-describedby="btnGroupAddon2">
                                         </div>
                                    <div class="space" style="width: 6px"></div>
                                        <div class="input-group mb-3">
                                             <label for="inputDate6" class="p-1 col-to-label" >End:</label>
                                             <input type="text" class="form-control" placeholder="Date/Month/Year" aria-label="Search" aria-describedby="btnGroupAddon2">
                                             <button class="btn btn-info btn-md" type="button">Search</button>
                                        </div>
          </div>
</div>

<div class="card-body">
    <table class="table table-hover table-bordered fixed-centre caption-top">
        <thead>
              <tr>
                  <th scope="col">Date</th>
                  <th scope="col">Order No.</th>
                  <th scope="col">User</th>
                  <th scope="col">Order Amount</th>
                  <th scope="col">Discount</th>
                  <th scope="col">Total</th>
                  <th scope="col">Action</th>
              </tr>
        </thead>
    <tbody>
        <tr class=" align-middle">
            <th scope="row">01/06/2001</th>
            <td>1</td>
            <td>Sarah</td>
            <td>20.00</td>
            <td>0.00</td>
            <td>20.00</td>
            <td>
                <div class="btn-group" role="group" aria-label="Basic button group">
                    <button type="button" class="btn btn-link">Update</button>
                    <button type="button" class="btn btn-link">Submit</button>
                    <button type="button" class="btn btn-link">Delete</button>
                </div>
            </td>
        </tr>
        <tr class=" align-middle">
            <th scope="row">03/04/2011</th>
            <td>2</td>
            <td>Sarah</td>
            <td>100.00</td>
            <td>0.00</td>
            <td>100.00</td>
            <td>
                <div class="btn-group" role="group" aria-label="Basic button group">
                    <button type="button" class="btn btn-link">Update</button>
                    <button type="button" class="btn btn-link">Submit</button>
                    <button type="button" class="btn btn-link">Delete</button>
                </div>
            </td>
        </tr>
        <tr class=" align-middle">
            <th scope="row">01/09/2004</th>
            <td>3</td>
            <td>Sarah</td>
            <td>40.00</td>
            <td>0.00</td>
            <td>40.00</td>
            <td>
                <div class="btn-group" role="group" aria-label="Basic button group">
                    <button type="button" class="btn btn-link">Update</button>
                    <button type="button" class="btn btn-link">Submit</button>
                    <button type="button" class="btn btn-link">Delete</button>
                </div>
            </td>
        </tr>
    </tbody>
    </table>
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-end">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hiddent="true">&laquo;</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class=""page-item>
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
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


