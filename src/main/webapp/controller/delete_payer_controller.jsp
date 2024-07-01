<%@ page import="CRUD.Delete_Payer" %>
<%@ page import="CRUD.Delete_Eau" %>
<%@ page import="CRUD.Delete_Elec" %>
<%@ page import="CRUD.Edit_Compteur" %>
<%@ page import="common.Compteur_Bean" %>
<%@ page import="CRUD.Insert_Compteur" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
try {
    // Conversion de la chaîne en entier
    int idpaye = Integer.parseInt(request.getParameter("idpaye"));
    
    // Création de l'objet Delete_Payer et appel de la méthode de suppression
    Delete_Payer obj_Delete_values = new Delete_Payer();
    obj_Delete_values.delete_values(idpaye);
%>

<script type="text/javascript">
    window.location.href = "http://localhost:8081/k/payer.jsp";
</script>

<%
} catch (NumberFormatException e) {
    // Gestion de l'erreur si l'idpaye n'est pas un entier valide
    out.println("Erreur : ID de paiement invalide.");
} catch (Exception e) {
    // Gestion des autres erreurs possibles
    out.println("Erreur lors de la suppression du paiement : " + e.getMessage());
}
%>

</body>
</html>
