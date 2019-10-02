<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Add Auction</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      <style>
      #bg{
      color:blue;
      }
    
</style>
      <script>
         $(function() {
            $( "#datepicker-13" ).datepicker();
            
         });
      </script>    
  <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
      <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <% String s=(String)session.getAttribute("uname");%>

    <script src="js/jquery.js"></script>
        <script>
        var date;
        $(function() {
            $("#startdate").datepicker({ dateFormat: 'yy-mm-dd'});
            $("#startdate").on('change', function(){

                 date = $(this).val();
                 var currentDate =new Date(date) ;
                 var nowDate =new Date() ;
                 var selectDay=parseInt(currentDate.getDate());
                 var selectMonth=parseInt(currentDate.getMonth());
                 var selectYear=parseInt(currentDate.getFullYear());
                 var currentDay=parseInt(nowDate.getDate());
                 var currentMonth=parseInt(nowDate.getMonth());
                 var currentYear=parseInt(nowDate.getFullYear());
                if (selectDay<currentDay || selectMonth<currentMonth || selectYear<currentYear){
                    alert('Please select another date');
                    $(this).val('');
                }

           });
            });
    </script>
            <script>
        $(function() {
        	   $("#startdate").datepicker({ dateFormat: 'yy-mm-dd'});

            $("#startdate").on('change', function(){
             var thisdate = $(this).val();
 			   var dates = new Date();
 			   var enddate=new Date(thisdate)
 			  Date.prototype.addDays = function(days) {
 			        this.setDate(this.getDate() + parseInt(days));
 			        return this;
 			    };
 			   var todayDate =new Date() ;
 			   
 			    var currentDate =new Date() ;
 			    var newdate=currentDate.addDays(14);
 			   if(enddate> newdate)
 			  {
 				   alert('Please select another date');
 				  $(this).val('');
 			  } 			   			   
 			 

          });          
            
            
        });
        function validatePhoto(input,fileImageId,showImageId) {
    		var maxFileSizeLimit = 1 * 1024 * 1024 ; // File size for image;
    		
    		var photoFileUploadPath = $('#'+fileImageId).val();
    	    
    	    if (photoFileUploadPath == '') {
    	        alert("Please upload an images");
    	        return false;
    	    } else if(photoFileUploadPath != null ) {
    	        var extension = photoFileUploadPath.substring(photoFileUploadPath.lastIndexOf('.') + 1).toLowerCase();
    	        if (extension == "gif" || extension == "png" || extension == "bmp"
    	                || extension == "jpeg" || extension == "jpg") {
    	        	if(input.files[0].size <= maxFileSizeLimit) { 
    	        		showImage(input,showImageId);	
    	        	}else {
    	        		alert("Image size should not be greater than 1MB.");
    	        		$("#photo").val("");
    	        		$("#employeePhoto").attr("src","images/no-image-big.png");
    	        		return false;
    	        	}
    	        } else {
    	        	alert("Only allows image file type.");
    	            $("#"+fileImageId).val("");
    	            $("#"+showImageId).attr("src","images/no-image-big.png"); 
    	            return false;
    	        }
    	    }
    	}
    	
    </script>
    
	<script>
    $(document).ready(function(){
     	 var uservalue="<%=s%>";
     	if(uservalue=="null"){
          	window.location.href = "login.jsp";
      	    }

		$("#bidframediv").hide();		
	 	$("#startpricediv").hide();	
		$("#startreservediv").hide();		
	 	$("#startdatediv").hide();	
	 	$("#starttimediv").hide();	
		$("#endtimediv").hide();	
		$("#enddatediv").hide();	
		$("#enddatediv").hide();
        
    	var dt = new Date();
    	var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
    	var currentdate = new Date(); 
        var datetime = "Now: " + currentdate.getDate()+parseInt(4) + "/"
                    + (currentdate.getMonth()+1)  + "/" 
                    + currentdate.getFullYear() + " @ "  
                    + currentdate.getHours() + ":"  
                    + currentdate.getMinutes() + ":" 
                    + currentdate.getSeconds();

	var testvalue= "<%=s%>"
    	    if(testvalue=="null"){
            	window.location.href = "login.jsp";
               
        	    }
	$('#starttime').blur(function(event){
    	
		var timefrom = new Date();
		var temp = $('#starttime').val().split(":");
		var selectedhour=(parseInt(temp[0]) + 24) % 24;
		var selectedminute=parseInt(temp[1]);
		var enteredhour=(parseInt(temp[0]));
		var currentdate = new Date();
		var currenthour=parseInt(currentdate.getHours());
		var currentminute=parseInt(currentdate.getMinutes());
		if(selectedhour<currenthour){
			      $(this).val('');
			
		}
		if(selectedhour<=currenthour){
			if(selectedminute<=currentminute){
				alert('Please select another time');
	              $(this).val('');
			}
			
		}
	
		
	  });		
	$('#auctiontime').blur(function(event){
		var timefrom = new Date();
		var temp = $('#auctiontime').val().split(":");
		var selectedhour=(parseInt(temp[0]));
		var selectedminute=parseInt(temp[1]);
		if(selectedhour>24){
	          alert('The value should be within range of (00:01 and 24:00)');
            $(this).val('');
  	}
		
	  });
	$('#bidframe').blur(function(event){
		var temp = $('#bidframe').val();
		var selectedhour=parseInt(temp);
		if(temp>60){
	          alert('The value should not be greater than 60 ');
            $(this).val('');
  	}
		
	  });
		


      	$('#auctiontype').change(function(event) {
	  		var auctiontype=$("#auctiontype").val();
			if(auctiontype=="English Auction"){
				$("#bidframediv").hide();		
				$("#enddatediv").show();		
			 	$("#startpricediv").show();	
				$("#startreservediv").show();		
			 	$("#startdatediv").show();	
			 	$("#starttimediv").show();		
			 	
			 	$("#enddatediv").show();		
			 	$("#endtimediv").show();	
			 	$("#enddatediv").show();	
		    
			}
			if(auctiontype=="First price sealed bid auction"){
				$("#bidframediv").show();		
				$("#enddatediv").hide();		
			 	$("#startpricediv").hide();	
				$("#startreservediv").show();		
			 	$("#startdatediv").show();	
				$("#enddatediv").hide();		
			 	$("#endtimediv").hide();	
			 	$("#enddatediv").hide();	
			 	$("#starttimediv").show();	
		    	   
			}
			
       	        });
    });1
    </script>

  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo"><b></b></a>
            <!--logo end-->
 
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
										<aside>        
          <div id="sidebar"  class="nav-collapse " >
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
                            	  <h5 class="centered"></h5>
                  <li class="mt">
                      <a href="welcome.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span>Home</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="browse.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span>Browse</span>
                      </a>
                  </li>
                  
                  
			<li class="sub-menu">
                      <a href="auction.jsp" >
                          <i class="fa fa-cogs"></i>
                          <span>My Auction</span>
                      </a>
                  </li>
              
                  <li class="sub-menu" id="masterdata">
                      <a href="wonAuction.jsp" >
                          <i class=" fa fa-tasks"></i>
                          <span>Won Auction</span>
                      </a>
                     
                  </li>

               
                  <li class="sub-menu">
                      <a href="bids.jsp" >
                          <i class="fa fa-book"></i>
                          <span>Bids & Wishlist</span>
                      </a>
                  </li>
                  
                 
                  <li class="sub-menu" >
                      <a href="addAuction.jsp" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>Add auction</span>
                      </a>
                  </li>
              	
                  <li class="sub-menu">
                      <a href="payment.jsp" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>Payment</span>
                      </a>
                     
                  </li>
                  <li class="sub-menu"  id="report">
                      <a href="logout" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>Logout</span>
                      </a>
                    
                  </li>     

              </ul>
          </div>
      </aside>
																								
          
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3 id="bg"><i class="fa fa-angle-right"></i>Add Auction</h3>
           
          	 <div class="panel panel-primary">
          	 		<div class="panel-heading"></div>
          	<div class="row mt" >
          		<div class="col-lg-12">
             <div class="form-panel">

                      <form class="form-horizontal style-form"   method="POST" enctype="multipart/form-data" action="AddAuctionData" id="mainframe" >
                     <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Product Name</label>
                              <div class="col-sm-4">
                                  <input type="text" class="form-control" name="productname" id="productname" required>
                              </div>
                          </div>
                           <input type="hidden" name="username" value=<%=s%>>
		       
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Product Category</label>
                              <div class="col-sm-4">
                             <select id="productcategory" name="productcategory">
                             <option>Electronics</option>
                             <option>Home</option>
                             <option>Garden</option>
                             <option>Antiques</option>
                             
                             </select>
                              </div>
                          </div>
                          <div class="form-group">   
             					<label class="col-sm-2 col-sm-2 control-label">Product Description</label>
                                    <div class="col-sm-4">
                                
                              
                              <textarea class="form-control" rows="4" name="description"  id="description"></textarea>
                                 </div>
                          </div>
                          
                          <div class="form-group">
                          	<label class="col-sm-2 col-sm-2 control-label">Photo</label>
                              <div class="col-sm-10">
								<input type="file" id="photo" name="photo"accept="image/*"  onchange="return validatePhoto(this,'photo','viewPhoto')" />
							  </div>

                          </div>
           					<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Auction Type</label>
                              <div class="col-sm-4">
                             <select id="auctiontype" name="auctiontype">
                            <option>---------</option>
                             <option>English Auction</option>
                             <option>First price sealed bid auction</option>
                             </select>
                              </div>
                          </div>							  
                          <div class="form-group" id="startpricediv">
                              <label class="col-sm-2 col-sm-2 control-label">Start Price</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" value='0 ' name="price" id="price" required>
                              </div>
                          </div>
                         
                          <div class="form-group" id="startreservediv">
                              <label class="col-sm-2 col-sm-2 control-label">Reserve Price</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" name="reserveprice" id="reserveprice" required>
                              </div>
                          </div>                          
                            <div class="form-group" id="startdatediv">
                              <label class="col-sm-2 col-sm-2 control-label">Start Date</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" name="startdate" id="startdate" required>
                              </div>
                          </div>
                          
                          <div class="form-group" id="starttimediv">
                              <label class="col-sm-2 col-sm-2 control-label">Start Time</label>
                              <div class="col-sm-4">
                             <input class="form-control" type="text" id="starttime" name="starttime" data-mask="99:99" />
                                      </div>
                          </div>
                                <div class="form-group" id="enddatediv">
                              <label class="col-sm-2 col-sm-2 control-label">Auction Time</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" name="auctiontime" id="auctiontime" data-mask="99:99" >
                    
                              </div>

                              </div>
                                                        <div class="form-group" id="endtimediv">
                              <label class="col-sm-2 col-sm-2 control-label">Minimum Bid</label>
                              <div class="col-sm-4">
                             <input class="form-control" type="text" id="minimumbid" name="minimumbid"  />
                             
                              </div>
                          </div>
                              
						<div class="form-group" id="bidframediv">
                              <label class="col-sm-2 col-sm-2 control-label">Bid Frame</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" name="bidframe" id="bidframe" >
                                             
 
                              </div>
  
                          </div>
                                      <input type="submit" class="btn btn-theme" value="Add Auction">                         
                         
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          	
          	</div>
   
      <!--footer end-->
      </div>
  </section>
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom switch-->
	<script src="assets/js/bootstrap-switch.js"></script>
	
	<!--custom tagsinput-->
	<script src="assets/js/jquery.tagsinput.js"></script>
	
	<!--custom checkbox & radio-->
	
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	
	
	<script src="assets/js/form-component.js"></script>    
    
    

  </body>
</html>
