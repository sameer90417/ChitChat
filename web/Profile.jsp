
<%@page import="com.database.ConnectionProvider"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <link rel="stylesheet" href="css/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <style>
            *{
                box-sizing: border-box;
            }

            body{
                font-family: 'Source Sans Pro', sans-serif;
                background-color: rgb(219, 221, 253);
                overflow-x: hidden;
            }

            .navbar{
                z-index: 2;
            }

            .logo-head{
                font-size: 27px;
            }

            .section1{
                height: 90vh;
                width: 100%;
                color: white;
                background: linear-gradient(to right, rgb(143, 121, 121), rgb(116, 130, 255,0.3)), url(https://images.pexels.com/photos/574069/pexels-photo-574069.jpeg?auto=compress&cs=tinysrgb&w=600);
                background-size: cover;
                background-repeat: no-repeat;
            }

            .started{
                border-radius: 23pc !important;
                padding: 10px 40px !important;
            }


            .h-100{
                height: 100%;
                width: 100%;
                margin-top: 350px;
            }

            /* ----------profile page css --------------------------- */

            .prof{
                width: 45px;
                height: 45px;
            }

            .prof:hover{
                padding: 3px;
            }

            .follow{
                background-color: rgb(235, 235, 235);
                margin-top: 15px;
                height: 85vh;
                overflow-y: auto;
                box-shadow: 1px 1px rgb(161, 161, 161);
            }

            thead{
                background-color: #3887ff;
                font-family: Verdana, Geneva, Tahoma, sans-serif;
                color: white;
            }

            .box{
                width: 60vh;
                height: 60vh;
                background-color: white;
                margin-top: 10px;
                z-index: 2;
                border-radius: 20px;
            }
        </style>
    </head>

    <body>
        
                    <%
                //getting Attribute
                String firstName = (String) request.getAttribute("firstName");
                String lastName = (String) request.getAttribute("lastName");
                String userName = (String) request.getAttribute("userName");
                String gender = (String) request.getAttribute("gender");
                String email = (String) request.getAttribute("email");
                int id = (int) request.getAttribute("Id");
                
            %>

        <!-- Start navbar -->


        <nav class="navbar navbar-expand-sm navbar-dark bg-primary position-sticky top-0">
            <div class="container">
                <img src="images/logo.png" alt="Logo" width="50" height="50" class="d-inline-block align-text-top">
                <div class="container-fluid">

                    <div class="navbar-brand logo-head">
                        ChitChat
                    </div>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto mb-2 mb-lg-0 mx-5">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Profile.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a id="chatboard" class="nav-link" href="CreateChatboard?Id= <%=id %>">ChatBoard</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link">Logout</a>
                        </li>
                    </ul>

                    <a name="profileInfo" onclick="setVisibility()"><img class="prof" src="images/user.png"
                                                                         alt="profile"></a>

                </div>
            </div>
        </nav>

        <!-- End navbar -->

        <!-- start followers and following pannel -->

        <div onclick="makeInvisible()" class="container position-relative">
            <div class="row">
                <div id="follow" class="col-sm-6">
                    <table class="table follow table-striped-columns ">
                        <thead>
                            <tr>
                                <th>Followers</th>
                                <th style="color: white;">Following</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                </td>
                                <td>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div id="randChat" class="col-sm-6">
                    <table class="table follow table-striped-columns ">
                        <thead>
                            <tr>
                                <th style="text-align: center;">Random ChatBoards</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                    Ram<br>
                                    shamn<br>
                                    Rohan<br>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>


            <!-- Start Profile botton pannel -->
            <div style="visibility: hidden;" id="profilepanel" class="position-absolute top-0 end-0">
                <div class="container box shadow">
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table table-hover mt-3">
                                <thead>
                                <th style="border-radius: 10px; text-align: center;" colspan="2">User Information</th>
                                </thead>

                                <tbody class="table-success">
                                    <tr>
                                        <th>Name</th>
                                        <td><%= firstName+" "+lastName %></td>
                                    </tr>
                                    <tr>
                                        <th>User Name</th>
                                        <td><%= userName %></td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td><%= gender %></td>
                                    </tr>
                                    <tr>
                                        <th>Email id </th>
                                        <td><%= email %></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-sm-6">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>Followers:</td>
                                        <td>120</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-sm-6">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>Following:</td>
                                        <td>20</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-sm-6 offset-sm-3">
                            <div class="d-grid gap-2">
                                <a href="index.html" class="btn btn-outline-danger" type="button">Logout</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- End Profile botton pannel -->

        </div>

        <!-- End followers and following pannel -->




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>

        <script>
            function setVisibility() {
                var node = document.getElementById('profilepanel');
                if (node.style.visibility == 'visible') {
                    node.style.visibility = 'hidden';
                } else
                    node.style.visibility = 'visible'
            }

            function makeInvisible() {
                var node = document.getElementById('profilepanel');
                node.style.visibility = 'hidden';
            }
        </script>
    </body>

</html>