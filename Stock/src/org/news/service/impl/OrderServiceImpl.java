package org.news.service.impl;

import java.util.List;

import org.news.dao.OrderHibernateDAO;
import org.news.dao.SoftwareHibernateDAO;
import org.news.dao.UsersHibernateDAO;
import org.news.model.Orders;
import org.news.model.Users;
import org.news.service.OrderService;

public class OrderServiceImpl implements OrderService{
	
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
	public boolean addOrder(int userId,long softwareId){
		Orders order = new Orders();
		order.setOrderId(0);
		order.setUser(userDAO.findUsersById(userId));
		order.setSoftware(softwareDAO.findSoftwareById(softwareId));
		return orderDAO.addOrder(order);
	}
	
	/**
	 * 用户登录验证
	 * @param user
	 * @return 软件级别
	 */
	public int findLogin(Users user,String type){
		if (userDAO.findLogin(user)){
			List<Orders> orders = orderDAO.getAllSoftwares(user.getUsersId(),type);
			if (orders == null || orders.size() == 0){
				return 0;
			}
			int level = 0;
			//找到该软件最大的级别
			for (Orders order:orders){
				if (order.getSoftware().getPermissionLevel()>level){
					level = order.getSoftware().getPermissionLevel();
				}
			}
			
			return level;
		}
		
		return 0;
		
	}
}
