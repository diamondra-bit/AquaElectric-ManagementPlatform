<%@page import="common.Compteur_Bean"%>
<%@page import="java.util.*"%>
<%@page import="CRUD.Read_Compteur"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
    
    <div class="content compteur">
        <h3 class="mb-4">Liste des compteurs</h3>
    
        <form action="controller/insert_compteur_controller.jsp" class="mb-4">
        
            <div class="form-group">
                <label for="codecompteur">Code Compteur :</label>
                <input type="text" class="" id="codecompteur" name="codecompteur">
            </div>
            <div class="form-group">
                <label for="type">Type de compteur :</label>
                  <select class="" id="type" name="type">
	            <option value="eau">Eau</option>
	            <option value="electricité">Electricité</option>
	        </select>
            </div>
            <div class="form-group">
                <label for="pu">PU :</label>
                <input type="text" class="" id="pu" name="pu">
            </div>
            <button type="submit" class="btn btn-success btn-form3 ">Insert</button>
        </form>
        
        <hr>
        
        <%
        Read_Compteur obj_readCompteur = new Read_Compteur();
        List<Compteur_Bean> list = obj_readCompteur.get_values();
        Iterator<Compteur_Bean> it_list = list.iterator();
        %>
        
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Code compteur</th>
                    <th>Type</th>
                    <th>Prix Unitaire</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% while(it_list.hasNext()) {
                       Compteur_Bean obj_Compteur_Bean = it_list.next();
                %>
                <tr>
                    <td><%= obj_Compteur_Bean.getCodecompteur() %></td>       
                    <td><%= obj_Compteur_Bean.getType() %></td>   
                    <td><%= obj_Compteur_Bean.getPu() %> Ar</td>
                    <td>
                        <a class="btn btn-warning btn-sm" href="edit_compteur.jsp?codecompteur=<%= obj_Compteur_Bean.getCodecompteur() %>">Edit</a>
                        <a class="btn btn-danger btn-sm" href="controller/delete_compteur_controller.jsp?codecompteur=<%= obj_Compteur_Bean.getCodecompteur() %>">Delete</a>
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
