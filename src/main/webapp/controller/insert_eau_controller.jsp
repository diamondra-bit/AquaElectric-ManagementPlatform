<%@page import="CRUD.Insert_Eau"%>
<%@page import="CRUD.Insert_Elec"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.sql.*"%>
<%@page import="common.DB_Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String codeeau = request.getParameter("codeeau");
String codecompteur = request.getParameter("codecompteur");
String valeur2Str = request.getParameter("valeur2");
String date_releve2Str = request.getParameter("date_releve2");
String date_presentation2Str = request.getParameter("date_presentation2");
String date_limite_paie2Str = request.getParameter("date_limite_paie2");

int valeur2 = 0;
try {
    valeur2 = Integer.parseInt(valeur2Str);
} catch (NumberFormatException e) {
    out.println("Invalid integer value for 'valeur1'.");
    return;
}

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date date_releve2 = null;
java.util.Date date_presentation2 = null;
java.util.Date date_limite_paie2 = null;

try {
    date_releve2= dateFormat.parse(date_releve2Str);
    date_presentation2 = dateFormat.parse(date_presentation2Str);
    date_limite_paie2 = dateFormat.parse(date_limite_paie2Str);
} catch (ParseException e) {
    out.println("Invalid date format. Please use yyyy-MM-dd.");
    return;
}

Insert_Eau obj = new Insert_Eau();
    obj.insert_values(codeeau, codecompteur, valeur2, new java.sql.Date(date_releve2.getTime()), new java.sql.Date(date_presentation2.getTime()), new java.sql.Date(date_limite_paie2.getTime()));

%>

<script type="text/javascript">
    window.location.href = "http://localhost:8081/k/eau.jsp";
</script>

</body>
</html>
