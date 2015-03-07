package org.news.service;

import java.util.List;

import org.news.model.Software;

public interface SoftwareService {

	/**
	 * 添加软件
	 * @param software 传入VO对象
	 * @return 操作是否成功
	 */
	public boolean addSoftware(Software software);
	
	/**
     * 删除软件
     * @param newsid
     * @return
     */
    public boolean deleteSoftware(int softwareid);
    
    /**
	 * 修改软件信息
	 * @param software
	 * @return 软件
	 */
	public Software updateSoftware(Software software);
	
	/**
	  * 模糊查询软件
	  * @param keyword 关键字
   * @param currentPage 当前页
   * @param lineSize 每页大小
   * @return 软件集合
   */
	public List<Software> getAllSoftwares(final String keyword, final int currentPage, final int lineSize);
	
	/**
	    * 查询含有关键字的软件数量
	    * @param keyword
	    * @return 软件数量
	    */
	   public long getCount(String keyword);
	   
	   /**
	    * 可通过Id来查找软件的信息
	    * @param attachmentId
	    * @return
	    */
	   public Software findSoftwareById(long softwareId);
}
