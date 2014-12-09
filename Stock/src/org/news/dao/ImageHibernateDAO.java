package org.news.dao;

import java.util.ArrayList;
import java.util.List;

import org.news.model.Image;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class ImageHibernateDAO extends HibernateDaoSupport {

	/**
	 * 查询数据库中的图片信息
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	public List<Image> getAllImages() {
		List<Image> images = new ArrayList<Image>(); // 定义集合，接收全部数据
		try {
			String queryString = "from image";
			return (List<Image>) getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 将图片信息添加到数据库中
	 * @param image
	 * @return
	 */
	@SuppressWarnings("finally")
	public boolean addImage(Image image){
		boolean b = false;//操作成功与否
		try {
			Integer id = (Integer)getHibernateTemplate().save(image);//返回新闻ID
			if(id>0){
				b = true;
			}
		} catch (RuntimeException e) {
			throw e;
		}finally{
			return b;
		}
	}
	
	/**
	 * 删除图片
	 * @param name
	 * @return
	 */
	@SuppressWarnings("finally")
	public boolean deleteImage(int newsInfoId) {
		boolean b = false;// 操作成功与否
		try {
			getHibernateTemplate().delete(this.getImage(newsInfoId));
			b = true;
		} catch (RuntimeException re) {
			re.printStackTrace();
		}finally{
			return b;
		}
	}
	
	
	/**
	 * 删除图片
	 * @param name
	 * @return
	 */
	@SuppressWarnings("finally")
	public boolean deleteImage(String imageName) {
		boolean b = false;// 操作成功与否
		try {
			getHibernateTemplate().delete(this.getImage(imageName));
			b = true;
		} catch (RuntimeException re) {
			re.printStackTrace();
		}finally{
			return b;
		}
	}
	
	/**
	 * 根据新闻ID查找图片
	 * @param newsInfoId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Image getImage(int newsInfoId){
		try {
			String queryString = "from image i where i.newsInfoId =?"; 
			List<Image> images = new ArrayList<Image>();
			images = (ArrayList<Image>)getHibernateTemplate().find(queryString,newsInfoId);
			return images.get(0);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * 根据新闻ID查找图片
	 * @param newsInfoId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Image getImage(String imageName){
		try {
			String queryString = "from image i where i.imageName =?"; 
			List<Image> images = new ArrayList<Image>();
			images = (ArrayList<Image>)getHibernateTemplate().find(queryString,imageName);
			return images.get(0);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
