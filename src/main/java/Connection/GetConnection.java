package Connection;
import java.sql.*;
public class GetConnection {
    private static Connection con;
    
    public static Connection getConnection(){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}

