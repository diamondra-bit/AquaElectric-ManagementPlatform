package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DB_Connection;
import common.Eau_Bean;

public class Edit_Eau {
	
	public Eau_Bean get_values_of_user(String codeeau) {
		
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		Eau_Bean obj_compteurBean=new Eau_Bean();	
		
		PreparedStatement ps= null;
		ResultSet rs=null;
		
			try {
				String query="Select * from releve_eau where codeeau=?";
				ps=connection.prepareStatement(query);
				ps.setString(1,codeeau);
				rs=ps.executeQuery();
				
				while(rs.next()) {
					
					obj_compteurBean.setCodeeau(rs.getString("codeeau"));
					obj_compteurBean.setCodecompteur(rs.getString("codecompteur"));
					obj_compteurBean.setValeur2(rs.getInt("valeur2"));
					obj_compteurBean.setDate_releve2(rs.getDate("date_releve2"));
					obj_compteurBean.setDate_presentation2(rs.getDate("date_presentation2"));
					obj_compteurBean.setDate_limite_paie2(rs.getDate("date_limite_paie2"));
							
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		
		return obj_compteurBean;
	}

	public void edit_user(Eau_Bean obj_compteurBean) {
		
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
		
			try {
				String query="update releve_eau set codecompteur=?,valeur2=?,date_releve2=?,date_presentation2=?,date_limite_paie2=? where codeeau=?";
				ps=connection.prepareStatement(query);
				ps.setString(1,obj_compteurBean.getCodecompteur());
				ps.setInt(2,obj_compteurBean.getValeur2());
				ps.setDate(3, new java.sql.Date(obj_compteurBean.getDate_releve2().getTime()));
			    ps.setDate(4, new java.sql.Date(obj_compteurBean.getDate_presentation2().getTime()));
			    ps.setDate(5, new java.sql.Date(obj_compteurBean.getDate_limite_paie2().getTime()));
				ps.setString(6,obj_compteurBean.getCodeeau());
				ps.executeUpdate();
				
			} catch (Exception e) {
				System.out.println(e);
			}
	
	}

}
