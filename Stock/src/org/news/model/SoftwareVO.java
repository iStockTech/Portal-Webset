package org.news.model;

public class SoftwareVO {
	
	private int softwareId;		//���Id
	private String softwareName;	//������
	private String softwareDescripe;	//�������
	private int price;		//����۸�	
	private String state;		//�Ƿ��ѹ���
	
	public SoftwareVO(){}
	
	
	public SoftwareVO(int softwareId, String softwareName,
			String softwareDescripe, int price, String isBuy) {
		super();
		this.softwareId = softwareId;
		this.softwareName = softwareName;
		this.softwareDescripe = softwareDescripe;
		this.price = price;
		this.state = isBuy;
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
	 * @return the state
	 */
	public String getState() {
		return state;
	}


	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}
	
	
}
