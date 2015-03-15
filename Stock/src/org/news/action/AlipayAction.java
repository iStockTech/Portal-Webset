/**
 * 
 */
package org.news.action;

import org.news.service.OrderService;
import org.news.service.SoftwareService;
import org.news.utils.Common;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author stockii
 *
 */
public class AlipayAction extends ActionSupport {

	private static final long serialVersionUID = -7472744358082575977L;
	
	private String WIDseller_email;
	private String WIDout_trade_no;
	private String WIDsubject;
	private String WIDtotal_fee;
	private String WIDbody;
	private String WIDshow_url;
	
	private int softwareid;
	
	
	
	public void setSoftwareid(int softwareid) {
		this.softwareid = softwareid;
	}


	private SoftwareService softwareService;
	private OrderService orderService;

	
	public void setSoftwareService(SoftwareService softwareService) {
		this.softwareService = softwareService;
	}


	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	

	public String getWIDseller_email() {
		return WIDseller_email;
	}



	public void setWIDseller_email(String wIDsellerEmail) {
		WIDseller_email = wIDsellerEmail;
	}



	public String getWIDout_trade_no() {
		return WIDout_trade_no;
	}



	public void setWIDout_trade_no(String wIDoutTradeNo) {
		WIDout_trade_no = wIDoutTradeNo;
	}



	public String getWIDsubject() {
		return WIDsubject;
	}



	public void setWIDsubject(String wIDsubject) {
		WIDsubject = wIDsubject;
	}



	public String getWIDtotal_fee() {
		return WIDtotal_fee;
	}



	public void setWIDtotal_fee(String wIDtotalFee) {
		WIDtotal_fee = wIDtotalFee;
	}



	public String getWIDbody() {
		return WIDbody;
	}



	public void setWIDbody(String wIDbody) {
		WIDbody = wIDbody;
	}



	public String getWIDshow_url() {
		return WIDshow_url;
	}



	public void setWIDshow_url(String wIDshowUrl) {
		WIDshow_url = wIDshowUrl;
	}



	public String instantPay(){

		//卖家支付宝帐户
		WIDseller_email = "istocktech@163.com";
		//必填

		//商户订单号
		WIDout_trade_no = Common.nextCode();
		//商户网站订单系统中唯一订单号，必填

		//订单名称
		WIDsubject = "AAA:"+ WIDout_trade_no;
		//必填

		//付款金额
		if (softwareService.findSoftwareById(softwareid)==null){
			return ERROR;
		}
		
		WIDtotal_fee = softwareService.findSoftwareById(softwareid).getPrice()+"";
		//必填

		//订单描述

		WIDbody = "斯多克股票智能分析系统";
		//商品展示地址
		WIDshow_url = "http://www.stockii.com/Software_detail";
		//需以http://开头的完整路径，例如：http://www.xxx.com/myorder.html
		
		return SUCCESS;
	}
}
