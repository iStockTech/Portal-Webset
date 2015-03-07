package org.news.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity(name="hotstock")
public class HotStock {

	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "increment")
	//private int id;
	private String stock_id;
	//private String stock_name;
	private String growth_ratio;  //涨幅(%)
	private String daily_up_down;   //日涨跌
	private String current_price;  //当前价
	
	public String getStock_id() {
		return stock_id;
	}
	public void setStock_id(String stock_id) {
		this.stock_id = stock_id;
	}
	public String getGrowth_ratio() {
		return growth_ratio;
	}
	public void setGrowth_ratio(String growth_ratio) {
		this.growth_ratio = growth_ratio;
	}
	public String getDaily_up_down() {
		return daily_up_down;
	}
	public void setDaily_up_down(String daily_up_down) {
		this.daily_up_down = daily_up_down;
	}
	public String getCurrent_price() {
		return current_price;
	}
	public void setCurrent_price(String current_price) {
		this.current_price = current_price;
	}
	public HotStock() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HotStock(String stock_id, String growth_ratio, String daily_up_down,
			String current_price) {
		super();
		this.stock_id = stock_id;
		this.growth_ratio = growth_ratio;
		this.daily_up_down = daily_up_down;
		this.current_price = current_price;
	}
	
	/*public String getStock_name() {
		return stock_name;
	}
	public void setStock_name(String stock_name) {
		this.stock_name = stock_name;
	}*/
	

}
