package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DB_Connection;
import common.Elec_Bean;


public class Read_Elec {

	public static void main(String[] args) {
		Read_Elec obj=new Read_Elec();
		obj.get_values();
	}
	public List<Elec_Bean> get_values() {
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
		ResultSet rs=null;
		
		List<Elec_Bean> list= new ArrayList<Elec_Bean>();
		
			try {
				String query="Select * from releve_elec";
				ps=connection.prepareStatement(query);
				rs=ps.executeQuery();
				
				while(rs.next()) {
					Elec_Bean obj_compteurBean=new Elec_Bean();
					
						
					obj_compteurBean.setCodeelec(rs.getString("codeelec"));
					obj_compteurBean.setCodecompteur(rs.getString("codecompteur"));
					obj_compteurBean.setValeur1(rs.getInt("valeur1"));
					obj_compteurBean.setDate_releve1(rs.getDate("date_releve1"));
					obj_compteurBean.setDate_presentation(rs.getDate("date_presentation"));
					obj_compteurBean.setDate_limite_paie(rs.getDate("date_limite_paie"));
					
					list.add(obj_compteurBean);					
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		
		return list;
	}
}
