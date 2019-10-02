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

        var check = "hello";
			var x = setInterval(function() {
				location.reload();

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
           			var firstDate=new Date(bb.closingdate);
           			var secondDate=new Date();
           			var currentdate=new Date();
           			var days=showDays(firstDate, secondDate);
           			var dayval=days*24;
           			var hours=showHours(firstDate, secondDate);
           			var mintval=hours*60;
           			var hourval=hours-dayval;
           			var minutes=showMinutes(firstDate, secondDate);
           			var totalminute=minutes-mintval;
           			var time=bb.time;
           			var endtime=bb.auctiontime;
           			var temp = time.split(":");
           			var selectedhour=(parseInt(temp[0]));
           			var selectedminute=parseInt(temp[1]);
           			var endtemp = endtime.split(":");
           			var endhour=(parseInt(endtemp[0]));
           			var endminute=parseInt(endtemp[1]);
           			var getminute=(selectedminute+endminute);
           			var gethour=(selectedhour+endhour);
           			var currenthour=secondDate.getHours();
           			var currentminute=secondDate.getMinutes();
           			
           			if(secondDate>=firstDate){
           			if(currenthour>=gethour && currentminute>=getminute)
           			{	
           				
           			 	var id= bb.id;
           				$.ajax({
           	   	   			
           	   	       		type:"POST",
           	   	       		url:"WonServlet",
           	   	       		data:{
           	   	       			wonid:id,
           	   	       		},
           	   	       		datatype:"json",
           	   	       		success:function(data){
           	   	       		alert(data);
           	   	       		}
           	   	    			
           	   	       });
           			}
           			
           			}
           	$('#showimg').after('<div  class="col-lg-4 col-md-4 col-sm-4 mb"><div class="content-panel pn" style="height:300px;"><div id="blog-bg"><div class="badge badge-popular">'+bb.price+'$</div><div class="blog-title">'+bb.name+'</div><img src="data:image/png;base64,' + bb.image + '" width="365" alt=""></div><br><div class="blog-text"><p>'+bb.description+'</p> <p>Open in:'+days+' Days '+gethour+' Hours '+getminute+' Minutes  <a href="showAuction.jsp?id='+bb.id+'">&nbsp&nbspFuther Detail</a></p><a class="btn btn-sm btn-clear-g"  href=welcome.jsp?id='+bb.id+'><img src="assets/like.png" style="width:20px;height:20px"></a></div></div></div>');						  
           					
           			}
           		}
        			
           	});
   			}, 1000*60);

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
   	       	
   	       		alert(data.id);
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
