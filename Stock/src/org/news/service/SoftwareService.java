package org.news.service;

import java.util.List;

import org.news.model.Software;
import org.news.model.SoftwareVO;

public interface SoftwareService {

	/**
	 * ������
	 * @param software ����VO����
	 * @return �����Ƿ�ɹ�
	 */
	public boolean addSoftware(Software software);
	
	/**
     * ɾ�����
     * @param newsid
     * @return
     */
    public boolean deleteSoftware(int softwareid);
    
    /**
	 * �޸������Ϣ
	 * @param software
	 * @return ���
	 */
	public Software updateSoftware(Software software);
	
	/**
	  * ģ���ѯ���
	  * @param keyword �ؼ���
   * @param currentPage ��ǰҳ
   * @param lineSize ÿҳ��С
   * @return �������
   */
	public List<Software> getAllSoftwares(final String keyword, final int currentPage, final int lineSize);
	
	/**
	    * ��ѯ���йؼ��ֵ��������
	    * @param keyword
	    * @return �������
	    */
	   public long getCount(String keyword);
	   
	   /**
	    * ��ͨ��Id�������������Ϣ
	    * @param attachmentId
	    * @return
	    */
	   public Software findSoftwareById(int softwareId);
	   
	   /**
		 * 将软件的PO转化成VO供显示
		 * 
		 * @param software
		 * @return
		 */
		public SoftwareVO toSoftwareVO(Software software);
		
		/**
		 * 用户软件列表
		 * @param keyword 关键字
		 * @param currentPage 当前页
		 * @param lineSize 页大小
		 * @param userName 用户名
		 * @return
		 */
		public List<SoftwareVO> getAllSoftwaresForUser(final String keyword, final int currentPage, final int lineSize,String userName);
}
