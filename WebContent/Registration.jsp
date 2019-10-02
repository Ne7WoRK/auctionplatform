<!DOCTYPE html>
<html lang="en">
  <head>

    <title>Registration</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />        
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
	 <script src="js/jquery.js"></script>
            
	<script>
	$(document).ready(function() {
	var userStatus=0;	
	var emailStatus=0;
	var phoneStatus=0;
	var passwordStatus=0;
	$('#user').keyup(function(event) {
   		var acname = $("#user").val();
   		$.ajax({
   			
       		type:"POST",
       		url:"Validation",
       		data:{
       			
       			accountname:acname,
       			
       		},
       		datatype:"json",
       		success:function(data){
			
			if(data=="success"){
	
				 $("#userspan").html("<span  style='font-size:12px;color:red'>This user is not availble</span>");
					userStatus=0;
				 
			}
			else{
				
				$("#userspan").html("<span></span>");
				userStatus=1;
				 
			}
			
    
       		
       		}
    			
       	});});
	
	$('#email').keyup(function(event) {
   		var emailcheck = $("#email").val();
   		$.ajax({
   			
       		type:"POST",
       		url:"Validation",
       		data:{
       			
       			emailvalue:emailcheck,
       			
       		},
       		datatype:"json",
       		success:function(data){
			
			if(data=="success"){
	
				 $("#emailspan").html("<span  style='font-size:12px;color:red'>This email is not availble</span>");
				 emailStatus=0;
							 
			}
			else{
				
				$("#emailspan").html("<span></span>");
				 emailStatus=1;
			}
			
       		
       		}
    			
       	});});

	$('#phone').keyup(function(event) {
   		var phonecheck = $("#phone").val();
   		$.ajax({
   			
       		type:"POST",
       		url:"Validation",
       		data:{
       			
       			phonevalue:phonecheck,
       			
       		},
       		datatype:"json",
       		success:function(data){
			
			if(data=="success"){
	
				 $("#phonespan").html("<span  style='font-size:12px;color:red'>This phone number is already there</span>");
				 phoneStatus=0; 
			}
			else{
				
				$("#phonespan").html("<span></span>");
				phoneStatus=1;
				 
			}
       		
       		}
    			
       	});});
	$('#enter').click(function(event) {
	var orignalpass=$("#pass").val();
	var confirmpass	= $("#confirmpass").val();
	if(orignalpass!=confirmpass){
	$("#passwordspan").html("<span  style='font-size:12px;color:red'>Password do not match</span>");
	passwordStatus=0;
		}
	else{
		passwordStatus=1;
		
	}
	if(userStatus==1 && emailStatus==1 && phoneStatus==1 && passwordStatus==1){
   		var user = $("#user").val();
   		var pass = $("#pass").val();
   		var email= $("#email").val();
   		var phone= $("#phone").val();
   	   		
   		$.ajax({
   			
       		type:"POST",
       		url:"NewUser",
       		data:{
       			
       			uservalue:user,
       			passvalue:pass,
       			emailvalue:email,
       			phonevalue:phone,
           			
       		},
       		datatype:"json",
       		success:function(data){
	  	alert("You have been registered. Please enter Debit Card Information")
       			location.href=data;

       		}
    			
       	});
	}
	else{
		
	alert("Please modify information")	
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
	  	
		      <form class="form-login">
		        <h2 class="form-login-heading">Registration</h2>
		        <div class="login-wrap">
		            <input type="text" class="form-control" id="user" name="user" placeholder="User Name" required>
				<span id="userspan"></span>
		            <br>
		            <input type="password" class="form-control" name='pass' id="pass" placeholder="Password" required>
		            <br>
		            <input type="password" class="form-control" id='confirmpass' name='confirmpass' placeholder="Confirm your password" required>
		          <span id="passwordspan"></span>
		            <br>
		            <input type="email" class="form-control" id="email" name='useremail' placeholder="Enter a valid email" required>
		          <span id="emailspan"></span>
		          <br>
		            <input type="phone" class="form-control" id="phone" name='phone' placeholder="Enter a valid phone number" required>
		            	<span id="phonespan"></span>		          
		            <button class="btn btn-theme btn-block" id="enter" type="button"><i class="fa fa-lock"></i> SIGN UP</button>
		        
		            <hr>
		            
		           <br>
		           <br>
		           <br>
		           <br>
		        </div>
		
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>



  </body>
</html>
