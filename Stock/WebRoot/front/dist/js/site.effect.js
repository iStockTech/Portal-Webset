$(document).ready(function(){
	(function(){
		/*--back-to-top--*/
		$("#backToTop").hide();
		$(document).scroll(function(){
			if($(this).scrollTop()>300){
				$("#backToTop").fadeIn();
			}else{$("#backToTop").fadeOut();}
		});
		$("#backToTop").click(function(){
			$('body,html').animate({scrollTop:0},500);
	        return false;
	    });
	})();
});

/**
 * This file stores some frequently used methods which are relevant to
 * the ui effect.
 */

function fullscreenHeight(selector) {
	var sH = $(window).height();
	$("" + selector).css('height', sH + 'px');
}

function fullscreenWidth(selector) {
	var sH = $(window).width();
	$("" + selector).css('width', sH + 'px');
}

/**
 * 
 * @param selector
 */
function focusTo(selector) {
	$("" + selector)[0].focus();
}


/**
 * QQ service
 * @param 
 */
(function suspend(){
	//$(".boxer").boxer();
	
	$(".suspend").mouseover(function() {
        $(this).stop();
        $(this).animate({width: 160}, 400);
	});

    $(".suspend").mouseout(function() {
        $(this).stop();
        $(this).animate({width: 40}, 400);
    });
})();
