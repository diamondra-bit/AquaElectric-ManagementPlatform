package Search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.Client_Bean;
import common.DB_Connection;

public class Historique {

    private Connection connection;

    public Historique() {
        // Initialise la connexion à la base de données dans le constructeur
        DB_Connection obj_DB_Connection = new DB_Connection();
        connection = obj_DB_Connection.get_Connection();
    }

    public List<Client_Bean> search(String codeclient) {
        List<Client_Bean> results = new ArrayList<>();
        String sql = "SELECT " +
                     "    c.codeclient, " +
                     "    c.nom, " +
                     "    c.mail, " +
                     "    p.datepaie AS mois, " +
                     "    p.montant AS montant_total " +
                     "FROM " +
                     "    CLIENT c " +
                     "JOIN " +
                     "    PAYER p ON c.codeclient = p.codecli " +
                     "WHERE " +
                     "    c.codeclient = ? " + 
                     "ORDER BY " +
                     "    p.datepaie DESC " +
                     "LIMIT 3";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, codeclient);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Client_Bean clientBean = new Client_Bean();
                clientBean.setCodeclient(rs.getString("codeclient"));
                clientBean.setNom(rs.getString("nom"));
                clientBean.setMail(rs.getString("mail"));
                clientBean.setMontant_total(rs.getDouble("montant_total"));
                clientBean.setMois(rs.getDate("mois"));

                results.add(clientBean);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Gestion des erreurs SQL
        }

        return results;
    }
}
