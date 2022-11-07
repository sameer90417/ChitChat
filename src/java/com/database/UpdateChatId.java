package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateChatId {

    public static void insertChatId(String id, String chatId) throws SQLException, ClassNotFoundException {
        Connection con = ConnectionProvider.getConnection();
        
        String q = "Update registrationcc set chatId = ? where id = ?";
        
        PreparedStatement pstmt = con.prepareStatement(q);
        
        pstmt.setString(1, chatId);
        pstmt.setString(2, id);
        
        pstmt.executeUpdate();
    }
}
