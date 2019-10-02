package com.servlet;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.tomcat.util.codec.binary.Base64;

import com.dao.DBManager;
import com.google.gson.Gson;
import com.model.Auction;
import com.model.Bid;
import com.model.DebitCard;
import com.model.ItemList;

import utils.EncryptionUtil;

/**
 * Servlet implementation class Validation
 */
@WebServlet("/Validation")
public class Validation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 if(request.getParameter("accountname")!=null){
			 
			 String username=request.getParameter("accountname"); 
			 if(DBManager.userCheck(username)){

			        response.setContentType("text/html;charset=UTF-8");
			        response.getWriter().write("success");
				 
			 }
			 else{
				 
				 response.setContentType("text/html;charset=UTF-8");
				    response.getWriter().write("unsuccess");
			 }
		 }

		 if(request.getParameter("emailvalue")!=null){
			 
			 String emailval=request.getParameter("emailvalue"); 
			 if(DBManager.emailCheck(emailval)){

			        response.setContentType("text/html;charset=UTF-8");
			        response.getWriter().write("success");
				 
			 }
			 else{
				 
				 response.setContentType("text/html;charset=UTF-8");
				    response.getWriter().write("unsuccess");
			 }
		 }
		 if(request.getParameter("phonevalue")!=null){
			 
			 String phoneval=request.getParameter("phonevalue"); 
			 if(DBManager.phoneCheck(phoneval)){
			  response.setContentType("text/html;charset=UTF-8");
			  response.getWriter().write("success");
				 
			 }
			 else{
				 
				 response.setContentType("text/html;charset=UTF-8");
				    response.getWriter().write("unsuccess");
			 }
		 }
		 if(request.getParameter("getusercard")!=null){
		String name=request.getParameter("getusercard");	 
		int id=DBManager.getUserId(name);
		ArrayList<DebitCard> list=DBManager.getUserCard(id);
		Gson gson1=new Gson();
		response.setContentType("application/json");
		response.getWriter().write((gson1.toJson(list)));

		 
		 }
		 
		 if(request.getParameter("removecarddata")!=null){
		String name=request.getParameter("removecarddata");	 
		DBManager.removeUserCard(name);
		response.setContentType("application/json");
	    response.getWriter().write("success");

		 
		 }
		 if(request.getParameter("actions")!=null){
		String id=request.getParameter("ids");
		String userid=request.getParameter("userids");
		String cardtype=request.getParameter("cardtypes");	 
		String cardno=request.getParameter("cardnos");	 
		String cvv=request.getParameter("cvvs");	 
		String expiredate=request.getParameter("expiredates");	 
		EncryptionUtil c = null;
		try {
			c = new EncryptionUtil();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String encreptCardType= c.encrypt(cardtype);
		String encreptCardNo= c.encrypt(cardno);
		String encreptCvv= c.encrypt(cvv);
		String encreptExpiredate= c.encrypt(expiredate);
		DBManager.addNewUserCard(id,userid,encreptCardType,encreptCardNo,encreptCvv,encreptExpiredate);
		response.setContentType("application/json");
	    response.getWriter().write("success");
	    request.getRequestDispatcher("payment.jsp").forward(request, response);
		 }
		 if(request.getParameter("getcarddata")!=null){
		DebitCard d=new DebitCard();
		ItemList l=new ItemList();	
		l.setCard(d.cardPretty());
		l.setCvv(d.getCVV());
		l.setExpiry(d.getExpiry());
		l.setCardtype(d.getCardType());
		
		 String a=d.cardPretty();
		int cvv=d.getCVV();
		String expiryDate=d.getExpiry();
		ArrayList<ItemList> list=new ArrayList<ItemList>();
		list.add(l);
		Gson gson1=new Gson();
		response.setContentType("application/json");
		response.getWriter().write((gson1.toJson(list)));

		 
		 }

		 if(request.getParameter("queryvalue")!=null){
			 
			 	String id=request.getParameter("queryvalue"); 
			 	ArrayList<Auction> lists=DBManager.getQueryResult(id);
				ArrayList<Auction> alist=new ArrayList<Auction>();
				Auction a=null;
				for(Auction l:lists){
				a=new Auction();
				a.setId(l.getId());
				int userid=DBManager.getwonStatus(l.getId());
				String user=DBManager.getUsername(userid);
				a.setWonuser(user);
				a.setAuctionType(l.getAuctionType());
				a.setCategory(l.getCategory());
				a.setPrice(l.getPrice());
				a.setName(l.getName());
				a.setStartDate(l.getStartDate());
				a.setImage(l.getImage());
				a.setStarttime(l.getStarttime());
				a.setAuctiontime(l.getAuctiontime());
				a.setDescription(l.getDescription());
				a.setMessage(l.getMessage());
				alist.add(a);	
				}

				Gson gson1=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson1.toJson(alist)));
			 
				 }
		 
		 if(request.getParameter("bidvalue")!=null){
			 
			 	String id=request.getParameter("bidvalue"); 
			 	ArrayList<Bid> list = null;
				try {
					list = DBManager.getBidResult(id);
				} catch (InvalidKeyException | IllegalBlockSizeException | BadPaddingException
						| NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeySpecException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 	Gson gson1=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson1.toJson(list)));
			 
				 }
		 if(request.getParameter("bidlist")!=null){
			 
			 	String user=request.getParameter("bidlist"); 
			 	ArrayList<Bid> list = null;
				try {
					list = DBManager.getBidlist(user);
				} catch (InvalidKeyException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalBlockSizeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (BadPaddingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchPaddingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvalidKeySpecException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 	Gson gson1=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson1.toJson(list)));
			 
				 }

		 if(request.getParameter("biduser")!=null){
			 
			 	String id=request.getParameter("bidids"); 
			 	String user=request.getParameter("biduser"); 
			 	ArrayList<Auction> list=DBManager.getCurrentBid(id);
				if(list.size()==0){
				 	ArrayList<Auction> lists=DBManager.getStartBid(id);
					Gson gson1=new Gson();
					response.setContentType("application/json");
					response.getWriter().write((gson1.toJson(lists)));
				}
				else{
				Gson gson1=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson1.toJson(list)));
				}			 
				 }
		 if(request.getParameter("getplacedbids")!=null){
			 
			 	String id=request.getParameter("bidids"); 
			 	System.out.println(id);
			 	String user=request.getParameter("bidusers");
			 	int userid=DBManager.getUserId(user);
			 	int counter=DBManager.getPlacedBid(id);
			 	if(DBManager.getBlindAuctionstatus(userid,id)){
					 response.setContentType("text/html;charset=UTF-8");
					 response.getWriter().write("cant bid");
			 	}
			 	else{
				 response.setContentType("text/html;charset=UTF-8");
				    response.getWriter().write(""+counter+"");
			 	} }
			
			if(request.getParameter("Searchlist")!=null){
			String Pname=request.getParameter("pName");
			String Pcategory=request.getParameter("pCategory");
			String PAuctiontype=request.getParameter("pAuctiontype");
			String PReserve=request.getParameter("pReserve");
			String PClosingdate=request.getParameter("pClosingddate");
			String sql=null;
			sql="SELECT * from auction where product_name ='"+Pname+"' OR product_category like '"+Pcategory+"' OR auction_type like '"+PAuctiontype+"' OR reserve_price like '"+PReserve+"' OR start_date  like '"+PClosingdate+"'";
			
	/*		if(Pcategory!=null){
				sql="SELECT * from auction where product_category='"+Pcategory+"'";
				}
			if(PReserve!=null){
				sql="SELECT * from auction where reserve_price='"+PReserve+"'";
				}
		
			if(PAuctiontype!=null){
				sql="SELECT * from auction where auction_type='"+PAuctiontype+"'";
				}
			if(PClosingdate!=null){
				sql="SELECT * from auction where end_date='"+PClosingdate+"'";
				}
		*/
			ArrayList<Auction>ac= DBManager.showSearchResult(sql);
			Gson gson=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson.toJson(ac)));
			}
	
			if(request.getParameter("mylist")!=null){
				String uname=request.getParameter("mylist");
				System.out.println(uname); 
				String sql="SELECT * from auction where user_name='"+uname+"'";
				ArrayList<Auction>ac= DBManager.showSearchResult(sql);
				Gson gson=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson.toJson(ac)));
				}
	
			if(request.getParameter("wonlist")!=null){
				String uname=request.getParameter("wonlist");
				int userid=DBManager.getUserId(uname);
				int id=DBManager.getWonid(userid);
				String sql="SELECT * from auction where id='"+id+"'";
				ArrayList<Auction>ac= DBManager.showSearchResult(sql);
				Gson gson=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson.toJson(ac)));
				}
	
	}
	 
}
