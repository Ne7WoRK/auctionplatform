<!DOCTYPE html>
<html lang="en">
  <head>

    <title>Bid</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />        
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <% String id=(String)request.getParameter("id");%>
    <% String s=(String)session.getAttribute("uname");%>
    
	 <script src="js/jquery.js"></script>
<style>
#countdown {
  text-align: center;
  font-size: 20px;
  margin-top: 0px;
  color:red;
}
#offer{
  text-align: center;
  font-size: 20px;
  margin-top: 0px;
  color:red;
}
</style>
	<script>
	$(document).ready(function() {
        var uservalue="<%=s%>";
        var id="<%=id%>";
    	var priceCheck=0;
   		$.ajax({
   			
       		type:"POST",
       		url:"Validation",
       		data:{
       			
       			biduser:uservalue,
       			bidids:id,
       		},
       		datatype:"json",
       		success:function(data){
			
	for(var a=0 ; a<data.length; a++)
	{					var bb=	data[a];
	var currentDate = new Date(bb.startDate);
	var day=currentDate.getDate();
	var month=currentDate.getMonth()+1;
	var year=currentDate.getFullYear();
	var time=bb.starttime;
	var endtime=bb.auctiontime;
	var temp = time.split(":");
	var selectedhour=(parseInt(temp[0]));
	var selectedminute=parseInt(temp[1]);
	var endtemp = endtime.split(":");
	var endhour=(parseInt(endtemp[0]));
	var endminute=parseInt(endtemp[1]);
	var hour=selectedhour+endhour;
	var minute=selectedminute+endminute;
	var countDownDate = new Date(currentDate.getMonth()+1+"-"+currentDate.getDate()+"-"+currentDate.getFullYear()+" "+hour+":"+minute+ ":00").getTime();
	var x = setInterval(function() {

	  // Get todays date and time
	  var now = new Date().getTime();
	    
	  // Find the distance between now and the count down date
	  var distance = countDownDate - now;
	    
	  // Time calculations for days, hours, minutes and seconds
	  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	    
	  // Output the result in an element with id="demo"
	  document.getElementById("countdown").innerHTML = days + "d " + hours + "h "
	  + minutes + "m " + seconds + "s ";
	    
	  // If the count down is over, write some text 
	  if (distance < 0) {
	    clearInterval(x);
	    document.getElementById("countdown").innerHTML = "EXPIRED";
	  window.location.href="welcome.jsp";
	  }
	}, 1000);
			var total=parseInt(bb.bidprice)+parseInt(bb.minbid);
			$("#price").val(bb.bidprice);
			$("#minbid").val(total);
			priceCheck=total;
				}
			
    
       		
       		}
    			
       });
	
   		$('#bid').blur(function(event){
   			var bid= $('#bid').val();
   			var prev=priceCheck;
   			if(bid<=prev){
   		          alert('The price is less than or equal to minimum Bid ');
   	            $(this).val('');
   	  	}
   			
   		  });
	
	});
	</script>
  </head>

  <body>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  <div id="login-page">
	  	<div class="container">

		      <form class="form-login" action="BidServlet" method="Post">
		        <h2 class="form-login-heading">Bidding</h2>
		        <div class="login-wrap">
		       <p id="offer">Accepting offers for</p>
		       <p id="countdown"></p>
	  	
		       
		        <input type="hidden" name="username" value=<%=s%>>
		        <input type="hidden" name="id" value=<%=request.getParameter("id") %>>
		        
		        <p>Current Price</p>
		            <input type="text" class="form-control" id="price" name="price" >
				 <br>
				 <p>Next Minimum Bid</p>
		          <input type="text" class="form-control" id="minbid" name='minbid'>
		         <br>
				 <p>Place a bid</p>
		          <input type="text" class="form-control" id="bid" name='bid'>
		         
		          <br>
		          <br>
		      <br>
		          
		      
		            <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> Place a Bid</button>
		        
		            <hr>
		            
		           <br>
		           <br>
		           <br>
		           <br>
		        </div>
		
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
    </script>


  </body>
</html>
