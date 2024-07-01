<%@ page import="CRUD.Edit_Client"%>
<%@ page import="common.Client_Bean"%>
<%@ page import="CRUD.Edit_Compteur"%>
<%@ page import="common.Compteur_Bean"%>
<%@ page import="CRUD.Insert_Compteur"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String codeclient = request.getParameter("codeclient");
String nom = request.getParameter("nom");
String sexe = request.getParameter("sexe");
String quartier = request.getParameter("quartier");
String niveau = request.getParameter("niveau");
String mail = request.getParameter("mail");
String codecompteur_eau = request.getParameter("codecompteur_eau");
String codecompteur_electricite = request.getParameter("codecompteur_electricite");

Client_Bean obj_compteur_bean = new Client_Bean();
obj_compteur_bean.setCodeclient(codeclient);
obj_compteur_bean.setNom(nom);
obj_compteur_bean.setSexe(sexe);
obj_compteur_bean.setQuartier(quartier);
obj_compteur_bean.setNiveau(niveau);
obj_compteur_bean.setMail(mail);
obj_compteur_bean.setCodecompteur_eau(codecompteur_eau);
obj_compteur_bean.setCodecompteur_electricite(codecompteur_electricite); // Corrected method name

Edit_Client obj_edit_compteur = new Edit_Client();
obj_edit_compteur.edit_user(obj_compteur_bean);
%>

<script type="text/javascript">
    window.location.href = "http://localhost:8081/k/client.jsp";
</script>

</body>
</html>
