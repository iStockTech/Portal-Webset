package org.news.service;

import java.io.File;
import java.util.List;

import org.news.model.Image;

public interface ImageService {
	
	/**
	 * 将图片上传到服务器
	 * @param imageFile
	 * @param imageFileName
	 * @return
	 */
	public boolean imageExecute(File imageFile,String imageFileName);
	

	/**
	 * 删除服务器上的图片以及数据库中的图片信息
	 */
	public boolean deleteImage(String filename,int newsInfoId);
	
	/**
	 * 根据新闻ID获取图片名字
	 * @param newsInfoId
	 * @return
	 */
	public String getImageName(int newsInfoId);
	
	/**
	 * 获取新闻图片地址
	 * @param newsInfoId
	 * @return 图片名
	 */
	public String getImage(int newsInfoId);
	
	/**
	 * 查询数据库中的图片信息
	 * @return
	 */
	public List<Image> getAllImages();
	
	/**
	 * 将图片信息添加到数据库中
	 * @param image
	 * @return
	 */
	public boolean addImage(Image image);
	
	/**
	 * 删除数据库中的图片信息
	 * @param name
	 * @return
	 */
	public boolean deleteImage(int newsInfoId);
	
	/**
	 * 删除数据库中的图片信息
	 * @param name
	 * @return
	 */
	public boolean deleteImage(String imageName);
	
	
}
