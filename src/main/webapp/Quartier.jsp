<%@page import="CRUD.Read_Quartier"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="Search.SearchQuartier" %>
<%@ page import="common.Client_Bean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des Clients par Quartier</title>
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
    .table {
        margin-top: 20px;
    }
</style>
<script>
    function toggleTableVisibility() {
        var queryParam = document.getElementById("query").value.trim();
        if (queryParam === "") {
            document.getElementById("initialTable").style.display = "block";
            document.getElementById("searchResultsTable").style.display = "none";
        } else {
            document.getElementById("initialTable").style.display = "none";
            document.getElementById("searchResultsTable").style.display = "block";
        }
    }

    function refreshPage() {
        window.location.href = window.location.pathname;
    }
</script>
</head>
<body>
<div class="flex">
    <div class="sidebar">
        <%@ include file="/Sidebar.jsp" %>
    </div>
    
    <div class="content">
        <h3>Liste des Clients par Quartier</h3>
        
        <br/>
        <div class="mb-4">
             <form class="form-inline" action="Quartier.jsp" method="GET">
                <input type="text" class="form-control mr-2" name="query" placeholder="Rechercher...">
                <button type="submit" class="btn btn-primary mr-2">Rechercher</button>
                <button type="button" class="btn btn-secondary" onclick="refreshPage()">Actualiser</button>
            </form>
        </div>
        <br/>
        
          <% Read_Quartier obj_readCompteur = new Read_Quartier();
           List<Client_Bean> list = obj_readCompteur.get_values();
           Iterator<Client_Bean> it_list = list.iterator();
      	  %>
      	  
      	<% if (request.getParameter("query") == null || request.getParameter("query").isEmpty()) { %>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Code Client</th>
                    <th>Nom</th>
                    <th>Sexe</th>
                    <th>Quartier</th>
                    <th>Niveau</th>
                    <th>Mail</th>
                    <th>N° compteur Eau</th>
                    <th>N° compteur Electricite</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% while (it_list.hasNext()) {
                       Client_Bean obj_Compteur_Bean = it_list.next();
                %>
                <tr>
                    <td><%= obj_Compteur_Bean.getCodeclient() %></td>
                    <td><%= obj_Compteur_Bean.getNom() %></td>
                    <td><%= obj_Compteur_Bean.getSexe() %></td>
                    <td><%= obj_Compteur_Bean.getQuartier() %></td>
                    <td><%= obj_Compteur_Bean.getNiveau() %></td>
                    <td><%= obj_Compteur_Bean.getMail() %></td>
                    <td><%= obj_Compteur_Bean.getCodecompteur_eau() %></td>
                    <td><%= obj_Compteur_Bean.getCodecompteur_electricite() %></td>
                    <td>
                        <a class="btn btn-warning btn-sm" href="edit_client.jsp?codeclient=<%= obj_Compteur_Bean.getCodeclient() %>">Edit</a>
                        <a class="btn btn-danger btn-sm" href="controller/delete_client_controller.jsp?codeclient=<%= obj_Compteur_Bean.getCodeclient() %>">Delete</a>
                        <a class="btn btn-info btn-sm" href="generateInvoice.jsp?codeclient=<%= obj_Compteur_Bean.getCodeclient() %>">Pdf</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
        
          <% String queryParam = request.getParameter("query");
           if (queryParam != null && !queryParam.isEmpty()) {
               SearchQuartier searchQuartier = new SearchQuartier();
               List<Client_Bean> results = searchQuartier.search(queryParam);
        %>
        
         <h3 class="mt-4">Résultats de la recherche pour : <%= queryParam %></h3>

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Code Client</th>
                    <th>Nom</th>
                    <th>Sexe</th>
                    <th>Quartier</th>
                    <th>Niveau</th>
                    <th>Mail</th>
                    <th>N° Compteur Eau</th>
                    <th>N° Compteur Electricité</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Client_Bean bean : results) { %>
                <tr>
                    <td><%= bean.getCodeclient() %></td>
                    <td><%= bean.getNom() %></td>
                    <td><%= bean.getSexe() %></td>
                    <td><%= bean.getQuartier() %></td>
                    <td><%= bean.getNiveau() %></td>
                    <td><%= bean.getMail() %></td>
                    <td><%= bean.getCodecompteur_eau() %></td>
                    <td><%= bean.getCodecompteur_electricite() %></td>
                    <td>
                        <a class="btn btn-warning btn-sm" href="edit_client.jsp?codeclient=<%= bean.getCodeclient() %>">Edit</a>
                        <a class="btn btn-danger btn-sm" href="controller/delete_client_controller.jsp?codeclient=<%= bean.getCodeclient() %>">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% } else { %>
            <p class="mt-4">Aucune recherche spécifiée.</p>
        <% } %>
        
        
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
