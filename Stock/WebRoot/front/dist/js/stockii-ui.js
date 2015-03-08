/**
 * This js file defines some frequently used methods which are relevant to
 * the ui effect.
 */

/**
 * 
 * @param selector
 */
function focusTo(selector) {
	$("" + selector)[0].focus();
}

/*
 * pagination
 */
function reshapePagination(total,numPerPage){
	tt=Math.ceil(total/numPerPage);
	$(".pagination li").remove();
	$(".pagination").append('<li data-dir="pre"><a href="javascript:void(0);">&laquo;</a></li>');
	for(var i=1;i<=tt;i++){
		if(i==1){
			$(".pagination").append('<li data-dir='+i+' class="active"><a href="javascript:void(0);">'+i+'</a></li>');
		}else{
			$(".pagination").append('<li data-dir='+i+'><a href="javascript:void(0);">'+i+'</a></li>');
		}
	}
	$(".pagination").append('<li data-dir="next"><a href="javascript:void(0);">&raquo;</a></li>');
}
function displayPagination(currentPage,total,numPerPage){
	$(".pagination li").on({
		"click":function(){
			var cancel = true;
			if(isNaN($(this).text())){//not a number
				if($(this).attr("data-dir").match("pre")){
					if(currentPage!=1){
						currentPage=currentPage-1;
						$(this).siblings("li").removeClass("active");
						$(this).siblings("li[data-dir="+currentPage+"]").addClass("active");
					}else{
						cancel = false;
					}
				}else{
					if(currentPage!=Math.ceil(total/numPerPage)){
						currentPage=currentPage+1;
						$(this).siblings("li").removeClass("active");
						$(this).siblings("li[data-dir="+currentPage+"]").addClass("active");
					}else{
						cancel = false;
					}
				}
			}else{//is a number
				currentPage=parseInt($(this).text());
				$(this).siblings("li").removeClass("active");
				$(this).addClass("active");
			}
			if(cancel){
				opera(currentPage);
			}
		}
	});
}
