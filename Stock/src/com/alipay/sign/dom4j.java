package com.alipay.sign;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
/**
 * 功能：外部解析XML文件类（此类不是支付宝所有，也可以使用其他方法解析）
 * 类属性：非支付宝解析类
 * 公司名称：alipay
 * 修改时间：2008-10-10
 * */
public class dom4j {
	String filepath = "";

	public Map<String,String> DomXml(String filepath) throws Exception {
		Map<String,String> params = new HashMap<String,String>();
		SAXReader reader = new SAXReader();
		Document doc = reader.read(new URL(filepath).openStream());

		//解析response列表下的订单信息 
		List<Node> nodeList1 = doc.selectNodes("//response/trade/*");
		StringBuffer buf1 = new StringBuffer();
		for (Node node : nodeList1) {			
			params.put(node.getName(), node.getText());
		}
		// System.out.println(buf.toString());
		return params;

	}

	
	public static void main(String[] args) throws Exception {
		//dom4j dom = new dom4j();
		//String sss = dom
		//		.dd("https://www.alipay.com/cooperate/gateway.do?service=single_trade_query&partner=2088002029290264&_input_charset=utf-8&out_trade_no=237&sign=abaab98dbff75a3712ec7a69e295a80b&sign_type=MD5");
		//System.out.println(sss);

	}
}
