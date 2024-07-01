<%@page import="common.Elec_Bean"%>
<%@page import="CRUD.Edit_Elec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier les valeurs d'électricité</title>
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
        String codeelec=(String)request.getParameter("codeelec");
        Edit_Elec obj_Edit_values=new Edit_Elec();
        Elec_Bean obj_User_Bean=obj_Edit_values.get_values_of_user(codeelec);
    %>
    
    <div class="container">
        <div class="form-container">
            <h3 class="mb-4">Modifier les valeurs d'électricité</h3>

            <form action="controller/edit_elec_controller.jsp">
                <div class="form-group">
                    <label for="codeelec">Code Électricité :</label>
                    <input type="text" class="form-control" id="codeelec" name="codeelec" value="<%=codeelec %>" readonly>
                </div>
                <div class="form-group">
                    <label for="codecompteur">Code Compteur :</label>
                    <input type="text" class="form-control" id="codecompteur" name="codecompteur" value="<%=obj_User_Bean.getCodecompteur()%>">
                </div>
                <div class="form-group">
                    <label for="valeur1">Valeur :</label>
                    <input type="number" class="form-control" id="valeur1" name="valeur1" value="<%=obj_User_Bean.getValeur1()%>">
                </div>
                <div class="form-group">
                    <label for="date_releve1">Date Relevé :</label>
                    <input type="date" class="form-control" id="date_releve1" name="date_releve1" value="<%=obj_User_Bean.getDate_releve1()%>">
                </div>
                <div class="form-group">
                    <label for="date_presentation">Date Présentation :</label>
                    <input type="date" class="form-control" id="date_presentation" name="date_presentation" value="<%=obj_User_Bean.getDate_presentation()%>">
                </div>
                <div class="form-group">
                    <label for="date_limite_paie">Date Limite de Paiement :</label>
                    <input type="date" class="form-control" id="date_limite_paie" name="date_limite_paie" value="<%=obj_User_Bean.getDate_limite_paie()%>">
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
