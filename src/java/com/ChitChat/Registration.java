package com.ChitChat;

import com.database.DataTransferMysql;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Registration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registration</title>");
            out.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT\" crossorigin=\"anonymous\">");
            out.println("</head>");
            out.println("<body>");

            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String userName = request.getParameter("user_name");
            String gender = request.getParameter("gender");
            String password = request.getParameter("password");
            String repeatPassword = request.getParameter("repeat_password");
            String email = request.getParameter("user_email");

            if (password.equals(repeatPassword) && firstName != null && lastName != null && userName != null && gender != null && password != null && repeatPassword != null && email != null) {
                DataTransferMysql.sendData(firstName, lastName, userName, gender, password, email);
                out.println("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">\n" +
"  <strong>Congratulations !..</strong> Successfully Registered...Now start login to your profile.\n" +
"  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
"</div>");

                RequestDispatcher rd = request.getRequestDispatcher("index.html");
                rd.include(request, response);

                out.println("</body>");
                out.println("</html>");
            } else {
                out.println("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
"  <strong>oops!</strong> Entered details are not correct.\n" +
"  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
"</div>");
                RequestDispatcher rd = request.getRequestDispatcher("registration.html");
                rd.include(request, response);

            }
            
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8\" crossorigin=\"anonymous\"></script>");
            out.println("</body>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
