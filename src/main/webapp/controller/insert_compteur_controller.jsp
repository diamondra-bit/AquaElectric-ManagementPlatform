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
String type=request.getParameter("type");
String pu=request.getParameter("pu");

Insert_Compteur obj=new Insert_Compteur();
obj.insert_values(codecompteur,type,pu);

%>

<script type="text/javascript">
window.location.href="http://localhost:8081/k/compteur.jsp"
</script>

</body>
</html>