package org.news.service.impl;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.news.dao.ImageHibernateDAO;
import org.news.model.Image;
import org.news.service.ImageService;

public class ImageServiceImpl implements ImageService{
	
	private ImageHibernateDAO imageDAO;
	public ImageHibernateDAO getImageDAO() {
		return imageDAO;
	}

	public void setImageDAO(ImageHibernateDAO imageDAO) {
		this.imageDAO = imageDAO;
	}

	/**
	 * 将图片上传到服务器
	 * @return
	 */
	public boolean imageExecute(File imageFile,String imageFileName){
		boolean b = false;
		InputStream is;
		try {
			ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
			is = new FileInputStream(imageFile);
			String root = ServletActionContext.getServletContext().getRealPath(
					"/upload");// 保存图片的目录
			
			File file =new File(root);    
			//如果文件夹不存在则创建    
			if(!file.exists()&&!file.isDirectory()){
				file.mkdir();    
			} 
			// 将后缀名改成小写
			String name = imageFileName;
			int pos = name.lastIndexOf(".");
			String suffix = name.substring(pos);
			String newName = name.substring(0, pos) + suffix.toLowerCase();

			File deskFile = new File(root, newName);

			// 输出到外存中
			OutputStream os = new FileOutputStream(deskFile);
			byte[] bytefer = new byte[400];
			int length = 0;
			while ((length = is.read(bytefer)) > 0) {
				os.write(bytefer, 0, length);
			}
			os.close();
			is.close();
			b = true;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	/**
	 * 删除服务器上的图片以及数据库中的图片信息
	 */
	public boolean deleteImage(String filename,int newsInfoId){
		boolean b = false;
		String filepath = ServletActionContext.getServletContext().getRealPath("/upload") + java.io.File.separator; //文件保存路径
		try{
			File file = new File(filepath+filename);
			if(file.exists()){
				FileUtils.forceDelete(file);
			}
			this.deleteImage(newsInfoId);
			b = true;
		}catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	/**
	 * 根据新闻ID获取图片名字
	 * @param newsInfoId
	 * @return
	 */
	public String getImageName(int newsInfoId){
		Image image = imageDAO.getImage(newsInfoId);
		return image.getImageName();
	}
	
	/**
	 * 根据新闻ID获取图片地址
	 */
	@Override
	public String getImage(int newsInfoId) {
		Image image = imageDAO.getImage(newsInfoId);
		String outImage="";
		String imageName = image.getImageName();
		//String outPath = ServletActionContext.getServletContext().getRealPath("/");
		String outPath = ServletActionContext.getRequest().getContextPath();
		outImage=outPath+"/upload/"+imageName;
	    return outImage;
	}

	/**
	 * 取出数据库所有图片信息
	 */
	@Override
	public List<Image> getAllImages() {
		return imageDAO.getAllImages();
	}

	/**
	 * 将图片信息存储到数据库中
	 */
	@Override
	public boolean addImage(Image image) {
		return imageDAO.addImage(image);
	}

	/**
	 * 根据新闻ID，将图片信息从数据库中删除
	 */
	@Override
	public boolean deleteImage(int newsInfoId) {
		return imageDAO.deleteImage(newsInfoId);
	}
	
	/**
	 * 根据图片名，将图片信息从数据库中删除
	 * @param name
	 * @return
	 */
	public boolean deleteImage(String imageName){
		return imageDAO.deleteImage(imageName);
	}
}
