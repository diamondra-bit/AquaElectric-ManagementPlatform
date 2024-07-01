<%@page import="CRUD.Insert_Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String codeclient=request.getParameter("codeclient");
String nom=request.getParameter("nom");
String sexe=request.getParameter("sexe");
String quartier=request.getParameter("quartier");
String niveau=request.getParameter("niveau");
String mail=request.getParameter("mail");
String codecompteur_eau=request.getParameter("codecompteur_eau");
String codecompteur_electricite=request.getParameter("codecompteur_electricite");

Insert_Client obj=new Insert_Client();
obj.insert_values(codeclient,nom,sexe,quartier,niveau,mail,codecompteur_eau,codecompteur_electricite);
%>

<script type="text/javascript">
window.location.href="http://localhost:8081/k/client.jsp"
</script>

</body>
</html>