System.namespace("com.stockii.portal.hq");
com.stockii.portal.hq = {
//	footprint : {
//		
//		initPrint : function() {
//			var list = ['home','second','third'];
//			var $_p = hqInit.create.createFooter(list);
//			$_p.appendTo($('.printContainer'));
//		},
//		
//		getPrint : function() {
//			
//		},
//		
//		reSetPrint : function() {
//			
//		},
//		
//	},	
};

var hqHandler = {
		footprint : {
			
			initPrint : function() {
				var list = ['行情中心'];
				var $_p = hqInit.create.createFooter(list);
				$_p.appendTo($('.printContainer'));
			},
			
			getPrint : function() {
				
				return list;
			},
			
			reSetPrint : function(list) {
//				var list = ['home','second','third'];
				$('.printContainer').find('ol').remove();
				list = list.reverse();
				list.push("行情中心");
				list.reverse();
				var $_p = hqInit.create.createFooter(list);
				$_p.appendTo($('.printContainer'));
			},
			
		},
		data : {
			
			initData : function() {
				
			},
			
			refreshData : function(hash) {
				console.log(hash);
			}
			
		}
};

var hqInit = {
		create : {
			createFooter : function(printList) {
				var $_footer = $('<ol class="breadcrumb" id="hq_footprint">');
				$.each(printList,function(key,val){
					$('<li>'+val+'</li>').appendTo($_footer);
				});
				$_footer.find("li").last().addClass("active");
				return $_footer;
			}
		}
};