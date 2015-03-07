package org.news.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

@Entity(name="orders")
public class Orders implements Serializable {

	private static final long serialVersionUID = 4441029194294397801L;

	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "increment")
	private int orderId;		//软件Id
		
	private Users user;
	private Software software;
	
	public Orders(){}
	
	/**
	 * @return the orderId
	 */
	public int getOrderId() {
		return orderId;
	}
	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	/**
	 * @return the user
	 */
	public Users getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	@OneToOne(fetch = FetchType.LAZY)//表示一对一的关系
	@JoinColumn(name="usersId")//为数据中的外键指定个名称
	public void setUser(Users user) {
		this.user = user;
	}
	
	/**
	 * @return the software
	 */
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)//表示一对一的关系
	@JoinColumn(name="softwareId")//为数据中的外键指定个名称
	public Software getSoftware() {
		return software;
	}
	/**
	 * @param software the software to set
	 */
	public void setSoftware(Software software) {
		this.software = software;
	}
}
