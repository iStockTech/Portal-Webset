package org.news.service.impl;

import java.util.List;

import org.news.dao.SoftwareHibernateDAO;
import org.news.model.NewsInfo;
import org.news.model.NewsVO;
import org.news.model.Software;
import org.news.model.SoftwareVO;
import org.news.service.SoftwareService;

public class SoftwareServiceImpl implements SoftwareService{

	private SoftwareHibernateDAO softwareDAO;

	/**
	 * @param softwareDAO the softwareDAO to set
	 */
	public void setSoftwareDAO(SoftwareHibernateDAO softwareDAO) {
		this.softwareDAO = softwareDAO;
	}
	
	/**
	 * ������
	 * @param software ����VO����
	 * @return �����Ƿ�ɹ�
	 */
	public boolean addSoftware(Software software){
		return softwareDAO.addSoftware(software);
	}
	
	/**
     * ɾ�����
     * @param newsid
     * @return
     */
    public boolean deleteSoftware(int softwareid){
    	Software software = new Software();
    	software.setSoftwareId(softwareid);
    	return softwareDAO.deleteSoftware(software);
    }
    
    /**
	 * �޸������Ϣ
	 * @param software
	 * @return ���
	 */
	public Software updateSoftware(Software software) {
		return softwareDAO.updateSoftware(software);
	}
	
	/**
 	  * ģ���ѯ���
 	  * @param keyword �ؼ���
    * @param currentPage ��ǰҳ
    * @param lineSize ÿҳ��С
    * @return �������
    */
	public List<Software> getAllSoftwares(final String keyword, final int currentPage, final int lineSize){
		return softwareDAO.getAllSoftwares(keyword, currentPage, lineSize);
	}
	
	/**
	    * ��ѯ���йؼ��ֵ��������
	    * @param keyword
	    * @return �������
	    */
	   public long getCount(String keyword){
		   return softwareDAO.getCount(keyword);
	   }
	   
	   /**
	    * ��ͨ��Id�������������Ϣ
	    * @param attachmentId
	    * @return
	    */
	   public Software findSoftwareById(int softwareId){
		   return softwareDAO.findSoftwareById(softwareId);
	   }
	   
	   /**
		 * 将软件的PO转化成VO供显示
		 * 
		 * @param software
		 * @return
		 */
		public SoftwareVO toSoftwareVO(Software software) {
			SoftwareVO vo = new SoftwareVO();
			if (software != null) {
				vo.setSoftwareId(software.getSoftwareId());
				vo.setSoftwareName(software.getSoftwareName());
				vo.setSoftwareDescripe(software.getSoftwareDescripe());
				vo.setPrice(software.getPrice());
			}
			return vo;
		}
}
