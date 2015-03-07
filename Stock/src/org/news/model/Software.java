package org.news.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

/**
 * �����ϢPO
 * @author tt
 * @version 14.6.18
 */
@Entity(name="software")
public class Software {

	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "increment")
	private int softwareId;		//���Id
	private String softwareName;	//������
	private String softwareDescripe;	//�������
	private int price;		//����۸�	
	private int permissionLevel;		//Ȩ�޵ȼ�
	private String softwareType;
	
	public Software(){}

	public Software(int softwareId, String softwareName,
			String softwareDescripe, int price, int permissionLevel,
			String softwareType) {
		super();
		this.softwareId = softwareId;
		this.softwareName = softwareName;
		this.softwareDescripe = softwareDescripe;
		this.price = price;
		this.permissionLevel = permissionLevel;
		this.softwareType = softwareType;
	}



	/**
	 * @return the softwareId
	 */
	public int getSoftwareId() {
		return softwareId;
	}

	/**
	 * @param softwareId the softwareId to set
	 */
	public void setSoftwareId(int softwareId) {
		this.softwareId = softwareId;
	}

	/**
	 * @return the softwareName
	 */
	public String getSoftwareName() {
		return softwareName;
	}

	/**
	 * @param softwareName the softwareName to set
	 */
	public void setSoftwareName(String softwareName) {
		this.softwareName = softwareName;
	}

	/**
	 * @return the softwareDescripe
	 */
	public String getSoftwareDescripe() {
		return softwareDescripe;
	}

	/**
	 * @param softwareDescripe the softwareDescripe to set
	 */
	public void setSoftwareDescripe(String softwareDescripe) {
		this.softwareDescripe = softwareDescripe;
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
	 * @return the permissionLevel
	 */
	public int getPermissionLevel() {
		return permissionLevel;
	}

	/**
	 * @param permissionLevel the permissionLevel to set
	 */
	public void setPermissionLevel(int permissionLevel) {
		this.permissionLevel = permissionLevel;
	}

	public String getSoftwareType() {
		return softwareType;
	}

	public void setSoftwareType(String softwareType) {
		this.softwareType = softwareType;
	}
}

