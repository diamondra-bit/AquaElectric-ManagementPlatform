package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import common.Compteur_Bean;
import common.DB_Connection;

public class Edit_Compteur {
	
	public Compteur_Bean get_values_of_user(String codecompteur) {
		
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		Compteur_Bean obj_compteurBean=new Compteur_Bean();	
		
		PreparedStatement ps= null;
		ResultSet rs=null;
		
			try {
				String query="Select * from compteur where codecompteur=?";
				ps=connection.prepareStatement(query);
				ps.setString(1,codecompteur);
				rs=ps.executeQuery();
				
				while(rs.next()) {
					
					obj_compteurBean.setCodecompteur(rs.getString("codecompteur"));
					obj_compteurBean.setType(rs.getString("type"));
					obj_compteurBean.setPu(rs.getString("pu"));
								
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		
		return obj_compteurBean;
	}

	public void edit_user(Compteur_Bean obj_compteurBean) {
		
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
		
			try {
				String query="update compteur set type=?,pu=? where codecompteur=?";
				ps=connection.prepareStatement(query);
				ps.setString(1,obj_compteurBean.getType());
				ps.setString(2,obj_compteurBean.getPu());
				ps.setString(3,obj_compteurBean.getCodecompteur());
				ps.executeUpdate();
				
			} catch (Exception e) {
				System.out.println(e);
			}
	
	}

}
