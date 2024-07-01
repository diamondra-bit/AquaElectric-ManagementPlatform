<%@page import="common.Client_Bean"%>
<%@page import="CRUD.Edit_Client"%>
<%@page import="common.Compteur_Bean"%>
<%@page import="CRUD.Edit_Compteur"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier les valeurs</title>
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
        String codeclient=(String)request.getParameter("codeclient");
        Edit_Client obj_Edit_values=new Edit_Client();
        Client_Bean obj_User_Bean=obj_Edit_values.get_values_of_user(codeclient);
    %>
    
    <div class="container">
        <div class="form-container">
            <h3 class="mb-4">Modifier les valeurs</h3>

            <form action="controller/edit_client_controller.jsp">
                <div class="form-group">
                    <label for="codeclient">Code Client :</label>
                    <input type="text" class="form-control" id="codeclient" name="codeclient" value="<%=codeclient %>" readonly>
                </div>
                <div class="form-group">
                    <label for="nom">Nom :</label>
                    <input type="text" class="form-control" id="nom" name="nom" value="<%=obj_User_Bean.getNom()%>">
                </div>
                <div class="form-group">
				    <label for="sexe">Sexe :</label>
				    <select class="form-control" id="sexe" name="sexe">
				        <option value="Femme" <%= obj_User_Bean.getSexe().equals("Femme") ? "selected" : "" %>>Femme</option>
				        <option value="Homme" <%= obj_User_Bean.getSexe().equals("Homme") ? "selected" : "" %>>Homme</option>
				    </select>
				</div>

                <div class="form-group">
                    <label for="quartier">Quartier :</label>
                    <input type="text" class="form-control" id="quartier" name="quartier" value="<%=obj_User_Bean.getQuartier() %>">
                </div>
                <div class="form-group">
                    <label for="niveau">Niveau :</label>
                    <input type="text" class="form-control" id="niveau" name="niveau" value="<%=obj_User_Bean.getNiveau()%>">
                </div>
                <div class="form-group">
                    <label for="mail">Mail :</label>
                    <input type="text" class="form-control" id="mail" name="mail" value="<%=obj_User_Bean.getMail()%>">
                </div>
                <div class="form-group">
                    <label for="codecompteur_eau">N° compteur Eau :</label>
                    <input type="text" class="form-control" id="codecompteur_eau" name="codecompteur_eau" value="<%=obj_User_Bean.getCodecompteur_eau()%>">
                </div>
                <div class="form-group">
                    <label for="codecompteur_electricite">N° compteur Electricite :</label>
                    <input type="text" class="form-control" id="codecompteur_electricite" name="codecompteur_electricite" value="<%=obj_User_Bean.getCodecompteur_electricite()%>">
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
