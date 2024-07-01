package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DB_Connection;
import common.Client_Bean;


public class Read_Client {

	public static void main(String[] args) {
		Read_Client obj=new Read_Client();
		obj.get_values();
	}
	public List<Client_Bean> get_values() {
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
		ResultSet rs=null;
		
		List<Client_Bean> list= new ArrayList<Client_Bean>();
		
			try {
				String query="Select * from client";
				ps=connection.prepareStatement(query);
				rs=ps.executeQuery();
				
				while(rs.next()) {
					Client_Bean obj_compteurBean=new Client_Bean();
					
						
					obj_compteurBean.setCodeclient(rs.getString("codeclient"));
					obj_compteurBean.setNom(rs.getString("nom"));
					obj_compteurBean.setSexe(rs.getString("sexe"));
					obj_compteurBean.setQuartier(rs.getString("quartier"));
					obj_compteurBean.setNiveau(rs.getString("niveau"));
					obj_compteurBean.setMail(rs.getString("mail"));
					obj_compteurBean.setCodecompteur_eau(rs.getString("codecompteur_eau"));
					obj_compteurBean.setCodecompteur_electricite(rs.getString("codecompteur_electricite"));
					
					list.add(obj_compteurBean);					
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		
		return list;
	}
}
