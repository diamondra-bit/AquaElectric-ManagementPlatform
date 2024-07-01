<%@ page import="CRUD.Insert_Payer" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Payer</title>
</head>
<body>

<%
String codecli = request.getParameter("codecli");
String datepaieStr = request.getParameter("datepaie");
String montantStr = request.getParameter("montant");

int montant = 0;
try {
    montant = Integer.parseInt(montantStr);
} catch (NumberFormatException e) {
    out.println("Invalid integer value for 'montant'.");
    return;
}

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date datepaie = null;

try {
    datepaie = dateFormat.parse(datepaieStr);
} catch (ParseException e) {
    out.println("Invalid date format. Please use yyyy-MM-dd.");
    return;
}

Insert_Payer obj = new Insert_Payer();
obj.insert_values(codecli, new java.sql.Date(datepaie.getTime()), montant);

%>

<script type="text/javascript">
    window.location.href = "http://localhost:8081/k/payer.jsp";
</script>

</body>
</html>
