package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import common.DB_Connection;
import common.Payer_Bean;

public class Edit_Payer {
	
	public Payer_Bean get_values_of_user(int idpaye) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.get_Connection();
		
		Payer_Bean obj_compteurBean = new Payer_Bean();	
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String query = "SELECT * FROM payer WHERE idpaye = ?";
			ps = connection.prepareStatement(query);
			ps.setInt(1, idpaye);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				obj_compteurBean.setIdpaye(rs.getInt("idpaye"));
				obj_compteurBean.setCodecli(rs.getString("codecli"));
				obj_compteurBean.setDatepaie(rs.getDate("datepaie"));			
				obj_compteurBean.setMontant(rs.getInt("montant"));
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (connection != null) connection.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		return obj_compteurBean;
	}

	public void edit_user(Payer_Bean obj_compteurBean) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.get_Connection();
		
		PreparedStatement ps = null;
		
		try {
			String query = "UPDATE payer SET codecli = ?, datepaie = ?, montant = ? WHERE idpaye = ?";
			ps = connection.prepareStatement(query);
			ps.setString(1, obj_compteurBean.getCodecli());
			ps.setDate(2, new java.sql.Date(obj_compteurBean.getDatepaie().getTime()));
			ps.setInt(3, obj_compteurBean.getMontant());
			ps.setInt(4, obj_compteurBean.getIdpaye());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (ps != null) ps.close();
				if (connection != null) connection.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}
}
