<!DOCTYPE html>
<html lang="en">
  <head>

    <title>Debit Card</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />        
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
	 <script src="js/jquery.js"></script>
            
	<script>
	$(document).ready(function() {
  		var val ="debitcard"
   		$.ajax({
   			
       		type:"POST",
       		url:"Validation",
       		data:{
       			
       			getcarddata:val,
       			
       		},
       		datatype:"json",
       		success:function(data){
			
	for(var a=0 ; a<data.length; a++)
	{					var bb=	data[a];
			$("#cardtype").val(bb.cardtype);
			$("#cardno").val(bb.card);
			$("#cvv").val(bb.cvv);
			$("#expiredate").val(bb.expiry);
			  
				}
			
    
       		
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
	  	
		      <form class="form-login" action="DebitCardServlet" method="Post">
		        <h2 class="form-login-heading">Card Information</h2>
		        <div class="login-wrap">
		        <input type="hidden" name="username" value=<%=request.getParameter("name") %>>
		        <p>Card Type</p>
		            <input type="text" class="form-control" id="cardtype" name="cardtype">
				 <br>
				 <p>Card Number</p>
		          <input type="text" class="form-control" id="cardno" name='cardno'>
		          <br>
		          <p>CVV</p>
		          <input type="text" class="form-control" id="cvv" name='cvv'>
		          <br>
		       	<p>Expire Date</p>
		            <input type="text" class="form-control" id="expiredate" name='expiredate'>
		      <br>
		            	  <input type="text" class="form-control" id="limit" name='limit' required>
		            	<span>Please specify the maximum amount you would like to be charged for the purchase of this platform</span>
		          
		            	<span id="limitspan"></span>
		      
		            <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> Next</button>
		        
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
    $.backstretch("resources/business2.jpg", {speed: 500});
    </script>


  </body>
</html>
