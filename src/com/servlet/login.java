package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.dao.DBManager;

import utils.EncryptionUtil;
import utils.Termination;
import utils.win;

import java.util.*;;
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String user=request.getParameter("user");
	String password=request.getParameter("pass");
	HttpSession session=request.getSession();
	EncryptionUtil c = null;
	try {
		c = new EncryptionUtil();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    String encryptPassword=c.encrypt(password);
    System.out.println(encryptPassword);
    
    if(DBManager.getlogin(user,encryptPassword)){
    	session.setAttribute("uname", user);
    	new win();
    	new Termination();
		response.sendRedirect("welcome.jsp");
		}else{
			response.sendRedirect("login.jsp");
			} 
    
/*	if(DBManager.getlogin(user,password)== true){
		session.setAttribute("uname", user);
		response.sendRedirect("welcome.jsp");
		}
	else{
		response.sendRedirect("login.jsp");
	}
		
	*/	
	}
	
	}

