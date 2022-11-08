package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckChatId {

    public static boolean isZero(String id) throws SQLException, ClassNotFoundException {
        Connection con = ConnectionProvider.getConnection();
        
        String q = "select chatid from registrationcc where id =?";
        PreparedStatement pstmt = con.prepareStatement(q);
        
        pstmt.setString(1, id);
        ResultSet set = pstmt.executeQuery();
        set.next();

        
        String checkingId = set.getString(1);
        if ("0".equals(checkingId)) {
            return true;
        } else {
            return false;
        }

    }
}
