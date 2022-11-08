package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ExistingChatId {

    public static String getChatId(String id) throws SQLException, ClassNotFoundException {
        Connection con = ConnectionProvider.getConnection();
        
        String q = "select chatId from registrationcc where id =?";
        PreparedStatement pstmt = con.prepareStatement(q);
        
        pstmt.setString(1, id);
        ResultSet set = pstmt.executeQuery();
        set.next();
        String chatid = set.getString(1);
        return chatid;
    }
}
