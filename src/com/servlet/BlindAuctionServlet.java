package com.servlet;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import com.dao.DBManager;

import utils.EncryptionUtil;

/**
 * Servlet implementation class BlindAuctionServlet
 */
@WebServlet("/BlindAuctionServlet")
public class BlindAuctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String publickey =request.getParameter("publickey");
		String sealedbid =request.getParameter("SealedBids");
		byte[] pubKey = DatatypeConverter.parseHexBinary(publickey);
		System.out.println(publickey);
		//String of digital signature converted in hex.
		String digitalSignature = request.getParameter("signature");
		String price=request.getParameter("prices");
		String id=request.getParameter("pid");
		String username=request.getParameter("users");
		String bidplaced=request.getParameter("bidplaced");
		int userid=DBManager.getUserId(username);
        int currenthour=LocalDateTime.now().getHour();
        int currentminute=LocalDateTime.now().getMinute();
        int currentday=LocalDateTime.now().getDayOfMonth();
        int month=LocalDateTime.now().getMonthValue();
        int year=LocalDateTime.now().getYear();
        String date=year+"-"+month+"-"+currentday;
        String time=currenthour+":"+currentminute;
		DBManager.addBlindAuction(id,date,time);
		int bidid=DBManager.getMaxBid();
		/*EncryptionUtil c = null;
		try {
			c = new EncryptionUtil();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    String encryptpid=c.encrypt(id);
	    String encryptuser=c.encrypt(username);
	    String encryptprice=c.encrypt(price);*/
	    DBManager.addSealedBid(publickey, sealedbid,id,bidid);
	    response.setContentType("text/html;charset=UTF-8");
	    response.getWriter().write("Bid completed");
	 	
	          
	    
	
	}
	
	}


