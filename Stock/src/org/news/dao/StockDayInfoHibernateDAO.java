package org.news.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.news.model.NewsInfo;
import org.news.model.Stock_day_info;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class StockDayInfoHibernateDAO extends HibernateDaoSupport {
	
	private static final Logger log = LoggerFactory.getLogger(StockDayInfoHibernateDAO.class);
	
	
	/**
	 * 获取每日股票信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Stock_day_info> getStockByDay(){
		try {
   			String queryString = "from stock_day_info where created = (select max(created) from stock_day_info) ORDER BY stock_id";
   			//String queryString = "from stock_day_info where seq_no =?";
			return (List<Stock_day_info>)getHibernateTemplate().find(queryString);
   		} catch (RuntimeException re) {
   			log.error("find all failed", re);
   			throw re;
   		}
	}
	
	/**
	 * 分页获取每日股票信息
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Stock_day_info>getStockByDay(final int currentPage,final int pageSize){
		
		
		return (List<Stock_day_info>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				Query query = session.createQuery("from stock_day_info where created = (select max(created) from stock_day_info) ORDER BY stock_id");
				// 设置每页显示多少个，设置多大结果。
				query.setMaxResults(pageSize);
				// 设置起点
				query.setFirstResult((currentPage-1)*pageSize);
				List<Stock_day_info> s = query.list();
				return s;
			}
		});
	}

}
