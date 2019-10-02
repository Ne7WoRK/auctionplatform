package com.model;

public class ItemList {
 String card;
 int cvv;
 String expiry;
 String cardtype;

 public String getCardtype() {
	return cardtype;
}
public void setCardtype(String cardtype) {
	this.cardtype = cardtype;
}
public String getCard() {
	return card;
}
public void setCard(String card) {
	this.card = card;
}
public int getCvv() {
	return cvv;
}
public void setCvv(int cvv) {
	this.cvv = cvv;
}
public String getExpiry() {
	return expiry;
}
public void setExpiry(String expiry) {
	this.expiry = expiry;
}
}
