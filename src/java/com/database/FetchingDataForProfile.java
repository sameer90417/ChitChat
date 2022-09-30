package com.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class FetchingDataForProfile {
     private String firstName, lastName, userName, gender, email;
     
     public void setFirstName(String firstName){
         this.firstName=firstName;
     }
     
     public void setLastName(String lastName){
         this.lastName=lastName;
     }
     
     public void setUserName(String userName){
         this.userName=userName;
     }
     
     public void setGender(String gender){
         this.gender=gender;
     }
     
     public void setEmail(String email){
         this.email=email;
     }
     
     public String getFirstName(){
         return firstName;
     }
     
      public String getLastName(){
         return lastName;
     }
      
       public String getUserName(){
         return userName;
     }
       
        public String getGender(){
         return gender;
     }
         public String getEmail(){
         return email;
     }

    public void fetchingData(int id){
        try{
            Connection con = ConnectionProvider.getConnection();
            
            String q ="select* from registrationcc where id="+id;
            
            Statement stmt = con.createStatement();
            ResultSet set=stmt.executeQuery(q);
            
            set.next();
                String  firstName=set.getString(2);
                String lastName=set.getString(3);
                String userName=set.getString(4);
                String gender=set.getString(5);
                String email=set.getString(7);
                
         setFirstName(firstName);
         setLastName(lastName);
         setUserName(userName);
         setGender(gender);
         setEmail(email);
              
              
          //  System.out.println(firstName);
            
    }catch(SQLException e){
        e.printStackTrace(System.out);
        }
    
}
   
}
