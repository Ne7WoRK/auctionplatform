/**
 * 
 */
/*$(document).on("click",".menu , .header, input[type=button],input[type=submit],button",function(){
	getFullName();
});	*/



/*
$(function(){
        $(".menu , .header, input[type=button],input[type=submit],button").each(function(){
          var onclickfunc = $(this).attr('onclick');
          $(this).attr('onclick','');
          $(this).on('click',function(){
          if(getFullName()){
          // eval(onclickfunc);
          }
         });
    });
    });
*/
function toggleGlobal(){
	
	var status=false;
	if($('#globalCheck').prop('checked')){
		
		status=true;
	}
	$.ajax({
		url:'rest/LoginRESTService/toggleGlobal',
		type: "POST",
		async:false,
		data:{
			status:status,
		
		},
		success:function(res){
		}
		});
}
function showProfileDetail(){
	$("#firstPageProfile .validate-required-error1").hide();
	$('#nextButton').prop('disabled', false);
	$("#profilePassword").val("");
	$("#profileConfirmPassword").val("");
	$("#profileVerificationCode").val("");
	$("#profileAuthenticationFeatureActive").prop('checked',false);
	$("#profileAuthenticationFeatureInActive").prop('checked',false);
	$.ajax({
		url : 'rest/UserRESTService/getUserProfileDetail',
		type : 'POST',
		success : function(data) {
			userDTO = data.userDTO;
			employeeDTO = data.employeeDTO;
			$("#profilePhoneNumber").val(employeeDTO.mobileNumber);
			if(userDTO.authenticationFeature=="true")
				{
					$("#profileAuthenticationFeatureActive").prop('checked',true);
				}
			else{
					$("#profileAuthenticationFeatureInActive").prop('checked',true);
				}
	$("#light").css("display", "block");
	$("#fade").css("display", "block");
			}
	});	
}
function hideProfileDetail(){
	$("#light").css("display", "none");
	$("#fade").css("display", "none");
	$("#validate-phone").hide();
	$("#validate-password").hide();
	$("#firstPageProfile").show();
	$("#secondPageProfile").hide();
}

function validateProfileDetailForm(){
	if($("#profileVerificationCode").val().trim()==""){
		$("#validate-required-code").show();
		return false;
	}
	else{
		$("#validate-required-code").hide();
	}
	$.ajax({
		url : 'rest/UserRESTService/updateUserProfileDetail',
		type : 'POST',
		data :{
			profileAuthenticationFeature:$('input[name=profileAuthenticationFeature]:checked', '#user-form').val(),
			profilePassword:$("#profilePassword").val(),
			profilePhoneNumber:$("#profilePhoneNumber").val(),
			profileVerificationCode:$("#profileVerificationCode").val()
			
		},
		success : function(data) {
			if(data.message=='Wrong Code'){
				$.notify(data.message,{position: 'right bottom',className:"error"});
			}
			else {
			hideProfileDetail();
			
				$.notify(data.message,{position: 'right bottom',className:"success"});
			}
		}
	});
	return false;
}
function resendCode(){
	$.ajax({
		url:'rest/LoginRESTService/sendCodeViaSMS',
		type: "POST",
		async:false,
		success:function(data){
			$.notify(data.message,{position: 'right bottom',className:"success"});
			}
		});
}

function nextForm(){
	$("#validate-phone").hide();
	$("#validate-password").hide();
	if(!validateGenericAllRequired3()){
		return false;
	}
	if($("#profilePhoneNumber").val().trim()==""){
		$("#validate-phone").show();
		return false;
	}
	else{
			$("#validate-phone").hide();
		}
	if( $("#profilePassword").val().trim()!==($("#profileConfirmPassword").val().trim()))
		{
			$("#validate-password").show();
				return false;
	}
	else{
			$("#validate-password").hide();
	}
	resendCode();
	$("#firstPageProfile").hide();
	$("#secondPageProfile").show();
	$('#nextButton').prop('disabled', true);
	return false;
}
$(document).on("click",'#hide-roads',function(){
	
	$("#roads-inner").slideToggle('fast');
	$("#roads-upper").toggle();
	$("#roads-down").toggle();

});

$(document).on("click",'#hide-adp',function(){
	
	$("#adp-inner").slideToggle('fast');
	$("#adp-upper").toggle();
	$("#adp-down").toggle();

});

$(document).on("click",'#hide-bridges',function(){
	
	$("#bridges-inner").slideToggle('fast');
	$("#bridge-upper").toggle();
	$("#bridge-down").toggle();

});

$(document).on("click",'#hide-roadparam',function(){
	
	$("#roadparam-inner").slideToggle('fast');
	$("#roadparam-upper").toggle();
	$("#roadparam-down").toggle();	
});

$(document).on("click",'#hide-bridgeparam',function(){
	
	$("#bridgeparam-inner").slideToggle('fast');
	$("#bridgeparam-upper").toggle();
	$("#bridgeparam-down").toggle();	
});


$(document).on("click",'#hide-workListparam',function(){
	
	$("#workListparam-inner").slideToggle('fast');
	$("#workListparam-upper").toggle();
	$("#workListparam-down").toggle();	
});

$(document).on("click",'#hide-culvertparam',function(){
	
	$("#culvertparam-inner").slideToggle('fast');
	$("#culvertparam-upper").toggle();
	$("#culvertparam-down").toggle();	
});


$(document).on("click",'#hide-system',function(){
	
	$("#system-inner").slideToggle('fast');
	$("#system-upper").toggle();
	$("#system-down").toggle();	
});

$(document).on("click",'#hide-buildings',function(){
	
	$("#buildings-inner").slideToggle('fast');
	$("#buildings-upper").toggle();
	$("#buildings-down").toggle();	
});
$(document).on("click",'#hide-humanr',function(){
	
	$("#humanr-inner").slideToggle('fast');
	$("#humanr-upper").toggle();
	$("#humanr-down").toggle();	
});
$(document).on("click",'#hide-reports',function(){
	
	$("#reports-inner").slideToggle('fast');
	$("#reports-upper").toggle();
	$("#reports-down").toggle();	
});

$(document).on("click",'#hide-reports-system-setup',function(){
	
	$("#reports-inner-system-setup").slideToggle('fast');
	$("#reports-system-setup-upper").toggle();
	$("#reports-system-setup-down").toggle();	
});
$(document).on("click",'#hide-reports-humans',function(){
	
	$("#reports-inner-humans").slideToggle('fast');
	$("#reports-humans-upper").toggle();
	$("#reports-humans-downs").toggle();	
});

$(document).on("click",'#hide-reports-buildings',function(){
	
	$("#reports-inner-buildings").slideToggle('fast');
	$("#reports-buildings-upper").toggle();
	$("#reports-buildings-down").toggle();	
});

$(document).on("click",'#hide-reports-human-resource',function(){
	
	$("#reports-inner-human-resource").slideToggle('fast');
	$("#reports-human-resource-upper").toggle();
	$("#reports-human-resource-down").toggle();	
});

$(document).on("click",'#hide-reports-roads',function(){
	
	$("#reports-inner-roads").slideToggle('fast');
	$("#reports-roads-upper").toggle();
	$("#reports-roads-down").toggle();	
});

$(document).on("click",'#hide-reports-bridges',function(){
	
	$("#reports-inner-bridges").slideToggle('fast');
	$("#reports-bridges-upper").toggle();
	$("#reports-bridges-down").toggle();	
});

$(document).on("click",'#hide-charts',function(){
	
	$("#charts-inner").slideToggle('fast');
	$("#charts-upper").toggle();
	$("#charts-down").toggle();

});


$(document).on("click",'#hide-reports-adp',function(){
	
	$("#reports-inner-adp").slideToggle('fast');
	$("#reports-adp-upper").toggle();
	$("#reports-adp-down").toggle();	
});


	$(document).on("click",'.togglemenu',function(){
		if(!jQuery(this).hasClass('togglemenu_collapsed')) {
			
			//if(jQuery('.iconmenu').hasClass('vernav')) {
			if(jQuery('.vernav').length > 0) {
				if(jQuery('.vernav').hasClass('iconmenu')) {
					jQuery('body').addClass('withmenucoll');
					jQuery('.iconmenu').addClass('menucoll');
				} else {
					jQuery('body').addClass('withmenucoll');
					jQuery('.vernav').addClass('menucoll').find('ul').hide();
				}
			} else if(jQuery('.menu').length > 0) {
			//} else {
				jQuery('body').addClass('withmenucoll2');
				jQuery('.iconmenu').addClass('menucoll2');
			}
			
			jQuery(this).addClass('togglemenu_collapsed');
			
			jQuery('.iconmenu > ul > li > a').each(function(){
				var label = jQuery(this).text();
				jQuery('<li><span>'+label+'</span></li>')
					.insertBefore(jQuery(this).parent().find('ul li:first-child'));
			});
		} else {
			
			//if(jQuery('.iconmenu').hasClass('vernav')) {
			if(jQuery('.vernav').length > 0) {
				if(jQuery('.vernav').hasClass('iconmenu')) {
					jQuery('body').removeClass('withmenucoll');
					jQuery('.iconmenu').removeClass('menucoll');
				} else {
					jQuery('body').removeClass('withmenucoll');
					jQuery('.vernav').removeClass('menucoll').find('ul').show();
				}
			} else if(jQuery('.menu').length > 0) {	
			//} else {
				jQuery('body').removeClass('withmenucoll2');
				jQuery('.iconmenu').removeClass('menucoll2');
			}
			jQuery(this).removeClass('togglemenu_collapsed');	
			
			jQuery('.iconmenu ul ul li:first-child').remove();
		}
	});
		
function checkSecondAuthenticationStatus(){
	
	$.ajax({
		url:'rest/LoginRESTService/isVerificationRequired',
		type: "POST",
		async:false,
		data:{
			username:$("#userName").val(),
		
		},
		success:function(data){				
			
			return data;
		
	},
	
});

	
}

$(document).on('submit', 'form.ajax-form', function() {

	$.ajax({
		url : $(this).attr('action'),
		type : $(this).attr('method'),
		data : $(this).serialize(),
		success : function(data) {
			hideShowMenu();
			if(data.status == true){
				$.notify(data.message,{position: 'right bottom',className:"success"});
				setContent(data.url,'');
			}else if(data.status == false){
				$.notify(data.message,{ position: 'right bottom',className:"error"} );
				$("#loginmsg").html(data.message);			
			}

		}

	});

	return false;
});


$(document).on('submit', 'form.ajax-form-login', function() {
	// Hide previously shown notify.js notifications - Trick (notify.js automatically hides notifications when clicked)
	$(".notifyjs-wrapper").click();
	$.ajax({
		url : $(this).attr('action'),
		type : $(this).attr('method'),
		data : $(this).serialize(),
		success : function(data) {
			$(".loginBtn").attr("disabled","true");
			hideShowMenu();
			if(data.status == true){
				setContent(data.url,'');
				$.notify(data.message,{position: 'right bottom',className:"success"});
				urlLoad = "rest/LoginRESTService/getUserImage";
				$.ajax({url:urlLoad,
					type:"POST",
					success:function(result) {
						if(result!==undefined){
							$("#imgThumb").attr("src","data:image/jpg;base64," + result);
						}else{
							
							$("#imgThumb").attr("src","images/thumbs/avatar.png");
						}
				}
				});
			}else if(data.status == false){
				$(".loginBtn").removeAttr("disabled");
				$.notify(data.message,{ position: 'right bottom',className:"error"} );
				$("#recover").empty();
				$("#recover").prepend("<label class='label' onClick='showRecoverDetail();'> Recover Password </label><br>");
				$("#loginmsg").html(data.message);			
			}

		}

	});

	return false;
});

$(document).on('submit', 'form.ajax-multipart-form', function() {

	var formData = new FormData($(this)[0]);
	$.ajax({
		url : $(this).attr('action'),
		type : $(this).attr('method'),
		data : formData,
		processData : false,
		contentType : false,
		success : function(data) {
			hideShowMenu();
			if(data.status == true){
				$.notify(data.message,{position: 'right bottom',className:"success"});
				setContent(data.url,'');
			}else{
				$.notify(data.message,{ position: 'right bottom',className:"error"} );
				$("#loginmsg").html(data.message);			
			}
		}

	});

	return false;
});


function setContent(url, restUrl) {
	
	
	$.ajax({
		url : url,
		cache : false,
		success : function(result) {
			$("#centercontent").html(result);
			hideShowMenu();
			validateIntegerValues();
			validateFloatingValues();
					}
	});
}


function toggleCollasped()
{
	

	if(jQuery(".togglemenu").hasClass('togglemenu_collapsed')) {
		if(jQuery('.vernav').length > 0) {
			if(jQuery('.vernav').hasClass('iconmenu')) {
				jQuery('body').removeClass('withmenucoll');
				jQuery('.iconmenu').removeClass('menucoll');
			} else {
				jQuery('body').removeClass('withmenucoll');
				jQuery('.vernav').removeClass('menucoll').find('ul').show();
			}
		} else if(jQuery('.menu').length > 0) {	
		//} else {
			jQuery('body').removeClass('withmenucoll2');
			jQuery('.iconmenu').removeClass('menucoll2');
		}
		jQuery(this).removeClass('togglemenu_collapsed');	
		
		jQuery('.iconmenu ul ul li:first-child').remove();
	}


	jQuery(".togglemenu").removeClass('togglemenu_collapsed');


}


function hideShowMenu() {

//	var menuHeight = window.innerHeight - 180 - 60;
	var login = document.getElementById("login");
	var menu = document.getElementById("left-menu");
	var loginPanel = document.getElementById("headerfile");
	var verifyCodeForm=document.getElementById("verifyCodeForm");

	if (login !== undefined && login !== null ) {
		menu.setAttribute("style", "display: none;");
		loginPanel.setAttribute("style", "visibility: hidden;");
		$("#hideMenu").hide();
		$("#showMenu").hide();
		$("#loginmsg").show();
		$("#header-menu").hide();
	}else if(verifyCodeForm !== undefined && verifyCodeForm !== null ){
		menu.setAttribute("style", "display: none;");
		loginPanel.setAttribute("style", "visibility: hidden;");
		$("#hideMenu").hide();
		$("#showMenu").hide();
		$("#loginmsg").show();
		$("#header-menu").hide();
	}
	else {
		
		if($("#loggedin-hidden").html() == ""){
			$("#loggedin-hidden").html("loggedin");
			//$("#header-menu").load("menu/header-menu.jsp");
		}
		menu.setAttribute("style", "display: block;");
		loginPanel.setAttribute("style", "display: block;");
		getFullName();
		$("#hideMenu").show();
		$("#header-menu").show();
		
	}
}


/*function hideShowMenu() {

//	var menuHeight = window.innerHeight - 180 - 60;
	var login = document.getElementById("login");
	var menu = document.getElementById("left-menu");
	var loginPanel = document.getElementById("headerfile");

	if (login !== undefined && login !== null) {
		menu.setAttribute("style", "display: none;");
		loginPanel.setAttribute("style", "visibility: hidden;");
		$("#hideMenu").hide();
		$("#showMenu").hide();
		$("#loginmsg").show();
		$("#header-menu").hide();
	} else {
		
		if($("#loggedin-hidden").html() == ""){
			$("#loggedin-hidden").html("loggedin");
			//$("#header-menu").load("menu/header-menu.jsp");
		}
		menu.setAttribute("style", "display: block;");
		loginPanel.setAttribute("style", "display: block;");
		getFullName();
		$("#hideMenu").show();
		$("#header-menu").show();
		
	}
}
*/




function getFullName() {
	urlLoad = "rest/LoginRESTService/getUserFullName";
	$.ajax({url:urlLoad,
		type:"POST",
		success:function(result) {
			if(result!==undefined){
			document.getElementById("userFullName").innerHTML = result;
			}else{
				setContent("login/login.jsp", "");
			}

	}
	});

}

function populateYearCombo(){
	var max = 2020,
	min=2008;
	var html="";

	for (var i = min; i<=max; i++){

		html+="<option value="+i+">"+i+"</option>\n";
	}

	$("#year").append(html);
}


function populateCombo(comboId, listOfObjects,objectId,ObjectName){
	var combo = $("#"+comboId);
	if(listOfObjects!= undefined )
	for ( var i = 0; i < listOfObjects.length ; i++) {
	combo.append(new Option(_.property(ObjectName)(listOfObjects[i]),_.property(objectId)(listOfObjects[i])));	
	}///End of User for loop	
}

function clearCombo(comboId){
	var combo = $("#"+comboId);	
	combo.prop('options').length=1 ;
}


function populateCategoryCombo(comboId, listOfObjects){
	var combo = $("#"+comboId);
	if(listOfObjects!= undefined )
	for ( var i = 0; i < listOfObjects.length ; i++) {
	combo.append(new Option(listOfObjects[i]));	
	
	}///End of User for loop	
}

function testRegexString(regexString,regexValue){
	
    var regexer = new RegExp(regexString);
    return regexer.test(regexValue);
	
}

function testRegexLiteral(regexerLiteral,regexValue){
    return regexer.test(regexValue);
	
}

function showMenu(menu){
	

	$( ".mainMenu" ).removeClass("current");
	$("#"+menu).addClass("current");
	$("#"+menu).addClass("mainMenu");
		$("#left-menu").load("menu/"+menu+"-menu.jsp");
		//setContent("dashboard/dashboard-human-resource-temp.jsp", "");
		//setContent("dashboard/dashboard.jsp", "");
		setContent("dashboard/"+menu+"-dashboard.jsp", "");
	
	
}

/**
 * @note date1 and date2 accepts date of format YYYY-MM-DD
 * @param date1
 * @param date2
 * @returns return true if date1 is equals to date2.
 */

var dateFormate='dd-M-y';
function compareDateEquals(date1 , date2){
	var d1 = new Date($.datepicker.parseDate(dateFormate,date1));
	var d2= new Date($.datepicker.parseDate(dateFormate,date2));
	return d1.getTime()==d2.getTime();
}

/**
 * @note date1 and date2 accepts date of format YYYY-MM-DD
 * @param date1
 * @param date2
 * @returns return true if date1 comes after date2.
 */
function compareDateGreaterThan(date1 , date2){
	var d1 = new Date($.datepicker.parseDate(dateFormate,date1));
	var d2= new Date($.datepicker.parseDate(dateFormate,date2));

	return d1.getTime()>d2.getTime();

}

function compareDateGreaterThanBuildingAsset(date1 , date2){
	var d1 = new Date($.datepicker.parseDate('dd-M-yy',date1));
	var d2= new Date($.datepicker.parseDate('dd-M-yy',date2));

	return d1.getTime()>d2.getTime();

}



function compareValuesGreaterThan(lowerValue , upperValue){

	return upperValue>lowerValue ;

}

/**
 * @note date1 and date2 accepts date of format YYYY-MM-DD
 * @param date1
 * @param date2
 * @returns return true if date1 comes after or equals to date2.
 */
function compareDateGreaterThanOrEquals(date1 , date2){
	var d1 = new Date($.datepicker.parseDate(dateFormate,date1));
	var d2= new Date($.datepicker.parseDate(dateFormate,date2));
	return d1.getTime()>=d2.getTime();

}
function compareDateGreaterThanOrEqualsScheme(date1, date2){

	var d1 = new Date($.datepicker.parseDate('dd-M-yy',date1));
	var d2= new Date($.datepicker.parseDate('dd-M-yy',date2));
    
	return d1.getTime()>=d2.getTime();
}

function validateGenericAllRequired(){
	var flag=true;
	$(".stdform .validate-required-error").remove();
	$(".validate-required").each(function(i){
		if($.trim( $(this).val())==""){
		$(this).closest("p").before($("#validate-required-error").clone());
		
		var $validateRequiredError = $(this).closest("p").prev() ;
		$validateRequiredError.removeAttr("id");
		$validateRequiredError.attr("class","validate-required-error non-readonly");
		
		var $validateRequiredMessage = $(this).attr("validate-required-message");
		if($validateRequiredMessage != undefined){			
			var $defaultErrorMessage = $validateRequiredError.find(".msgerror");
			$defaultErrorMessage.html($validateRequiredMessage);
		}		
		
		if(flag){
			flag=false;
		}
		}
	});
	
	$(".stdform .validate-required-error").show();
	return flag;
}


function validateGenericAllRequired1(){

	var flag=true;
	$(".validate-form1 .validate-required-error1").remove();
	$(".validate-required1").each(function(i){
		if($.trim( $(this).val())==""){
		//$(this).closest("p").before($("#validate-required-error1").clone());
			$(this).closest("div").before($("#validate-required-error1").clone());
		
		var $validateRequiredError = $(this).closest("div").prev() ;
		$validateRequiredError.removeAttr("id");
		$validateRequiredError.attr("class","validate-required-error1 non-readonly msgerror");
		
		var $validateRequiredMessage = $(this).attr("validate-required-message1");
		if($validateRequiredMessage != undefined){			
			//var $defaultErrorMessage = $validateRequiredError.find(".msgerror");
			$validateRequiredError.html($validateRequiredMessage);
		}		
		
		if(flag){
			flag=false;
		}
		}
	});
	
	$(".validate-form1 .validate-required-error1").show();
	return flag;
}

function validateSearchGenericAllRequired1(){

	var flag=true;
	$(".validate-form1 .validate-required-error1").remove();
	$(".validate-required1").each(function(i){
		if($.trim( $(this).val())==""){
		//$(this).closest("p").before($("#validate-required-error1").clone());
			$(this).closest("div").before($("#validate-required-error1").clone());
		
		var $validateRequiredError = $(this).closest("div").prev() ;
		$validateRequiredError.removeAttr("id");
		$validateRequiredError.attr("class","validate-required-error1 non-readonly msgerrorsearch");
		
		var $validateRequiredMessage = $(this).attr("validate-required-message1");
		if($validateRequiredMessage != undefined){			
			//var $defaultErrorMessage = $validateRequiredError.find(".msgerror");
			$validateRequiredError.html($validateRequiredMessage);
		}		
		
		if(flag){
			flag=false;
		}
		}
	});
	
	$(".validate-form1 .validate-required-error1").show();
	return flag;
}

function validateGenericAllRequired2(){
	var flag=true;
	$(".validate-form1 .validate-required-error1").remove();
	$(".validate-required2").each(function(i){
		if($.trim($(this).val()) == ""){
			$(this).closest("div").before($("#validate-required-error1").clone());
			var $validateRequiredError = $(this).closest("div").prev() ;
			$validateRequiredError.removeAttr("id");
			$validateRequiredError.attr("class","validate-required-error1 non-readonly textfield msgerror");
			var $validateRequiredMessage = $(this).attr("validate-required-message1");
			if($validateRequiredMessage != undefined){			
				$validateRequiredError.html($validateRequiredMessage);
			}
			if(flag){
				flag=false;
			}
		}
	});
		$(".validate-form1 .validate-required-error1").show();
		return flag;
}

function validateGenericAllRequired4(){
	var flag=true;
	$(".validate-form1 .validate-required-error1").remove();
	$(".validate-required4").each(function(i){
		if($.trim($(this).val()) == ""){
			$(this).closest("div").before($("#validate-required-error1").clone());
			var $validateRequiredError = $(this).closest("div").prev() ;
			$validateRequiredError.removeAttr("id");
			$validateRequiredError.attr("class","validate-required-error1 non-readonly textfield msgerror");
			var $validateRequiredMessage = $(this).attr("validate-required-message1");
			if($validateRequiredMessage != undefined){			
				$validateRequiredError.html($validateRequiredMessage);
			}
			if(flag){
				flag=false;
			}
		}
	});
		$(".validate-form1 .validate-required-error1").show();
		return flag;
}

function validateGenericAllRequired3(){
	var flag=true;
	$(".validate-form1 .validate-required-error1").remove();
	$(".validate-required3").each(function(i){
		if($.trim($(this).val()) == ""){
			$(this).closest("div").before($("#validate-required-error1").clone());
			var $validateRequiredError = $(this).closest("div").prev() ;
			$validateRequiredError.removeAttr("id");
			$validateRequiredError.attr("class","validate-required-error1 non-readonly textfield msgerror");
			var $validateRequiredMessage = $(this).attr("validate-required-message1");
			if($validateRequiredMessage != undefined){			
				$validateRequiredError.html($validateRequiredMessage);
			}
			if(flag){
				flag=false;
			}
		}
	});
		$(".validate-form1 .validate-required-error1").show();
		return flag;
}


function validateGenericAllRegex(){
	var flag=true;
	$(".stdform .validate-regex-error").remove();
	$(".validate-regex").each(function(i){
		if($(this).val()!=""){
		if(!testRegexString($(this).attr("regex"), $(this).val())){
		
			
		$(this).closest("p").before($("#validate-regex-error").clone());
		var $validateRegexError = $(this).closest("p").prev() ;
		$validateRegexError.removeAttr("id");
		$validateRegexError.attr("class","validate-regex-error");
		
		var $validateRegexMessage = $(this).attr("validate-regex-message");
		if($validateRegexMessage != undefined){			
			var $defaultErrorMessage = $validateRegexError.find(".msgerror");
			$defaultErrorMessage.html($validateRegexMessage);
		}
		
		if(flag){
			flag=false;
		}
		}
	}
	}
	);
	
	$(".stdform .validate-regex-error").show();
	return flag;
}
function validateGenericAllRegex1(){

	var flag=true;
	$(".validate-form1 .validate-regex-error1").remove();
	$(".validate-regex1").each(function(i){
		if($(this).val()!=""){
		if(!testRegexString($(this).attr("regex"), $(this).val())){
		
			
			
			$(this).closest("div").before($("#validate-regex-error1").clone());
			
			var $validateRequiredError = $(this).closest("div").prev() ;
			$validateRequiredError.removeAttr("id");
			$validateRequiredError.attr("class","validate-regex-error1 non-readonly msgerror");
			
			var $validateRequiredMessage = $(this).attr("validate-regex-message1");
			if($validateRequiredMessage != undefined){			
				//var $defaultErrorMessage = $validateRequiredError.find(".msgerror");
				$validateRequiredError.html($validateRequiredMessage);
			}		
		if(flag)
		{
			flag=false;
		}
		}
	}
	}
	);
	
	$(".validate-form1 .validate-regex-error1").show();
	return flag;
}

function showEditableForm(){
	
	$("#original").show();
	$("#copy").html("");
	$("#copy-button-bar").hide();
}

function validateIntegerRange(){
	$(".validate-integer-range").keypress(function (e) {
			var num=parseInt($(e.target).val()+String.fromCharCode(e.which));
			if(num>2147483647)
				{
				  return false;
				}
	});
}

function validateTextRange(){
	$(".validate-text-range").each(function(i){
		$(this).attr('maxlength', '244');
		
	});
}

//function validateFloatingRange(){
//	$(".validate-floating-range").keypress(function (e) {
//			var num=parseInt($(e.target).val()+String.fromCharCode(e.which));
//			if(num>2147483647)
//				{
//				  return false;
//				}
//	});
//}


function validateFloatingValues(){

	$(".validate-floating-value").keypress(function (e) {
		if(navigator.userAgent.indexOf("Firefox") != -1 ) {
			var eventASCII = e.keyCode;
			if(!(eventASCII==9 || (eventASCII >= 35 && eventASCII <= 40) || eventASCII == 46))				
				return testFloatingValues(e);
		}else{
				return testFloatingValues(e);
		}
	});

}

function testFloatingValues(e){
	if(e.which!=8 && e.which!=13)
		if(!/^[0-9]*\.?[0-9]*$/.test($(e.target).val()+String.fromCharCode(e.which))){
			return false;
		}
}

function validateCNIC(e){
	
	var unicode = e.charCode ? e.charCode : e.keyCode;
	
	if(($(e.target).val().length==5) || ($(e.target).val().length==13)){
		$(e.target).val($(e.target).val()+'-');
	}
	
	if(navigator.userAgent.indexOf("Firefox") != -1 ) {		
		var eventASCII = e.keyCode;
		if(!(eventASCII==9 || (eventASCII >= 35 && eventASCII <= 40) || eventASCII == 46)){
		    if (unicode!=8 && unicode!=13){ //if the key isn't the backspace key (which we should allow)
		    	if (unicode<48 || unicode>57){ //if not a number
		    		
		        		return false; //disable key press
		        } 
		            
		    }
		}
	}else{		
		if (unicode!=8 && unicode!=13){ //if the key isn't the backspace key (which we should allow)
			if (unicode<48 || unicode>57){ //if not a number
	        		return false; //disable key press
	        } 
	           
	    }
	}
	

}

function validateIntegerValues(){

	$(".validate-integer-value").keypress(function (e) {	
		if(navigator.userAgent.indexOf("Firefox") != -1 ) {			
			var eventASCII = e.keyCode;
			if(!(eventASCII==9 || (eventASCII >= 35 && eventASCII <= 40) || eventASCII == 46 ))
				return testIntegerValues(e);
			}else{
			return testIntegerValues(e);
			}
	});

}//^\d{0,12}(\.\d{1,4})?$

function testIntegerValues(e){
	if(e.which!=8 && e.which!=13)
		if(!/^[0-9]*$/.test($(e.target).val()+String.fromCharCode(e.which))){
			return false;
		}
}

function numbersonly(e){
	var unicode = e.charCode ? e.charCode : e.keyCode;
	
	if(navigator.userAgent.indexOf("Firefox") != -1 ) {		
		var eventASCII = e.keyCode;
		if(!(eventASCII==9 || (eventASCII >= 35 && eventASCII <= 40) || eventASCII == 46)){
		    if (unicode!=8 && unicode!=13){ //if the key isn't the backspace key (which we should allow)
		        if (unicode<48||unicode>57) //if not a number
		            return false; //disable key press
		    }
		}
	}else{		
		if (unicode!=8&& unicode!=13){ //if the key isn't the backspace key (which we should allow)
	        if (unicode<48||unicode>57) //if not a number
	            return false; //disable key press
	    }
	}
}

/*window.onbeforeunload = function (evt) {
	  var message = 'Are you sure you want to leave?';
	  if (typeof evt == 'undefined') {
	    evt = window.event;
	  }
	  if (evt) {
	    evt.returnValue = message;
	  }
	 return " ";
	};*/
	function roundTo(number,decimal)
	{
		
		return Number((number).toFixed(decimal)); 
	}
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
	
	function showImage(input,showImageId) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#'+showImageId)
				.attr('src', e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		}	
	}
	
function populateBuildingRegisterCombo(){
		
		var max = 2016,min=1930;
		var html="";

		for (var i = max; i>=min; i--){

			html+="<option value="+i+'-06-30'+">30-Jun-"+i+"</option>\n";
		}

		$("#buildingRegister").append(html);
	}

function checkEnterKeyForUpdatePassword(e){
	if(e.keyCode == 13){
	    $('#submitButton').click();
	}
}