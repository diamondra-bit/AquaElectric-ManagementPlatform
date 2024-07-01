package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.Client_Bean;
import common.DB_Connection;

public class Edit_Client {

    public Client_Bean get_values_of_user(String codeclient) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_Connection();
        Client_Bean obj_compteurBean = new Client_Bean();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM client WHERE codeclient=?";
            ps = connection.prepareStatement(query);
            ps.setString(1, codeclient);
            rs = ps.executeQuery();

            if (rs.next()) {
                obj_compteurBean.setCodeclient(rs.getString("codeclient"));
                obj_compteurBean.setNom(rs.getString("nom"));
                obj_compteurBean.setSexe(rs.getString("sexe"));
                obj_compteurBean.setQuartier(rs.getString("quartier"));
                obj_compteurBean.setNiveau(rs.getString("niveau"));
                obj_compteurBean.setMail(rs.getString("mail"));
                obj_compteurBean.setCodecompteur_eau(rs.getString("codecompteur_eau"));
                obj_compteurBean.setCodecompteur_electricite(rs.getString("codecompteur_electricite"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return obj_compteurBean;
    }

    public void edit_user(Client_Bean obj_compteurBean) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_Connection();
        PreparedStatement ps = null;

        try {
            String query = "UPDATE client SET nom=?, sexe=?, quartier=?, niveau=?, mail=?, codecompteur_eau=?, codecompteur_electricite=? WHERE codeclient=?";
            ps = connection.prepareStatement(query);
            ps.setString(1, obj_compteurBean.getNom());
            ps.setString(2, obj_compteurBean.getSexe());
            ps.setString(3, obj_compteurBean.getQuartier());
            ps.setString(4, obj_compteurBean.getNiveau());
            ps.setString(5, obj_compteurBean.getMail());
            ps.setString(6, obj_compteurBean.getCodecompteur_eau());
            ps.setString(7, obj_compteurBean.getCodecompteur_electricite());
            ps.setString(8, obj_compteurBean.getCodeclient());
            
            // Debugging print statement
            System.out.println("Before update - codecompteur_electricite: " + obj_compteurBean.getCodecompteur_electricite());
            
            int rowsUpdated = ps.executeUpdate();
            
            // Check if update was successful
            if (rowsUpdated > 0) {
                System.out.println("Update successful");
            } else {
                System.out.println("Update failed");
            }
            
            // Debugging print statement
            System.out.println("After update - codecompteur_electricite: " + obj_compteurBean.getCodecompteur_electricite());
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
