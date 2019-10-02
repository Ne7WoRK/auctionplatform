package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBManager;
import com.google.gson.Gson;
import com.model.Auction;

/**
 * Servlet implementation class WonServlet
 */
@WebServlet("/WonServlet")
public class WonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("wonid")!=null){
			int id=Integer.parseInt(request.getParameter("wonid"));
			ArrayList<Auction> list= DBManager.WonStatus(id);
					for(Auction a:list){
						int userid=a.getUserid();
						int price=a.getPrice();
						//DBManager.updateWonBid(userid,price);	
									
					}
			}
			
	}

}
