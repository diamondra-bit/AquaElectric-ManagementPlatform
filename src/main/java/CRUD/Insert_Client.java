package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DB_Connection;

public class Insert_Client {

	public void insert_values(String codeclient,String nom,String sexe,String quartier,String niveau,String mail,String codecompteur_eau,String codecompteur_electricite) {
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
			try {
				String query="insert into client(codeclient,nom,sexe,quartier,niveau,mail,codecompteur_eau,codecompteur_electricite) values (?,?,?,?,?,?,?,?)";
				ps=connection.prepareStatement(query);
				ps.setString(1, codeclient);
				ps.setString(2,nom);
				ps.setString(3, sexe);
				ps.setString(4, quartier);
				ps.setString(5,niveau);
				ps.setString(6, mail);
				ps.setString(7, codecompteur_eau);
				ps.setString(8, codecompteur_electricite);
				ps.executeUpdate();
				
			} catch (Exception e) {
				System.out.println(e);
			}
				
		
	}
}
