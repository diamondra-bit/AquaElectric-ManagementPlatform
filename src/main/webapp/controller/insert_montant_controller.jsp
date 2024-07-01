<%@page import="java.util.List"%>
<%@ page import="Search.SearchMontant" %>
<%@ page import="common.Client_Bean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Controller JSP</title>
</head>
<body>

<%
    String codecli = request.getParameter("codecli");

    // Vérifier si le code client est présent dans la requête
    if (codecli != null && !codecli.isEmpty()) {
        // Appel à la classe de recherche pour récupérer les montants
        SearchMontant searcher = new SearchMontant();
        List<Client_Bean> clients = searcher.search(codecli);

        // Affichage des montants récupérés (pour vérification)
        for (Client_Bean client : clients) {
            out.println("Montant récupéré : " + client.getMontant_total() + "<br>");
        }
    } else {
        out.println("Code client non spécifié.");
    }
%>

<script type="text/javascript">
    // Redirection vers une autre page après traitement
    //window.location.href = "http://localhost:8081/k/payer.jsp";
</script>

</body>
</html>
