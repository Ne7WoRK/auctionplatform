<!DOCTYPE html>
<html lang="en">
  <head>

    <title>Debit Card</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />        
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
	 <script src="js/jquery.js"></script>


    <% String s=(String)session.getAttribute("uname");%>
            
	<script>
	$(document).ready(function() {
        var uservalue="<%=s%>";
        if(uservalue=="null"){
         	window.location.href = "login.jsp";
            
     	    }

		
		var value=<%=request.getParameter("actions") %>;	
	  	var val=<%=request.getParameter("val") %>;
	  	if(value==1){
	  	 	$("#update").hide();	
	  	}
	  	if(value==2){
	  	 	$("#update").show();
	  	 	$("#addnewcard").hide();
	  	}
	
		
	  	$('#newcard').click(function() {
   			var newval ="debitcard";
   	   		$.ajax({
   	   			
   	       		type:"POST",
   	       		url:"Validation",
   	       		data:{
   	       			
   	       			getcarddata:newval,
   	       			
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
   		$('#update').click(function() {
   				var id =<%=request.getParameter("id") %>;
   				var userid =<%=request.getParameter("val") %>;
				var cardtype=$("#cardtype").val();
   				var cardno=$("#cardno").val();
   				var cvv=$("#cvv").val();
   				var expiredate=$("#expiredate").val();
   				var action="add";  
   			$.ajax({
   	   			
   	       		type:"POST",
   	       		url:"Validation",
   	       		data:{
   	       			actions:action,
   	       			userids:userid,
   	       			ids:id,
   	       			cardtypes:cardtype,
   	       			cardnos:cardno,
   	     			cvvs:cvv,
   	 				expiredates:expiredate,
   				},
   	       		datatype:"json",
   	       		success:function(data){
   	       	
   	       		window.location.href="payment.jsp";
   	       		}
   	    			
   	       });
   		

   		
   		});		
	    var testvalue= "<%=s%>";

	        if(testvalue=="null"){
	        	window.location.href = "login.jsp";
	           
	    	    }	

  		var val ="debitcard";
  		var uservalue= "<%=s%>";
  		$.ajax({
   			
       		type:"POST",
       		url:"Validation",
       		data:{
       			getusercard:uservalue,
       	       			
       		},
       		datatype:"json",
       		success:function(data){
			
	for(var a=0 ; a<data.length; a++)
	{					var bb=	data[a];
			if(bb.status==1){
			$("#cardtype").val(bb.cardType);
			$("#cardno").val(bb.newcardNo);
			$("#cvv").val(bb.newcvvNo);
			$("#expiredate").val(bb.expiry);
			}
			
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

	  	<div class="container">

	  <div id="login-page">
	  	  
		      <form class="form-login" action="AddNewCardServlet" method="Post">
		        <h2 class="form-login-heading" id="header">Card Information</h2>
		        <div class="login-wrap">
		        <input type="hidden" name="username" value=<%=s%>>
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
		      
		        <button class="btn btn-theme btn-block " type="submit"  id="addnewcard"><i class="fa fa-lock"></i> Insert Now</button>
		     
		      </form>	  	
    		  <button class="btn btn-theme btn-block " type="button"   id="newcard"><i class="fa fa-lock"></i> New Card No</button>
			      <button class="btn btn-theme btn-block" id="update" type="button"><i class="fa fa-lock"></i> Update</button>
			    
 </div>
	
	  	</div>
		            
		          </div>
		           <br>
		           <br>
		           <br>
		           <br>
		  
		        </div>
		  
		    <hr>
		        
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
