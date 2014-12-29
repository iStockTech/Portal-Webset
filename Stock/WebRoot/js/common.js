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
	}
};