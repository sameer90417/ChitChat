
package com.ChitChat.Chatboard;


import com.database.CheckChatId;
import com.database.ExistingChatId;
import com.database.FetchingDataForProfile;
import com.database.UpdateChatId;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
@WebServlet(name = "CreateChatboard_1", urlPatterns = {"/CreateChatboard_1"})
public class CreateChatboard extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateChatboard</title>");
            out.println("</head>");
            out.println("<body>");
            //            while(true){
            String Id = request.getParameter("Id");
            // check chatId of this id is 0 or not
            String chatboardId;
            if (CheckChatId.isZero(Id)) {
                String SALTCHARS = "A1B2C6D3EF4G5H7IJ9KL1MN8OP3QR9ST4UV2WX5YZ6";
                StringBuilder salt = new StringBuilder();
                Random rnd = new Random();
                while (salt.length() < 10) { // length of the random string.
                    int index = (int) (rnd.nextFloat() * SALTCHARS.length());
                    salt.append(SALTCHARS.charAt(index));
                }
                chatboardId = salt.toString();
                // check uniquness of chatboard id 
                // -_____________________________________-

                // insert chatboardID inside database table at a given ID
                UpdateChatId.insertChatId(Id, chatboardId);
            } else {
                chatboardId = ExistingChatId.getChatId(Id);
            }

            FetchingDataForProfile user = new FetchingDataForProfile();
            user.fetchingData(Integer.parseInt(Id.trim()));
            
            String firstName = user.getFirstName();
            String lastName = user.getLastName();
            String userName = user.getUserName();
            String gender = user.getGender();
            String email = user.getEmail();

            request.setAttribute("Id", Id);
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("userName", userName);
            request.setAttribute("gender", gender);
            request.setAttribute("email", email);
            request.setAttribute("chatId", chatboardId);
            
            RequestDispatcher rd = request.getRequestDispatcher("Chatboard.jsp");
            rd.forward(request, response);
            

            out.println("</body>");
            out.println("</html>");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CreateChatboard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateChatboard.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CreateChatboard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateChatboard.class.getName()).log(Level.SEVERE, null, ex);
        }
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
