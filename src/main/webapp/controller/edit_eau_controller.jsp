<%@page import="CRUD.Edit_Eau"%>
<%@page import="common.Eau_Bean"%>
<%@page import="CRUD.Edit_Elec"%>
<%@page import="common.Elec_Bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

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
Date date_releve2 = null;
Date date_presentation2 = null;
Date date_limite_paie2 = null;

try {
    date_releve2 = dateFormat.parse(date_releve2Str);
    date_presentation2 = dateFormat.parse(date_presentation2Str);
    date_limite_paie2 = dateFormat.parse(date_limite_paie2Str);
} catch (Exception e) {
    out.println("Invalid date format. Please use yyyy-MM-dd.");
    return;
}

Eau_Bean obj_compteur_bean = new Eau_Bean();
obj_compteur_bean.setCodeeau(codeeau);
obj_compteur_bean.setCodecompteur(codecompteur);
obj_compteur_bean.setValeur2(valeur2);
obj_compteur_bean.setDate_releve2(date_releve2);
obj_compteur_bean.setDate_presentation2(date_presentation2);
obj_compteur_bean.setDate_limite_paie2(date_limite_paie2);

Edit_Eau obj_edit_compteur = new Edit_Eau();
obj_edit_compteur.edit_user(obj_compteur_bean);
%>


<script type="text/javascript">
window.location.href="http://localhost:8081/k/eau.jsp"
</script>


</body>
</html>
