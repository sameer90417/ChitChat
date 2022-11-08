package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ManageMessage {

    public static void insertMessage(String chatId, String message) throws SQLException, ClassNotFoundException{
        Connection con = ConnectionProvider.getConnection();
        
        String q = "insert into message_table(chatId, message) values(?,?)";
        PreparedStatement pstmt = con.prepareStatement(q);
        
        pstmt.setString(1, chatId);
        pstmt.setString(2, message);
        
        pstmt.executeUpdate();
    }
}
