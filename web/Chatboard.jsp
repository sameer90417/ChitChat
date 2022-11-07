<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ChatBoard - Let's Talk with your friends</title>
    </head>
    <body>
        <h1>This is chatboard.jsp</h1>
               <%
                //getting Attribute
                String firstName = (String) request.getAttribute("firstName");
                String lastName = (String) request.getAttribute("lastName");
                String userName = (String) request.getAttribute("userName");
                String gender = (String) request.getAttribute("gender");
                String email = (String) request.getAttribute("email");
                String id = (String) request.getAttribute("Id");
                String chatId = (String) request.getAttribute("chatId");
                
                out.print(firstName+" "+lastName+" "+" "+chatId);
                
            %>
    </body>
</html>
