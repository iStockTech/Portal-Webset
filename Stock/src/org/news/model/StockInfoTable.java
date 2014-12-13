package org.news.model;

public class StockInfoTable {
	
	private int id;
	private String stock_id;
	private String stock_name;
	private Double growth_speed;  //涨幅
	private Double daily_up_down;  //涨跌
	private Double bought_price;  //买入价
	private Double sold_price;   //卖出价
	private Long total_money;   //金额
	private Double amplitude_ratio;  //市盈动率
	private Double max;  //最高
	private Double min;  //最低
	private Double today_begin_price;   //今日开盘价
	private Double ytd_end_price;  //昨日收盘价
	
	private Long zongshou; //总手
	private int huanshou;  //先手
	private Double zuixin; //换手         
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStock_id() {
		return stock_id;
	}
	public void setStock_id(String stock_id) {
		this.stock_id = stock_id;
	}
	public String getStock_name() {
		return stock_name;
	}
	public void setStock_name(String stock_name) {
		this.stock_name = stock_name;
	}
	public Double getGrowth_speed() {
		return growth_speed;
	}
	public void setGrowth_speed(Double growth_speed) {
		this.growth_speed = growth_speed;
	}
	public Double getDaily_up_down() {
		return daily_up_down;
	}
	public void setDaily_up_down(Double daily_up_down) {
		this.daily_up_down = daily_up_down;
	}
	public Double getBought_price() {
		return bought_price;
	}
	public void setBought_price(Double bought_price) {
		this.bought_price = bought_price;
	}
	public Double getSold_price() {
		return sold_price;
	}
	public void setSold_price(Double sold_price) {
		this.sold_price = sold_price;
	}
	public Long getTotal_money() {
		return total_money;
	}
	public void setTotal_money(Long total_money) {
		this.total_money = total_money;
	}
	public Double getAmplitude_ratio() {
		return amplitude_ratio;
	}
	public void setAmplitude_ratio(Double amplitude_ratio) {
		this.amplitude_ratio = amplitude_ratio;
	}
	public Double getMax() {
		return max;
	}
	public void setMax(Double max) {
		this.max = max;
	}
	public Double getMin() {
		return min;
	}
	public void setMin(Double min) {
		this.min = min;
	}
	public Double getToday_begin_price() {
		return today_begin_price;
	}
	public void setToday_begin_price(Double today_begin_price) {
		this.today_begin_price = today_begin_price;
	}
	public Double getYtd_end_price() {
		return ytd_end_price;
	}
	public void setYtd_end_price(Double ytd_end_price) {
		this.ytd_end_price = ytd_end_price;
	}
	public Long getZongshou() {
		return zongshou;
	}
	public void setZongshou(Long zongshou) {
		this.zongshou = zongshou;
	}
	public int getHuanshou() {
		return huanshou;
	}
	public void setHuanshou(int huanshou) {
		this.huanshou = huanshou;
	}
	public Double getZuixin() {
		return zuixin;
	}
	public void setZuixin(Double zuixin) {
		this.zuixin = zuixin;
	}
	public StockInfoTable(int id, String stock_id, String stock_name,
			Double growth_speed, Double daily_up_down, Double bought_price,
			Double sold_price, Long total_money, Double amplitude_ratio,
			Double max, Double min, Double today_begin_price,
			Double ytd_end_price, Long zongshou, int huanshou, Double zuixin) {
		super();
		this.id = id;
		this.stock_id = stock_id;
		this.stock_name = stock_name;
		this.growth_speed = growth_speed;
		this.daily_up_down = daily_up_down;
		this.bought_price = bought_price;
		this.sold_price = sold_price;
		this.total_money = total_money;
		this.amplitude_ratio = amplitude_ratio;
		this.max = max;
		this.min = min;
		this.today_begin_price = today_begin_price;
		this.ytd_end_price = ytd_end_price;
		this.zongshou = zongshou;
		this.huanshou = huanshou;
		this.zuixin = zuixin;
	}
	public StockInfoTable() {
		super();
	}
					
}
