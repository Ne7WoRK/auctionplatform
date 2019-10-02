<!DOCTYPE html>
<html lang="en">
  <head>

    <title>Payment Method</title>
<style>
header { 
    background-color: block;
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
             var uservalues="<%=s%>";
             if(uservalues=="null"){
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
           				$('#showimg').after('<div id="paypanel"   class="col-lg-4 col-md-4 col-sm-4 mb"><div class="product-panel-2 pn"><div class="badge badge-popular">'+bb.cardType+'</div><br><br><br><br><br><h4> Card No: '+bb.newcardNo+'</h4><h4>Expire Date: '+bb.expiry+'</h4><h4>Balance: '+bb.balance+'</h4><h4>Limit: '+bb.limit+'</h4><a href="paymentFunc.jsp?actions=2&val='+bb.userid+'&id='+bb.id+'">Edit</a><br><a href="payment.jsp?id='+bb.id+'">Delete</a></div>');						  

       					}
       					else{
       						
       					}
       						}
       					
       		    
       		       		
       		       		}
       		    			
       		       });

       		  		
       				
       					if(<%=request.getParameter("id")%>!=null){
       		   			var removeval ="<%=request.getParameter("id")%>";
       		   			$.ajax({
       		   	   			
       		   	       		type:"POST",
       		   	       		url:"Validation",
       		   	       		data:{
       		   	       			
       		   	       			removecarddata:removeval,
       		   	       			
       		   	       		},
       		   	       		datatype:"json",
       		   	       		success:function(data){
       		   				alert(data);
       		   	       		
       		   	       		}
       		   	    			
       		   	       });
       		   		

       					}
       		   		
       		  		
       		  		
       		  		
       	 });
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
          	<h3 id="bg"><i class="fa fa-angle-right"></i> Payment Method </h3>
        <div class="col-md-12">
 <button class="btn btn-theme" type="button" onclick="window.location.href='paymentFunc.jsp?actions=1'">Add Payment Method</button>
       
                     				<div class="row mt" id="showimg">
					
					</div>


          	
          			</div><!-- /form-panel -->
          	


          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
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
