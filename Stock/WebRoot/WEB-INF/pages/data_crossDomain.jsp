<%@page import="com.stockii.httpclient.StockiiHTTPRequest"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page  import="net.sf.json.JSONArray"%>
<%@page  import="net.sf.json.JSONObject"%>
<%!
public String main(){
	String result = StockiiHTTPRequest.sendGet("http://192.168.1.220:8080/client/api", "command=liststockclassfication&response=json");
	JSONObject jsonObject = JSONObject.fromObject(JSONObject.fromObject(result).getString("liststockclassficationresponse"));
 	String data = jsonObject.getString("stockclassification");
 	data="{\"data\":"+data+"}";
	return data;
} 

%>
<%
out.print(main());
%>