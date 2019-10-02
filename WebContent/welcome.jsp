<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Welcome Back</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
      <style>
      img{
      width:100%;
      height:180px;
      }
      h3{
      color:blue;
      }
      h4{
      color:blue;
      }
      
      </style>  
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <% String s=(String)session.getAttribute("uname");%>
    <% String id=request.getParameter("id");%>

    <script src="js/jquery.js"></script>
	<script>
    $(document).ready(function(){
        var testvalue= "<%=s%>";

            if(testvalue=="null"){
            	window.location.href = "login.jsp";
               
        	    }	
            
            $(document).on("click", ".open-AddBookDialog", function () {
            	var bidval = $(this).data('id'); 
	   		 $("#modaltable").find("tr:gt(0)").remove();
            	$.ajax({
           			
               		type:"POST",
               		url:"Validation",
               		data:{
               			bidvalue:bidval,
               		},
               		datatype:"json",
               		success:function(data){
    					var status=0;
               			for(var a=0 ; a<data.length; a++)
               			{					var bb=	data[a];
               			
               			
           				$('#modaltable tr').eq(0).after('<tr><td>'+bb.username+'</td><td>'+bb.price+'</td><td>'+bb.date+'</td><td>'+bb.time+'</td></tr>');						  
	           			
               			
               			}
               		}
            
        	});     
    			 $('#edit').modal('show'); 
                   	
          	});
            

        var check = "hello";
       		$.ajax({
       			
           		type:"POST",
           		url:"HomeServlet",
           		data:{
           			
           			checkspoint:check,
           			
           		},
           		datatype:"json",
           		success:function(data){
           		
           			for(var a=0 ; a<data.length; a++)
           			{					var bb=	data[a];
           			var currentDate = new Date(bb.closingdate);
           			var day=currentDate.getDate();
           			var month=currentDate.getMonth()+1;
           			var year=currentDate.getFullYear();
           			var time=bb.time;
           			var prices=bb.price;
           			var temp = time.split(":");
           			var selectedhour=(parseInt(temp[0]));
           			var selectedminute=parseInt(temp[1]);
           			var endtime=bb.auctiontime;
           			var endtime=bb.auctiontime;
           			var endtemp = endtime.split(":");
           			var endhour=(parseInt(endtemp[0]));
           			var endminute=parseInt(endtemp[1]);
           			var hour=selectedhour+endhour;
           			var minute=selectedminute+endminute;
           			var status=0;
           			var countDownDate = new Date(currentDate.getMonth()+1+"-"+currentDate.getDate()+"-"+currentDate.getFullYear()+" "+selectedhour+":"+selectedminute+ ":"+currentDate.getSeconds()).getTime();
           		 	var days=0 ;
      			  var hours=0;
      			  var minutes=0;
      			  var seconds=0;
      			 if(bb.auctionType='First price sealed bid auction'){
    	   			 
      			 }
           			var x = setInterval(function() {
					location.reload();
           			}, 1000*60);
           			  // Get todays date and time
           			  var now = new Date().getTime();
           			    
           			  // Find the distance between now and the count down date
           			  var distance = countDownDate - now;
           			    
           			  // Time calculations for days, hours, minutes and seconds
           			 days = Math.floor(distance / (1000 * 60 * 60 * 24));
           			 hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
           			 minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
           			 seconds = Math.floor((distance % (1000 * 60)) / 1000);
           			 
           			  // If the count down is over, write some text 
           			  if (distance < 0) {
           				var getDownDate = new Date(currentDate.getMonth()+1+"-"+currentDate.getDate()+"-"+currentDate.getFullYear()+" "+hour+":"+minute+ ":"+currentDate.getSeconds()).getTime();
           				var distances = getDownDate - now;
             	    
           		 
          			  // Time calculations for days, hours, minutes and seconds
          			 days = Math.floor(distances / (1000 * 60 * 60 * 24));
          			 hours = Math.floor((distances % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
          			 minutes = Math.floor((distances % (1000 * 60 * 60)) / (1000 * 60));
          			 seconds = Math.floor((distances % (1000 * 60)) / 1000);
					if(days>=0){
          			 $('#showimg').after('<div  class="col-lg-4 col-md-4 col-sm-4 mb"><div class="content-panel pn" style="height:300px;"><div id="blog-bg"><div id="getprices" class="badge badge-popular">'+bb.prices+'</div><div class="blog-title">'+bb.name+'</div><img src="data:image/png;base64,' + bb.image + '" width="365" alt=""></div><br><div class="blog-text"><p>'+bb.description+'</p> <p>Closing in:'+days+' d '+hours+' h '+minutes+' m '+minutes+' s  <a href="showAuction.jsp?id='+bb.id+'&status=1">&nbsp&nbspFuther Detail</a></p><a class="btn btn-sm btn-clear-g"  href=welcome.jsp?id='+bb.id+'><img src="assets/like.png" style="width:20px;height:20px"></a></div></div></div>');						  
          			 
           
           			 status=status+2;
					}
					if(distances<0){
               			$('#showimg').after('<div  class="col-lg-4 col-md-4 col-sm-4 mb"><div class="content-panel pn" style="height:300px;"><div id="blog-bg"><div id="getprices" class="badge badge-popular">'+bb.prices+'</div><div class="blog-title">'+bb.name+'</div><img src="data:image/png;base64,' + bb.image + '" width="365" alt=""></div><br><div class="blog-text"><p>'+bb.description+'</p> <p>Closed</p><a href="show.jsp?id='+bb.id+'">Futher Detail</a><br><a href="#edit" data-id='+bb.id+' class="open-AddBookDialog  "  data-toggle="modal" data-target="#edit">Bid History</a></div></div></div>');						  
           			status=status+1;
             	    }
           			  }
           			
           			  if(status==0){			  
				  $('#showimg').after('<div  class="col-lg-4 col-md-4 col-sm-4 mb"><div class="content-panel pn" style="height:300px;"><div id="blog-bg"><div id="getprices" class="badge badge-popular">'+bb.prices+'</div><div class="blog-title">'+bb.name+'</div><img src="data:image/png;base64,' + bb.image + '" width="365" alt=""></div><br><div class="blog-text"><p>'+bb.description+'</p> <p>Open in:'+days+' d '+hours+' h '+minutes+' m '+minutes+' s  <a href="showAuction.jsp?id='+bb.id+'&status=0">&nbsp&nbspFuther Detail</a></p><a class="btn btn-sm btn-clear-g"  href=welcome.jsp?id='+bb.id+'><img src="assets/like.png" style="width:20px;height:20px"></a></div></div></div>');						  
           }
           			}
           					
           	
           		}
        			
           	});
   	   var id= "<%=id%>";
      if(id!="null") {
       	var user= "<%=s%>";
       	$.ajax({
   	   			
   	       		type:"POST",
   	       		url:"WishlistServlet",
   	       		data:{
   	       			userids:user,
   	       			id:id,
   	       		},
   	       		datatype:"json",
   	       		success:function(data){
   	       	
   	       		alert(data);
   	       		}
   	    			
   	       });
   		

   		}	

    });
    function showDays(firstDate,secondDate){
		var startDay = new Date(firstDate);
        var endDay = new Date(secondDate);
        var millisecondsPerDay = 1000 * 60 * 60 * 24;
		var millisBetween = startDay.getTime() - endDay.getTime();
  		var days = millisBetween / millisecondsPerDay;
		return( Math.floor(days));}
    
    function showHours(firstDate,secondDate){
		var startDay = new Date(firstDate);
        var endDay = new Date(secondDate);
        var millisecondsPerDay = 1000 * 60 * 60 * 24;
		var hour=1000*60*60;
	    var millisBetween = startDay.getTime() - endDay.getTime();
  		var gethours=millisBetween/hour;
        return( Math.floor(gethours));}
    
    function showMinutes(firstDate,secondDate){
		var startDay = new Date(firstDate);
        var endDay = new Date(secondDate);
        var millisecondsPerDay = 1000 * 60 * 60 * 24;
		var minute=1000*60;
        var millisBetween = startDay.getTime() - endDay.getTime();
  		var getminute=millisBetween/minute;
		return( Math.floor(getminute));}
        
    
    </script>

  </head>

  <body>
  <section id="container">
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
          	<h3><i class="fa fa-angle-right"></i>Welcome Back</h3>
          	<h4><%=s%></h4>
      				<div class="row" id="showimg">
					
					</div>
					<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Bidding Detail</h4>
      </div>
          <div class="modal-body">
                   	<div class="col-lg-12">
                <span id="msg"></span>
                 <div class="table-responsive">

                
              <table id="modaltable" class="table table-bordered table-striped table-condensed cf">
                   
                   <thead>
                   
        			<th>UserName</th>
                   <th>Bid</th>
              		<th>Date</th>
                   	<th>Bid timestamp</th>
              
                    </thead>
 
 <div id="data">
 </div>
 
    <tbody>
   
    </tbody>
        
</table>
         
        </div>
        
        
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
           <div class="modal-footer ">
      </div>
        
   </div></div></div>
					
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
	
	<script type="text/javascript" src="assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	
	
	<script src="assets/js/form-component.js"></script>    
    
    

  </body>
</html>
	