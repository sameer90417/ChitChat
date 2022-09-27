
<%@page import="com.database.ConnectionProvider"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
        <% 
                            Connection con = ConnectionProvider.getConnection();
                            String q = "insert into registrationcc(first_name,last_name,user_name,gender,password,email) values (?,?,?,?,?,?)";
        %>
        
    </body>
</html>
