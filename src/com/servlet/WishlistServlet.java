package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DBManager;
import com.google.gson.Gson;
import com.model.Auction;

/**
 * Servlet implementation class WishlistServlet
 */
@WebServlet("/WishlistServlet")
public class WishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

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
		if(request.getParameter("id")!=null){
		String id=request.getParameter("id");
		String uservalue=request.getParameter("userids");
		int userid=DBManager.getUserId(uservalue);
		if(DBManager.getWishstatus(userid, id)){
			Gson gson1=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson1.toJson("This item is already in your wishlist")));
			
		}
		else{
		DBManager.addwishlist(id,uservalue);	
		Gson gson1=new Gson();
		response.setContentType("application/json");
		response.getWriter().write((gson1.toJson("This item has added in your wishlist")));
		}
		}
		if(request.getParameter("wishlistshow")!=null){
			String user=request.getParameter("users");
			int userid=DBManager.getUserId(user);
			ArrayList<Integer> plist=DBManager.getAuctionId(userid);
			Auction a=null;
			ArrayList<Auction> lists=DBManager.geWishdata(plist);
			ArrayList<Auction> alist=new ArrayList<Auction>();
			HttpSession session=request.getSession();
			for(Auction l:lists){
				a=new Auction();
			a.setId(l.getId());
			a.setDescription(l.getDescription());
			a.setPrice(l.getPrice());
			a.setClosingdate(l.getClosingdate());
			a.setImage(l.getImage());
			a.setName(l.getName());
			a.setTime(l.getTime());
			a.setAuctiontime(l.getAuctiontime());
			alist.add(a);	
			}
			Gson gson1=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson1.toJson(alist)));
			}
		
		
	}

}
