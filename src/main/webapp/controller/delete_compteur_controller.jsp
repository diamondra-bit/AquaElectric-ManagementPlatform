<%@page import="CRUD.Delete_Compteur"%>
<%@page import="CRUD.Edit_Compteur"%>
<%@page import="common.Compteur_Bean"%>
<%@page import="CRUD.Insert_Compteur"%>
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
String codecompteur=request.getParameter("codecompteur");
Delete_Compteur obj_Delete_values=new Delete_Compteur();
obj_Delete_values.delete_values(codecompteur);
%>

<script type="text/javascript">
window.location.href="http://localhost:8081/k/compteur.jsp"
</script>

</body>
</html>