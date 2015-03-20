package org.news.service.impl;

import org.news.dao.TradeLogHibernateDAO;
import org.news.model.TradeLog;
import org.news.service.TradeLogService;

public class TradeLogServiceImpl implements TradeLogService{

	private TradeLogHibernateDAO logDAO;

	/**
	 * @param logDAO the logDAO to set
	 */
	public void setLogDAO(TradeLogHibernateDAO logDAO) {
		this.logDAO = logDAO;
	}
	
	
	public boolean addLog(TradeLog tradelog){
		return logDAO.addLog(tradelog);
	}
}
