<%@page import="CRUD.Delete_Client"%>
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
String codeclient=request.getParameter("codeclient");
Delete_Client obj_Delete_values=new Delete_Client();
obj_Delete_values.delete_values(codeclient);
%>

<script type="text/javascript">
window.location.href="http://localhost:8081/k/client.jsp"
</script>

</body>
</html>