package Search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.Client_Bean;
import common.DB_Connection;

public class SearchQuery {

    private Connection connection;

    public SearchQuery() {
        // Initialise la connexion à la base de données dans le constructeur
        DB_Connection obj_DB_Connection = new DB_Connection();
        connection = obj_DB_Connection.get_Connection();
    }

    public List<Client_Bean> search(String queryParam) {
        List<Client_Bean> results = new ArrayList<>();
        String sql = "SELECT * FROM client WHERE " +
                     "codeclient LIKE ? OR " +
                     "nom LIKE ? OR " +
                     "sexe LIKE ? OR " +
                     "quartier LIKE ? OR " +
                     "niveau LIKE ? OR " +
                     "mail LIKE ? OR " +
                     "codecompteur_eau LIKE ? OR " +
                     "codecompteur_electricite LIKE ?"; // Utilisation de paramètres préparés
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            String likeParam = "%" + queryParam + "%"; // Prépare le paramètre LIKE
            ps.setString(1, likeParam); // Code client
            ps.setString(2, likeParam); // Nom
            ps.setString(3, likeParam); // Sexe
            ps.setString(4, likeParam); // Quartier
            ps.setString(5, likeParam); // Niveau
            ps.setString(6, likeParam); // Mail
            ps.setString(7, likeParam); // N° compteur Eau
            ps.setString(8, likeParam); // N° compteur Electricite
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Client_Bean clientBean = new Client_Bean();
                clientBean.setCodeclient(rs.getString("codeclient"));
                clientBean.setNom(rs.getString("nom"));
                clientBean.setSexe(rs.getString("sexe"));
                clientBean.setQuartier(rs.getString("quartier"));
                clientBean.setNiveau(rs.getString("niveau"));
                clientBean.setMail(rs.getString("mail"));
                clientBean.setCodecompteur_eau(rs.getString("codecompteur_eau"));
                clientBean.setCodecompteur_electricite(rs.getString("codecompteur_electricite"));
                
                results.add(clientBean);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            // Gestion des erreurs SQL
        } 
        
        return results;
    }
}
