package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.DBManager;

import utils.EncryptionUtil;

/**
 * Servlet implementation class NewUser
 */
@WebServlet("/NewUser")
public class NewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewUser() {
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
		String name=request.getParameter("uservalue");
		EncryptionUtil c = null;
		try {
			c = new EncryptionUtil();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(name!=null){		
		String userName=request.getParameter("uservalue");
		String password=request.getParameter("passvalue");
		String email=request.getParameter("emailvalue");
		String phone=request.getParameter("phonevalue");
        String encreptPass= c.encrypt(password);
        DBManager.addUser(userName,encreptPass, email, phone);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write("DebitCard.jsp?name="+userName+"");

			}
			}
			
		
	}


