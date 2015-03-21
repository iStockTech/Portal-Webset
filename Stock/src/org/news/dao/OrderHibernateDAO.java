package org.news.dao;

import java.util.List;

import org.news.model.Orders;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class OrderHibernateDAO extends HibernateDaoSupport {
	
	private static final Logger log = LoggerFactory.getLogger(OrderHibernateDAO.class);

	/**
	 * ��������¼
	 * @param software ����VO����
	 * @return �����Ƿ�ɹ�
	 */
	@SuppressWarnings("finally")
	public boolean addOrder(Orders order){
		boolean result = false;
		try {
			getHibernateTemplate().save(order);
			log.debug("save successful");
			result = true;
		} catch (RuntimeException e) {
			log.error("save failed", e);
			throw e;
		}finally{
			return result;
		}
	}
	
	/**
	 * ����ĳһ�û���������������¼
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Orders> getAllSoftwares(int userId){
		try {
  			String queryString = "from orders where usersId = ?";
  			return (List<Orders>)getHibernateTemplate().find(queryString, userId);
  		} catch (RuntimeException re) {
  			log.error("find all failed", re);
  			throw re;
  		}
	}
	
	/**
	 * 根据订单号找到订单
	 * @param tradeNo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Orders findOrderByTradeNo(String tradeNo){
		try {
  			String queryString = "from orders where tradeNo = ?";
  			List<Orders> result = (List<Orders>)getHibernateTemplate().find(queryString, tradeNo);
  			if (result.size()>0){
   				return result.get(0);
   			}else{
   				return null;
   			}
  		} catch (RuntimeException re) {
  			log.error("find all failed", re);
  			re.printStackTrace();
  		}
  		return null;
	}
	
	@SuppressWarnings("finally")
	public Orders updateOrder(Orders order){
		try{
			getHibernateTemplate().update(order);
			log.debug("update successful");
		}catch (RuntimeException e) {
			log.error("update failed", e);
			order = null;
			throw e;
		}finally{
			return order;
		}
	}
	
	/**
	 * 根据订单标识找到订单
	 * @param orderId
	 * @return
	 */
	public Orders findOrderById(int orderId){
		return (Orders)getHibernateTemplate().get(Orders.class, orderId);
	}
}
