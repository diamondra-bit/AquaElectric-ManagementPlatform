<%@page import="mail.SendMail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Envoyer Email</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .success-message {
            margin-top: 20px;
            padding: 10px;
            background-color: #d4edda;
            border-color: #c3e6cb;
            color: #155724;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
           String email = request.getParameter("email");
           if (email != null && !email.isEmpty()) {
               SendMail.sendEmail(email);
               boolean emailSent =true;
               if (emailSent) {
        %>
               <div class="success-message">
                   <p><strong>Succès :</strong> Email envoyé à <%= email %> avec succès.</p>
               </div>
        <%     } else {
                   out.println("Une erreur s'est produite lors de l'envoi de l'email.");
               }
           } else {
               out.println("L'adresse email est manquante.");
           }
        %>
        <br/>
        <a href="/k/Nonpaye.jsp" class="btn btn-primary">Retour à la page Nonpaye</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
