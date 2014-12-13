package org.news.service;

import java.util.List;

import org.news.model.StockInfoTable;
import org.news.model.Stock_day_info;

public interface StockDayInfoTableService {
	
	/**
	 * 获取每日股票信息
	 */
	public List<Stock_day_info> getStockByDay();
	
	
	/**
	 * 分页获取每日股票信息
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<Stock_day_info>getStockByDay(int currentPage,int pageSize);
	
	/**
	 * 将stock_day_info转换为StockInfoTable
	 * @return
	 */
	public List<StockInfoTable> toStockInfoTable(List<Stock_day_info>lists);

}
