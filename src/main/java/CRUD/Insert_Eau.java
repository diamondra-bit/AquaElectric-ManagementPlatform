package CRUD;

import java.sql.*;

import common.DB_Connection;

public class Insert_Eau {

	public void insert_values(String codeeau,String codecompteur,int valeur2,Date date_releve2,Date date_presentation2,Date date_limite_paie2) {
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
			try {
				String query="insert into releve_eau(codeeau,codecompteur,valeur2,date_releve2,date_presentation2,date_limite_paie2) values (?,?,?,?,?,?)";
				ps=connection.prepareStatement(query);
				ps.setString(1, codeeau);
				ps.setString(2,codecompteur);
				ps.setInt(3, valeur2);
				ps.setDate(4, date_releve2);
				ps.setDate(5,date_presentation2);
				ps.setDate(6, date_limite_paie2);
		
				ps.executeUpdate();
				
			} catch (Exception e) {
				System.out.println(e);
			}
				
		
	}
}
