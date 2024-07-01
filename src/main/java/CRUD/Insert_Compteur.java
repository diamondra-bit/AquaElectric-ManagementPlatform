package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DB_Connection;

public class Insert_Compteur {

	public void insert_values(String codecompteur,String type, String pu) {
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
			try {
				String query="insert into compteur(codecompteur,type,pu) values (?,?,?)";
				ps=connection.prepareStatement(query);
				ps.setString(1, codecompteur);
				ps.setString(2,type);
				ps.setString(3, pu);
				ps.executeUpdate();
				
			} catch (Exception e) {
				System.out.println(e);
			}
				
		
	}
}
