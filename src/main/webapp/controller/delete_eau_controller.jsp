<%@page import="CRUD.Delete_Eau"%>
<%@page import="CRUD.Delete_Elec"%>
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
String codeeau=request.getParameter("codeeau");
Delete_Eau obj_Delete_values=new Delete_Eau();
obj_Delete_values.delete_values(codeeau);
%>

<script type="text/javascript">
window.location.href="http://localhost:8081/k/eau.jsp"
</script>

</body>
</html>