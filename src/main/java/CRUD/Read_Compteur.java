package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DB_Connection;
import common.Compteur_Bean;

public class Read_Compteur {

	public static void main(String[] args) {
		Read_Compteur obj=new Read_Compteur();
		obj.get_values();
	}
	public List<Compteur_Bean> get_values() {
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
		ResultSet rs=null;
		
		List<Compteur_Bean> list= new ArrayList<Compteur_Bean>();
		
			try {
				String query="Select * from compteur";
				ps=connection.prepareStatement(query);
				rs=ps.executeQuery();
				
				while(rs.next()) {
					Compteur_Bean obj_compteurBean=new Compteur_Bean();
					
					obj_compteurBean.setCodecompteur(rs.getString("codecompteur"));
					obj_compteurBean.setType(rs.getString("type"));
					obj_compteurBean.setPu(rs.getString("pu"));
					
					list.add(obj_compteurBean);					
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		
		return list;
	}
}
