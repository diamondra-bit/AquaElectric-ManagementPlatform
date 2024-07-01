package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DB_Connection;

public class Delete_Eau {

	public void delete_values(String codeeau) {
			
			DB_Connection obj_DB_Connection= new DB_Connection();
			Connection connection=obj_DB_Connection.get_Connection();
			
			
			PreparedStatement ps= null;

				try {
					String query="delete from releve_eau where codeeau=?";
					ps=connection.prepareStatement(query);
					ps.setString(1,codeeau);
					ps.executeUpdate();
								
				} catch (Exception e) {
					System.out.println(e);
				}
			
		}

}
