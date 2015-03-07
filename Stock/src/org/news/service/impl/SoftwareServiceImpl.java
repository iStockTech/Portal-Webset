package org.news.service.impl;

import java.util.List;

import org.news.dao.SoftwareHibernateDAO;
import org.news.model.Software;
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
	 * 添加软件
	 * @param software 传入VO对象
	 * @return 操作是否成功
	 */
	public boolean addSoftware(Software software){
		return softwareDAO.addSoftware(software);
	}
	
	/**
     * 删除软件
     * @param newsid
     * @return
     */
    public boolean deleteSoftware(int softwareid){
    	Software software = new Software();
    	software.setSoftwareId(softwareid);
    	return softwareDAO.deleteSoftware(software);
    }
    
    /**
	 * 修改软件信息
	 * @param software
	 * @return 软件
	 */
	public Software updateSoftware(Software software) {
		return softwareDAO.updateSoftware(software);
	}
	
	/**
 	  * 模糊查询软件
 	  * @param keyword 关键字
    * @param currentPage 当前页
    * @param lineSize 每页大小
    * @return 软件集合
    */
	public List<Software> getAllSoftwares(final String keyword, final int currentPage, final int lineSize){
		return softwareDAO.getAllSoftwares(keyword, currentPage, lineSize);
	}
	
	/**
	    * 查询含有关键字的软件数量
	    * @param keyword
	    * @return 软件数量
	    */
	   public long getCount(String keyword){
		   return softwareDAO.getCount(keyword);
	   }
	   
	   /**
	    * 可通过Id来查找软件的信息
	    * @param attachmentId
	    * @return
	    */
	   public Software findSoftwareById(long softwareId){
		   return softwareDAO.findSoftwareById(softwareId);
	   }
}
