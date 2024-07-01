package Search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.Client_Bean;
import common.DB_Connection;

public class SearchMontant {

    private Connection connection;

    public SearchMontant() {
        // Initialise la connexion à la base de données dans le constructeur
        DB_Connection obj_DB_Connection = new DB_Connection();
        connection = obj_DB_Connection.get_Connection();
    }

    public List<Client_Bean> search(String codecli) {
        List<Client_Bean> results = new ArrayList<>();
        String sql = "SELECT montant FROM payer WHERE codecli = ? LIMIT 1"; // Supprimez LIMIT 1 si vous ne voulez pas limiter à un seul résultat

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, codecli); // Code client

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Client_Bean clientBean = new Client_Bean();
                clientBean.setMontant_total(rs.getDouble("montant")); // Récupère le montant depuis le ResultSet
                results.add(clientBean);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Gestion des erreurs SQL
        }

        return results;
    }

}
