<%@page import="common.Compteur_Bean"%>
<%@page import="CRUD.Edit_Compteur"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier les valeurs du compteur</title>
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
        String codecompteur=(String)request.getParameter("codecompteur");
        Edit_Compteur obj_Edit_values=new Edit_Compteur();
        Compteur_Bean obj_User_Bean=obj_Edit_values.get_values_of_user(codecompteur);
    %>
    
    <div class="container">
        <div class="form-container">
            <h3 class="mb-4">Modifier les valeurs du compteur</h3>

            <form action="controller/edit_compteur_controller.jsp">
                <div class="form-group">
                    <label for="codecompteur">Code Compteur :</label>
                    <input type="text" class="form-control" id="codecompteur" name="codecompteur" value="<%=codecompteur %>" readonly>
                </div>
                <div class="form-group">
				    <label for="type">Type de compteur :</label>
				    <select class="form-control" id="type" name="type">
				        <option value="eau" <%= obj_User_Bean.getType().equals("eau") ? "selected" : "" %>>Eau</option>
				        <option value="electricité" <%= obj_User_Bean.getType().equals("electricité") ? "selected" : "" %>>Électricité</option>
				    </select>
				</div>
                <div class="form-group">
                    <label for="pu">PU :</label>
                    <input type="text" class="form-control" id="pu" name="pu" value="<%=obj_User_Bean.getPu()%>">
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
