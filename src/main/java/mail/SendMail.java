package mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	  public static void sendEmail(String recipient) {
	        String host = "smtp.gmail.com";
	        final String user = "rasolofojaonadiamondranirina@gmail.com";
	        final String password = "zdys wsgf muul iduf";

	        String subject = "Notification de Paiement en Retard";
	        String messageText = "Cher client, \n\nNous vous informons que vous n'avez pas encore payé votre facture. Veuillez le faire dès que possible.\n\nMerci.";

	        Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.port", "587");

	        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });

	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
	            message.setSubject(subject);
	            message.setText(messageText);

	            Transport.send(message);
	            System.out.println("Email envoyé avec succès.");
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            System.out.println("Erreur lors de l'envoi de l'email.");
	        }
	    }
	 
}
