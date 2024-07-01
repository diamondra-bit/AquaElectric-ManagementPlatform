package common;

import java.util.Date;

public class Payer_Bean {

	private int idpaye;
	private String codecli;
	private int montant;
	private Date datepaie;
	public int getIdpaye() {
		return idpaye;
	}
	public void setIdpaye(int idpaye) {
		this.idpaye = idpaye;
	}
	public String getCodecli() {
		return codecli;
	}
	public void setCodecli(String codecli) {
		this.codecli = codecli;
	}
	public int getMontant() {
		return montant;
	}
	public void setMontant(int montant) {
		this.montant = montant;
	}
	public Date getDatepaie() {
		return datepaie;
	}
	public void setDatepaie(Date datepaie) {
		this.datepaie = datepaie;
	}
	
	
	
}
