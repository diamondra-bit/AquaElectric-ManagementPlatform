package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DB_Connection;
import common.Payer_Bean;

public class Read_Payer {

	public static void main(String[] args) {
		Read_Payer obj=new Read_Payer();
		obj.get_values();
	}
	public List<Payer_Bean> get_values() {
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
		ResultSet rs=null;
		
		List<Payer_Bean> list= new ArrayList<Payer_Bean>();
		
			try {
				String query="Select * from payer";
				ps=connection.prepareStatement(query);
				rs=ps.executeQuery();
				
				while(rs.next()) {
					Payer_Bean obj_compteurBean=new Payer_Bean();
					
						
					obj_compteurBean.setIdpaye(rs.getInt("idpaye"));
					obj_compteurBean.setCodecli(rs.getString("codecli"));
					obj_compteurBean.setDatepaie(rs.getDate("datepaie"));
					obj_compteurBean.setMontant(rs.getInt("montant"));
					list.add(obj_compteurBean);					
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		
		return list;
	}
}
