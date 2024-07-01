<%@page import="Pdf.Dynamic.Generate_Pdf_Dynamic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Invoice</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .success-message {
            margin-bottom: 20px;
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
           String codeclient=request.getParameter("codeclient");
           Generate_Pdf_Dynamic jp=new Generate_Pdf_Dynamic();
          jp.printPdf(codeclient);
         boolean pdfGenerated=true;
        %>
        
        <% if (pdfGenerated) { %>
            <div class="success-message">
                <p><strong>Success:</strong> PDF téléchargé avec succès dans le dossier 'documents'.</p>
            </div>
        <% } else { %>
            <div class="alert alert-danger" role="alert">
                Une erreur s'est produite lors de la génération du PDF.
            </div>
        <% } %>
        
        <a href="client.jsp" class="btn btn-primary">Retour à la page principale</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
