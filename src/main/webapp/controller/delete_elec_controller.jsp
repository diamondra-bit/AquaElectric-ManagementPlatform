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
String codeelec=request.getParameter("codeelec");
Delete_Elec obj_Delete_values=new Delete_Elec();
obj_Delete_values.delete_values(codeelec);
%>

<script type="text/javascript">
window.location.href="http://localhost:8081/k/elec.jsp"
</script>

</body>
</html>