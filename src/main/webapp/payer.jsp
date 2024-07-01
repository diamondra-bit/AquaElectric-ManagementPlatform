<%@ page import="common.Payer_Bean" %>
<%@ page import="CRUD.Read_Payer" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insertion de paiement</title>
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
    .form-group {
        margin-bottom: 15px;
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
    
    <div class="content payer">
        <h3 class="mb-4">Insertion de paiement</h3>
        
        <% Payer_Bean objPayer1 = new Payer_Bean(); %>
        
        <form action="controller/insert_payer_controller.jsp" class="form-horizontal">
            <div class="form-group">
                <label for="codecli">Code client:</label>
                <input type="text" class="" id="codecli" name="codecli" onchange="get_montant.jsp">
            </div>
            <div class="form-group">
                <label for="datepaie">Date de paiement:</label>
                <input type="date" class="" id="datepaie" name="datepaie">
            </div>
            <div class="form-group">
                <label for="montant">Montant:</label>
                <input type="number" class="" id="montant" name="montant" value="<%= objPayer1.getMontant() %>">
            </div>
            <button type="submit" class="btn btn-success btn-form3">Insérer</button>
        </form>
        
        <hr>
        
        <%
        Read_Payer obj_readPayer = new Read_Payer();
        List<Payer_Bean> list = obj_readPayer.get_values();
        Iterator<Payer_Bean> it_list = list.iterator();
        %>
        
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Code paiement</th>
                    <th>Code Client</th>
                    <th>Date de paiement</th>
                    <th>Montant</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <% while(it_list.hasNext()){
                Payer_Bean objPayer = it_list.next();
            %>
            <tr>
                <td><%= objPayer.getIdpaye() %></td>
                <td><%= objPayer.getCodecli() %></td>
                <td><%= objPayer.getDatepaie() %></td>
                <td><%= objPayer.getMontant() %> Ar</td>
                <td>
                    <a href="edit_payer.jsp?idpaye=<%= objPayer.getIdpaye() %>" class="btn btn-warning">Éditer</a>
                    <a href="controller/delete_payer_controller.jsp?idpaye=<%= objPayer.getIdpaye() %>" class="btn btn-danger">Supprimer</a>
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
