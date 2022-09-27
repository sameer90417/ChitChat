package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CheckingEntity {

    public static int checkResult(String userName, String password) throws SQLException {
        
            int id=0;

            Connection con = ConnectionProvider.getConnection();

            String q = "select id from registrationcc where user_name=\"" + userName + "\" and password=\"" + password+"\"";

            Statement stmt = con.createStatement();
            ResultSet set = stmt.executeQuery(q);
            
            if (set.next()) {
             id =set.getInt(1);
             return id;
           }
            return -1;
    }
}

