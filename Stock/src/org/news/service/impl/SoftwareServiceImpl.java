package org.news.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.news.dao.OrderHibernateDAO;
import org.news.dao.SoftwareHibernateDAO;
import org.news.dao.UsersHibernateDAO;
import org.news.model.Orders;
import org.news.model.Software;
import org.news.model.SoftwareVO;
import org.news.service.SoftwareService;
import org.owasp.esapi.ESAPI;

public class SoftwareServiceImpl implements SoftwareService{

	private OrderHibernateDAO orderDAO;
	private UsersHibernateDAO userDAO;
	private SoftwareHibernateDAO softwareDAO;
	
	
	/**
	 * @param userDAO the userDAO to set
	 */
	public void setUserDAO(UsersHibernateDAO userDAO) {
		this.userDAO = userDAO;
	}

	/**
	 * @param softwareDAO the softwareDAO to set
	 */
	public void setSoftwareDAO(SoftwareHibernateDAO softwareDAO) {
		this.softwareDAO = softwareDAO;
	}

	/**
	 * @param orderDAO the orderDAO to set
	 */
	public void setOrderDAO(OrderHibernateDAO orderDAO) {
		this.orderDAO = orderDAO;
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
	public boolean updateSoftware(Software software) {
		if (softwareDAO.updateSoftware(software) == null){
			return false;
		}else{
			return true;
		}
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
		
		/**
		 * 用户软件列表
		 * @param keyword 关键字
		 * @param currentPage 当前页
		 * @param lineSize 页大小
		 * @param userName 用户名
		 * @return
		 */
		public List<SoftwareVO> getAllSoftwaresForUser(final String keyword, final int currentPage, final int lineSize,String userName){
			List<Software> softs = softwareDAO.getAllSoftwares(keyword, currentPage, lineSize);
			
			if (null == userDAO.findUsersByName(userName))
			{
				return new ArrayList<SoftwareVO>();
			}
			
			List<Orders> orders = orderDAO.getAllSoftwares(userDAO.findUsersByName(userName).getUsersId());
			
			List<SoftwareVO> vos = new ArrayList<SoftwareVO>();
			
			//设置软件的状态是不是已买
			for (Software soft:softs){
				SoftwareVO vo = toSoftwareVO(soft);
				vo.setState("未购买");
				for (Orders order:orders){
					if (order.getTradeState().equals("finished")&&order.getSoftware().getSoftwareId()==soft.getSoftwareId()){
						vo.setState("已购买");
						break;
					}
				}
				vos.add(vo);
			}
			
			return vos;
		}
}
