package org.news.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity(name="pay_log")
public class TradeLog {

	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "increment")
	private int id;
	private String userName;
	private String outTradeNo;
	private String subject;
	private int price;
	private String tradeNo;
	private String tradeStatus;
	private String response;
	private String time;
	
	public TradeLog(){}


	/**
	 * @param id
	 * @param userName
	 * @param outTradeNo
	 * @param subject
	 * @param price
	 * @param tradeNo
	 * @param tradeStatus
	 * @param response
	 * @param time
	 */
	public TradeLog(int id, String userName, String outTradeNo, String subject,
			int price, String tradeNo, String tradeStatus, String response,
			String time) {
		super();
		this.id = id;
		this.userName = userName;
		this.outTradeNo = outTradeNo;
		this.subject = subject;
		this.price = price;
		this.tradeNo = tradeNo;
		this.tradeStatus = tradeStatus;
		this.response = response;
		this.time = time;
	}



	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the outTradeNo
	 */
	public String getOutTradeNo() {
		return outTradeNo;
	}

	/**
	 * @param outTradeNo the outTradeNo to set
	 */
	public void setOutTradeNo(String outTradeNo) {
		this.outTradeNo = outTradeNo;
	}

	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}

	/**
	 * @param subject the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}

	/**
	 * @return the tradeNo
	 */
	public String getTradeNo() {
		return tradeNo;
	}

	/**
	 * @param tradeNo the tradeNo to set
	 */
	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}

	/**
	 * @return the tradeStatus
	 */
	public String getTradeStatus() {
		return tradeStatus;
	}

	/**
	 * @param tradeStatus the tradeStatus to set
	 */
	public void setTradeStatus(String tradeStatus) {
		this.tradeStatus = tradeStatus;
	}

	/**
	 * @return the response
	 */
	public String getResponse() {
		return response;
	}

	/**
	 * @param response the response to set
	 */
	public void setResponse(String response) {
		this.response = response;
	}


	/**
	 * @return the time
	 */
	public String getTime() {
		return time;
	}


	/**
	 * @param time the time to set
	 */
	public void setTime(String time) {
		this.time = time;
	}
	
}
