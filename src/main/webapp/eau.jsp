<%@page import="common.Eau_Bean"%>
<%@page import="CRUD.Read_Eau"%>
<%@page import="common.Compteur_Bean"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/style.css">
<style>
    .flex {
        display: flex;
    }
    .sidebar {
        width: 200px;
    }
    .content {
        flex: 1;
        padding: 20px;
    }
</style>
</head>
<body>
<div class="flex">
    <div class="sidebar">
        <%@ include file="/Sidebar.jsp" %>
    </div>
    
    <div class="content eau">
        <h3 class="mb-4">Liste des relevés d'eau</h3>
    
        <form action="controller/insert_eau_controller.jsp" class="mb-4">
          <div class="flex-form">
	            <div class="form-group">
	                <label for="codeeau">Code Eau :</label>
	                <input type="text" class="" id="codeeau" name="codeeau">
	            </div>
	            <div class="form-group">
	                <label for="codecompteur">Code Compteur :</label>
	                <input type="text" class="" id="codecompteur" name="codecompteur">
	            </div>
	            <div class="form-group">
	                <label for="valeur2">Valeur :</label>
	                <input type="number" class="" id="valeur2" name="valeur2">
	            </div>
            </div>
            <div class="flex-form">
	            <div class="form-group">
	                <label for="date_releve2">Date de releve :</label>
	                <input type="date" class="" id="date_releve2" name="date_releve2">
	            </div>
	            <div class="form-group">
	                <label for="date_presentation2">Date de presentation :</label>
	                <input type="date" class="" id="date_presentation2" name="date_presentation2">
	            </div>
	            <div class="form-group">
	                <label for="date_limite_paie2">Date limite de paie :</label>
	                <input type="date" class="" id="date_limite_paie2" name="date_limite_paie2">
	            </div>
             </div>
            <button type="submit" class="btn btn-success btn-form2">Insert</button>
        </form>
        
        <hr>
        
        <%
        Read_Eau obj_readEau = new Read_Eau();
        List<Eau_Bean> list = obj_readEau.get_values();
        Iterator<Eau_Bean> it_list = list.iterator();
        %>
        
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Code Eau</th>
                    <th>Code Compteur</th>
                    <th>Valeur</th>
                    <th>Date de releve</th>
                    <th>Date de présentation</th>
                    <th>Date limite de paie</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% while (it_list.hasNext()) {
                       Eau_Bean obj_Eau_Bean = it_list.next();
                %>
                <tr>
                    <td><%= obj_Eau_Bean.getCodeeau() %></td>
                    <td><%= obj_Eau_Bean.getCodecompteur() %></td>
                    <td><%= obj_Eau_Bean.getValeur2() %> m3
                    </td>
                    <td><%= obj_Eau_Bean.getDate_releve2() %></td>
                    <td><%= obj_Eau_Bean.getDate_presentation2() %></td>
                    <td><%= obj_Eau_Bean.getDate_limite_paie2() %></td>
                    <td>
                        <a href="edit_eau.jsp?codeeau=<%= obj_Eau_Bean.getCodeeau() %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="controller/delete_eau_controller.jsp?codeeau=<%= obj_Eau_Bean.getCodeeau() %>" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
