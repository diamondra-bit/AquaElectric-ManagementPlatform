package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DB_Connection;

public class Delete_Elec {

	public void delete_values(String codeelec) {
			
			DB_Connection obj_DB_Connection= new DB_Connection();
			Connection connection=obj_DB_Connection.get_Connection();
			
			
			PreparedStatement ps= null;

				try {
					String query="delete from releve_elec where codeelec=?";
					ps=connection.prepareStatement(query);
					ps.setString(1,codeelec);
					ps.executeUpdate();
								
				} catch (Exception e) {
					System.out.println(e);
				}
			
		}

}
