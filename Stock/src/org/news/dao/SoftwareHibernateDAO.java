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
	 * ������
	 * @param software ����VO����
	 * @return �����Ƿ�ɹ�
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
	 * ɾ�����
	 * @param software
	 * @return �Ƿ�ɹ�
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
	 * �޸������Ϣ
	 * @param software
	 * @return ���
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
  	  * ģ���ѯ���
  	  * @param keyword �ؼ���
     * @param currentPage ��ǰҳ
     * @param lineSize ÿҳ��С
     * @return �������
     */
   @SuppressWarnings("unchecked")
	public List<Software> getAllSoftwares(final String keyword, final int currentPage, final int lineSize){
   	//ͨ��һ��HibernateCallback������ִ�в�ѯ
   	final String hql = "from software where softwareName like ? order by softwareId";
   	  List<Software> list = getHibernateTemplate()
 			.executeFind(new HibernateCallback()
 		{
 			//ʵ��HibernateCallback�ӿڱ���ʵ�ֵķ���
 			public Object doInHibernate(Session session)
 				throws HibernateException, SQLException
 			{
 				//ִ��Hibernate��ҳ��ѯ
 				List<Software> result = session.createQuery(hql)
 					//Ϊhql��䴫�����
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
    * ��ѯ���йؼ��ֵ��������
    * @param keyword
    * @return �������
    */
   public long getCount(String keyword){
   	return (Long)getHibernateTemplate().find("select count(softwareId) " +
   	  		"from software where softwareName like ?",'%' + keyword + '%').get(0);
   }
   
   /**
    * ��ͨ��Id�������������Ϣ
    * @param attachmentId
    * @return
    */
   public Software findSoftwareById(int softwareId){
   	return (Software)getHibernateTemplate().get(Software.class, softwareId); 
   }
}
