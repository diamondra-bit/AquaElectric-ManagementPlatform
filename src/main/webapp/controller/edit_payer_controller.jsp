<%@ page import="CRUD.Edit_Payer"%>
<%@ page import="common.Payer_Bean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Payment</title>
</head>
<body>

<%
String idpayeStr = request.getParameter("idpaye");
String codecli = request.getParameter("codecli");
String datepaieStr = request.getParameter("datepaie");
String montantStr = request.getParameter("montant");

int idpaye = 0;
int montant = 0;
try {
    idpaye = Integer.parseInt(idpayeStr);
    montant = Integer.parseInt(montantStr);
} catch (NumberFormatException e) {
    out.println("Invalid integer value.");
    return;
}

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date datepaie = null;

try {
    datepaie = dateFormat.parse(datepaieStr);
} catch (Exception e) {
    out.println("Invalid date format. Please use yyyy-MM-dd.");
    return;
}

Payer_Bean obj_compteur_bean = new Payer_Bean();
obj_compteur_bean.setIdpaye(idpaye);
obj_compteur_bean.setCodecli(codecli);
obj_compteur_bean.setDatepaie(datepaie);
obj_compteur_bean.setMontant(montant);

Edit_Payer obj_edit_compteur = new Edit_Payer();
obj_edit_compteur.edit_user(obj_compteur_bean);
%>

<script type="text/javascript">
window.location.href="http://localhost:8081/k/payer.jsp";
</script>

</body>
</html>
