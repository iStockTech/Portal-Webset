/**
 * 
 */
package org.news.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.news.dao.AdminHibernateDAO;
import org.news.model.Orders;
import org.news.model.Software;
import org.news.model.TradeLog;
import org.news.model.Users;
import org.news.service.OrderService;
import org.news.service.SoftwareService;
import org.news.service.TradeLogService;
import org.news.service.UserService;
import org.news.utils.Common;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alipay.config.AlipayConfig;
import com.alipay.sign.Payment;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.alipay.util.UtilDate;
import com.opensymphony.xwork2.ActionContext;
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
	
	private String softwareid;
	private String enable_paymethod;
	private String responseTxt;
	
	private static final Logger log = LoggerFactory.getLogger(AlipayAction.class);
	
	

	/**
	 * @return the responseTxt
	 */
	public String getResponseTxt() {
		return responseTxt;
	}


	/**
	 * @param responseTxt the responseTxt to set
	 */
	public void setResponseTxt(String responseTxt) {
		this.responseTxt = responseTxt;
	}


	/**
	 * @return the enable_paymethod
	 */
	public String getEnable_paymethod() {
		return enable_paymethod;
	}


	/**
	 * @param enablePaymethod the enable_paymethod to set
	 */
	public void setEnable_paymethod(String enablePaymethod) {
		enable_paymethod = enablePaymethod;
	}


	public void setSoftwareid(String softwareid) {
		this.softwareid = softwareid;
	}


	/**
	 * @return the softwareid
	 */
	public String getSoftwareid() {
		return softwareid;
	}


	private SoftwareService softwareService;
	private OrderService orderService;
	private UserService userService;
	private TradeLogService logService;
	
	
	
	/**
	 * @param logService the logService to set
	 */
	public void setLogService(TradeLogService logService) {
		this.logService = logService;
	}


	/**
	 * @param userService the userService to set
	 */
	public void setUserService(UserService userService) {
		this.userService = userService;
	}


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
		WIDseller_email = AlipayConfig.seller_email;
		//必填

		//商户订单号
		WIDout_trade_no = AlipayConfig.out_trade_no + UtilDate.getOrderNum();
		//商户网站订单系统中唯一订单号，必填

		//付款金额
		int sid = 0;
		Software software = null;
		try{
			sid = Integer.parseInt(softwareid);
			software = softwareService.findSoftwareById(sid);
			if (software == null){
				log.error("no software");
				return ERROR;
			}
			
			
		}catch(Exception e){
			log.error("softwareid is wrong");
			return ERROR;
		}
		
		//订单名称
		WIDsubject = software.getSoftwareName();
		//必填

		
		WIDtotal_fee = software.getPrice()+"";
		//必填

		//订单描述

		WIDbody = software.getSoftwareDescripe();
		//商品展示地址
		WIDshow_url = AlipayConfig.show_url;
		//需以http://开头的完整路径，例如：http://www.xxx.com/myorder.html

		return SUCCESS;
	}
	
	public String alipayTo(){

		ActionContext ctx = ActionContext.getContext();
		String userName = (String) ctx.getSession().get("id") ;	// 从session中取出用户名
		if (userName==null){
			//System.out.println("no userName");
			return LOGIN;
		}
		
		Users user = userService.findUsersById(userName);
		
		if (user==null){
			//System.out.println("no user");
			return LOGIN;
		}
		
		int sid = 0;
		try{
			sid = Integer.parseInt(softwareid);

		}catch(Exception e){
			//System.out.println("no sid");
			return ERROR;
		}
		
		int price = 0;
		try{
			price = Integer.parseInt(WIDtotal_fee);

		}catch(Exception e){
			//System.out.println("no sid");
			return ERROR;
		}
		
		//插入交易纪录
		orderService.addOrder(user.getUsersId(), sid, WIDout_trade_no, "", "submit");
		
		//记入日志
		TradeLog logger = new TradeLog();
		logger.setId(0);
		logger.setUserName(userName);
		logger.setOutTradeNo(WIDout_trade_no);
		logger.setSubject(WIDsubject);
		logger.setPrice(price);
		logger.setTradeNo("");
		logger.setTradeStatus("submit");
		logger.setResponse("success");
		logService.addLog(logger);
		
		return SUCCESS;
	}
	
	/**
	 * 功能：付完款后跳转的页面（页面跳转同步通知页面）
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String returnURL() throws UnsupportedEncodingException {	
		ActionContext ctx = ActionContext.getContext();
		String userName = (String) ctx.getSession().get("id") ;	// 从session中取出用户名
		if (userName==null){
			//System.out.println("no userName");
			return LOGIN;
		}
		
		String key = AlipayConfig.key;
		//获取支付宝GET过来反馈信息
		
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		//商户订单号

		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
		String subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"),"UTF-8");
		
		String total_fee = new String(request.getParameter("total_fee").getBytes("ISO-8859-1"),"UTF-8");
		
		int price = 0;
		try{
			price = Integer.parseInt(total_fee);

		}catch(Exception e){
			log.error("返回价格错误");
			return ERROR;
		}

		//支付宝交易号

		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//交易状态
		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

		//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
		
		//计算得出通知验证结果
		boolean verify_result = AlipayNotify.verify(params);
		
		TradeLog logger = new TradeLog();
		logger.setId(0);
		logger.setUserName(userName);
		logger.setOutTradeNo(out_trade_no);
		logger.setSubject(subject);
		logger.setPrice(price);
		logger.setTradeNo(trade_no);
		
		Orders order = orderService.findOrderByTradeNo(out_trade_no);
		if (order == null){
			log.error("找不到订单");
			responseTxt = "database_no_trade";
			
			//记入日志			
			logger.setTradeStatus("submit");
			logger.setResponse("database_no_trade");
			logService.addLog(logger);
			return ERROR;
		}
		
		if(verify_result){//验证成功
			//////////////////////////////////////////////////////////////////////////////////////////
			//请在这里加上商户的业务逻辑程序代码
			

			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
			if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				if (!order.getTradeState().equals("finished")){					
					order.setTradeState("finished");
					order.setSerialNo(trade_no);
					
					logger.setTradeStatus("finished");
					if (!orderService.updateOrders(order)){
						log.error("验证成功，更新订单失败");
						responseTxt = "verify_success_update_fail";
												
						logger.setResponse("verify_success_update_fail");
						logService.addLog(logger);
						return ERROR;
					}

					logger.setResponse("支付成功");
					logService.addLog(logger);
				}
					//如果有做过处理，不执行商户的业务程序
				responseTxt = "支付成功";				
			}else{
				if (!order.getTradeState().equals("finished")){
					order.setTradeState("wait");
					order.setSerialNo(trade_no);
					
					logger.setTradeStatus("wait");
					if (!orderService.updateOrders(order)){
						log.error("验证成功，更新订单失败");
						responseTxt = "verify_success_update_fail";
													
						logger.setResponse("verify_success_update_fail");
						logService.addLog(logger);
						return ERROR;
					}
					logger.setResponse("支付未完成");
					logService.addLog(logger);
					responseTxt = "支付未完成";
				}else{
					responseTxt = "支付成功";
				}			
				
			}
			
			//该页面可做页面美工编辑
			return SUCCESS;
			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

			//////////////////////////////////////////////////////////////////////////////////////////
		}else{
			//该页面可做页面美工编辑
			responseTxt = "验证失败";
			
			logger.setTradeStatus(order.getTradeState());
			logger.setResponse("验证失败");
			logService.addLog(logger);
			return SUCCESS;
		}
	}
	
	/**
	 * 功能：支付宝主动通知调用的页面（服务器异步通知页面）
	 * @throws UnsupportedEncodingException 
	 */
	public void notifyURL() throws UnsupportedEncodingException {
		ActionContext ctx = ActionContext.getContext();
		String userName = (String) ctx.getSession().get("id") ;	// 从session中取出用户名

		PrintWriter out = null;
		try {
			out = ServletActionContext.getResponse().getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String key = AlipayConfig.key;
		
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		
		//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		//商户订单号

		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
		String subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"),"UTF-8");
		
		String total_fee = new String(request.getParameter("total_fee").getBytes("ISO-8859-1"),"UTF-8");
		
		int price = 0;
		try{
			price = Integer.parseInt(total_fee);

		}catch(Exception e){
			log.error("返回价格错误");
		}


		//支付宝交易号

		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//交易状态
		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

		//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
		
		TradeLog logger = new TradeLog();
		logger.setId(0);
		logger.setUserName(userName);
		logger.setOutTradeNo(out_trade_no);
		logger.setSubject(subject);
		logger.setPrice(price);
		logger.setTradeNo(trade_no);		

		if(AlipayNotify.verify(params)){//验证成功
			//////////////////////////////////////////////////////////////////////////////////////////
			//请在这里加上商户的业务逻辑程序代码
			Orders order = orderService.findOrderByTradeNo(out_trade_no);
			if (order == null){
				log.error("Notify:找不到订单");
				
				//记入日志			
				logger.setTradeStatus("submit");
				logger.setResponse("Notify:database_no_trade");
				logService.addLog(logger);
				out.println("success");	//请不要修改或删除
				return;
			}
			

			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
			
			if(trade_status.equals("TRADE_FINISHED")){
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//如果有做过处理，不执行商户的业务程序
				if (!order.getTradeState().equals("finished")){
					order.setTradeState("finished");
					order.setSerialNo(trade_no);
					
					logger.setTradeStatus("finished");
					if (!orderService.updateOrders(order)){
						log.error("Notify:验证成功，更新订单失败");
						
						logger.setResponse("Notify:verify_success_update_fail");
						logService.addLog(logger);
					}else{
						logger.setResponse("Notify:支付成功");
						logService.addLog(logger);
					}
				}
					//如果有做过处理，不执行商户的业务程序
					
				//注意：
				//该种交易状态只在两种情况下出现
				//1、开通了普通即时到账，买家付款成功后。
				//2、开通了高级即时到账，从该笔交易成功时间算起，过了签约时的可退款时限（如：三个月以内可退款、一年以内可退款等）后。
			} else if (trade_status.equals("TRADE_SUCCESS")){
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				if (!order.getTradeState().equals("finished")){
					order.setTradeState("finished");
					order.setSerialNo(trade_no);
					
					logger.setTradeStatus("finished");
					if (!orderService.updateOrders(order)){
						log.error("Notify:验证成功，更新订单失败");
						
						logger.setResponse("Notify:verify_success_update_fail");
						logService.addLog(logger);
					}else{
						logger.setResponse("Notify:支付成功");
						logService.addLog(logger);
					}
				}
					//如果有做过处理，不执行商户的业务程序

				//注意：
				//该种交易状态只在一种情况下出现——开通了高级即时到账，买家付款成功后。
			}else{
				if (!order.getTradeState().equals("finished")){
					order.setTradeState("wait");
					order.setSerialNo(trade_no);
					
					logger.setTradeStatus("wait");
					if (!orderService.updateOrders(order)){
						log.error("Notify:验证成功，更新订单失败");
						
						logger.setResponse("Notify:verify_success_update_fail");
						logService.addLog(logger);
					}else{
						logger.setResponse("Notify:支付未完成");
						logService.addLog(logger);
					}
				}

			}

			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
				
			out.println("success");	//请不要修改或删除

			//////////////////////////////////////////////////////////////////////////////////////////
		}else{//验证失败
			out.println("fail");
		}
	}
	
	/**
	 * 支付完成，获取支付结果
	 * @return
	 */
	public String finish(){
		try {
			Orders order = orderService.findOrderByTradeNo(WIDout_trade_no);
			if (order == null){
				responseTxt = "未查到交易记录";
			}else{
				responseTxt = order.getTradeState();
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error("查找订单请求失败");
			responseTxt = "支付失败";
		}
		
		return SUCCESS;
	}
}
