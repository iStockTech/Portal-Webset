package org.news.service.impl;

import java.util.List;

import org.news.dao.HotStockHibernateDAO;
import org.news.model.HotStock;

public class HotStockServiceImpl {
	
	private HotStockHibernateDAO hotstockDAO;
	
	public void setHotstockDAO(HotStockHibernateDAO hotstockDAO) {
		this.hotstockDAO = hotstockDAO;
	}

	/**
	 * 获取涨幅排前十的股票信息：stock_id,涨幅，最新，涨跌
	 * @return
	 */
	public List<HotStock> getTop10StockInfoByDay(){
		return hotstockDAO.getTop10StockByDay();
	}
	
	/**
	 * 获取涨幅排前十的股票信息：股票名称
	 * @return
	 */
	public String getTop10StockNameByDay(String stock_id){
		return hotstockDAO.getTop10StockNameByDay(stock_id);
	}

}
