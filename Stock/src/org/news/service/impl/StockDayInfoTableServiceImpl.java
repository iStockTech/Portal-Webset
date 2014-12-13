package org.news.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.news.dao.StockDayInfoHibernateDAO;
import org.news.model.StockInfoTable;
import org.news.model.Stock_day_info;
import org.news.service.StockDayInfoTableService;

public class StockDayInfoTableServiceImpl implements StockDayInfoTableService{
	
	
	private StockDayInfoHibernateDAO stockDayInfoHibernateDAO;

	public void setStockDayInfoHibernateDAO(
			StockDayInfoHibernateDAO stockDayInfoHibernateDAO) {
		this.stockDayInfoHibernateDAO = stockDayInfoHibernateDAO;
	}
	
	/**
	 * 获取每日股票信息
	 */
	public List<Stock_day_info> getStockByDay(){
		return stockDayInfoHibernateDAO.getStockByDay();
	}
	
	/**
	 * 分页获取每日股票信息
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<Stock_day_info>getStockByDay(int currentPage,int pageSize){
		return stockDayInfoHibernateDAO.getStockByDay(currentPage, pageSize);
	}
	
	/**
	 * 将stock_day_info转换为StockInfoTable
	 * @return
	 */
	public List<StockInfoTable> toStockInfoTable(List<Stock_day_info>lists){
		
		List<StockInfoTable>listTable = new ArrayList<>();
		for(int i=0;i<lists.size();i++){
			StockInfoTable s = new StockInfoTable();
			s.setId(i+1);
			s.setStock_id(lists.get(i).getStock_id());
			s.setAmplitude_ratio(lists.get(i).getAmplitude_ratio());
			s.setBought_price(lists.get(i).getBought_price());
			s.setDaily_up_down(lists.get(i).getDaily_up_down());
			s.setGrowth_speed(lists.get(i).getGrowth_speed());
			s.setMax(lists.get(i).getMax());
			s.setMin(lists.get(i).getMin());
			s.setSold_price(lists.get(i).getSold_price());
			s.setToday_begin_price(lists.get(i).getToday_begin_price());
			s.setTotal_money(lists.get(i).getTotal_money());
			s.setYtd_end_price(lists.get(i).getYtd_end_price());
			s.setZuixin(1.0);
			s.setZongshou(100l);
			s.setHuanshou(0);
			s.setStock_name("股票名为"+lists.get(i).getStock_id());
			listTable.add(s);
		}
		return listTable;
	}

}
