package common;
import java.sql.*;

public class DB_Connection
{
	public static void main(String[] args) 
	{
		DB_Connection obj_DB_Connection=new DB_Connection();
		System.out.println(obj_DB_Connection.get_Connection());
	}
	
	public Connection get_Connection() 
	{
		Connection connection=null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionjsp","root","");
			} catch (Exception e) {
				// TODO: handle exception
			}
		return connection;
	}
}

