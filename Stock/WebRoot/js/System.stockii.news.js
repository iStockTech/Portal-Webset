System.namespace("com.stockii.portal.news");
com.stockii.portal.news = {
	type : "hsh",
	pagination : {
		options : {
			"callback" : function(result) {
				newsHandler.setNewsPagination(result);
			},
			"errorCallback" : function(){
				console.error("pagination error");
			}
		}
	},
	rebuild : {
//		options : {
//			"callback" : function(result) {
//				console.log("get list");
//				var list = eval("("+result+")");
//				newsHandler.setNewsList(list.newsItem);
//				newsHandler.setNewsList.setForSec(list.newsItem);
//			},
//			"errorCallback" : function() {
//				console.error("rebuild error");
//			}
//		},
		options : {
			forSec : {
				"callback" : function(result) {
					var list = eval("("+result+")");
					newsHandler.setNewsList.setForSec(list.newsItem);
				},
				"errorCallback" : function() {
					console.error("rebuild second page error");
				}
			},
			
			forHotnews : {
				"callback" : function(result) {
//					console.log("success hotnews");
					var list = eval("("+result+")");
					newsHandler.setNewsList.setForHotnews(list.hotnews);
				},
				"errorCallback" : function() {
					console.error("rebuild hotnews error");
				}
			},
			
			forIndexMain : {
				"callback" : function(result){
					console.log("index main success");
				},
				"errorCallback" : function() {
					console.error("index main content get error");
				}
			}
		}
	}
};

var newsHandler = {
		
		getNewsPagination : function() {
			System.ajaxUtil.sendAjax("data/pagination.txt",com.stockii.portal.news.type, com.stockii.portal.news.pagination.options);
		},
		
		setNewsPagination : function(result) {
//			var $_oldObj = $(".main").find(".pagination");
			var $_oldObj = $(".news-list-block").find(".pagination");
			if($_oldObj) $_oldObj.parent().remove();
			var $_pagi = $("<div class='text-center'><ul class='pagination'></ul></div>");
//			$(".news-more").find(".main").append($_pagi);
			$(".news-list-block").append($_pagi);
//			var resObj = eval("("+result.pagination+")");
			var resObj = eval("("+result+")");
			var pageSize = resObj.pageSize,
				total = resObj.total,
				buttons = Math.ceil(total/pageSize);
			if (buttons > 8) buttons = 8;
			$(".pagination").jBootstrapPage({
				pageSize : pageSize,
				total : total,
				maxPageButton:buttons,
				onPageClicked : function(obj,pageIndex) {
//					alert("page = "+(pageIndex+1));
//					newsHandler.getNewsList("data/rebuild.txt",com.stockii.portal.news.type, pageIndex+1);
					newsHandler.getNewsList.getForSec("data/rebuild.txt",com.stockii.portal.news.type, pageIndex+1)
				}
			});
		},
		
//		getNewsList : function(url,type,pageIndex) {
//			System.ajaxUtil.sendAjax(url, com.stockii.portal.news.type, com.stockii.portal.news.rebuild.options);
//		},
		
		getNewsList : {
			
			//TODO for index page
			
			
			//for second page
			getForSec : function(url,type,pageIndex) {
				var data = {
					type : com.stockii.portal.news.type,
					pageIndex : pageIndex
				};
				System.ajaxUtil.sendAjax(url, data, com.stockii.portal.news.rebuild.options.forSec);
			},
			
			//TODO for hotnews
			getForHot : function(url,type){
				var data = {
						type: type
				};
				System.ajaxUtil.sendAjax(url, data, com.stockii.portal.news.rebuild.options.forHotnews);
			},
			
			//TODO for index main content
			getForIndexMain : function(url,type) {
				
				var data = {
						type: type
				};
				System.ajaxUtil.sendAjax(url, data, com.stockii.portal.news.rebuild.options.forIndexMain);
				
			}
		
		},
		
		setNewsList : {
			
			//TODO for index page
			
			//for second page
			setForSec : function(result) {
				$(".main").find("div").remove();
				$.each(result,function(key,val){
//					var li = newsHandler.createNewsItem();
					var li = newsHandler.createNewsObj.createListItem();
//					newsHandler.fillNewsItem(li, $(this)[0]);
					newsHandler.fillNewsObj.fillListItem(li, $(this)[0]);
				});
			},
			
			//TODO for hotnews
			setForHotnews : function(result) {
				$(".hotnews").find("div").remove();
				$.each(result,function(key,val){
					var li = newsHandler.createNewsObj.createHotnews();
					newsHandler.fillNewsObj.fillHotnews(li, $(this)[0]);
				});
			},
			
			//TODO for index main
			setForIndexMain : function(result) {
				
			}
			
		},
		
//		setNewsList : function(result) {
//			$(".main").find("div").remove();
//			$.each(result,function(key,val){
//				var li = newsHandler.createNewsItem();
//				newsHandler.fillNewsItem(li, $(this)[0]);
//			});
//		},
		
		createNewsObj : {
			
			//TODO for index page
			
			//for second page (List)
			createListItem : function() {
//				var $_item = $("<div class='row'>"+
//									"<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4'>"+
//										"<img alt='picture' src='upload/a.jpg'>"+
//									"</div>"+
//									"<div class='col-lg-8 col-md-8 col-sm-8 col-xs-8'>"+
//										"<p class='title'><a href='javascript:void(0);'>"+"</a></p>"+
//										"<p class='summary'>"+"</p>"+
//										"<p class='append'><span class='glyphicon glyphicon-user'></span><span class='author'></span><span class='glyphicon glyphicon-time'></span><span class='time'>2014-12-22</span></p>"+
//									"</div>"+
//							   "</div>");
//				return $_item;
				return atomicOperation.createListItem();
			},
			
			//TODO for hotnews
			createHotnews : function() {
//				var $_item = $("<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4'>"+
//									"<img alt='HotNews' src='upload/a.jpg'>"+
//									"<p class='profile'><a href='javascript:void(0);'></a></p>"+
//								"</div>");
//				return $_item;
				return atomicOperation.createHotnews();
			},
			
			//TODO for index main content
			createIndexMain : {
				createImgNews : {
					top : function() {
						var $_block = $(
									"<div class='row'>" +
										"<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4'>" +
											"<img alt='news' src='upload/a.jpg= >" +
										"</div>" +
										"<div class='col-lg-8 col-md-8 col-sm-8 col-xs-8'>" +
											"<p class='title'><a href='javascript:void(0);' data-id='1'>人民币周五收跌，创6个月新低</a></p>" +
											"<p class='content'>中国人民币兑美元周五收低于6.22元附近，创近半年低点，与中间价贬值方向一致。盘间一度触及6.2316元低点。市场人士认为，当前已接近今年低点，年内续贬空间不多。</p>" +
										"</div>" +
									"</div>");
						return $_block;
					},
					
					listItem : function() {
						var $_blok = $(
								"<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4'>" +
									"<a href='javascript:void(0);' data-id='3'><img alt='' src='upload/a.jpg'></a>" +
									"<p class='title text-left'><a href='javascript:void(0);'>郭靖：后继乏力，降龙十八掌该何去何从？</a></p>" +
									"<p class='content text-left'></p>" +
								"</div>");
					}
				},
				
				createSuccinctNews : function() {
					
				}
			}
			
			
		},
		
//		createNewsItem : function() {
//			var $_item = $("<div class='row'>"+
//					"<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4'>"+
//						"<img alt='picture' src='upload/a.jpg'>"+
//					"</div>"+
//					"<div class='col-lg-8 col-md-8 col-sm-8 col-xs-8'>"+
//						"<p class='title'><a href='javascript:void(0);'>"+"</a></p>"+
//						"<p class='summary'>"+"</p>"+
//						"<p class='append'><span class='glyphicon glyphicon-user'></span><span class='author'></span><span class='glyphicon glyphicon-time'></span><span class='time'>2014-12-22</span></p>"+
//					"</div>"+
//			   "</div>");
//
//			return $_item;
//		},
		
		
		fillNewsObj : {
			
			//TODO for index page
			
			//for second page
			fillListItem : function(itemObj,content) {
//				$(itemObj).find("img").attr("src","");
				$(itemObj).find("p.title>a").html(content.title);
//	  			$(itemObj).find("p.title>a").attr(content.id);
				$(itemObj).find("p.summary").html(content.summary);
				$(itemObj).find("p.append>span.author").html(content.author);
				$(itemObj).find("p.append>span.time").html(content.time);
				$(itemObj).appendTo($(".main"));
			},
			
			//TODO for hotnews 
			fillHotnews : function(itemObj,content) {
//				$(itemObj).find("img").attr("src",content.img);
				$(itemObj).find("p.profile>a").html(content.title);
//				$(itemObj).find("p.profile>a").attr("data-id",content.id);
				$(itemObj).appendTo($("div.hotnews"));
			},
			
			//TODO for indexMain 
			fillIndexMain : {
				fillImgNews : function() {
					
				},
				
				fillSuccinctNews : function() {
					
				}
			}
			
		},
		
		
//		fillNewsItem : function(itemObj,content) {
////			$(itemObj).find("img").attr("src","");
//			$(itemObj).find("p.title>a").html(content.title);
////  		$(itemObj).find("p.title>a").attr(content.newsid);
//			$(itemObj).find("p.summary").html(content.summary);
//			$(itemObj).find("p.append>span.author").html(content.author);
//			$(itemObj).find("p.append>span.time").html(content.time);
//			$(itemObj).appendTo($(".main"));
//		}
	
};


var atomicOperation = {
		createListItem : function() {
			var $_item = $("<div class='row'>"+
								"<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4'>"+
									"<img alt='picture' src='upload/a.jpg'>"+
								"</div>"+
								"<div class='col-lg-8 col-md-8 col-sm-8 col-xs-8'>"+
									"<p class='title'><a href='javascript:void(0);'>"+"</a></p>"+
									"<p class='summary'>"+"</p>"+
									"<p class='append'><span class='glyphicon glyphicon-user'></span><span class='author'></span><span class='glyphicon glyphicon-time'></span><span class='time'>2014-12-22</span></p>"+
								"</div>"+
						   "</div>");
			return $_item;
		},	
		
		createHotnews : function() {
			var $_item = $("<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4'>"+
								"<img alt='HotNews' src='upload/a.jpg'>"+
								"<p class='profile'><a href='javascript:void(0);'></a></p>"+
							"</div>");
			return $_item;
		},
		
		// used to create recommond reading leading card
		createImgCard : function() {
			
		}
};