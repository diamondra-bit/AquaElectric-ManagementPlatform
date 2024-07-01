package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DB_Connection;
import common.Eau_Bean;

public class Read_Eau {

	public static void main(String[] args) {
		Read_Eau obj=new Read_Eau();
		obj.get_values();
	}
	public List<Eau_Bean> get_values() {
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
		ResultSet rs=null;
		
		List<Eau_Bean> list= new ArrayList<Eau_Bean>();
		
			try {
				String query="Select * from releve_eau";
				ps=connection.prepareStatement(query);
				rs=ps.executeQuery();
				
				while(rs.next()) {
					Eau_Bean obj_compteurBean=new Eau_Bean();
					
						
					obj_compteurBean.setCodeeau(rs.getString("codeeau"));
					obj_compteurBean.setCodecompteur(rs.getString("codecompteur"));
					obj_compteurBean.setValeur2(rs.getInt("valeur2"));
					obj_compteurBean.setDate_releve2(rs.getDate("date_releve2"));
					obj_compteurBean.setDate_presentation2(rs.getDate("date_presentation2"));
					obj_compteurBean.setDate_limite_paie2(rs.getDate("date_limite_paie2"));
					
					list.add(obj_compteurBean);					
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		
		return list;
	}
}
