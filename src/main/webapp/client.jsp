<%@page import="Search.SearchQuery"%>
<%@page import="CRUD.Read_Client"%>
<%@page import="common.Client_Bean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des Clients</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/style.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script>
    function refreshPage() {
        window.location.href = 'client.jsp';
    }
</script>
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
    
    <div class="content">
        <h3 class="mb-4">Liste des Clients</h3>
        
        <div class="mb-4">
            <form class="form-inline" action="client.jsp" method="GET">
                <input type="text" class="form-control mr-2" name="query" placeholder="Rechercher...">
                <button type="submit" class="btn btn-primary mr-2">Rechercher</button>
                <button type="button" class="btn btn-secondary" onclick="refreshPage()">Actualiser</button>
            </form>
        </div>
    
        <form class="mb-4" action="controller/insert_client_controller.jsp">
         <div class="flex-form client">
      		 <div class="f">
           		<div class="form-group">
	                <label for="codeclient">Code Client :</label>
	                <input type="text" class="" id="codeclient" name="codeclient">
           		</div>
	            <div class="form-group">
	                <label for="nom">Nom :</label>
	                <input type="text" class="" id="nom" name="nom">
	            </div>
	            <div class="form-group">
				    <label for="sexe">Sexe :</label>
				    <select class="" id="sexe" name="sexe">
				        <option value="Femme">Femme</option>
				        <option value="Homme">Homme</option>
				    </select>
				</div>

	          </div>
	           
	          <div class="f">   
		            <div class="form-group">
		                <label for="quartier">Quartier :</label>
		                <input type="text" class="" id="quartier" name="quartier">
		            </div>
		            <div class="form-group">
		                <label for="niveau">Niveau :</label>
		                <input type="text" class="" id="niveau" name="niveau">
		            </div>
		            <div class="form-group">
		                <label for="mail">Mail :</label>
		                <input type="email" class="" id="mail" name="mail">
		            </div>
	           </div>
	           <div class="f">
		            <div class="form-group">
		                <label for="codecompteur_eau">N° compteur Eau :</label>
		                <input type="text" class="" id="codecompteur_eau" name="codecompteur_eau">
		            </div>
		            <div class="form-group">
		                <label for="codecompteur_electricite">N° compteur Electricite :</label>
		                <input type="text" class="" id="codecompteur_electricite" name="codecompteur_electricite">
		            </div>
		            <button type="submit" class="btn btn-success btn-form">Insert</button>
              </div>
              </div>
        </form>
        
        <hr>
        
        <% Read_Client obj_readCompteur = new Read_Client();
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
               SearchQuery searchQuery = new SearchQuery();
               List<Client_Bean> results = searchQuery.search(queryParam);
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
