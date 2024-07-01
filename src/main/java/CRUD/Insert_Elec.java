package CRUD;

import java.sql.*;

import common.DB_Connection;

public class Insert_Elec {

	public void insert_values(String codeelec,String codecompteur,int valeur1,Date date_releve1,Date date_presentation,Date date_limite_paie) {
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
			try {
				String query="insert into releve_elec(codeelec,codecompteur,valeur1,date_releve1,date_presentation,date_limite_paie) values (?,?,?,?,?,?)";
				ps=connection.prepareStatement(query);
				ps.setString(1, codeelec);
				ps.setString(2,codecompteur);
				ps.setInt(3, valeur1);
				ps.setDate(4, date_releve1);
				ps.setDate(5,date_presentation);
				ps.setDate(6, date_limite_paie);
		
				ps.executeUpdate();
				
			} catch (Exception e) {
				System.out.println(e);
			}
				
		
	}
}
