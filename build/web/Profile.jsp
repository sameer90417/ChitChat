
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
                            //getting Attribute
                            String firstName=(String)request.getAttribute("firstName");
                             String lastName=(String)request.getAttribute("lastName");
                              String userName=(String)request.getAttribute("userName");
                               String gender=(String)request.getAttribute("gender");
                                String email=(String)request.getAttribute("email");
                                
                           out.println(firstName);
                           out.println(lastName);

        %>
        
    </body>
</html>
