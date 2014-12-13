package org.news.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;
/**
 * 股票的所有信息
 * 共57个字段
 * @author dirkwang
 */
@Entity(name="stock_day_info")
public class Stock_day_info {
	
	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "increment")
	private Integer seq_no;
	private String stock_id;
	private Double growth_ratio;
	private Double current_price;
	private Double daily_up_down;
	private Double bought_price;
	private Double sold_price;
	private Integer total_deal_amount;
	private Integer last_deal_amount;
	private Double growth_speed;
	private Double turnover_ratio;
	private Double today_begin_price;
	private Double ytd_end_price;
	private Double pe_ratio;
	private Double max;
	private Double min;
	private Long total_money;
	private Double amplitude_ratio;
	private Integer cir_of_cap_stock;
	private Double upordown_per_deal;
	private Double volume_ratio;
	private Double avg_price;
	private Double DaPanWeiBi;
	private Integer sell;
	private Integer buy;
	private Double sb_ratio;
	private Integer daPanWeiCha;
	private Integer num1_buy;
	private Integer num1_sell;
	private Double num1_buy_price;
	private Double num1_sell_price;
	private Double num2_sell_price;
	private Integer num2_sell;
	private Double num2_buy_price;
	private Integer num2_buy;
	private Double num3_buy_price;
	private Integer num3_buy;
	private Double num3_sell_price;
	private Integer num3_sell;
	private String circulation_value;
	private Double bbi_balance;
	private Double bull_profit;
	private Double bull_stop_losses;
	private Double short_covering;
	private Double bear_stop_losses;
	private Double relative_strength_index;
	private Integer activity;
	private Double num_per_deal;
	private Double turn_per_deal;
	private Timestamp update_date;
	private Double total_stock;
	private Double max_circulation_value;
	private Double current_circulation_value;
	private Double min_circulation_value;
	private Double avg_circulation_value;
	private Double total_value;
	private Timestamp created;
	
	public Stock_day_info(Integer seq_no, String stock_id, Double growth_ratio,
			Double current_price, Double daily_up_down, Double bought_price,
			Double sold_price, Integer total_deal_amount,
			Integer last_deal_amount, Double growth_speed,
			Double turnover_ratio, Double today_begin_price,
			Double ytd_end_price, Double pe_ratio, Double max, Double min,
			Long total_money, Double amplitude_ratio, Integer cir_of_cap_stock,
			Double upordown_per_deal, Double volume_ratio, Double avg_price,
			Double daPanWeiBi, Integer sell, Integer buy, Double sb_ratio,
			Integer daPanWeiCha, Integer num1_buy, Integer num1_sell,
			Double num1_buy_price, Double num1_sell_price,
			Double num2_sell_price, Integer num2_sell, Double num2_buy_price,
			Integer num2_buy, Double num3_buy_price, Integer num3_buy,
			Double num3_sell_price, Integer num3_sell,
			String circulation_value, Double bbi_balance, Double bull_profit,
			Double bull_stop_losses, Double short_covering,
			Double bear_stop_losses, Double relative_strength_index,
			Integer activity, Double num_per_deal, Double turn_per_deal,
			Timestamp update_date, Double total_stock,
			Double max_circulation_value, Double current_circulation_value,
			Double min_circulation_value, Double avg_circulation_value,
			Double total_value, Timestamp created) {
		super();
		this.seq_no = seq_no;
		this.stock_id = stock_id;
		this.growth_ratio = growth_ratio;
		this.current_price = current_price;
		this.daily_up_down = daily_up_down;
		this.bought_price = bought_price;
		this.sold_price = sold_price;
		this.total_deal_amount = total_deal_amount;
		this.last_deal_amount = last_deal_amount;
		this.growth_speed = growth_speed;
		this.turnover_ratio = turnover_ratio;
		this.today_begin_price = today_begin_price;
		this.ytd_end_price = ytd_end_price;
		this.pe_ratio = pe_ratio;
		this.max = max;
		this.min = min;
		this.total_money = total_money;
		this.amplitude_ratio = amplitude_ratio;
		this.cir_of_cap_stock = cir_of_cap_stock;
		this.upordown_per_deal = upordown_per_deal;
		this.volume_ratio = volume_ratio;
		this.avg_price = avg_price;
		DaPanWeiBi = daPanWeiBi;
		this.sell = sell;
		this.buy = buy;
		this.sb_ratio = sb_ratio;
		this.daPanWeiCha = daPanWeiCha;
		this.num1_buy = num1_buy;
		this.num1_sell = num1_sell;
		this.num1_buy_price = num1_buy_price;
		this.num1_sell_price = num1_sell_price;
		this.num2_sell_price = num2_sell_price;
		this.num2_sell = num2_sell;
		this.num2_buy_price = num2_buy_price;
		this.num2_buy = num2_buy;
		this.num3_buy_price = num3_buy_price;
		this.num3_buy = num3_buy;
		this.num3_sell_price = num3_sell_price;
		this.num3_sell = num3_sell;
		this.circulation_value = circulation_value;
		this.bbi_balance = bbi_balance;
		this.bull_profit = bull_profit;
		this.bull_stop_losses = bull_stop_losses;
		this.short_covering = short_covering;
		this.bear_stop_losses = bear_stop_losses;
		this.relative_strength_index = relative_strength_index;
		this.activity = activity;
		this.num_per_deal = num_per_deal;
		this.turn_per_deal = turn_per_deal;
		this.update_date = update_date;
		this.total_stock = total_stock;
		this.max_circulation_value = max_circulation_value;
		this.current_circulation_value = current_circulation_value;
		this.min_circulation_value = min_circulation_value;
		this.avg_circulation_value = avg_circulation_value;
		this.total_value = total_value;
		this.created = created;
	}

	public Integer getSeq_no() {
		return seq_no;
	}

	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}

	public String getStock_id() {
		return stock_id;
	}

	public void setStock_id(String stock_id) {
		this.stock_id = stock_id;
	}

	public Double getGrowth_ratio() {
		return growth_ratio;
	}

	public void setGrowth_ratio(Double growth_ratio) {
		this.growth_ratio = growth_ratio;
	}

	public Double getCurrent_price() {
		return current_price;
	}

	public void setCurrent_price(Double current_price) {
		this.current_price = current_price;
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

	public Integer getTotal_deal_amount() {
		return total_deal_amount;
	}

	public void setTotal_deal_amount(Integer total_deal_amount) {
		this.total_deal_amount = total_deal_amount;
	}

	public Integer getLast_deal_amount() {
		return last_deal_amount;
	}

	public void setLast_deal_amount(Integer last_deal_amount) {
		this.last_deal_amount = last_deal_amount;
	}

	public Double getGrowth_speed() {
		return growth_speed;
	}

	public void setGrowth_speed(Double growth_speed) {
		this.growth_speed = growth_speed;
	}

	public Double getTurnover_ratio() {
		return turnover_ratio;
	}

	public void setTurnover_ratio(Double turnover_ratio) {
		this.turnover_ratio = turnover_ratio;
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

	public Double getPe_ratio() {
		return pe_ratio;
	}

	public void setPe_ratio(Double pe_ratio) {
		this.pe_ratio = pe_ratio;
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

	public Integer getCir_of_cap_stock() {
		return cir_of_cap_stock;
	}

	public void setCir_of_cap_stock(Integer cir_of_cap_stock) {
		this.cir_of_cap_stock = cir_of_cap_stock;
	}

	public Double getUpordown_per_deal() {
		return upordown_per_deal;
	}

	public void setUpordown_per_deal(Double upordown_per_deal) {
		this.upordown_per_deal = upordown_per_deal;
	}

	public Double getVolume_ratio() {
		return volume_ratio;
	}

	public void setVolume_ratio(Double volume_ratio) {
		this.volume_ratio = volume_ratio;
	}

	public Double getAvg_price() {
		return avg_price;
	}

	public void setAvg_price(Double avg_price) {
		this.avg_price = avg_price;
	}

	public Double getDaPanWeiBi() {
		return DaPanWeiBi;
	}

	public void setDaPanWeiBi(Double daPanWeiBi) {
		DaPanWeiBi = daPanWeiBi;
	}

	public Integer getSell() {
		return sell;
	}

	public void setSell(Integer sell) {
		this.sell = sell;
	}

	public Integer getBuy() {
		return buy;
	}

	public void setBuy(Integer buy) {
		this.buy = buy;
	}

	public Double getSb_ratio() {
		return sb_ratio;
	}

	public void setSb_ratio(Double sb_ratio) {
		this.sb_ratio = sb_ratio;
	}

	public Integer getDaPanWeiCha() {
		return daPanWeiCha;
	}

	public void setDaPanWeiCha(Integer daPanWeiCha) {
		this.daPanWeiCha = daPanWeiCha;
	}

	public Integer getNum1_buy() {
		return num1_buy;
	}

	public void setNum1_buy(Integer num1_buy) {
		this.num1_buy = num1_buy;
	}

	public Integer getNum1_sell() {
		return num1_sell;
	}

	public void setNum1_sell(Integer num1_sell) {
		this.num1_sell = num1_sell;
	}

	public Double getNum1_buy_price() {
		return num1_buy_price;
	}

	public void setNum1_buy_price(Double num1_buy_price) {
		this.num1_buy_price = num1_buy_price;
	}

	public Double getNum1_sell_price() {
		return num1_sell_price;
	}

	public void setNum1_sell_price(Double num1_sell_price) {
		this.num1_sell_price = num1_sell_price;
	}

	public Double getNum2_sell_price() {
		return num2_sell_price;
	}

	public void setNum2_sell_price(Double num2_sell_price) {
		this.num2_sell_price = num2_sell_price;
	}

	public Integer getNum2_sell() {
		return num2_sell;
	}

	public void setNum2_sell(Integer num2_sell) {
		this.num2_sell = num2_sell;
	}

	public Double getNum2_buy_price() {
		return num2_buy_price;
	}

	public void setNum2_buy_price(Double num2_buy_price) {
		this.num2_buy_price = num2_buy_price;
	}

	public Integer getNum2_buy() {
		return num2_buy;
	}

	public void setNum2_buy(Integer num2_buy) {
		this.num2_buy = num2_buy;
	}

	public Double getNum3_buy_price() {
		return num3_buy_price;
	}

	public void setNum3_buy_price(Double num3_buy_price) {
		this.num3_buy_price = num3_buy_price;
	}

	public Integer getNum3_buy() {
		return num3_buy;
	}

	public void setNum3_buy(Integer num3_buy) {
		this.num3_buy = num3_buy;
	}

	public Double getNum3_sell_price() {
		return num3_sell_price;
	}

	public void setNum3_sell_price(Double num3_sell_price) {
		this.num3_sell_price = num3_sell_price;
	}

	public Integer getNum3_sell() {
		return num3_sell;
	}

	public void setNum3_sell(Integer num3_sell) {
		this.num3_sell = num3_sell;
	}

	public String getCirculation_value() {
		return circulation_value;
	}

	public void setCirculation_value(String circulation_value) {
		this.circulation_value = circulation_value;
	}

	public Double getBbi_balance() {
		return bbi_balance;
	}

	public void setBbi_balance(Double bbi_balance) {
		this.bbi_balance = bbi_balance;
	}

	public Double getBull_profit() {
		return bull_profit;
	}

	public void setBull_profit(Double bull_profit) {
		this.bull_profit = bull_profit;
	}

	public Double getBull_stop_losses() {
		return bull_stop_losses;
	}

	public void setBull_stop_losses(Double bull_stop_losses) {
		this.bull_stop_losses = bull_stop_losses;
	}

	public Double getShort_covering() {
		return short_covering;
	}

	public void setShort_covering(Double short_covering) {
		this.short_covering = short_covering;
	}

	public Double getBear_stop_losses() {
		return bear_stop_losses;
	}

	public void setBear_stop_losses(Double bear_stop_losses) {
		this.bear_stop_losses = bear_stop_losses;
	}

	public Double getRelative_strength_index() {
		return relative_strength_index;
	}

	public void setRelative_strength_index(Double relative_strength_index) {
		this.relative_strength_index = relative_strength_index;
	}

	public Integer getActivity() {
		return activity;
	}

	public void setActivity(Integer activity) {
		this.activity = activity;
	}

	public Double getNum_per_deal() {
		return num_per_deal;
	}

	public void setNum_per_deal(Double num_per_deal) {
		this.num_per_deal = num_per_deal;
	}

	public Double getTurn_per_deal() {
		return turn_per_deal;
	}

	public void setTurn_per_deal(Double turn_per_deal) {
		this.turn_per_deal = turn_per_deal;
	}

	public Timestamp getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}

	public Double getTotal_stock() {
		return total_stock;
	}

	public void setTotal_stock(Double total_stock) {
		this.total_stock = total_stock;
	}

	public Double getMax_circulation_value() {
		return max_circulation_value;
	}

	public void setMax_circulation_value(Double max_circulation_value) {
		this.max_circulation_value = max_circulation_value;
	}

	public Double getCurrent_circulation_value() {
		return current_circulation_value;
	}

	public void setCurrent_circulation_value(Double current_circulation_value) {
		this.current_circulation_value = current_circulation_value;
	}

	public Double getMin_circulation_value() {
		return min_circulation_value;
	}

	public void setMin_circulation_value(Double min_circulation_value) {
		this.min_circulation_value = min_circulation_value;
	}

	public Double getAvg_circulation_value() {
		return avg_circulation_value;
	}

	public void setAvg_circulation_value(Double avg_circulation_value) {
		this.avg_circulation_value = avg_circulation_value;
	}

	public Double getTotal_value() {
		return total_value;
	}

	public void setTotal_value(Double total_value) {
		this.total_value = total_value;
	}

	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public Stock_day_info() {
		super();
	}
}
