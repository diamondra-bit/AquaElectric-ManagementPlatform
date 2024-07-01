package Search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import common.Client_Bean;
import common.DB_Connection;

public class SearchNonPaye {
    private Connection connection;

    public SearchNonPaye() {
        // Initialise la connexion à la base de données dans le constructeur
        DB_Connection obj_DB_Connection = new DB_Connection();
        connection = obj_DB_Connection.get_Connection();
    }

    public List<Client_Bean> search(int month, int year) {
        List<Client_Bean> results = new ArrayList<>();
        String sql = "SELECT " +
                     "    c.codeclient, " +
                     "    c.nom, " +
                     "    c.quartier, " +
                     "    c.mail " +
                     "FROM " +
                     "    client c " +
                     "LEFT JOIN " +
                     "    payer p ON c.codeclient = p.codecli " +
                     "WHERE " +
                     "    MONTH(p.datepaie) < ?  AND YEAR(p.datepaie) = ? " +
                     "    AND NOT EXISTS ( " +
                     "        SELECT 1 " +
                     "        FROM payer p2 " +
                     "        WHERE p2.codecli = c.codeclient " +
                     "          AND MONTH(p2.datepaie) = ? AND YEAR(p2.datepaie) = ? " +
                     "    );";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, month);
            ps.setInt(2, year);
            ps.setInt(3, month);
            ps.setInt(4, year);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Client_Bean clientBean = new Client_Bean();
                clientBean.setCodeclient(rs.getString("codeclient"));
                clientBean.setNom(rs.getString("nom"));
                clientBean.setQuartier(rs.getString("quartier"));
                clientBean.setMail(rs.getString("mail"));

                results.add(clientBean);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Gestion des erreurs SQL
        }

        return results;
    }
}
