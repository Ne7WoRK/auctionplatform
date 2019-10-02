package utils;

import java.util.ArrayList;
import java.time.LocalDateTime;
import java.util.*;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpSession;

import com.dao.DBManager;
import com.model.Auction;

public class win {	

	public win(){
		// TODO Auto-generated method stub
		TimerTask task = new TimerTask() {
		      @Override
		      public void run() {
		        // task to run goes here
					Auction a=null;
					ArrayList<Auction> lists=DBManager.getImage();
					for(Auction l:lists){
						a=new Auction();
						String getdate=l.getClosingdate();
				        String[] splitdate = getdate.split("[-]"); 
				        int getyear=Integer.parseInt(splitdate[0]);
				        int getmonth=Integer.parseInt(splitdate[1]);
				        int getday=Integer.parseInt(splitdate[2]);		
						String str =l.getTime(); 
						  String[] temp = str.split("[:]"); 
				        int starthour=Integer.parseInt(temp[0]);
				        int startminute=Integer.parseInt(temp[1]);
				        String end =l.getAuctiontime();
				        String[] endtemp = end.split("[:]"); 
				        int endhour=Integer.parseInt(endtemp[0]);
				        int endminute=Integer.parseInt(endtemp[1]);
				        int hour=starthour+endhour;
				        int minute=startminute+endminute;
				        int currenthour=LocalDateTime.now().getHour();
				        int currentminute=LocalDateTime.now().getMinute();
				        int currentday=LocalDateTime.now().getDayOfMonth();
				    	if( currentday>=getday )
		       			{
				    	if(currenthour>=hour){	
				    	int id=l.getId();
				    	ArrayList<Auction> list= DBManager.WonStatus(id);
						for(Auction aa:list){
							String msg=null;
						int userid=aa.getUserid();
						int price=aa.getPrice();
						int pid=aa.getPid();
						if(DBManager.getCounter(userid)==0){
						int counter=0;
						DBManager.updateBalance(userid,price,pid);
						++counter;
						DBManager.updateCounter(userid, counter);
						}
						DBManager.updateWonBid(aa.getId(),pid,userid);	
							
						}
					}
				
		       			}}
		      }
		    };
		    Timer timer = new Timer();
		    long delay = 0;
		    long intevalPeriod = 60* 1000; 
		    // schedules the task to be run in an interval 
		    timer.scheduleAtFixedRate(task, delay,
		                                intevalPeriod);
		
		
	}

	}
