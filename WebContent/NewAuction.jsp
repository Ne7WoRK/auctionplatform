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
    
	 <script src="js/jquery.js"></script>
   <script language="JavaScript" type="text/javascript" src="js/jsrsasign-all-min.js"></script>
            
	<script>
	$(document).ready(function() {
        var uservalue="<%=s%>";
        var id="<%=id%>";
        var action="getplacedbids";
   		$.ajax({
   			
       		type:"POST",
       		url:"Validation",
       		data:{
       			
       			bidusers:uservalue,
       			bidids:id,
       			getplacedbids:action,
    		       
       		},
       		datatype:"json",
       		success:function(data){
       			if(data=="cant bid"){
       			alert("You cannot bid becuase you have already bid for this product.Please wait for result.");
       		 	window.location.href = "welcome.jsp";
       	        		
       		}
       		else{
       			$('#bidplaced').val(data);
       		}}
       });
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
	  }
	}, 1000);
			var total=parseInt(bb.bidprice)+parseInt(bb.minbid);
		
				}
			
    
       		
       		}
    			
       });

   		
   	 $('#enter').click(function(event){
 		var func = "searching";
 		var price = $("#price").val();
 		var user="<%=s%>";
        var ids="<%=id%>";
        var curve = "secp256r1"; 
 		var ec = new KJUR.crypto.ECDSA({"curve": curve});

 		//Generating Keypair
 		var keypair = ec.generateKeyPairHex();

 		//Generating Private Key
 		var private_key = keypair.ecprvhex;

 		//Generating Public Key
 		var public_key = keypair.ecpubhex;

 		//Signature Algorithm SHA256withECDSA, SHA1withECDSA  
 		var signature_algo = "SHA256withECDSA";

 		//Message for encrypting
 		var msg = user+price+ids;
 		alert("Private Key : "+private_key+"<br>");
 		alert("Public Key : "+public_key+"<br>");
 		alert("Message : " +msg);
 		var sig = new KJUR.crypto.Signature({"alg": signature_algo});
 		sig.init({d: private_key, curve: curve});
 		sig.updateString(msg);
 		var sigValueHex = sig.sign();
 		  
 		//Printing Signature  
 		alert("Signature : "+sigValueHex);
 		//Verifying Signature 
 		var sigval = sigValueHex;

 		var sig = new KJUR.crypto.Signature({"alg": signature_algo, "prov": "cryptojs/jsrsa"});
 		sig.init({xy: public_key, curve: curve});
 		sig.updateString(msg);
 		var result = sig.verify(sigval);
 		if (result) {
 		alert("Signature : Verified");
 			} else {
 			  alert("Signature : UnVerified");
 			}

               $.ajax({
             	type:"POST",
          		url:"Testservlet",
          		data:{
        				publickey:public_key,
        				signature:sigValueHex,
        				users:user,
        				pid:ids,
        				prices:price,
        				msgs:msg,
        			},
          		datatype:"json",
          		success:function(data){
            					
            		
 }
               });
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
	  	
		      <form class="form-login" action="" method="Post">
		        <h2 class="form-login-heading">Bidding</h2>
		        <div class="login-wrap">
		       		        <input type="hidden" id="users" name="username" value=<%=s%>>
		        <input type="hidden" name="id" id="pid" value=<%=request.getParameter("id") %>>
        <p id="offer">Accepting offers for</p>
		       <p id="countdown"></p>
	  	
		        <p>Bids Placed</p>
		            <input type="text" class="form-control" id="bidplaced" name="bidplaced">
				 <br>
				 <p>Bid Amount</p>
		          <input type="text" class="form-control" id="price" name='price'>
		          <br>
		      <br>
		          
		      
		            <button class="btn btn-theme btn-block" id="enter" type="button"><i class="fa fa-lock"></i> Place a Bid</button>
		        
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
    $.backstretch("assets/login-bg.jpg", {speed: 500});
        </script>


  </body>
</html>
