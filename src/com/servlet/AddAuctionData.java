package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;

import com.dao.DBManager;
import com.model.Auction;

/**
 * Servlet implementation class Addauction
 */
@WebServlet("/AddAuctionData")
@MultipartConfig
public class AddAuctionData extends HttpServlet {
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
		String productName=request.getParameter("productname");
		String productCategory=request.getParameter("productcategory");
		String description=request.getParameter("description");
		String price=request.getParameter("price");
		String auctionType=request.getParameter("auctiontype");
		String reservePrice=request.getParameter("reserveprice");
		String startDate=request.getParameter("startdate");
		String startTime=request.getParameter("starttime");
		String auctiontime=request.getParameter("auctiontime");
		String minimumbid=request.getParameter("minimumbid");
		String bidFrame=request.getParameter("bidframe");
		String username=request.getParameter("username");
		
		byte[] upload=null;
		String uploads=null;
		Blob blob=null;
		
		InputStream inputStream = null; // input stream of the upload file
		// obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
     // prints out some information for debugging
        System.out.println(filePart.getName());
        System.out.println(filePart.getSize());
        System.out.println(filePart.getContentType());
        Blob b=null;
         Auction a=new Auction();
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            upload=IOUtils.toByteArray(inputStream);
           uploads= Base64.encodeBase64String(upload);
           try {
		blob = new SerialBlob(upload);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        }

	
		if(auctionType.equals("English Auction")){
			
			DBManager.addAuction(productName,productCategory,description,price,auctionType,reservePrice,startDate,startTime,auctiontime,uploads,minimumbid,username);	
		}
		if(auctionType.equals("First price sealed bid auction")){
			
			String str=startTime;
	        String[] temp = str.split("[:]"); 
	        int starthour=00;
	        int startminute=00;
	        int val=startminute+Integer.parseInt(bidFrame);
	        if(val>=60){
	        starthour=starthour+1;	
	        val=val-60;
	        }
	        String newauctiontime=starthour+":"+val;
			DBManager.addBlindAuction(productName,productCategory,description,auctionType,reservePrice,startDate,startTime,bidFrame,uploads,username,newauctiontime);	
				
		}
		
		response.sendRedirect("welcome.jsp");
    	





	}

}
