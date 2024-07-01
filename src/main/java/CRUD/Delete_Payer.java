package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DB_Connection;

public class Delete_Payer {

	public void delete_values(int idpaye) {
			
			DB_Connection obj_DB_Connection= new DB_Connection();
			Connection connection=obj_DB_Connection.get_Connection();
			
			
			PreparedStatement ps= null;

				try {
					String query="delete from payer where idpaye=?";
					ps=connection.prepareStatement(query);
					ps.setInt(1,idpaye);
					ps.executeUpdate();
								
				} catch (Exception e) {
					System.out.println(e);
				}
			
		}

}
