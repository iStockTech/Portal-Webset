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
					var list = eval("("+result+")");
					newsHandler.setNewsList.setForHotnews(list.hotnews);
				},
				"errorCallback" : function() {
					console.error("rebuild hotnews error");
				}
			},
			
			forIndex : {
				"callback" : function(result){
					var resObj = eval("("+result+")");
					
					$.each(resObj.illustrate,function(key,val){
						// use key to confirm classify name
						// this call just create container structure and return the container
						var _self = this,
							_key = key,
							container = newsHandler.setNewsList.setForIndex(key);
						//fill the container illustrate
						$.each($(container).find(".content"),function(key,val){
							newsHandler.fillNewsObj.fillIllustrate($(this), _self[key]);
						});
						//fill the container succinct
						$.each($(container).find(".succinct ul"),function(key,val){
							newsHandler.fillNewsObj.fillSuccinct($(this),resObj.succinct[_key]);
						});
						
						
					});
				},
				"errorCallback" : function() {
					console.error("index main content get error");
				}
			}
		}
	},
	classify : {
		"hsh" : "沪<span class='dot'>·</span>深",
		"mhk" : "美<span class='dot'>·</span>港",
		"found" : "基金"
	}
};

var newsHandler = {
		
		getNewsPagination : function() {
			System.ajaxUtil.sendAjax("data/pagination.txt",com.stockii.portal.news.type, com.stockii.portal.news.pagination.options);
		},
		
		setNewsPagination : function(result) {
			var $_oldObj = $(".news-list-block").find(".pagination");
			if($_oldObj) $_oldObj.parent().remove();
			var $_pagi = $("<div class='text-center'><ul class='pagination'></ul></div>");
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
					newsHandler.getNewsList.getForSec("data/rebuild.txt",com.stockii.portal.news.type, pageIndex+1);
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
			
			getForHot : function(url,type){
				var data = {
						type: type
				};
				System.ajaxUtil.sendAjax(url, data, com.stockii.portal.news.rebuild.options.forHotnews);
			},
			
			//TODO for index main content
			getForIndex : function(url,type) {
				
				var data = {
						type: type
				};
				System.ajaxUtil.sendAjax(url, data, com.stockii.portal.news.rebuild.options.forIndex);
				
			}
		
		},
		
		setNewsList : {
			
			
			//for second page
			setForSec : function(result) {
				$(".js-main").find("div").remove();
				var $_parent = $(".js-main");
				$.each(result,function(key,val){
//					var li = newsHandler.createNewsItem();
					var li = newsHandler.createNewsObj.createListItem();
//					newsHandler.fillNewsItem(li, $(this)[0]);
					newsHandler.fillNewsObj.fillListItem(li, $(this)[0],$_parent);
				});
			},
			
			setForHotnews : function(result) {
				var $_parent = $("div.hotnews");
				$(".hotnews").find("div").remove();
				$.each(result,function(key,val){
					var li = newsHandler.createNewsObj.createHotnews();
					newsHandler.fillNewsObj.fillHotnews(li, $(this)[0],$_parent);
				});
			},
			
			//TODO for index main
			setForIndex : function(classifyName) {
				//return container
				var itemObj = newsHandler.createNewsObj.createIndex(classifyName);
				//set for illustrate single news
//				console.log(result);
				
//				newsHandler.fillNewsObj.fillIndex(itemObj.find(".content"), result);
				
				//set for illustrate set news
				
				//set for succinct news
				return itemObj;
			}
			
		},
		
		getAppendix : {
			
			getStockIndex : function(url) {
				
			}
			
		},
		
		createNewsObj : {
			
			//for second page (List)
			createListItem : function() {
				return atomicOperation.createHtmlDOM.createListItem();
			},
			
			createHotnews : function() {
				return atomicOperation.createHtmlDOM.createHotnews();
			},
			
			//TODO for /news/index page
			createIndex : function(classifyName) {
				var $_basicCotainer = atomicOperation.createFrameDOM.basicCotainer(),
					sectorname = atomicOperation.createFrameDOM.sectorName(com.stockii.portal.news.classify[classifyName]),
					$_block_IllustrateSingle = atomicOperation.createHtmlDOM.createIllustrateSingle(),
					$_block_IllustrateSet = atomicOperation.createHtmlDOM.createIllustrateSet(),
					$_block_succinct = atomicOperation.createHtmlDOM.createSuccinct();
				atomicOperation.pasteFrameDOM.basicCotainer($_basicCotainer,$(".js-news-main"));
				atomicOperation.pasteFrameDOM.sectorName(sectorname,$_basicCotainer.find("div.js-nail"));
				atomicOperation.pasteHtmlDOM.pasteIllustrateSingle($_block_IllustrateSingle,$_basicCotainer.find("div.js-nail.basic"));
				atomicOperation.pasteHtmlDOM.pasteIllustrateSet($_block_IllustrateSet,$_basicCotainer.find("div.js-nail.basic"));
				atomicOperation.pasteHtmlDOM.pasteSuccinct($_block_succinct,$_basicCotainer.find("div.js-nail.basic"));
				return $_basicCotainer;
			}
		},
		
		fillNewsObj : {
			
			
			/*
			 *@itemObj:
			 *@content:
			 *@parent: 
			 * */
			fillListItem : function(itemObj,content,parent) {
				atomicOperation.fillHtmlDOM.fillListItem(itemObj, content);
				atomicOperation.pasteHtmlDOM.pasteListItem(itemObj, parent);
			},
			
			fillHotnews : function(itemObj,content,parent) {
				atomicOperation.fillHtmlDOM.fillHotnews(itemObj, content);
				atomicOperation.pasteHtmlDOM.pasteHotnews(itemObj, parent);
			},
			
			/*
			 * @itemObj: illustrate object
			 * @content: object 
			 * {
			 *	"flag":"important",
			 *	"img":"kkkk",
			 *	"title":"1title found",
			 *	"summary":"1summary found",
			 *	"id":"1"
			 *	}
			 * */
			fillIllustrate : function(itemObj,content) {
				atomicOperation.fillHtmlDOM.fillIllustrate(itemObj, content);
			},
			
			/*
			 * @itemObj: ul object 
			 * @content: array list (hsh@1=title@id)
			 * ["hsh@1","hsh@1","hsh@3","hsh@4","hsh@5","hsh@6","hsh@7","hsh@8"]
			 * */
			fillSuccinct : function(itemObj,content) {
				$.each($(itemObj).find("li"),function(key,val){
					var title = content[key].split("@")[0],
						id = content[key].split("@")[1];
					$(this).find("a").html(title);
					$(this).find("a").attr("data-id",id);
				});
			}
			
		}
		
};


var atomicOperation = {
		
		createHtmlDOM : {
			
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
			
			//TODO for news -- index
			createIllustrateSingle : function() {
				var $_newsblock = $(
						"<div class='newsblock illustrate single'>" +
							"<img alt='illustrated photo' class='image' src='upload/a.jpg'>" +
							"<div class='content'>" +
								"<p class='title'><a href='javascript:void(0);'></a></p>" +
								"<p class='summary'></p>" +
							"</div>" +
						"</div>");
				return $_newsblock;
			},
			
			createIllustrateSet : function() {
				var $_newsblock = $(
						"<div class='newsblock illustrate set'>" +
							"<div class='slice content'>" +
								"<img alt='slice news' src='upload/a.jpg'>" +
								"<p class='title'><a href='javascript:void(0);'></a></p>" +
								"<p class='summary'></p>" +
							"</div>" +
							"<div class='slice content'>" +
								"<img alt='slice news' src='upload/a.jpg'>" +
								"<p class='title'><a href='javascript:void(0);'></a></p>" +
								"<p class='summary'></p>" +
							"</div>" +
							"<div class='slice content'>" +
								"<img alt='slice news' src='upload/a.jpg'>" +
								"<p class='title'><a href='javascript:void(0);'></a></p>" +
								"<p class='summary'></p>" +
							"</div>" +
						"</div>");
				return $_newsblock;
			},
			
			createSuccinct : function() {
				var $_newsblock = $(
						"<div class='newsblock succinct'>" +
							"<div class='card slice'>" +
								"<img alt='card recommend' src='upload/a.jpg'>" +
								"<p class='text'>推荐阅读</p>" +
							"</div>" +
							"<ul class='lsit-unstyle list slice'>" +
								"<li><a href='javascript:void(0);'></a></li>" +
								"<li><a href='javascript:void(0);'></a></li>" +
								"<li><a href='javascript:void(0);'></a></li>" +
								"<li><a href='javascript:void(0);'></a></li>" +
								"<li><a href='javascript:void(0);'></a></li>" +
							"</ul>" +
							"<ul class='lsit-unstyle list slice'>" +
								"<li><a href='javascript:void(0);'></a></li>" +
								"<li><a href='javascript:void(0);'></a></li>" +
								"<li><a href='javascript:void(0);'></a></li>" +
								"<li><a href='javascript:void(0);'></a></li>" +
								"<li><a href='javascript:void(0);'></a></li>" +
							"</ul>" +
						"</div>");
				return $_newsblock;
			},
			
			createStockIndex : function(indexNumber) {
				var indexList = "";
				for(var i = 0;i<indexNumber;i++){
					indexList = indexList+" <li> " + " <span class='indexname' title=''>indexname " + " </span> " + " <span class='indexnumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " ;
				}
				var $_indexblock = $(
						" <div class='indexblock'> " + 				
							" <span class='blockname'> " + " </span> " + 
							" <span class='line'> " + " </span> " + 
							" <ul class='list-unstyle list slice'> " + 
//								" <li> " + " <span class='indexname' title=''> " + " </span> " + " <span class='indexnumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
//								" <li> " + " <span class='indexname' title=''> " + " </span> " + " <span class='indexnumber'> " + " <span class='number-1'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
//								" <li> " + " <span class='indexname' title=''> " + " </span> " + " <span class='indexnumber'> " + " <span class='number-1'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
//								" <li> " + " <span class='indexname' title=''> " + " </span> " + " <span class='indexnumber'> " + " <span class='number-1 down'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" </ul> " + 
						" </div> ");
				$(indexList).appendTo($_indexblock.find("ul.list"));
				return $_indexblock;
			},
			
			createStockRank : function() {
				var $_rank = $(
					" <div class='rankblock'> " + 
						" <span class='blockname'>涨跌排行</span> " + 
						" <span class='line'> " + " </span> " + 
						" <ul class='list-inline list rankname'> " + 
							" <li class='active' data-target='up'>涨幅前十</li> " + 
							" <li data-target='down'>跌幅前十</li> " + 
						" </ul> " + 
						" <ul class='list-unstyle list rankdata js-up' data-target='up'> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial first up'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial second up'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial third up'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
						" </ul> " + 
						" <ul class='list-unstyle list rankdata js-down' style='display: none;' data-target='down'> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial first down'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial second down'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial third down'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
							" <li> " + " <span class='stockname'> " + " <span class='serial'></span><span class='name'></span> " + " </span> " + " <span class='stocknumber'> " + " <span class='number-1 up'> " + " </span> " + " <span class='number-2'> " + " </span> " + " <span class='number-3'> " + " </span> " + " </span> " + " </li> " + 
						" </ul> " + 
					" </div> "
				);
				return $_rank;
			}
			   
		},
		
		fillHtmlDOM : {
			
			fillListItem : function(itemObj,content) {
//				$(itemObj).find("img").attr("src","");
				$(itemObj).find("p.title>a").html(content.title);
//	  			$(itemObj).find("p.title>a").attr(content.id);
				$(itemObj).find("p.summary").html(content.summary);
				$(itemObj).find("p.append>span.author").html(content.author);
				$(itemObj).find("p.append>span.time").html(content.time);
			},
			
			fillHotnews : function(itemObj,content) {
//				$(itemObj).find("img").attr("src",content.img);
				itemObj.find("p.profile>a").html(content.title);
//				$(itemObj).find("p.profile>a").attr("data-id",content.id);
			},
			
			//TODO for news -- index
			fillIllustrateSingle : function(block,content) {
//				$(block).find("img").attr("src",conten t.img);
//				block.find(".title").html(content.title);
//				block.find(".summary").html(content.summary);
//				console.log(content);
//				block.appendTo(parent);
//				console.log(content.title+" : "+content.summary);
			},
			
			fillIllustrateSet :  function(block,content) {
//				$(block).find("img").attr("src",content.img);
				block.find(".title").html(content.title);
				block.find(".summary").html(content.summary);
//				block.appendTo(parent);				
			},
			
			fillIllustrate : function(block,content) {
//				block.find("img").attr("src",content.img);
//				console.log(content);
//				console.log(content);
				block.find(".title").html(content.title);
				block.find(".summary").html(content.summary);
			},
			
			fillSuccinct : function(block,content) {
//				block.find("img").attr("src",content.img);
				var $_li = block.find("li>a");
				$_li.html("li test liiii");
//				block.appendTo(parent);
			},
			
//			fillStockIndex : function(stockIndexBlock,content,indexNameList,indexDataList) {
			fillStockIndex : function(stockIndexBlock,content,indexList) {
				stockIndexBlock.find("span.blockname").html("沪<span class='dot'>·</span>深指数");
				var $_indexname = stockIndexBlock.find("span.indexname");
				for(var i=0;i<indexList.length;i++){
					$($_indexname[i]).html(indexList[i][0]);
				}
				// fill data
				var $_indexNumber = stockIndexBlock.find("span.indexnumber");
				for(var i=0;i<indexList.length;i++){
					for(var j=0;j<indexList[i].length-1;j++){
						$($_indexNumber[i]).find("span.number-"+(j+1)).html(indexList[i][j+1]);
					}
				}
			},
			
			fillStockRank : function(stockRankBlock,rankList) {
				var $_rankUpLi = stockRankBlock.find("ul.js-up > li"),
					$_rankDownLi = stockRankBlock.find("ul.js-down > li");
				for(var i=0;i<rankList["up"].length;i++){
					$($_rankUpLi[i]).find("span.stockname>span.serial").text(i+1);
					$($_rankUpLi[i]).find("span.stockname>span.name").text(rankList["up"][i][0]);
					$($_rankUpLi[i]).find("span.number-1").html(rankList["up"][i][1]);
					$($_rankUpLi[i]).find("span.number-2").html(rankList["up"][i][2]);
					$($_rankUpLi[i]).find("span.number-3").html(rankList["up"][i][3]);
				}
				for(var i=0;i<rankList["down"].length;i++){
					$($_rankDownLi[i]).find("span.stockname>span.serial").text(i+1);
					$($_rankDownLi[i]).find("span.stockname>span.name").text(rankList["down"][i][0]);
					$($_rankDownLi[i]).find("span.number-1").html(rankList["down"][i][1]);
					$($_rankDownLi[i]).find("span.number-2").html(rankList["down"][i][2]);
					$($_rankDownLi[i]).find("span.number-3").html(rankList["down"][i][3]);
				}
			}
		},
		
		pasteHtmlDOM : {
			pasteListItem : function(itemObj,parent) {
				itemObj.appendTo(parent);
			},
			
			pasteHotnews : function(hotObj,parent) {
				hotObj.appendTo(parent);
			},
			
			pasteIllustrateSingle : function(illustrateSingleObj,parent) {
				illustrateSingleObj.appendTo(parent);
			},
			
			pasteIllustrateSet : function(illustrateSetObj,parent) {
				illustrateSetObj.appendTo(parent);
			},
			
			pasteSuccinct : function(succinctObj,parent) {
				succinctObj.appendTo(parent);
			},
			
			pasetStockIndex : function(indexObj,parent) {
				indexObj.appendTo(parent);
			},
			
			pasteStockRank : function(rankObj,parent) {
				rankObj.appendTo(parent);
			}
		},
		
		createFrameDOM : {
			//NOTE container is based on DOM Structure(change flexible)
			basicCotainer : function() {
				var $_container = $(
					"<div class='row'>" +
						"<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12 bgc-f8 mgt20 border-news js-nail basic'></div>" +
					"</div>");
				return $_container;
			},
			
			appendixContainer : function() {
				var $_appendixContainer = $(
						" <div class='row mgt20' style='margin-left: 0;'> " +
							" <div class='col-lg-12 col-md-12 col-sm-12 col-xs-12 bgc-f8 border-news js-nail appendix'> " +" </div> " +
						" </div> ");
				return $_appendixContainer;
			},
			
			//
			sectorName : function(name) {
				var $_sname = $(
					"<div class='newsblock sectorname'> " + "<span class='title'></span>" + "</div>"
					);
				$_sname.find("span.title").html(name);
				return $_sname;
			},
			
		},
		
		pasteFrameDOM : {
			
			basicCotainer : function(basic,parent) {
				basic.appendTo(parent);
			},
			
			appendixContainer : function(appendix,parent) {
				appendix.appendTo(parent);
			},
			
			sectorName : function(name,parent) {
				name.appendTo(parent);
			},
						
		},
		
};