package Pdf.Dynamic;

import java.io.FileOutputStream;
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import common.DB_Connection;

public class Generate_Pdf_Dynamic {
    public void printPdf(String codeclient) {
        try {
            String file_name = "C:\\Users\\Diamondra\\Documents\\FactureClient_" + codeclient + ".pdf";
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(file_name));

            document.open();

            DB_Connection obj_DB_Connection = new DB_Connection();
            Connection connection = obj_DB_Connection.get_Connection();

            PreparedStatement ps = null;
            ResultSet rs = null;

          String query = "SELECT " +
                    "    client.nom, " +
                    "    client.mail, " +
                    "    client.codeclient, " +
                    "    client.quartier, " +
                    "    client.codecompteur_eau, " +
                    "    client.codecompteur_electricite, " +
                    "    releve_elec.date_presentation, " +
                    "    releve_elec.date_limite_paie, " +
                    "    releve_elec.valeur1, " +
                    "    releve_eau.valeur2, " +
                    "    compteur_elec.pu AS pu_elec, " +
                    "    compteur_eau.pu AS pu_eau " +
                    "FROM " +
                    "    client " +
                    "JOIN " +
                    "    releve_elec ON releve_elec.codecompteur = client.codecompteur_electricite " +
                    "JOIN " +
                    "    releve_eau ON releve_eau.codecompteur = client.codecompteur_eau " +
                    "LEFT JOIN " +
                    "    compteur AS compteur_elec ON compteur_elec.codecompteur = client.codecompteur_electricite AND compteur_elec.type = 'electricite' " +
                    "LEFT JOIN " +
                    "    compteur AS compteur_eau ON compteur_eau.codecompteur = client.codecompteur_eau AND compteur_eau.type = 'eau' " +
                    "WHERE " +
                    "    client.codeclient = ? " +
                    "ORDER BY " +
                    "    releve_elec.date_presentation DESC " +
                    "LIMIT 1;";

            ps = connection.prepareStatement(query);
            ps.setString(1, codeclient);
            rs = ps.executeQuery();

            // Titre du document
            Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            Paragraph title = new Paragraph("JIRO SY RANO MALAGASY", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            // Facture mois de :
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMMM yyyy", Locale.FRANCE);
            String formattedDate = currentDate.format(formatter).toUpperCase(Locale.FRANCE);

            Font subTitleFont = new Font(Font.FontFamily.HELVETICA, 12);
            Paragraph subTitle = new Paragraph("Votre facture du mois de : " + formattedDate, subTitleFont);
            subTitle.setAlignment(Element.ALIGN_CENTER);
            document.add(subTitle);

            // Ajouter un espace entre le titre et le contenu
            document.add(new Paragraph("\n"));

            while (rs.next()) {
                // Titulaire
                Font contentFont = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);

                Paragraph para2 = new Paragraph("Titulaire du compte: " + rs.getString("nom"));
                document.add(para2);

                Paragraph para3 = new Paragraph("Référence Client: " + rs.getString("codeclient"), contentFont);
                document.add(para3);

                Paragraph para4 = new Paragraph("Adresse installation: " + rs.getString("quartier"), contentFont);
                document.add(para4);

                Paragraph para5 = new Paragraph("N° compteur électricité: " + rs.getString("codecompteur_electricite"), contentFont);
                document.add(para5);

                Paragraph para6 = new Paragraph("N° compteur eau: " + rs.getString("codecompteur_eau"), contentFont);
                document.add(para6);

                Paragraph para7 = new Paragraph("Date de présentation: " + rs.getString("date_presentation"), contentFont);
                document.add(para7);

                Paragraph para8 = new Paragraph("Date limite de paie: " + rs.getString("date_limite_paie"), contentFont);
                document.add(para8);

                document.add(new Paragraph("\n"));
                Paragraph para9 = new Paragraph("Votre facture en détail ", subTitleFont);
                para9.setAlignment(Element.ALIGN_CENTER);
                document.add(para9);

                // Convertir les valeurs en entier et calculer les totaux
                int pu_elec = rs.getInt("pu_elec");
                int valeur_elec = rs.getInt("valeur1");
                int total_elec = pu_elec * valeur_elec;

                int pu_eau = rs.getInt("pu_eau");
                int valeur_eau = rs.getInt("valeur2");
                int total_eau = pu_eau * valeur_eau;

                // Calculer le total net à payer
                int total_facture = total_elec + total_eau;

                PdfPTable table = new PdfPTable(3);
                table.setWidthPercentage(100);
                table.setSpacingBefore(10f);
                table.setSpacingAfter(10f);

                // Header
                PdfPCell headerCell;
                headerCell = new PdfPCell(new Phrase(""));
                headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(headerCell);

                headerCell = new PdfPCell(new Phrase("Electricité"));
                headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(headerCell);

                headerCell = new PdfPCell(new Phrase("Eau"));
                headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(headerCell);
                table.setHeaderRows(1);

                // Data
                table.addCell(new Phrase("PU (Ar)"));
                table.addCell(String.valueOf(pu_elec));
                table.addCell(String.valueOf(pu_eau));

                table.addCell(new Phrase("Valeur"));
                table.addCell(String.valueOf(valeur_elec));
                table.addCell(String.valueOf(valeur_eau));

                table.addCell(new Phrase("Total (Ar)"));
                table.addCell(String.valueOf(total_elec));
                table.addCell(String.valueOf(total_eau));

                document.add(table);

                // Ajout du total facture pour chaque client
                Paragraph para10 = new Paragraph("Net à Payer: " + total_facture + " Ariary");
                document.add(para10);

                // Ajouter un espace après chaque facture
                document.add(new Paragraph("\n"));
            }

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
