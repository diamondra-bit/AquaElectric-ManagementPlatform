package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DB_Connection;
import common.Elec_Bean;

public class Edit_Elec {
	
	public Elec_Bean get_values_of_user(String codeelec) {
		
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		Elec_Bean obj_compteurBean=new Elec_Bean();	
		
		PreparedStatement ps= null;
		ResultSet rs=null;
		
			try {
				String query="Select * from releve_elec where codeelec=?";
				ps=connection.prepareStatement(query);
				ps.setString(1,codeelec);
				rs=ps.executeQuery();
				
				while(rs.next()) {
					
					obj_compteurBean.setCodeelec(rs.getString("codeelec"));
					obj_compteurBean.setCodecompteur(rs.getString("codecompteur"));
					obj_compteurBean.setValeur1(rs.getInt("valeur1"));
					obj_compteurBean.setDate_releve1(rs.getDate("date_releve1"));
					obj_compteurBean.setDate_presentation(rs.getDate("date_presentation"));
					obj_compteurBean.setDate_limite_paie(rs.getDate("date_limite_paie"));
							
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		
		return obj_compteurBean;
	}

	public void edit_user(Elec_Bean obj_compteurBean) {
		
		DB_Connection obj_DB_Connection= new DB_Connection();
		Connection connection=obj_DB_Connection.get_Connection();
		
		PreparedStatement ps= null;
		
			try {
				String query="update releve_elec set codecompteur=?,valeur1=?,date_releve1=?,date_presentation=?,date_limite_paie=? where codeelec=?";
				ps=connection.prepareStatement(query);
				ps.setString(1,obj_compteurBean.getCodecompteur());
				ps.setInt(2,obj_compteurBean.getValeur1());
				ps.setDate(3, new java.sql.Date(obj_compteurBean.getDate_releve1().getTime()));
			    ps.setDate(4, new java.sql.Date(obj_compteurBean.getDate_presentation().getTime()));
			    ps.setDate(5, new java.sql.Date(obj_compteurBean.getDate_limite_paie().getTime()));
				ps.setString(6,obj_compteurBean.getCodeelec());
				ps.executeUpdate();
				
			} catch (Exception e) {
				System.out.println(e);
			}
	
	}

}
