<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>My Auction</title>
<style>
header { 
    background-color: block;
}
  img{
      width:100%;
      height:180px;
      }
      #bg{
      color:blue;
      }
    
</style>
  
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

 <script src="js/jquery.js"></script>
<% String s=(String)session.getAttribute("uname");%>
          <script >
         $(document).ready(function(){
             
             var uservalue="<%=s%>";
             if(uservalue=="null"){
              	window.location.href = "login.jsp";
                 
          	    }
              
             $.ajax({
                    	type:"POST",
                 		url:"Validation",
                 		data:{
                 			mylist:uservalue,
               				 			
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
                  			 $('#showimg').after('<div  class="col-lg-4 col-md-4 col-sm-4 mb"><div class="content-panel pn" style="height:300px;"><div id="blog-bg"><div class="badge badge-popular">'+bb.price+'$</div><div class="blog-title">'+bb.name+'</div><img src="data:image/png;base64,' + bb.image + '" width="365" alt=""></div><br><div class="blog-text"><p>'+bb.description+'</p> <p>Closing in:'+days+' d '+hours+' h '+minutes+' m '+minutes+' s  <a href="showAuction.jsp?id='+bb.id+'">&nbsp&nbspFuther Detail</a></p><a class="btn btn-sm btn-clear-g"  href=welcome.jsp?id='+bb.id+'><img src="assets/like.png" style="width:20px;height:20px"></a></div></div></div>');						  
                   
                   			 status=status+2;
        					}
        					if(distances<0){
                       			$('#showimg').after('<div  class="col-lg-4 col-md-4 col-sm-4 mb"><div class="content-panel pn" style="height:300px;"><div id="blog-bg"><div class="badge badge-popular">'+bb.price+'$</div><div class="blog-title">'+bb.name+'</div><img src="data:image/png;base64,' + bb.image + '" width="365" alt=""></div><br><div class="blog-text"><p>'+bb.description+'</p> <p>Closed</p></div></div></div>');						  
                   			status=status+1;
                     	    }
                   			  }
                   			
                   			  if(status==0){			  
        				  $('#showimg').after('<div  class="col-lg-4 col-md-4 col-sm-4 mb"><div class="content-panel pn" style="height:300px;"><div id="blog-bg"><div class="badge badge-popular">'+bb.price+'$</div><div class="blog-title">'+bb.name+'</div><img src="data:image/png;base64,' + bb.image + '" width="365" alt=""></div><br><div class="blog-text"><p>'+bb.description+'</p> <p>Open in:'+days+' d '+hours+' h '+minutes+' m '+minutes+' s  <a href="showAuction.jsp?id='+bb.id+'">&nbsp&nbspFuther Detail</a></p><a class="btn btn-sm btn-clear-g"  href=welcome.jsp?id='+bb.id+'><img src="assets/like.png" style="width:20px;height:20px"></a></div></div></div>');						  
                   }
                   			}
                   					
                   	
                 			
                 			
                 			
                 			
                 			
                 			
                 			
                 			
                 			
        }
                      });
                });

         function showDays(firstDate,secondDate){
             
             

             var startDay = new Date(firstDate);
             var endDay = new Date(secondDate);
             var millisecondsPerDay = 1000 * 60 * 60 * 24;

             var millisBetween = startDay.getTime() - endDay.getTime();
             var days = millisBetween / millisecondsPerDay;

             // Round down.
             return( Math.floor(days));}


         			
         
         </script>
 

	
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg" >
      <!--header start-->
              <div class="sidebar-toggle-box" style="background-color: block;">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
                      
            	</ul>
            </div>
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
          	<h3 id="bg"><i class="fa fa-angle-right"></i> My Auction</h3>

                     				<div class="row" id="showimg">
					
					</div>
  
            
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
          <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
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
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
