package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DB_Connection;

public class Delete_Client {

	public void delete_values(String codeclient) {
			
			DB_Connection obj_DB_Connection= new DB_Connection();
			Connection connection=obj_DB_Connection.get_Connection();
			
			PreparedStatement ps= null;

				try {
					String query="delete from client where codeclient=?";
					ps=connection.prepareStatement(query);
					ps.setString(1,codeclient);
					ps.executeUpdate();
								
				} catch (Exception e) {
					System.out.println(e);
				}
			
		}

}
