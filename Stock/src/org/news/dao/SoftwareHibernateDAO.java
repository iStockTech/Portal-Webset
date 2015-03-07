package org.news.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.news.model.Software;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class SoftwareHibernateDAO extends HibernateDaoSupport {

	private static final Logger log = LoggerFactory.getLogger(SoftwareHibernateDAO.class);
	
	/**
	 * 添加软件
	 * @param software 传入VO对象
	 * @return 操作是否成功
	 */
	@SuppressWarnings("finally")
	public boolean addSoftware(Software software){
		boolean result = false;
		try {
			getHibernateTemplate().save(software);
			log.debug("save successful");
			result = true;
		} catch (RuntimeException e) {
			log.error("save failed", e);
			throw e;
		}finally{
			return result;
		}
	}
	
	/**
	 * 删除软件
	 * @param software
	 * @return 是否成功
	 */
	@SuppressWarnings("finally")
	public boolean deleteSoftware(Software software) {
		boolean result = false;
		try {
			Software soft = getHibernateTemplate().merge(software);
			getHibernateTemplate().delete(soft);
			log.debug("delete successful");
			result = true;
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}finally{
			return result;
		}
	}
	
	/**
	 * 修改软件信息
	 * @param software
	 * @return 软件
	 */
	@SuppressWarnings("finally")
	public Software updateSoftware(Software software) {
		try{
			getHibernateTemplate().update(software);
			log.debug("update successful");
		}catch (RuntimeException e) {
			log.error("update failed", e);
			software = null;
			throw e;
		}finally{
			return software;
		}
	}
	
	/**
  	  * 模糊查询软件
  	  * @param keyword 关键字
     * @param currentPage 当前页
     * @param lineSize 每页大小
     * @return 软件集合
     */
   @SuppressWarnings("unchecked")
	public List<Software> getAllSoftwares(final String keyword, final int currentPage, final int lineSize){
   	//通过一个HibernateCallback对象来执行查询
   	final String hql = "from software where softwareName like ? order by softwareId";
   	  List<Software> list = getHibernateTemplate()
 			.executeFind(new HibernateCallback()
 		{
 			//实现HibernateCallback接口必须实现的方法
 			public Object doInHibernate(Session session)
 				throws HibernateException, SQLException
 			{
 				//执行Hibernate分页查询
 				List<Software> result = session.createQuery(hql)
 					//为hql语句传入参数
 					.setParameter(0, '%' + keyword + '%') 
 					.setFirstResult((currentPage - 1) * lineSize)
 					.setMaxResults(lineSize)
 					.list();
 				return result;
 			}
 		});
 		return list;
     }
   
   /**
    * 查询含有关键字的软件数量
    * @param keyword
    * @return 软件数量
    */
   public long getCount(String keyword){
   	return (Long)getHibernateTemplate().find("select count(softwareId) " +
   	  		"from software where softwareName like ?",'%' + keyword + '%').get(0);
   }
   
   /**
    * 可通过Id来查找软件的信息
    * @param attachmentId
    * @return
    */
   public Software findSoftwareById(long softwareId){
   	return (Software)getHibernateTemplate().get(Software.class, softwareId); 
   }
}
