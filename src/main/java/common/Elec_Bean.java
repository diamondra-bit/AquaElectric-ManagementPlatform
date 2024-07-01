package common;

import java.util.Date;

public class Elec_Bean {

	private String codeelec;
	private String codecompteur;
	private int valeur1;
	private Date date_releve1;
	private Date date_presentation;
	private Date date_limite_paie;
	public String getCodeelec() {
		return codeelec;
	}
	public void setCodeelec(String codeelec) {
		this.codeelec = codeelec;
	}
	public String getCodecompteur() {
		return codecompteur;
	}
	public void setCodecompteur(String codecompteur) {
		this.codecompteur = codecompteur;
	}
	public int getValeur1() {
		return valeur1;
	}
	public void setValeur1(int valeur1) {
		this.valeur1 = valeur1;
	}
	public Date getDate_presentation() {
		return date_presentation;
	}
	public void setDate_presentation(Date date_presentation) {
		this.date_presentation = date_presentation;
	}
	public Date getDate_limite_paie() {
		return date_limite_paie;
	}
	public void setDate_limite_paie(Date date_limite_paie) {
		this.date_limite_paie = date_limite_paie;
	}
	public Date getDate_releve1() {
		return date_releve1;
	}
	public void setDate_releve1(Date date_releve1) {
		this.date_releve1 = date_releve1;
	}

	
	
	
}
