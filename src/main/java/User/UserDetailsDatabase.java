package User;

import java.sql.*;
import java.util.Random;
public class UserDetailsDatabase {

	Connection con ;

    public UserDetailsDatabase(Connection con) {
        this.con = con;
    }
    
    //Creating random user id for user
    Random rnd = new Random();
    int number = rnd.nextInt(99999);
    
    //for register user 
    public boolean saveUser(UserDetails user){
        boolean set = false;
        try{
            //Insert register data to UserDetails Database
            String query = "insert into UserDetails(UserID,Password,First_Name,Last_Name,Age,Gender,Address,PhoneNo)values(?,?,?,?,?,?,?,?,?)";
           System.out.println(con+"---------------");
           PreparedStatement pt = con.prepareStatement(query);
           pt.setInt(1, number);
           pt.setString(2, user.getPassword());
           pt.setString(3, user.getFirst_Name());
           pt.setString(4, user.getLastName());
           pt.setInt(5, user.getAge());
           pt.setString(6, user.getGender());
           pt.setString(7, user.getAddress());
           pt.setLong(8, user.getPhoneNo());
           
           pt.executeUpdate();
           
           //if (i!=0)  //Just to ensure data has been inserted into the database
           set = true; 
       }
       catch(SQLException e)
       {
          e.printStackTrace();
       }       
       return set;  
   }
}
