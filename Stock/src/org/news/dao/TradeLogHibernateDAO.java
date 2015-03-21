package org.news.dao;

import org.news.model.TradeLog;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class TradeLogHibernateDAO extends HibernateDaoSupport {
	
	private static final Logger log = LoggerFactory.getLogger(TradeLogHibernateDAO.class);

	/**
	 * 增加交易日志
	 * @param tradelog
	 * @return
	 */
	@SuppressWarnings("finally")
	public boolean addLog(TradeLog tradelog){
		boolean result = false;
		try {
			getHibernateTemplate().save(tradelog);
			log.debug("save successful");
			result = true;
		} catch (RuntimeException e) {
			log.error("save failed", e);
			throw e;
		}finally{
			return result;
		}
	}
}
