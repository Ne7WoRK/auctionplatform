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
<script language="JavaScript" type="text/javascript" src="js/rsa.js"></script>
<script language="JavaScript" type="text/javascript" src="js/jsbn.js"></script>
<script src="js/jsrsasign-all-min.js"></script>

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
	    window.location.href="welcome.jsp";
		  
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
        var ids="<%=(String)request.getParameter("id")%>";
        var curve = "secp256r1"; 
        var ec = new KJUR.crypto.ECDSA({"curve": curve});
        //Generating Keypair
        var keypair = ec.generateKeyPairHex();
        //Generating Private Key
        var private_key = keypair.ecprvhex;
        //Generating Public Key
        var public_key = keypair.ecpubhex;
        /*----------------------End of client side keys---------------*/
        //Pass here bid and username in format bid + "/" + username + "/"
        var msg = price+"/"+user+"/";
        function SealedBid(){

        	//Signature Algorithm SHA256withECDSA, SHA1withECDSA  
        	var signature_algo = "SHA256withECDSA";

        	//Generating Signature
        	var sig = new KJUR.crypto.Signature({"alg": signature_algo});
        	sig.init({d: private_key, curve: curve});
        	sig.updateString(msg);
        	var sigValueHex = sig.sign();

        	//Storing public key in variable.Don't forget to escape the lines.DON'T TOUCH THIS VALUE FORMAT!
        	    var pem = "-----BEGIN PUBLIC KEY-----\
        	MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7cpZVjYz1QKrRlffCqNC\
        	MxciJtKA/RxmmpSLiCjqQfY/VnX4ZvCMJQRAIhrsMtkzGxI1/Jn1FXSdmdsy4DPw\
        	JIScVZccZhTzRJ+3Oc8c8zZc2Reju4QgBpy1Vc8ZmOprCjC4X8nmHlc9w3xX1zKC\
        	9gbfAq2fiWncEJ2Es13/wpMflAuuCwHccV8AXf2t2rVEf412Q6hr4kpF42TZI0Er\
        	3ISAtB3Ye5Pl31EbVcsYE8qSfN+AL7cNKE+XG54McwkY8ic/JcOnTVLk4UB5S/b3\
        	w8eb2oWJGpgNjGf17ztYzuebgF8s26b/ifGYUd8QH0MYlKxg8nAqnu6YSvklWvdM\
        	7wIDAQAB\
        	-----END PUBLIC KEY-----";
        		
        		//Converting from pem to public key 
        		var public_key = RSA.getPublicKey(pem);

        		//Initialize the seal
        		var seal = msg+sigValueHex;

        		//Encrypt the seal.
        		var encryptSeal = RSA.encrypt(seal,public_key);

        		return encryptSeal;

        	}
        var SealedBid = SealedBid();
        

        $.ajax({
             	type:"POST",
          		url:"BlindAuctionServlet",
          		data:{
        				publickey:public_key,
        				SealedBids:SealedBid,
        				prices:price,
        				users:user,
        				pid:ids,
                				
          		},
          		datatype:"json",
          		success:function(data){
          		 	
          			window.location.href = "welcome.jsp";
          	       	    		
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


  </body>
</html>
