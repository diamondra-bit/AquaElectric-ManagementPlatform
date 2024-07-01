<%@page import="common.Eau_Bean"%>
<%@page import="CRUD.Edit_Eau"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier les valeurs de l'eau</title>
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
        String codeeau=(String)request.getParameter("codeeau");
        Edit_Eau obj_Edit_values=new Edit_Eau();
        Eau_Bean obj_User_Bean=obj_Edit_values.get_values_of_user(codeeau);
    %>
    
    <div class="container">
        <div class="form-container">
            <h3 class="mb-4">Modifier les valeurs de l'eau</h3>

            <form action="controller/edit_eau_controller.jsp">
                <div class="form-group">
                    <label for="codeeau">Code Eau :</label>
                    <input type="text" class="form-control" id="codeeau" name="codeeau" value="<%=codeeau %>" readonly>
                </div>
                <div class="form-group">
                    <label for="codecompteur">Code Compteur :</label>
                    <input type="text" class="form-control" id="codecompteur" name="codecompteur" value="<%=obj_User_Bean.getCodecompteur()%>">
                </div>
                <div class="form-group">
                    <label for="valeur2">Valeur :</label>
                    <input type="number" class="form-control" id="valeur2" name="valeur2" value="<%=obj_User_Bean.getValeur2()%>">
                </div>
                <div class="form-group">
                    <label for="date_releve2">Date Relevé :</label>
                    <input type="date" class="form-control" id="date_releve2" name="date_releve2" value="<%=obj_User_Bean.getDate_releve2()%>">
                </div>
                <div class="form-group">
                    <label for="date_presentation2">Date Présentation :</label>
                    <input type="date" class="form-control" id="date_presentation2" name="date_presentation2" value="<%=obj_User_Bean.getDate_presentation2()%>">
                </div>
                <div class="form-group">
                    <label for="date_limite_paie2">Date Limite de Paiement :</label>
                    <input type="date" class="form-control" id="date_limite_paie2" name="date_limite_paie2" value="<%=obj_User_Bean.getDate_limite_paie2()%>">
                </div>
            
                <button type="submit" class="btn btn-primary">Modifier</button>
            </form>
        </div>
    </div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
