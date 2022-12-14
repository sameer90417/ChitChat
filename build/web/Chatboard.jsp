<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
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

            .chatbox{
                margin-top: 2px;
                border-radius: 20px;
                width: 100%;
                height: 80vh;
                background-color: #3887ff;
            }

            .head{
                width: 100%;
                height: 10vh;
                text-align: center;
                background-color: white;
                font-family: cursive;
                font-weight: bolder;
                font-size: 10px;
            }

            .content{
                width: 80%;
                height: 55vh;
                background-color: white;
                margin-top: 20px;
                border-radius: 10px;
            }

            .search{
                width: 90%;
                height: 10vh;
                background-color: white;
                margin-top: 20px;
                border-radius: 8px;
            }

            .sendMessageForm{
                width: 80%;
                height: 8vh;
            }

        </style>
    </head>

    <body style="background-color: rgb(209, 209, 209);">

        <%
            //getting Attribute
            String firstName = (String) request.getAttribute("firstName");
            String lastName = (String) request.getAttribute("lastName");
            String userName = (String) request.getAttribute("userName");
            String gender = (String) request.getAttribute("gender");
            String email = (String) request.getAttribute("email");
            String id = (String) request.getAttribute("Id");
            String chatId = (String) request.getAttribute("chatId");

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
                            <a class="nav-link" aria-current="page" href="Home.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a id="chatboard" class="nav-link active" href="#">ChatBoard</a>
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

        <!-- start chatboard pannel -->
        <div onclick="makeInvisible()" class="container position-relative mt-3">


            <div class="chatbox shadow">
                <br>
                <div class="head shadow">
                    <br>
                    <h3><%= chatId%></h3>
                </div>
                <div class="content mx-auto shadow">

                    <table>
                        <tbody>

                            <%
                                Connection con = ConnectionProvider.getConnection();
                                String q = "select message from message_table where chatId = ?";
                                PreparedStatement pstmt = con.prepareStatement(q);
                                pstmt.setString(1, chatId);
                                ResultSet set = pstmt.executeQuery();
                                while (set.next()) {
                            %>


                            <tr>
                                <td><%=set.getString(1)%></td>
                            </tr>

                            <%                           
                                }
                            %>
                        </tbody>
                    </table>

                </div>


                <form action="messageServlet" method="get" class="input-group search shadow mx-auto">
                    <input type="text" name="user_message" class="form-control" placeholder="Enter your message" 
                           aria-label="Enter your message" aria-describedby="button-addon2">
                    <input type="text" name="chat_id" value="<%=chatId%>" hidden="true" />
                    <input type="text" name="Id" value="<%=id%>" hidden="true" />
                    <button class="btn btn-success" type="submit" id="button-addon2">Send</button>
                </form>

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
                                        <td><%= firstName + " " + lastName%></td>
                                    </tr>
                                    <tr>
                                        <th>User Name</th>
                                        <td><%= userName%></td>
                                    </tr>
                                    <tr>
                                        <td>Id number</td>
                                        <td><%= id%></td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td><%= gender%></td>
                                    </tr>
                                    <tr>
                                        <th>Email id </th>
                                        <td><%= email%></td>
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

        <!-- End chatboard pannel -->




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>

        <script src="js/new.js"></script>
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