
package com.database;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class DataTransferMysql {

    public static void sendData(String firstName, String lastName, String userName,String gender,String password, String email) {
        try {
            Connection con = ConnectionProvider.getConnection();
            
             // Create a query
            String q = "insert into registrationcc(first_name,last_name,user_name,gender,password,email) values (?,?,?,?,?,?)";

            // Get the PreparedStatement object

            PreparedStatement pstmt = con.prepareStatement(q);

            // Set the values to query

            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, userName);
            pstmt.setString(4, gender);
            pstmt.setString(5, password);
            pstmt.setString(6, email);

            pstmt.executeUpdate();

            System.out.println("inserted...");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
