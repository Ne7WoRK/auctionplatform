<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Auction Detail</title>
	<style>
  img{
      width:400px;
      height:300px;
      }

	table {
border-collapse: collapse;width: 90%;  font-size: 18px; color: blue;   font-family: "Times New Roman", Times, serif; table-layout: auto; }

th, td {
  padding: 12px;
}
      
h3{color:blue;
      } 
      .modal-dialog {
    width: 800px;
    margin: 30px auto;
}
	#anothertable{
font-size: 15px; color: blue;   font-family: "Times New Roman", Times, serif; }

tr:nth-child(even){background-color: #f3f3f3}
$('#anothertable').css( 'display', 'block' );
table.columns.adjust().draw();

	</style>
	<style>
	     h3{
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
    <% String id=(String)request.getParameter("id");%>
    <% String s=(String)session.getAttribute("uname");%>

    <script src="js/jquery.js"></script>
    
	<script>
    $(document).ready(function(){
        var uservalue="<%=s%>";
        if(uservalue=="null"){
         	window.location.href = "login.jsp";
            
     	    }
        $('#create').on('click', function() {
            var bidval= "<%=id%>";
			 $("#msg").html("<span  style='font-size:20px;color:red'></span>");
			 $("#modaltable").find("tr:gt(0)").remove();
			 $("#anothertable").find("tr:gt(0)").remove();
		       
			 $('#link').html("");
           		
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
           			$('#msg').remove();
           			if(bb.auctiontype=='English Auction'){
           			 $('#anothertable').hide('show'); 
           	        	$('#modaltable tr').eq(0).after('<tr><td>'+bb.username+'</td><td>'+bb.price+'</td><td>'+bb.date+'</td><td>'+bb.time+'</td></tr>');						  
               		}
               		if(bb.auctiontype=='First price sealed bid auction'){
               		 $('#modaltable').hide('show');
               			$('#anothertable tr').eq(0).after('<tr><td>'+bb.username+'</td><td>'+bb.price+'</td><td>'+bb.sigval+'</td><td>'+bb.publickey+'</td></tr>');						  
                   		}
        	}
           		}
        
    	});     
        	
        	$('#edit').modal('show'); 
      	});
         	

        var val= "<%=id%>";
        $.ajax({
   			
       		type:"POST",
       		url:"Validation",
       		data:{
       			queryvalue:val,
       		},
       		datatype:"json",
       		success:function(data){

       			for(var a=0 ; a<data.length; a++)
       			{					var bb=	data[a];
       			if(bb.auctionType=="First price sealed bid auction"){
       				var startdate=new Date(bb.startDate);
       				var starttime=bb.starttime;
           			var auctiontime=bb.auctiontime;
           			var currentdate=new Date();
           			var temp = starttime.split(":");
           			var selectedhour=(parseInt(temp[0]));
           			var selectedminute=parseInt(temp[1]);
           			var currenthour=currentdate.getHours();
           			var currentminute=currentdate.getMinutes();
       				var day=startdate.getDate();
       				var currentday=currentdate.getDate();
       				var month=startdate.getMonth()+1;
       				var currentmonth=currentdate.getMonth()+1;
       				var year=startdate.getFullYear(); 
       				var currentyear=startdate.getFullYear();
           			if(currentday>=day && currentmonth==month && currentyear==year){
           					if(selectedhour<=currenthour && currentminute<=currentminute ){           				
           	$('#showimg').html('<div><img src="data:image/png;base64,' + bb.image + '" /></a><table class="table-condensed "   style=" th, td {padding: 12px;} "><tr><td>ID</td><td>'+bb.id+'</td></tr><tr><td>Product Name</td><td>'+bb.name+'</td></tr><tr><td>Category</td><td>'+bb.category+'</td></tr><tr><tr><td>Product Description</td><td>'+bb.description+'</td></tr><tr><td>Start Date</td><td>'+bb.startDate+'&nbsp&nbsp&nbsp'+bb.starttime+' </td></tr><tr><td>Auction Type</td><td>'+bb.auctionType+'</td></tr><tr><td>Won By</td><td>'+bb.wonuser+'</td></tr><tr><td >'+bb.message+'</td></tr></tr></table><br></div>');						  
          		}
					else{
           				
						$('#showimg').html('<div><img src="data:image/png;base64,' + bb.image + '" /></a><table class="table-condensed "   style=" th, td {padding: 12px;} "><tr><td>ID</td><td>'+bb.id+'</td></tr><tr><td>Product Name</td><td>'+bb.name+'</td></tr><tr><td>Category</td><td>'+bb.category+'</td></tr><tr><td>Product Description</td><td>'+bb.description+'</td></tr><tr><td>Start Date</td><td>'+bb.startDate+'&nbsp&nbsp&nbsp'+bb.starttime+'</td></tr><tr><td>Auction Type</td><td>'+bb.auctionType+'</td></tr><tr><td></td></tr><tr><td>Won By</td><td>'+bb.wonuser+'</td></tr><tr><td >'+bb.message+'</td></tr><tr><td style="color:red"></td></tr></table><br></div>');						  

					}
         			}
         			
         			else{
           				
         				$('#showimg').html('<div><img src="data:image/png;base64,' + bb.image + '" /></a><table class="table-condensed "   style=" th, td {padding: 12px;} "><tr><td>ID</td><td>'+bb.id+'</td></tr><tr><td>Product Name</td><td>'+bb.name+'</td></tr><tr><td>Category</td><td>'+bb.category+'</td></tr><tr><td>Product Description</td><td>'+bb.description+'</td></tr><tr><td>Start Date</td><td>'+bb.startDate+'&nbsp&nbsp&nbsp'+bb.starttime+'</td></tr><tr><td>Auction Type</td><td>'+bb.auctionType+'</td></tr><tr><td>Won By</td><td>'+bb.wonuser+'</td></tr><tr><td>'+bb.message+'</td></tr><tr><td></td></tr></table><br></div>');						  
                  	
         			}

         			    	
       		 	}
       			else{
       			$('#showimg').html('<div><img src="data:image/png;base64,' + bb.image + '" /></a><table class="table-condensed "   style=" th, td {padding: 12px;} "><tr><td>ID</td><td>'+bb.id+'</td></tr><tr><td>Product Name</td><td>'+bb.name+'</td></tr><tr><td>Category</td><td>'+bb.category+'</td></tr><tr><td>Product Description</td><td>'+bb.description+'</td></tr><tr><td>Current highest bid(Price)</td><td>'+bb.price+'</td></tr><tr><td>Start Date</td><td>'+bb.startDate+'&nbsp&nbsp&nbsp'+bb.starttime+'</td></tr><tr><td>Auction Type</td><td>'+bb.auctionType+'</td></tr><tr><td>Won By</td><td>'+bb.wonuser+'</td></tr><tr><td>'+bb.message+'</td></tr></table><br></div>');						  
       		  	
       			}
       			}
       		}
    
	});

    });
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
          	<h3><i class="fa fa-angle-right"></i>Show Auction</h3>
          	          	
    
          	          	<div id="showimg">
          	</div>
          	
          	<span  style='font-size:20px;color:red'>Bidding on this product has closed</span>
          <br>
          	      <button   id="create" class="btn btn-primary">Bid History</button>
          	
      <!--footer end-->
      
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Bid History</h4>
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
              <table id="anothertable" class="table table-bordered table-striped table-condensed cf">
                   
                   <thead>
                   
        			<th>UserName</th>
                   <th>Bid</th>
              		<th>Signature</th>
                   	<th >Public Key</th>
              
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
<!-- /form-panel -->
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
