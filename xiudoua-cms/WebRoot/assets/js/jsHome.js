/**
 * 
 */
$(function(){
	$(window).scroll(function(event){
		if($(window).scrollTop() > 200){
			$("#floatNavbar").show();
		}else{
			$("#floatNavbar").hide();
		}
    });
});