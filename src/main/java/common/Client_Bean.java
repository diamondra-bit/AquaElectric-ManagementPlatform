package common;

import java.util.Date;

public class Client_Bean {

	private String codeclient;
	private String nom;
	private String sexe;
	private String quartier;
	private String niveau;
	private String mail;
	private String codecompteur_eau;
	private String codecompteur_electricite;
	 private double montant_total;
		private Date mois;
	
	public String getCodeclient() {
		return codeclient;
	}
	public void setCodeclient(String codeclient) {
		this.codeclient = codeclient;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getSexe() {
		return sexe;
	}
	public void setSexe(String sexe) {
		this.sexe = sexe;
	}
	public String getQuartier() {
		return quartier;
	}
	public void setQuartier(String quartier) {
		this.quartier = quartier;
	}
	public String getNiveau() {
		return niveau;
	}
	public void setNiveau(String niveau) {
		this.niveau = niveau;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getCodecompteur_eau() {
		return codecompteur_eau;
	}
	public void setCodecompteur_eau(String codecompteur_eau) {
		this.codecompteur_eau = codecompteur_eau;
	}
	public String getCodecompteur_electricite() {
		return codecompteur_electricite;
	}
	public void setCodecompteur_electricite(String codecompteur_electricite) {
		this.codecompteur_electricite = codecompteur_electricite;
	}
	
	 public double getMontant_total() {
	        return montant_total;
	    }

	    public void setMontant_total(double montant_total) {
	        this.montant_total = montant_total;
	    }
	    
	    public Date getMois() {
			return mois;
		}
		public void setMois(Date mois) {
			this.mois= mois;
		}
	
	
	
	
}
