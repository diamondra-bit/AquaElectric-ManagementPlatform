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
Date date_releve1 = null;
Date date_presentation = null;
Date date_limite_paie = null;

try {
    date_releve1 = dateFormat.parse(date_releve1Str);
    date_presentation = dateFormat.parse(date_presentationStr);
    date_limite_paie = dateFormat.parse(date_limite_paieStr);
} catch (Exception e) {
    out.println("Invalid date format. Please use yyyy-MM-dd.");
    return;
}

Elec_Bean obj_compteur_bean = new Elec_Bean();
obj_compteur_bean.setCodeelec(codeelec);
obj_compteur_bean.setCodecompteur(codecompteur);
obj_compteur_bean.setValeur1(valeur1);
obj_compteur_bean.setDate_releve1(date_releve1);
obj_compteur_bean.setDate_presentation(date_presentation);
obj_compteur_bean.setDate_limite_paie(date_limite_paie);

Edit_Elec obj_edit_compteur = new Edit_Elec();
obj_edit_compteur.edit_user(obj_compteur_bean);
%>


<script type="text/javascript">
window.location.href="http://localhost:8081/k/elec.jsp"
</script>


</body>
</html>
