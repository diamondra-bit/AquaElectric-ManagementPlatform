package CRUD;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import common.DB_Connection;

public class Insert_Payer {

    public void insert_values(String codecli, Date datepaie, int montant) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_Connection();
        PreparedStatement ps = null;
        try {
            String query = "INSERT INTO payer (codecli, datepaie, montant) VALUES (?, ?, ?)";
            ps = connection.prepareStatement(query);
            ps.setString(1, codecli);
            ps.setDate(2, datepaie);
            ps.setInt(3, montant);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
