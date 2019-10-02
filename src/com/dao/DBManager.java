package com.dao;

import com.model.Auction;
import com.model.Bid;
import com.model.DebitCard;
import com.mysql.jdbc.Connection;

import utils.EncryptionUtil;
import utils.RSA;
import utils.SaltEncryption;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

public class DBManager {
	 	
	
	public static boolean  getlogin(String id,String password){
   	  boolean	user=false;
   				 Connection con = (Connection) DBConnection.getConnection();
        			        try{    
   			        	Statement stm = (Statement) con.createStatement();
   					   String query="SELECT user_name,password FROM login  where user_name='"+id+"' AND password='"+password+"'";
   			            ResultSet rs=stm.executeQuery(query);
   			            while(rs.next()){
   			            rs.getString("user_name");
   			            rs.getString("password");
   			            user=true;
   			            }}
   			            
   			        
   			      catch(SQLException ex){
   			          ex.printStackTrace();
   			      }
   			           return  user;
   		  }
	   
 	public static void addUser(String userName, String password,String email,String phone){
		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				 String sql= "insert into login(user_name,password,email,phone)values('"+userName+"','"+password+"','"+email+"','"+phone+"')"  ;
				st.executeUpdate(sql);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
 	public static void addDebitCard(int id,String cardtype,String cardno,String cvv,String expiredate,String limit){
		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				String sql="INSERT  INTO `debitcard`(`card_type`,`card_no`,`cvv`,`expire_date`,`status`,user_id,card_limit,balance,default_val) VALUES ('"+cardtype+"','"+cardno+"','"+cvv+"','"+expiredate+"','1',"+id+","+limit+",1000,1)";
				st.executeUpdate(sql);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
 	public static void addNewDebitCard(int id,String cardtype,String cardno,String cvv,String expiredate,String limit,int balance){
		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				String sql="INSERT  INTO `debitcard`(`card_type`,`card_no`,`cvv`,`expire_date`,`status`,user_id,card_limit,balance) VALUES ('"+cardtype+"','"+cardno+"','"+cvv+"','"+expiredate+"','1',"+id+","+limit+","+balance+")";
				st.executeUpdate(sql);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
 	
    public static boolean userCheck(String username){
    	  boolean val=false;
    	  Connection con = (Connection) DBConnection.getConnection();
    	  String name=username.replace(" ", "");
  	        try{    
         	Statement stm = (Statement) con.createStatement();
  		   String query=" select user_name from login where user_name='"+name+"'";
             ResultSet rs=stm.executeQuery(query);
             	if(rs.next()){
             		val=true;
             		
             		
             	}
             	else{
             		
             		val=false;
             	}
  	        }
       catch(SQLException ex){
           ex.printStackTrace();
       } 
  		return val;
    	  
      }
    public static boolean emailCheck(String emailval){
  	  boolean val=false;
  	  Connection con = (Connection) DBConnection.getConnection();
  	  String email=emailval.replace(" ", "");
	        try{    
       	Statement stm = (Statement) con.createStatement();
		   String query=" select email from login where email='"+email+"'";
           ResultSet rs=stm.executeQuery(query);
           	if(rs.next()){
           		val=true;
           		
           		
           	}
           	else{
           		
           		val=false;
           	}
	        }
     catch(SQLException ex){
         ex.printStackTrace();
     } 
		return val;
  	  
    }

    public static boolean phoneCheck(String phoneval){
    	  boolean val=false;
    	  Connection con = (Connection) DBConnection.getConnection();
    	  String phone=phoneval.replace(" ", "");
  	        try{    
         	Statement stm = (Statement) con.createStatement();
  		   String query=" select phone from login where phone='"+phone+"'";
             ResultSet rs=stm.executeQuery(query);
             	if(rs.next()){
             		val=true;
             		
             		
             	}
             	else{
             		
             		val=false;
             	}
  	        }
       catch(SQLException ex){
           ex.printStackTrace();
       } 
  		return val;
    	  
    }
   public static void addAuction(String productName,String productCategory,String description,String price,String auctionType,String reservePrice,String startDate,String startTime,String endDate,String inputStream,String endtime,String username)
   {

		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 try {
			Statement st=(Statement) con.createStatement();
				 String sql= "insert into auction(product_name,product_category,description,price,auction_type,reserve_price,start_date,start_time,auction_time,image,minimum_bid,user_name)values("
				 		+ "'"+productName+"','"+productCategory+"','"+description+"',"+price+",'"+auctionType+"','"+reservePrice+"','"+startDate+"','"+startTime+"','"+endDate+"','"+inputStream+"','"+endtime+"','"+username+"')"  ;
				st.executeUpdate(sql);
								} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
   }
   
   public static void addBlindAuction(String productName,String productCategory,String description,String auctionType,String reservePrice,String startDate,String startTime,String bidframe,String inputStream,String username,String newauctiontime)
   {

		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 try {


				Statement st=(Statement) con.createStatement();
				String sql= "insert into auction(product_name,product_category,description,auction_type,reserve_price,start_date,start_time,bid_frame,image,user_name,auction_time)values("
				 		+ "'"+productName+"','"+productCategory+"','"+description+"','"+auctionType+"','"+reservePrice+"','"+startDate+"','"+startTime+"','"+bidframe+"','"+inputStream+"','"+username+"','"+newauctiontime+"')"  ;
				st.executeUpdate(sql);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
   }
   public static ArrayList<Auction> getImage(){
		 Connection con = (Connection) DBConnection.getConnection();
		 Auction a=null;
		 ArrayList<Auction> alist=new ArrayList<Auction>();
	        try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from auction";
        ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
        	a=new Auction();
       a.setImage(rs.getString("image"));
       a.setId(rs.getInt("id"));
       if(rs.getString("auction_type").equals("First price sealed bid auction")){
    	  String sid=String.valueOf(rs.getInt("id"));
    	  String bids=String.valueOf(DBManager.getPlacedBid(sid));
    	   a.setPrices(bids+"Times");
    	 
       }
       else{
    	   a.setPrices(String.valueOf(rs.getInt("price"))+"$");
    	        	   
       }
       a.setDescription(rs.getString("description"));
       a.setClosingdate(rs.getString("start_date"));
       a.setName(rs.getString("product_name"));
       a.setTime(rs.getString("start_time"));
       a.setAuctiontime(rs.getString("auction_time"));
       a.setAuctionType(rs.getString("auction_type"));
       alist.add(a);   
        }
	        }
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  alist;
}
   
   public static ArrayList<Auction> getImages(){
		 Connection con = (Connection) DBConnection.getConnection();
		 Auction a=null;
		 ArrayList<Auction> alist=new ArrayList<Auction>();
	        try{    
  	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from auction";
      ResultSet rs=stm.executeQuery(query);
      while(rs.next()){
      	a=new Auction();
     a.setImage(rs.getString("image"));
     a.setId(rs.getInt("id"));
     if(rs.getString("auction_type").equals("First price sealed bid auction")){
  	  String sid=String.valueOf(rs.getInt("id"));
  	  String bids=String.valueOf(DBManager.getPlacedBid(sid));
  	   a.setPrices(bids+"Times");
  	 
     }
     else{
  	   a.setPrices(String.valueOf(rs.getInt("price"))+"$");
  	        	   
     }
     a.setDescription(rs.getString("description"));
     a.setClosingdate(rs.getString("start_date"));
     a.setName(rs.getString("product_name"));
     a.setTime(rs.getString("start_time"));
     a.setAuctiontime(rs.getString("auction_time"));
     a.setAuctionType(rs.getString("auction_type"));
     alist.add(a);   
      }
	        }
catch(SQLException ex){
    ex.printStackTrace();
}
     return  alist;
}
   
   public static ArrayList<Auction> getblindproduct(){
		 Connection con = (Connection) DBConnection.getConnection();
		 Auction a=null;
		 ArrayList<Auction> alist=new ArrayList<Auction>();
	        try{    
  	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from auction where auction_type='First price sealed bid auction'";
      ResultSet rs=stm.executeQuery(query);
      while(rs.next()){
      	a=new Auction();
     a.setImage(rs.getString("image"));
     a.setId(rs.getInt("id"));
     a.setStartDate(rs.getString("start_date"));
     a.setStarttime(rs.getString("start_time"));
     a.setAuctiontime(rs.getString("auction_time"));
     alist.add(a);   
      }
	        }
catch(SQLException ex){
    ex.printStackTrace();
}
     return  alist;
}
   
   
   
   
   
   
   
   
   
   
   
   public static ArrayList<Auction> geWishdata(ArrayList<Integer> id){
		 Connection con = (Connection) DBConnection.getConnection();
		 Auction a=null;
		 ArrayList<Auction> alist=new ArrayList<Auction>();
	        try{    
    	Statement stm = (Statement) con.createStatement();
	   for(int getids:id){
		String query="SELECT * from auction where id="+getids+"";
        ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
        	a=new Auction();
            a.setImage(rs.getString("image"));
            a.setId(rs.getInt("id"));
            a.setPrice(rs.getInt("price"));
            a.setDescription(rs.getString("description"));
            a.setClosingdate(rs.getString("start_date"));
            a.setName(rs.getString("product_name"));
            a.setTime(rs.getString("start_time"));
            a.setAuctiontime(rs.getString("auction_time"));
        	alist.add(a);   
        } }
	        }
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  alist;
}
   
   public static ArrayList<Auction> getQueryResult(String id){
		 Connection con = (Connection) DBConnection.getConnection();
		 Auction a=null;
		 ArrayList<Auction> alist=new ArrayList<Auction>();
	        try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from auction where id="+id+"";
        ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
        	a=new Auction();
       a.setImage(rs.getString("image"));
       a.setDescription(rs.getString("description"));
       a.setId(rs.getInt("id"));
       a.setAuctionType(rs.getString("auction_type"));
       a.setName(rs.getString("product_name"));
       a.setPrice(rs.getInt("price"));
       a.setCategory(rs.getString("product_category"));
       a.setStartDate(rs.getString("start_date"));
       a.setStarttime(rs.getString("start_time"));
       a.setAuctiontime(rs.getString("auction_time"));
      if(rs.getString("message")==null || rs.getString("message").equals("null")){
    	    a.setMessage("Payment has been paid");
     }
      else{
       a.setMessage(rs.getString("message"));
      }
       alist.add(a);   
        }

	        }
        
    
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  alist;
	   
   }
   public static ArrayList<Bid> getBidResult(String id) throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeySpecException, IOException{
		 Connection con = (Connection) DBConnection.getConnection();
		 int pid=0;
		 SaltEncryption s=new SaltEncryption();
		 String encryptId=s.encrypt(id);
		 
		 Bid b=null;
		 ArrayList<Bid> alist=new ArrayList<Bid>();
	        try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from bids where p_id="+id+"";
        ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
        	b=new Bid();
       b.setId(rs.getInt("id"));
       pid=rs.getInt("id");
       String user=DBManager.getUsername(rs.getInt("user_id"));
       b.setUsername(user);
       b.setAuctionid(Integer.parseInt(rs.getString("p_id")));
       b.setPrice(Integer.parseInt(s.decrypt(rs.getString("bid_price"))));
       b.setStartdate(DBManager.getstartdate(id));
       b.setStarttime(DBManager.getstarttime(id));
       b.setAuctiontime(DBManager.getauctiontime(id));
       b.setTime(rs.getString("c_time"));
       b.setDate(rs.getString("c_date"));
       b.setSigval(DBManager.getSignatureValue(pid));
       b.setPublickey(DBManager.getPublicKey(pid));
       b.setAuctiontype(DBManager.getauctionType(id));
       alist.add(b);   
        }

	        }
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  alist;
	 }
   public static ArrayList<Bid> getBidlist(String getuser) throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeySpecException, IOException{
		 Connection con = (Connection) DBConnection.getConnection();
		 int pid=0;
		 Bid b=null;
		 String id=String.valueOf(DBManager.getUserId(getuser));
		SaltEncryption s=new SaltEncryption(); 
		 ArrayList<Bid> alist=new ArrayList<Bid>();
	        try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from bids where user_id="+id+" and bid_type='First price sealed bid auction' and status=1";
	 ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
        	b=new Bid();
       b.setId(rs.getInt("p_id"));
       pid=rs.getInt("id");
       int productId=rs.getInt("p_id");
       String user=DBManager.getUsername(rs.getInt("user_id"));
       b.setUsername(user);
       b.setAuctionid(rs.getInt("p_id"));
       b.setBidno(DBManager.getBidno(productId));
       b.setPrice(Integer.parseInt(s.decrypt(rs.getString("bid_price"))));
       b.setStartdate(DBManager.getstartdate(id));
       b.setStarttime(DBManager.getstarttime(id));
       b.setAuctiontime(DBManager.getauctiontime(id));
       b.setTime(rs.getString("c_time"));
       b.setDate(rs.getString("c_date"));
       b.setSigval(DBManager.getSignatureValue(pid));
       b.setPname(DBManager.getProductname(productId));
       alist.add(b);   
        }

	        }
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  alist;
	 }
   public static String getstartdate(String id){
		 Connection con = (Connection) DBConnection.getConnection();
		 String date="";
		     try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from auction where id="+id+"";
       ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
       date=rs.getString("start_date");   
        }

	        }
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  date;
	 }
   public static String getSignatureValue(int pid) throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeySpecException, IOException{
		 Connection con = (Connection) DBConnection.getConnection();
		String val=null;
		String signature=null;
		String minimize=null;
		RSA r=new RSA();
			    
		try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from sealedbid where bid_id="+pid+"";
   ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
       val=rs.getString("sealedbid_value"); 
   	String unseal[] =(r.decryptOne(val).split("/"));
	signature=unseal[2];
	minimize=signature.substring(0,30);
  }

	        }
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  minimize;
	 }
   public static String getPublicKey(int pid){
		 Connection con = (Connection) DBConnection.getConnection();
		String val=null;
		String minimize=null;
		
		     try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from sealedbid where bid_id="+pid+"";
	   ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
       val=rs.getString("public_key");   
       minimize=val.substring(0,28);
       
        }

	        }
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  minimize;
	 }
   public static String getstarttime(String id){
		 Connection con = (Connection) DBConnection.getConnection();
		 String time="";
		     try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from auction where id="+id+"";
        ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
       time=rs.getString("start_time");   
        }

	        }
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  time;
	 }
   public static String getauctiontime(String id){
		 Connection con = (Connection) DBConnection.getConnection();
		 String time="";
		     try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from auction where id="+id+"";
        ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
       time=rs.getString("auction_time");   
        }

	        }
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  time;
	 }
   public static String getauctionType(String id){
		 Connection con = (Connection) DBConnection.getConnection();
		 String type="";
		     try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from auction where id="+id+"";
        ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
       type=rs.getString("auction_type");   
        }

	        }
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  type;
	 }
   
   public static ArrayList<Auction> getCurrentBid(String id){
		 Connection con = (Connection) DBConnection.getConnection();
		 Auction a=null;
		 SaltEncryption s=new SaltEncryption();
		 ArrayList<Auction> alist=new ArrayList<Auction>();
	        try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT a.minimum_bid,a.price,b.`bid_price`,a.start_date,a.start_time,a.auction_time FROM auction a,bids b WHERE a.id="+id+" AND a.id=b.p_id AND b.bid_price=(SELECT MAX(bid_price) FROM bids WHERE p_id="+id+") ";
        ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
        	a=new Auction();
       a.setPrice(rs.getInt("price"));
       a.setMinbid(rs.getString("minimum_bid"));
       a.setBidprice(Integer.parseInt(s.decrypt(rs.getString("bid_price"))));
       a.setStartDate(rs.getString("start_date"));
       a.setStarttime(rs.getString("start_time"));
       a.setAuctiontime(rs.getString("auction_time"));
       alist.add(a);   
        }
}
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  alist;
	   
   }
   public static ArrayList<Auction> getStartBid(String id){
		 Connection con = (Connection) DBConnection.getConnection();
		 Auction a=null;
		 ArrayList<Auction> alist=new ArrayList<Auction>();
	        try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT minimum_bid,price,start_date,start_time,auction_time FROM auction  WHERE id="+id+"  ";
        ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
        	a=new Auction();
       a.setPrice(rs.getInt("price"));
       a.setMinbid(rs.getString("minimum_bid"));
       a.setStartDate(rs.getString("start_date"));
       a.setBidprice(rs.getInt("price"));
       a.setStarttime(rs.getString("start_time"));
       a.setAuctiontime(rs.getString("auction_time"));
       alist.add(a);   
        }
}
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  alist;
	   
   }   
   public static ArrayList<DebitCard> getUserCard(int id){
		 Connection con = (Connection) DBConnection.getConnection();
		 EncryptionUtil c = null;
		 
			try {
				c = new EncryptionUtil();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 DebitCard card=null;
		 ArrayList<DebitCard> alist=new ArrayList<DebitCard>();
	        try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="SELECT * from debitcard where user_id="+id+"";
	    ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
        	card=new DebitCard();
        	card.setCardType(c.decrypt(rs.getString("card_type")));
        	card.setExpiry(c.decrypt(rs.getString("expire_date")));
        	card.setNewcardNo(c.decrypt(rs.getString("card_no")));
        	card.setNewcvvNo(c.decrypt(rs.getString("cvv")));
        	card.setStatus(rs.getString("status"));
        	card.setBalance(rs.getInt("balance"));
        	card.setLimit(rs.getString("card_limit"));
        	card.setId(rs.getInt("id"));
        	card.setUserid(rs.getInt("user_id"));
        	alist.add(card);   
        }

	        }
        
    
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  alist;

	   
	   
   }
   
   public static void removeUserCard(String name){
		 Connection con = (Connection) DBConnection.getConnection();
	        try{    
    	Statement stm = (Statement) con.createStatement();
	   String query="update debitcard set status=0 where id='"+name+"'";
	   stm.executeUpdate(query);

	        }
        
    
  catch(SQLException ex){
      ex.printStackTrace();
  }
 }
   public static void addNewUserCard(String id,String userid,String cardtype,String cardno,String cvv,String expiredate){
		 Connection con = (Connection) DBConnection.getConnection();
	        try{    
    	Statement stm = (Statement) con.createStatement();
    	String query="update `debitcard`set `card_type`='"+cardtype+"',`card_no`='"+cardno+"',`cvv`='"+cvv+"',`expire_date`='"+expiredate+"',`status`=1 where id= "+id+" AND user_id="+userid+"";
	 stm.executeUpdate(query);

	        }
        
    
  catch(SQLException ex){
      ex.printStackTrace();
  }
 }

   public static ArrayList<Auction> showSearchResult(String sql){
		 Connection con = (Connection) DBConnection.getConnection();
		 Auction a=null;
		 ArrayList<Auction> alist=new ArrayList<Auction>();
	        try{    
    	Statement stm = (Statement) con.createStatement();
	   String query=sql;
	    ResultSet rs=stm.executeQuery(query);
        while(rs.next()){
        a=new Auction();
        a.setImage(rs.getString("image"));
        a.setId(rs.getInt("id"));
        a.setPrice(rs.getInt("price"));
        a.setDescription(rs.getString("description"));
        a.setClosingdate(rs.getString("start_date"));
        a.setName(rs.getString("product_name"));
        a.setTime(rs.getString("start_time"));
        a.setAuctiontime(rs.getString("auction_time"));
       alist.add(a);   
        }
	        }
  catch(SQLException ex){
      ex.printStackTrace();
  }
       return  alist;
}
	 public static int getUserId(String data){
		 int val=0;
		 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select id from login where user_name='"+data+"' ";
					st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					while(rs.next()){
						val=rs.getInt("id");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return val;			 
			 					}
	 public static String getUsername(int data){
		 String val="";
		 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select user_name from login where id='"+data+"' ";
					st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					while(rs.next()){
						val=rs.getString("user_name");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return val;			 
			 					}
	 public static String getAuctiondate(int data){
		 String val="";
		 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select *  from auction where id='"+data+"' ";
					st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					while(rs.next()){
						val=rs.getString("start_date");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return val;			 
			 					}
	 public static String getAuctionStarttime(int data){
		 String val="";
		 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select *  from auction where id='"+data+"' ";
					st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					while(rs.next()){
						val=rs.getString("start_time");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return val;			 
			 					}

	 public static String getAuctionstime(int data){
		 String val="";
		 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select *  from auction where id='"+data+"' ";
					st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					while(rs.next()){
						val=rs.getString("auction_time");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return val;			 
			 					}

	 
	 public static String getProductname(int data){
		 String val="";
		 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select product_name from auction where id="+data+" ";
					st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					while(rs.next()){
						val=rs.getString("product_name");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return val;			 
			 					}
	 public static int getBidno(int data){
		 int val=0;
		 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select id from bids where p_id="+data+" and status=1 and bid_type='First price sealed bid auction' ";
					 st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					while(rs.next()){
						val=rs.getInt("id");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return val;			 
			 					}	 
	 public static int getMaxBid(){
		 int val=0;
		 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select Max(id) as id from bids ";
					st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					while(rs.next()){
						val=rs.getInt("id");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return val;			 
			 					}
	public static void addwishlist(String id, String uservalue) {
		// TODO Auto-generated method stub
		int userid=DBManager.getUserId(uservalue);
		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				 String sql= "insert into wishlist(p_id,user_id)values('"+id+"','"+userid+"')"  ;
				 st.executeUpdate(sql);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
	
	public static void addBid(String price,String minbid,String offer,int userid,String id,String date,String time){
		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 SaltEncryption s=new SaltEncryption();
		 String encryptOffer=s.encrypt(offer);

		 try {
				Statement st=(Statement) con.createStatement();
				String sql="INSERT  INTO `bids`(`user_id`,`bid_price`,`p_id`,`c_date`,`c_time`,bid_type) VALUES ('"+userid+"','"+encryptOffer+"','"+id+"','"+date+"','"+time+"','English Auction')";
				st.executeUpdate(sql);
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public static void updatePrice(String minbid,String id){
		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				String sql="update auction set price="+minbid+" where id="+id+"";
				st.executeUpdate(sql);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public static void updateEnglishAuction(String startdate,String starttime,int id){
		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				String sql="update auction set start_date='"+startdate+"',start_time='"+starttime+"' where id="+id+"";
				st.executeUpdate(sql);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public static void addBlindAuction(String id,String date, String time){
		 Connection con;
		 con=(Connection) DBConnection.getConnection();

		 try {
				Statement st=(Statement) con.createStatement();
				String sql="INSERT  INTO `bids`(`p_id`,`c_date`,`c_time`,bid_type) VALUES ("+id+",'"+date+"','"+time+"','First price sealed bid auction')";
				st.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	
	public static void addDigitalSignaure(String encryptprice, String encryptuser,String encryptpid,String date,String time,int bidid){
		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				String sql="INSERT  INTO `signature`(`user_name`,`item_id`,`price`,`c_date`,`c_time`,`bid_id`) VALUES ('"+encryptuser+"','"+encryptprice+"','"+encryptpid+"','"+date+"','"+time+"',"+bidid+")";
				st.executeUpdate(sql);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public static void addDigitalSignaures(String encryptprice, String encryptuser,String encryptpid,String date,String time,int bidid,String publickey,String digitalSignature){
		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				String sql="INSERT  INTO `signature`(`user_name`,`item_id`,`price`,`c_date`,`c_time`,`bid_id`,sig_value,public_key) VALUES ('"+encryptuser+"','"+encryptprice+"','"+encryptpid+"','"+date+"','"+time+"',"+bidid+",'"+digitalSignature+"','"+publickey+"')";
				st.executeUpdate(sql);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public static void addSealedBid(String publickey,String sealedbid,String id,int bidid){
		 Connection con;
		 con=(Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				String sql="INSERT  INTO `sealedbid`(sealedbid_value,public_key,p_id,bid_id) VALUES ('"+sealedbid+"','"+publickey+"',"+id+","+bidid+")";
				st.executeUpdate(sql);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	 public static String getBalanceLimit(int data){
		 String val=null;
		 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select max(card_limit) from debitcard where user_id="+data+" ";
					st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					while(rs.next()){
						val=rs.getString("max(card_limit)");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return val;			 
			 					}
	 
	 
	 public static ArrayList<Integer> getAuctionId(int data){
		 ArrayList<Integer> val=new ArrayList<Integer>();
		 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select p_id from wishlist where user_id='"+data+"' ";
					st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					while(rs.next()){
					val.add(rs.getInt("p_id"));			;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return val;			 
			 					}
		 

	 public static boolean getWishstatus(int userid,String pid){
		 boolean status=false;
		 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select id from wishlist where user_id="+userid+" AND p_id="+pid+" ";
					st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					if(rs.next()){
						status=true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return status;			 
			 					}
	 public static boolean getBlindAuctionstatus(int userid,String pid){
		 boolean status=false;
		 Connection con = (Connection) DBConnection.getConnection();
		 SaltEncryption s=new SaltEncryption();
		 String encryptPid=s.encrypt(pid);
		 String encryptUserid=s.encrypt(String.valueOf(userid));
		 
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select * from bids where user_id='"+userid+"' AND p_id="+pid+" ";
					st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					if(rs.next()){
						status=true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return status;			 
			 					}
	
	 public static int getPlacedBid(String id){
	Connection con = (Connection) DBConnection.getConnection();
	int counter=0;
	SaltEncryption s=new SaltEncryption();
	 String encryptid=s.encrypt(id);
	 
			try {
					Statement st=(Statement) con.createStatement();
					 String sql=" select p_id from bids where p_id='"+id+"' ";
					 st.executeQuery(sql);
					ResultSet rs=st.executeQuery(sql);
					while(rs.next()){
					++counter;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		return counter;			 
			 					}
		 
	   public static ArrayList<Auction> WonStatus(int id){
			 Connection con = (Connection) DBConnection.getConnection();
			 Auction a=null;
			 SaltEncryption s=new SaltEncryption();
			 int maxid=getMaxBidPrice(id);
									 
			 ArrayList<Auction> alist=new ArrayList<Auction>();
		        try{    
	    	Statement stm = (Statement) con.createStatement();
		   String query="SELECT  *  FROM bids WHERE  id="+maxid+"";
		   ResultSet rs=stm.executeQuery(query);
	        while(rs.next()){
	        a=new Auction();
	      a.setUserid(rs.getInt("user_id"));
	      a.setPrice(Integer.parseInt(s.decrypt(rs.getString("bid_price"))));
	      a.setId(rs.getInt("id"));
	      a.setPid(rs.getInt("p_id"));
	      alist.add(a);   
	        }
		        }
	  catch(SQLException ex){
	      ex.printStackTrace();
	  }
	       return  alist;
	}
	   public static ArrayList<Auction> BlindBidList(int id){
			 Connection con = (Connection) DBConnection.getConnection();
			 Auction a=null;
			 ArrayList<Auction> alist=new ArrayList<Auction>();
		        try{    
	    	Statement stm = (Statement) con.createStatement();
		   String query="SELECT *  FROM bids WHERE  p_id='"+id+"'";
		   ResultSet rs=stm.executeQuery(query);
	        while(rs.next()){
	        a=new Auction();
	     a.setId(rs.getInt("id"));
	        alist.add(a);   
	        }
		        }
	  catch(SQLException ex){
	      ex.printStackTrace();
	  }
	       return  alist;
	}
	   public static void updateUnsealedBid(ArrayList<Auction> obj) {
			// TODO Auto-generated method stub
			Connection con;
			int total=0;
			SaltEncryption s=new SaltEncryption();
			 con=(Connection) DBConnection.getConnection();
			 try {
				for(Auction a:obj){
				 Statement st=(Statement) con.createStatement();
				 String price=s.encrypt(String.valueOf(a.getPrice()));
				 int userid=DBManager.getUserId(a.getUser());
					 String sql= "update bids set user_id="+userid+",bid_price='"+price+"'  where id="+a.getId()+"";
					 st.executeUpdate(sql);
				}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
	   public static ArrayList<Auction> getUnsealedVal(int id) throws Exception{
			 Connection con = (Connection) DBConnection.getConnection();
			 Auction a=null;
			 RSA r=new RSA();
			 ArrayList<Auction> alist=new ArrayList<Auction>();
		        try{    
	    	Statement stm = (Statement) con.createStatement();
		   String query="SELECT *  FROM sealedbid WHERE  bid_id='"+id+"'";
		   ResultSet rs=stm.executeQuery(query);
	        while(rs.next()){
	         	a=new Auction();
	     	String sealval=rs.getString("sealedbid_value");
	     	a.setPrice(Integer.parseInt(r.decyptPrice(sealval)));
	       a.setUser(r.decyptUser(sealval));
	     a.setId(rs.getInt("bid_id"));
	        alist.add(a);   
	        }
		        }
	  catch(SQLException ex){
	      ex.printStackTrace();
	  }
	       return  alist;
	}
	   public static ArrayList<Integer> getBidPriceList(int id){
			 Connection con = (Connection) DBConnection.getConnection();
			 Auction a=null;
			 SaltEncryption s=new SaltEncryption();
			 String encryptid=s.encrypt(String.valueOf(id));
					 
			 ArrayList<Integer> alist=new ArrayList<Integer>();
		        try{    
	    	Statement stm = (Statement) con.createStatement();
		   String query="SELECT bid_price  FROM bids WHERE p_id='"+id+"'";
		    ResultSet rs=stm.executeQuery(query);
	        while(rs.next()){
	       if(s.decrypt(rs.getString("bid_price"))!=null) {   
	        	alist.add(Integer.parseInt(s.decrypt(rs.getString("bid_price"))));
	 	   }}
		        }
	  catch(SQLException ex){
	      ex.printStackTrace();
	  }
	       return  alist;
	}
	   public static ArrayList<Auction> getencyptPriceList(int id){
			 Connection con = (Connection) DBConnection.getConnection();
			 Auction a=null;
			 SaltEncryption s=new SaltEncryption();
			 ArrayList<Auction> alist=new ArrayList<Auction>();
		        try{    
	    	Statement stm = (Statement) con.createStatement();
		   String query="SELECT *  FROM bids WHERE p_id='"+id+"'";
		   ResultSet rs=stm.executeQuery(query);
	        while(rs.next()){
	        	a=new Auction();
	       if(rs.getString("bid_price")!=null) {   
	        	a.setEncryptprice(rs.getString("bid_price"));
	        	a.setId(rs.getInt("id"));
	        	a.setTime(rs.getString("c_time"));
	    	   alist.add(a);
	 	   }}
		        }
	  catch(SQLException ex){
	      ex.printStackTrace();
	  }
	       return  alist;
	}

	   public static int getMaxBidPrice(int id){
		  int maxid=0;
		  int maximum=0;
		   ArrayList<Integer> list= getBidPriceList(id);
		   try{
		  	 maximum=Collections.max(list);}
		   catch(Exception e){
			}
		  ArrayList<Auction> winlist=DBManager.Findwinner(id,maximum);
		  for(Auction ac:winlist){
			  if(winlist.size()>=1){
				  maxid=ac.getId();  
			  }
			  else{
				maxid=ac.getId();  
			  }
		  
		  }
		   return maxid;
		    }
	   
	   public static ArrayList<Auction> Findwinner(int id, int max) 
	   {	 Connection con = (Connection) DBConnection.getConnection();
	   		SaltEncryption s=new SaltEncryption();
			Auction aval=null; 
			ArrayList<Auction> alist=new ArrayList<Auction>();
			
			ArrayList<Auction> list=getencyptPriceList(id);
			 for(Auction a:list){
				int val=Integer.parseInt(s.decrypt(a.getEncryptprice()));
				 if(max==val){
					 aval=new Auction();
					 aval.setId(a.getId());
					 aval.setTime(a.getTime());
					 aval.setPrice(max);
				alist.add(aval);
				 }
			 }
	       return  alist;
	}
	   public static void updateWonBid(int id,int pid,int userid) {
			// TODO Auto-generated method stub
			Connection con;
			 con=(Connection) DBConnection.getConnection();
			 String username=DBManager.getUsername(userid);
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql= "update bids set status=1 where  id="+id+""  ;
					 st.executeUpdate(sql);
					 String sql1= "update auction set user_name='"+username+"' where  id="+pid+"" ;
					 st.executeUpdate(sql1);
			
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
	   public static String updateBalance(int userid, int price,int pid) {
			// TODO Auto-generated method stub
			Connection con;
			int total=0;
			String message="";
			String username=DBManager.getUsername(userid);
			 
			 con=(Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					if(DBManager.getBalance(userid)>=price){
						if(DBManager.getLimit(userid)>=price){
							total=DBManager.getBalance(userid)-price;
					
						}
						else{
							
					message="Unfortunately, the amount of the item exceeds the specified charge limit.The item is on hold for period of 3 months. Please contact seller to pay the remaining amount.";
									
						}

					}
					if(DBManager.getBalance(userid)<price){
						message="you have insufficient Balance please contact the seller to arrange an alternative payment method";
					}
					 String sql= "update debitcard set balance="+total+" where user_id="+userid+" and status=1 and default_val=1 "  ;
					st.executeUpdate(sql);
					 String sql1= "update auction set user_name='"+username+"',message='"+message+"' where  id="+pid+"" ;
					 st.executeUpdate(sql1);
			
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			return message;
		}
	   public static void updateCounter(int userid,int counter) {
			// TODO Auto-generated method stub
			Connection con;
			con=(Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					 String sql= "update debitcard set counter="+counter+" where user_id="+userid+" and status=1 and default_val=1"  ;
					 st.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
	   
		 public static int getBalance(int userid){
		Connection con = (Connection) DBConnection.getConnection();
		int id=0;
				try {
						Statement st=(Statement) con.createStatement();
						 String sql=" select balance from debitcard where user_id="+userid+" and status=1 and default_val=1 ";
						 st.executeQuery(sql);
						ResultSet rs=st.executeQuery(sql);
						while(rs.next()){
						id=rs.getInt("balance");
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return id;			 
				 					}	   
		
		 public static int getLimit(int userid){
				Connection con = (Connection) DBConnection.getConnection();
				int id=0;
						try {
								Statement st=(Statement) con.createStatement();
								 String sql=" select card_limit from debitcard where user_id="+userid+" and status=1 and default_val=1 ";
								 st.executeQuery(sql);
								ResultSet rs=st.executeQuery(sql);
								while(rs.next()){
								id=rs.getInt("card_limit");
								}
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							return id;			 
						 					}	   
				
		 public static int getCounter(int userid){
		Connection con = (Connection) DBConnection.getConnection();
		int id=0;
				try {
						Statement st=(Statement) con.createStatement();
						 String sql=" select counter from debitcard where user_id="+userid+" and status=1 and default_val=1 ";
						st.executeQuery(sql);
						ResultSet rs=st.executeQuery(sql);
						while(rs.next()){
						id=rs.getInt("counter");
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return id;			 
				 					}	   

		 
		 public static int getWonid(int userid){
		Connection con = (Connection) DBConnection.getConnection();
		int id=0;
		 SaltEncryption s=new SaltEncryption();
		 String encryptUserid=s.encrypt(String.valueOf(userid));
		 String encryptStatus=s.encrypt("1");
	
				try {
						Statement st=(Statement) con.createStatement();
						 String sql=" select p_id from bids where user_id='"+userid+"' and status=1 ";
						 st.executeQuery(sql);
						ResultSet rs=st.executeQuery(sql);
						while(rs.next()){
							id=rs.getInt("p_id");
						
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return id;			 
				 					}
		 public static int getwonStatus(int pid){
		Connection con = (Connection) DBConnection.getConnection();
		int id=0;
		 SaltEncryption s=new SaltEncryption();
		 String encryptPid=s.encrypt(String.valueOf(pid));
		 String encryptStatus=s.encrypt("1");
			
				try {
						Statement st=(Statement) con.createStatement();
						 String sql=" select user_id from bids where p_id='"+pid+"' and status=1 ";
						 st.executeQuery(sql);
						ResultSet rs=st.executeQuery(sql);
						while(rs.next()){
						id=rs.getInt("user_id");
						
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return id;			 
				 					}



}

					