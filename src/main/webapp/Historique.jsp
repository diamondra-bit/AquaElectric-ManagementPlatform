<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Search.Historique"%>
<%@ page import="common.Client_Bean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Historique des 3 derniers factures</title>
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
</style>
</head>
<body>
<div class="flex">
    <div class="sidebar">
        <%@ include file="/Sidebar.jsp" %>
    </div>
    
    <div class="content">
        <h3 class="mb-4">Historique facture</h3>
        <div class="search-form">
            <form action="Historique.jsp" method="get" class="form-inline">
                <input type="text" class="form-control" name="codeclient" placeholder="Code client" required>
                <button type="submit" class="btn btn-primary search-button">Rechercher</button>
            </form>
        </div>
        
          <br/>
    
        <table id="initialTable" class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Code Client</th>
                    <th>Nom</th>
                    <th>Mail</th>
                    <th>Mois</th>
                    <th>Montant Total</th>
                </tr>
            </thead>
            <tbody>
            <% 
                String codeclient = request.getParameter("codeclient");
                if (codeclient != null && !codeclient.isEmpty()) {
                    Historique historique = new Historique();
                    List<Client_Bean> list = historique.search(codeclient);
                    Iterator<Client_Bean> it_list = list.iterator();
                    if (!it_list.hasNext()) { 
            %>
                <tr>
                    <td colspan="5" class="text-center">Aucun résultat trouvé</td>
                </tr>
            <% 
                    } else {
                        while (it_list.hasNext()) {
                            Client_Bean clientBean = it_list.next();
                            Date date = clientBean.getMois();
                            
                            // Formattage pour récupérer uniquement le mois et l'année
                            SimpleDateFormat sdf = new SimpleDateFormat("MM/yyyy");
                            String moisEtAnnee = sdf.format(date);
            %>
                <tr>
                    <td><%= clientBean.getCodeclient() %></td>
                    <td><%= clientBean.getNom() %></td>
                    <td><%= clientBean.getMail() %></td>
                    <td><%=  moisEtAnnee %></td>
                    <td><%= formatMontant(clientBean.getMontant_total()) %></td>
                </tr>
            <% 
                        }
                    }
                } else {
                    // Ajoutez ici un message ou une indication si aucun résultat n'est trouvé
            %>
                <tr>
                    <td colspan="5" class="text-center">Veuillez entrer un code client pour rechercher</td>
                </tr>
            <% 
                }
            %>
            </tbody>
        </table>
      
    </div>
</div>

<%-- Méthode pour formater le montant_total en tant que devise --%>
<%! 
    public String formatMontant(double montant) {
        DecimalFormat df = new DecimalFormat("#,###.00");
        return df.format(montant) + " Ar";
    }
%>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
