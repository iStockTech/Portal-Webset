package org.news.action;

import java.util.ArrayList;
import java.util.List;

import org.news.model.HotStock;
import org.news.service.impl.HotStockServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class HotStockAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6681989473048996746L;
	private HotStockServiceImpl hotStockService;
	private String hstop10;

	public String getHstop10() {
		return hstop10;
	}


	public void setHstop10(String hstop10) {
		this.hstop10 = hstop10;
	}


	public void sethotStockService(HotStockServiceImpl hotStockService) {
		this.hotStockService = hotStockService;
	}


	public String top10(){
		
		List<HotStock> top10Stock = new ArrayList<>();
		top10Stock = hotStockService.getTop10StockInfoByDay();
		
		StringBuffer strbuf = new StringBuffer();
		for(HotStock stock:top10Stock){
			strbuf.append(stock.getStock_id()+","+hotStockService.getTop10StockNameByDay(stock.getStock_id())+","+stock.getCurrent_price()+","+stock.getGrowth_ratio()+","+stock.getDaily_up_down()+";");
		}
		hstop10 = strbuf.toString();
		System.out.println(hstop10);
		return SUCCESS;
		
	}
	
	

}
