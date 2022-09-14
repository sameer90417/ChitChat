package com.database;

import java.sql.*;

public class ConnectionProvider {
    
    private static Connection con;

    public static Connection getConnection(){

        try {
            if (con == null) {

                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/youtube", "root", "Sam@1123");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        return con;
    }


}
