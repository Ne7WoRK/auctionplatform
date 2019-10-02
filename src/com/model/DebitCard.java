package com.model;

import java.util.Random;

public class DebitCard {

	private final String[] VISA_PREFIX_LIST = new String[] { "4539", "4556", "4916", "4532", "4929", "40240071", "4485",
			"4716", "4" };

	private final String[] MASTERCARD_PREFIX_LIST = new String[] { "51", "52", "53", "54", "55", "2221", "2222", "2223",
			"2224", "2225", "2226", "2227", "2228", "2229", "223", "224", "225", "226", "227", "228", "229", "23", "24",
			"25", "26", "270", "271", "2720" };

	private final int CARD_LENGHT = 16;
	private static int PREFIX = 0;
	private String CARD_NUMBER;
	private int CVV;
	private String expiry;
	private String cardType;
	private String newcardNo;
	private String newcvvNo;
	private String status;
	private int id;
	private int userid;
	private String limit;
	private int balance;
	
	

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getNewcardNo() {
		return newcardNo;
	}

	public void setNewcardNo(String newcardNo) {
		this.newcardNo = newcardNo;
	}

	public String getNewcvvNo() {
		return newcvvNo;
	}

	public void setNewcvvNo(String newcvvNo) {
		this.newcvvNo = newcvvNo;
	}

	public String[] getMASTERCARD_PREFIX_LIST() {
		return MASTERCARD_PREFIX_LIST;
	}

	public String getExpiry() {
		return expiry;
	}

	public void setExpiry(String expiry) {
		this.expiry = expiry;
	}

	public int getCVV() {
		return CVV;
	}

	public void setCVV(int CVV) {
		this.CVV = CVV;
	}

	public String getCARD_NUMBER() {
		return CARD_NUMBER;
	}

	public void setCARD_NUMBER(String cARD_NUMBER) {
		CARD_NUMBER = cARD_NUMBER;
	}

	public static int getPREFIX() {
		return PREFIX;
	}

	public void setPREFIX(int pREFIX) {
		PREFIX = pREFIX;
	}

	public int getCARD_LENGHT() {
		return CARD_LENGHT;
	}

	public String[] getVISA_PREFIX_LIST() {
		return VISA_PREFIX_LIST;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	Random random = new Random();

	// Randomly selects a prefix from the VISA_PREFIX_LIST or MASTERCARD_PREFIX_LIST and converts it to integer
	// Also it defines the type of card that is going to be generated.
	public void randomCardPrefix() {

		int visaPrefix = random.nextInt(getVISA_PREFIX_LIST().length);
		int masterPrefix = random.nextInt(getMASTERCARD_PREFIX_LIST().length);
		int temp = (Math.random() <= 0.5) ? 1 : 2;

		if (temp == 1) {
			setPREFIX(Integer.parseInt(getVISA_PREFIX_LIST()[visaPrefix]));
			setCardType("Visa");
		} else {
			setPREFIX(Integer.parseInt(getMASTERCARD_PREFIX_LIST()[masterPrefix]));
			setCardType("MasterCard");
		}
	}

	// Generates the remaining digits with certain given length.
	public String generateRemainingNumbers() {
		
		int remainingLength = (getCARD_LENGHT() - String.valueOf(getPREFIX()).length());
		
		char[] digits = new char[remainingLength];
		digits[0] = (char) (random.nextInt(9) + '1');
		
		for (int i = 1; i < remainingLength; i++) {
			digits[i] = (char) (random.nextInt(10) + '0');
		}
		
		long result = Long.parseLong(new String(digits));

		return String.valueOf(result);
	}

	// Creates a card using the chosen prefix and the randomly generated remaining numbers.
	public void cardBuilder() {

		String prefix = String.valueOf(getPREFIX());
		String remainigNumb = String.valueOf(generateRemainingNumbers());
		
			String result = prefix + remainigNumb;
		setCARD_NUMBER(result);
	}

	// Printing the card in format XXXX-XXXX-XXXX-XXXX
	public String cardPretty() {

		char[] array = getCARD_NUMBER().toCharArray();
		int counter = 0;
		StringBuilder builder = new StringBuilder();

		for (int i = 0; i < array.length; i++) {
			counter++;
			builder.append(array[i]);

			if (counter % 4 == 0 && i != 15) {
				counter = 0;
				builder.append("-");
			}
		}
		return String.valueOf(builder);
	}

	//Generate a CVV
	public void CVV() {

		int cvv = random.nextInt(900) + 100;
		setCVV(cvv);
	}

	//Overriding the toString method.
	public String toString() {
		return "Card Type: " + getCardType() + "\nCard number: " + cardPretty() + "\nCVV: " + getCVV() + "\nExpiration: " + getExpiry();
	}
	
	//Generates expiry date string in format XX/XX for a card. 
	public void expiryDate() {
		int month = random.nextInt(12 - 1 + 1) + 1;
		int year = random.nextInt(25 - 20 + 1) + 20;

		String expiry = String.valueOf(month) + "/" + String.valueOf(year);
		setExpiry(expiry);
	}

	//Constructor of debit card class.
	public DebitCard() {

		randomCardPrefix();
		generateRemainingNumbers();
		cardBuilder();
		CVV();
		expiryDate();
	}
	
	// Testing 
	public static void main(String[] args) {
		DebitCard a = new DebitCard();
		System.out.println(a);

	}}