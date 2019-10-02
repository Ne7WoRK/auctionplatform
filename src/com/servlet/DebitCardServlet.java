package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBManager;

import utils.EncryptionUtil;

/**
 * Servlet implementation class DebitCardServlet
 */
@WebServlet("/DebitCardServlet")
public class DebitCardServlet extends HttpServlet {
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
		String cardtype=request.getParameter("cardtype");
		String cardno=request.getParameter("cardno");
		String cvv=request.getParameter("cvv");
		String expiredate=request.getParameter("expiredate");
		String username=request.getParameter("username");
		String limit=request.getParameter("limit");
		int id=DBManager.getUserId(username);
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
		DBManager.addDebitCard(id,encreptCardType, encreptCardNo, encreptCvv, encreptExpiredate,limit);
    	response.sendRedirect("login.jsp");
    	
	
	}

}
