<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/style.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<div class="side">
		<h3>Aqua Electric</h3>
		<ul>
		<li> <a href="${pageContext.request.contextPath}/compteur.jsp">Compteur</a></li>
		<li> <a href="${pageContext.request.contextPath}/client.jsp">Client</a></li>
		<li> <a href="${pageContext.request.contextPath}/elec.jsp">Electricite</a></li>
		<li> <a href="${pageContext.request.contextPath}/eau.jsp">Eau</a></li>
		<li> <a href="${pageContext.request.contextPath}/payer.jsp">Payement</a></li>
		<li> <a href="${pageContext.request.contextPath}/Quartier.jsp">Quartier</a></li>
		<li> <a href="${pageContext.request.contextPath}/Nonpaye.jsp">Non Payé</a></li>
		<li> <a href="${pageContext.request.contextPath}/Historique.jsp">Historique</a></li>
		
		</ul>
		   
	</div>
</body>
</html>