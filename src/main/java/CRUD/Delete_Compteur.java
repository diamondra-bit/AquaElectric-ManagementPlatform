package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DB_Connection;

public class Delete_Compteur {

	public void delete_values(String codecompteur) {
			
			DB_Connection obj_DB_Connection= new DB_Connection();
			Connection connection=obj_DB_Connection.get_Connection();
			
			
			PreparedStatement ps= null;

				try {
					String query="delete from compteur where codecompteur=?";
					ps=connection.prepareStatement(query);
					ps.setString(1,codecompteur);
					ps.executeUpdate();
								
				} catch (Exception e) {
					System.out.println(e);
				}
			
		}

}
