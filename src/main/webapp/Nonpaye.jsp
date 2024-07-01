<%@ page import="Search.SearchNonPaye" %>
<%@ page import="common.Client_Bean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des Clients qui n'ont pas payé</title>
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
    .search-form {
        margin-bottom: 20px;
    }
    .search-button {
        margin-left: 10px;
    }
    .table {
        margin-top: 20px;
    }
</style>
</head>
<body>
<div class="flex">
    <div class="sidebar">
        <%@ include file="/Sidebar.jsp" %>
    </div>
    
    <div class="content">
        <h3 class="mb-4">Liste des Clients qui n'ont pas payé</h3>
        
        <div class="search-form">
            <form action="Nonpaye.jsp" method="get" class="form-inline">
                <input type="month" class="form-control" name="month" required>
                <button type="submit" class="btn btn-primary search-button">Rechercher</button>
            </form>
        </div>
    
        <table id="initialTable" class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Code Client</th>
                    <th>Nom</th>
                    <th>Quartier</th>
                    <th>Mail</th>
                    <th>Notifier</th>
                </tr>
            </thead>
            <tbody>
                <% 
                String monthParam = request.getParameter("month");
                if (monthParam != null && !monthParam.isEmpty()) {
                    try {
                        // Extraire le mois et l'année à partir de la valeur du champ month
                        String[] parts = monthParam.split("-");
                        int selectedMonth = Integer.parseInt(parts[1]);
                        int selectedYear = Integer.parseInt(parts[0]);

                        SearchNonPaye searchNonPaye = new SearchNonPaye();
                        List<Client_Bean> list = searchNonPaye.search(selectedMonth, selectedYear);
                        Iterator<Client_Bean> it_list = list.iterator();

                        while (it_list.hasNext()) {
                            Client_Bean obj_Compteur_Bean = it_list.next();
                %>
                <tr>
                    <td><%= obj_Compteur_Bean.getCodeclient() %></td>
                    <td><%= obj_Compteur_Bean.getNom() %></td>
                    <td><%= obj_Compteur_Bean.getQuartier() %></td>
                    <td><%= obj_Compteur_Bean.getMail() %></td>
                    <td>
                        <form action="controller/mail.jsp" method="post">
                            <input type="hidden" name="email" value="<%= obj_Compteur_Bean.getMail() %>">
                            <button type="submit" class="btn btn-warning">Notifier par mail</button>
                        </form>
                    </td>
                </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
