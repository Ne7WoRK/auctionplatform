package com.model;

import java.sql.Blob;

public class Bid {

	private int id;
	private int auctionid;
	private int userid;
	private int price;
	String startdate;
	String starttime;
	String auctiontime;
	String msg;
	String username;
	String date;
	String time;
	String sigval;
	String pname;
	int bidno;
	String publickey;
	String auctiontype;

	public String getAuctiontype() {
		return auctiontype;
	}
	public void setAuctiontype(String auctiontype) {
		this.auctiontype = auctiontype;
	}
	public String getPublickey() {
		return publickey;
	}
	public void setPublickey(String publickey) {
		this.publickey = publickey;
	}
	public int getBidno() {
		return bidno;
	}
	public void setBidno(int bidno) {
		this.bidno = bidno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getSigval() {
		return sigval;
	}
	public void setSigval(String i) {
		this.sigval = i;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getAuctiontime() {
		return auctiontime;
	}
	public void setAuctiontime(String auctiontime) {
		this.auctiontime = auctiontime;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAuctionid() {
		return auctionid;
	}
	public void setAuctionid(int auctionid) {
		this.auctionid = auctionid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
}
