package utils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;

import com.dao.DBManager;
import com.model.Auction;

public class Termination  {

	public Termination() {
		// TODO Auto-generated method stub
		TimerTask task = new TimerTask()  {
		      @Override
		      public void run() {
		        // task to run goes here
					Auction a=null;
					ArrayList<Auction> lists=DBManager.getblindproduct();
					for(Auction l:lists){
						a=new Auction();
						String getdate=l.getStartDate();
				        String[] splitdate = getdate.split("[-]"); 
				        int getyear=Integer.parseInt(splitdate[0]);
				        int getmonth=Integer.parseInt(splitdate[1]);
				        int getday=Integer.parseInt(splitdate[2]);		
						String str =l.getStarttime(); 
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
				        
				    	if( currentday>=getday)
		       			{
				    	if(currenthour>=hour){
				    		if(currentminute>=minute){
				    			int id=l.getId();
							    ArrayList<Auction> blindlist=DBManager.BlindBidList(id);
				    		
							    for(Auction val:blindlist){
				    				try {
				    					ArrayList<Auction> obj=DBManager.getUnsealedVal(val.getId());
										DBManager.updateUnsealedBid(obj);
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
				    			}
				    		
				    		}
				    	}	
				    }
					}
		      }
		    };
		    Timer timer = new Timer();
		    long delay = 0;
		    long intevalPeriod = 10* 1000; 
		    // schedules the task to be run in an interval 
		    timer.scheduleAtFixedRate(task, delay,
		                                intevalPeriod);
		
		
	}


}
