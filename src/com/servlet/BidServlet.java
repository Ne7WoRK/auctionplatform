package com.servlet;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBManager;

/**
 * Servlet implementation class BidServlet
 */
@WebServlet("/BidServlet")
public class BidServlet extends HttpServlet {
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
		String price=request.getParameter("price");
		String minbid=request.getParameter("minbid");
		String offer=request.getParameter("bid");
		String id=request.getParameter("id");
		int data=Integer.parseInt(id);
		String getdate=DBManager.getAuctiondate(data);
		String starttime=DBManager.getAuctionStarttime(data);
		String auctiontime=DBManager.getAuctionstime(data);
		String[] splitdate = getdate.split("[-]"); 
        int getyear=Integer.parseInt(splitdate[0]);
        int getmonth=Integer.parseInt(splitdate[1]);
        int getday=Integer.parseInt(splitdate[2]);		
		String str =starttime; 
        String[] temp = str.split("[:]"); 
        int starthour=Integer.parseInt(temp[0]);
        int startminute=Integer.parseInt(temp[1]);
        String end =auctiontime;
        String[] endtemp = end.split("[:]"); 
        int endhour=Integer.parseInt(endtemp[0]);
        int endminute=Integer.parseInt(endtemp[1]);
    	int currenthour=LocalDateTime.now().getHour();
        int currentminute=LocalDateTime.now().getMinute();
        int currentday=LocalDateTime.now().getDayOfMonth();
        int month=LocalDateTime.now().getMonthValue();
        int year=LocalDateTime.now().getYear();
        int hour=currenthour-starthour;
        int minute=currentminute-startminute;
        int newhour=hour+starthour;
        int newminute=minute+startminute;
       System.out.println("new"+newhour+"old"+hour);
       System.out.println(newminute);
        if(newhour>=24){
        	newhour=newhour-24;
        	getday=getday+1;
        	if(getday>31){
        		getday=01;
        		getmonth=getmonth+1;
        	}
        	if(newminute>=60){
        		newminute=newminute-60;
        	newhour=newhour+1;	
        	}
        }
        String newtime=newhour+":"+newminute;
        String newdate=getyear+"-"+getmonth+"-"+getday;
        DBManager.updateEnglishAuction(newdate, newtime, data);
		String username=request.getParameter("username");
	     String date=year+"-"+month+"-"+currentday;
        String time=currenthour+":"+currentminute;
		int userid=DBManager.getUserId(username);
		DBManager.addBid(price,minbid, offer, userid,id,date,time);
		DBManager.updatePrice(offer, id);
    	response.sendRedirect("welcome.jsp");
    	
	
	
	}

}
