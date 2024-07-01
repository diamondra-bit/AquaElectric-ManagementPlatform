<%@page import="common.Elec_Bean"%>
<%@page import="CRUD.Read_Elec"%>
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
    
    <div class="content elec">
        <h3 class="mb-4">Liste des relevé d'electricité</h3>
    
        <form action="controller/insert_elec_controller.jsp" class="mb-4">
         <div class="flex-form">
            <div class="form-group">
                <label for="codeelec">Code Electricite :</label>
                <input type="text" class="" id="codeelec" name="codeelec">
            </div>
            <div class="form-group">
                <label for="codecompteur">Code Compteur :</label>
                <input type="text" class="" id="codecompteur" name="codecompteur">
            </div>
            <div class="form-group">
                <label for="valeur1">Valeur :</label>
                <input type="number" class="" id="valeur1" name="valeur1">
            </div>
         </div>
         
          <div class="flex-form">
            <div class="form-group">
                <label for="date_releve1">Date de releve :</label>
                <input type="date" class="" id="date_releve1" name="date_releve1">
            </div>
            <div class="form-group">
                <label for="date_presentation">Date de presentation :</label>
                <input type="date" class="" id="date_presentation" name="date_presentation">
            </div>
            <div class="form-group">
                <label for="date_limite_paie">Date limite de paie :</label>
                <input type="date" class="" id="date_limite_paie" name="date_limite_paie">
            </div>
           </div>
            <button type="submit" class="btn btn-success">Insert</button>
        </form>
        
        <hr>
        
        <%
        Read_Elec obj_readElec = new Read_Elec();
        List<Elec_Bean> list = obj_readElec.get_values();
        Iterator<Elec_Bean> it_list = list.iterator();
        %>
        
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Code Electricite</th>
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
                       Elec_Bean obj_Elec_Bean = it_list.next();
                %>
                <tr>
                    <td><%= obj_Elec_Bean.getCodeelec() %></td>
                    <td><%= obj_Elec_Bean.getCodecompteur() %></td>
                    <td><%= obj_Elec_Bean.getValeur1() %> kWh</td>
                    <td><%= obj_Elec_Bean.getDate_releve1() %></td>
                    <td><%= obj_Elec_Bean.getDate_presentation() %></td>
                    <td><%= obj_Elec_Bean.getDate_limite_paie() %></td>
                    <td>
                        <a href="edit_elec.jsp?codeelec=<%= obj_Elec_Bean.getCodeelec() %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="controller/delete_elec_controller.jsp?codeelec=<%= obj_Elec_Bean.getCodeelec() %>" class="btn btn-danger btn-sm">Delete</a>
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
