package org.news.service;

import org.news.model.Orders;
import org.news.model.Users;

public interface OrderService {

	/**
	 * 增加软件销售纪录
	 * @param userId
	 * @param softwareId
	 * @return
	 */
	public boolean addOrder(int userId,int softwareId, String tradeNo,String serialNo,String tradeState);
	
	/**
	 * 用户登录验证
	 * @param user
	 * @return 软件级别
	 */
	public int findLogin(Users user,String type);
	
	/**
	 * 更新订单
	 * @param order
	 * @return 是否成功
	 */
	public boolean updateOrders(Orders order);
	
	/**
	 * 通过订单号查找订单
	 * @param tradeNo
	 * @return
	 */
	public Orders findOrderByTradeNo(String tradeNo);
}
