var System = {
	namespace : function(packages){
		var spaces = packages.toLowerCase().split(".");
		var parentSpace = window;
		for(var i = 0; i< spaces.length ;i++) {
			var space = spaces[i];
			parentSpace = parentSpace[space] = (parentSpace[space] || new Object());
		}
	},
	getContextPath : function(){
		var tempPath = document.location.pathname.substring(1);
		return '/' + tempPath.substring(0, tempPath.indexOf('/'));
	},
	ajaxUtil : {
		sendAjax : function(url,data,options){
			var submitData = data;
			if (options.type && options.type != 'GET'){
				submitData = JSON.stringify(data);
			}
			$.ajax({
				url:url,
				type : options.type || 'POST',
				datatype : options.datatype || 'json',
				contentType : options.contentType || 'application/json; charset=utf-8',
				"data" : submitData,
	            "cache" : false,
	            async : options.async && true,
	            success : function(result) {
	            	if (options.callback) options.callback(result);
	            },
	            error : function() {
	            	if (options.errorCallback) options.errorCallback();
	            	else if(window.console){console.warn("错误"+ result.responseText);}
	            }
			});
		}
	},
	getObjectLength : function(object) {
		var length = 0;
		$.each(object,function(key,val){
			length = length + 1;
		});
		return length;
	},
	
	urlUtil : {
		getUrlHash : function() {
			//获取url "#" 字符后的参数
			return window.location.hash;
		},
		getUrlRequest : function() {
			var url = location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                if (str.indexOf("&") != -1) {
                    strs = str.split("&");
                    for (var i = 0; i < strs.length; i++) {
                        theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
                    }
                } else {
                    var key = str.substring(0,str.indexOf("="));
                    var value = str.substr(str.indexOf("=")+1);
                    theRequest[key] = decodeURI(value);
                }
            }
            return theRequest;
		},
	},
	
};