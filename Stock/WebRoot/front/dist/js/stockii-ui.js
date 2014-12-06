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


/*
 * pagination - jquery
 */
;(function($,window,document,undefined){
	var pagination=function(ele,opt){
		this.$element=ele;
		this.defaults={
			"currentPage":1,
			"NumPage":2,
			"total":100,
		};
		this.options=$.extend({},this.defaults,opt);
	};
	pagination.prototype={
			reshapePagination:function(){
				var tit=this;
				var tt=tit.options.total/tit.options.NumPage;
				tit.$element.find("li").remove();
				tit.$element.append('<li><a href="javascript:void(0);" data-dir="pre">&laquo;</a></li>');
				for(var i=1;i<=tt;i++){
					tit.$element.append('<li data-dir='+i+'><a href="javascript:void(0);">'+i+'</a></li>');
				}
				tit.$element.append('<li><a href="javascript:void(0);" data-dir="next">&raquo;</a></li>');
			},
	};
	
	//插件 pagination
	$.fn.Pagination=function(options){
		var paginationSet=new pagination(this,options);
		//重塑分页组件
		paginationSet.reshapePagination();
		//
		return;
	};
})(jQuery,window,document);