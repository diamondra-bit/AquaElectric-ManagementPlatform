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
String type=request.getParameter("type");
String pu=request.getParameter("pu");

Compteur_Bean obj_compteur_bean=new Compteur_Bean();
obj_compteur_bean.setCodecompteur(codecompteur);
obj_compteur_bean.setType(type);
obj_compteur_bean.setPu(pu);

Edit_Compteur obj_edit_compteur=new Edit_Compteur();
obj_edit_compteur.edit_user(obj_compteur_bean);


%>

<script type="text/javascript">
window.location.href="http://localhost:8081/k/compteur.jsp"
</script>

</body>
</html>