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
String codeelec = request.getParameter("codeelec");
String codecompteur = request.getParameter("codecompteur");
String valeur1Str = request.getParameter("valeur1");
String date_releve1Str = request.getParameter("date_releve1");
String date_presentationStr = request.getParameter("date_presentation");
String date_limite_paieStr = request.getParameter("date_limite_paie");

int valeur1 = 0;
try {
    valeur1 = Integer.parseInt(valeur1Str);
} catch (NumberFormatException e) {
    out.println("Invalid integer value for 'valeur1'.");
    return;
}

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date date_releve1 = null;
java.util.Date date_presentation = null;
java.util.Date date_limite_paie = null;

try {
    date_releve1 = dateFormat.parse(date_releve1Str);
    date_presentation = dateFormat.parse(date_presentationStr);
    date_limite_paie = dateFormat.parse(date_limite_paieStr);
} catch (ParseException e) {
    out.println("Invalid date format. Please use yyyy-MM-dd.");
    return;
}

Insert_Elec obj = new Insert_Elec();
    obj.insert_values(codeelec, codecompteur, valeur1, new java.sql.Date(date_releve1.getTime()), new java.sql.Date(date_presentation.getTime()), new java.sql.Date(date_limite_paie.getTime()));

%>

<script type="text/javascript">
    window.location.href = "http://localhost:8081/k/elec.jsp";
</script>

</body>
</html>
