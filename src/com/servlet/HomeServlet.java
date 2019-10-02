package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import com.dao.DBManager;
import com.google.gson.Gson;
import com.model.Auction;
import com.model.ItemList;

/**
 * Servlet implementation class testing
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

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
					Auction a=null;
					ArrayList<Auction> lists=DBManager.getImage();
					ArrayList<Auction> alist=new ArrayList<Auction>();
					HttpSession session=request.getSession();
					for(Auction l:lists){
						a=new Auction();
					a.setId(l.getId());
					int userid=DBManager.getwonStatus(l.getId());
					String user=DBManager.getUsername(userid);
					a.setWonuser(user);
					a.setDescription(l.getDescription());
					a.setPrice(l.getPrice());
					a.setClosingdate(l.getClosingdate());
					a.setImage(l.getImage());
					a.setName(l.getName());
					a.setTime(l.getTime());
					a.setAuctiontime(l.getAuctiontime());
					a.setAuctionType(l.getAuctionType());
					a.setPrices(l.getPrices());
					alist.add(a);	
					}
					Gson gson1=new Gson();
					response.setContentType("application/json");
					response.getWriter().write((gson1.toJson(alist)));

}}
