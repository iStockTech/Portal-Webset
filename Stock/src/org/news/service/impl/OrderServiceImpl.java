package org.news.service.impl;

import java.util.List;
import java.util.Map;

import org.news.dao.OrderHibernateDAO;
import org.news.dao.SoftwareHibernateDAO;
import org.news.dao.UsersHibernateDAO;
import org.news.model.Orders;
import org.news.model.Users;
import org.news.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alipay.config.AlipayConfig;
import com.alipay.sign.Payment;
import com.alipay.sign.dom4j;

public class OrderServiceImpl implements OrderService{
	private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	private OrderHibernateDAO orderDAO;
	private UsersHibernateDAO userDAO;
	private SoftwareHibernateDAO softwareDAO;
	
	
	/**
	 * @param userDAO the userDAO to set
	 */
	public void setUserDAO(UsersHibernateDAO userDAO) {
		this.userDAO = userDAO;
	}

	/**
	 * @param softwareDAO the softwareDAO to set
	 */
	public void setSoftwareDAO(SoftwareHibernateDAO softwareDAO) {
		this.softwareDAO = softwareDAO;
	}

	/**
	 * @param orderDAO the orderDAO to set
	 */
	public void setOrderDAO(OrderHibernateDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	/**
	 * 增加软件销售纪录
	 * @param userId
	 * @param softwareId
	 * @return
	 */
	public boolean addOrder(int userId,int softwareId, String tradeNo,String serialNo,String tradeState){
		Orders order = new Orders();
		order.setOrderId(0);
		order.setUser(userDAO.findUsersById(userId));
		order.setSoftware(softwareDAO.findSoftwareById(softwareId));
		order.setSerialNo(serialNo);
		order.setTradeNo(tradeNo);
		order.setTradeState(tradeState);
		return orderDAO.addOrder(order);
	}
	
	/**
	 * 用户登录验证
	 * @param user
	 * @return 软件级别
	 */
	public int findLogin(Users user,String type){
		if (userDAO.findLogin(user)){
			int userId = userDAO.findUsersByName(user.getUsersName()).getUsersId();
			List<Orders> orders = orderDAO.getAllSoftwares(userId);

			if (orders == null || orders.size() == 0){
				return 0;
			}
			int level = 0;
			int orderId = 0;
			//找到该软件最大的级别
			for (Orders order:orders){
				if (order.getTradeState().equals("finished")&&order.getSoftware().getSoftwareType().equals(type)&&order.getSoftware().getPermissionLevel()>level){
					level = order.getSoftware().getPermissionLevel();
					orderId = order.getOrderId();
				}
			}
			
			/*
			if (level > 0){//通过查询订单信息，确认数据库不被修改
				Orders currentOrder =orderDAO.findOrderById(orderId);

				String out_trade_no = currentOrder.getTradeNo();	//商户网站订单（也就是外部订单号，是通过客户网站传给支付宝，不可以重复）

				try {
					Map<String,String> result = Payment.singleTradeQuery(out_trade_no);
					String tradeNo = result.get("trade_no");
					String tradeState = result.get("trade_status");
					if (!(tradeNo.equals(currentOrder.getSerialNo())&&
							(tradeState.equals("TRADE_FINISHED") || tradeState.equals("TRADE_SUCCESS")))){
						log.error("流水号不匹配或交易未完成");
						return 0;
					}
				} catch (Exception e) {
					e.printStackTrace();
					log.error("查找订单请求失败");
					return 0;
				}
			}*/

			return level;
		}
		
		return 0;
		
	}
	
	public boolean updateOrders(Orders order){
		if (orderDAO.updateOrder(order)==null){
			return false;
		}else{
			return true;
		}
	}
	
	public Orders findOrderByTradeNo(String tradeNo){
		return orderDAO.findOrderByTradeNo(tradeNo);
	}
}
