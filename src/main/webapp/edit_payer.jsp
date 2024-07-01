<%@ page import="common.Payer_Bean"%>
<%@ page import="CRUD.Edit_Payer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Payment Details</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    .form-container {
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f9f9f9;
    }
</style>
</head>
<body>

<%
try {
    // Conversion de la chaîne en entier
    int idpaye = Integer.parseInt(request.getParameter("idpaye"));
    
    // Création de l'objet Edit_Payer et appel de la méthode pour obtenir les valeurs
    Edit_Payer obj_Edit_values = new Edit_Payer();
    Payer_Bean obj_User_Bean = obj_Edit_values.get_values_of_user(idpaye);
%>

<div class="container">
    <div class="form-container">
        <h3 class="mb-4">Edit Payment Details</h3>
        <form action="controller/edit_payer_controller.jsp" method="post">
            <input type="hidden" name="idpaye" value="<%= idpaye %>">
            <div class="form-group">
                <label for="codecli">Code Client :</label>
                <input type="text" class="form-control" id="codecli" name="codecli" value="<%= obj_User_Bean.getCodecli() %>" readonly>
            </div>
            <div class="form-group">
                <label for="datepaie">Date de Paiement :</label>
                <input type="date" class="form-control" id="datepaie" name="datepaie" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(obj_User_Bean.getDatepaie()) %>">
            </div>
            <div class="form-group">
                <label for="montant">Montant :</label>
                <input type="number" class="form-control" id="montant" name="montant" value="<%= obj_User_Bean.getMontant() %>">
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</div>

<%
} catch (NumberFormatException e) {
    // Gestion de l'erreur si l'idpaye n'est pas un entier valide
    out.println("Erreur : ID de paiement invalide.");
} catch (Exception e) {
    // Gestion des autres erreurs possibles
    out.println("Erreur lors de la récupération des détails du paiement : " + e.getMessage());
}
%>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
