package org.news.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.news.model.HotStock;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;



public class HotStockHibernateDAO extends HibernateDaoSupport {
	
	
private static final Logger log = LoggerFactory.getLogger(StockDayInfoHibernateDAO.class);
	
	
	/**
	 * 获取涨幅排前十的股票信息：stock_id,涨幅，最新，涨跌
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<HotStock> getTop10StockByDay(){
		return (List<HotStock>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				List<HotStock> list = new ArrayList<HotStock>();
				Query query = session.createQuery("select stock_id,growth_ratio,daily_up_down,current_price from stock_day_info where created = (select max(created) from stock_day_info) ORDER BY growth_ratio desc");
				
				// 设置每页显示多少个，设置多大结果。
				query.setMaxResults(10);
				// 设置起点
				query.setFirstResult(0);
				List<Object[]> result = query.list(); 
				for(Object[] s : result){
					HotStock hotStock = new HotStock();
					hotStock.setStock_id((String)s[0]);
					hotStock.setGrowth_ratio(s[1].toString());
					hotStock.setDaily_up_down(s[2].toString());
					hotStock.setCurrent_price(s[3].toString());
					list.add(hotStock);
				}
				return list;
			}
		});
		/*try {
   			String queryString = "select stock_id,growth_ratio,daily_up_down,current_price from stock_day_info where created = '2014-12-19 00:00:00' ORDER BY growth_ratio desc limit 10";
   			//String queryString = "from stock_day_info where seq_no =?";
   			//(select max(created) from stock_day_info)
   			// where created = (select max(created) from stock_day_info) ORDER BY growth_ratio desc limit 10
			return (List<HotStock>)getHibernateTemplate().find(queryString);
   		} catch (RuntimeException re) {
   			log.error("find all failed", re);
   			throw re;
   		}*/
	}
	
	/**
	 * 获取涨幅排前十的股票信息：股票名称
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getTop10StockNameByDay(final String stock_id){
		
		/* List<String> list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				Query query = session.createQuery("select stock_name from stock_basic_info where stock_id = ?");
				query.setParameter(0, stock_id);
				// 设置每页显示多少个，设置多大结果。
				return query.list();
			}
		});
		
		 return list.get(0);*/
		try {
			String queryString = "select stock_name from stock_basic_info where stock_id = ?";
			return ((List<String>)getHibernateTemplate().find(queryString,stock_id)).get(0);
		} catch (DataAccessException e) {
			e.printStackTrace();
			throw e;
		}
	}

}
