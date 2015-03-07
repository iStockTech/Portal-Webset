package org.news.service;

import org.news.model.Users;

public interface OrderService {

	/**
	 * 增加软件销售纪录
	 * @param userId
	 * @param softwareId
	 * @return
	 */
	public boolean addOrder(int userId,long softwareId);
	
	/**
	 * 用户登录验证
	 * @param user
	 * @return 软件级别
	 */
	public int findLogin(Users user,String type);
}
