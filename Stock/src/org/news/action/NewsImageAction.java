package org.news.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.news.model.Image;
import org.news.service.ImageService;

import com.opensymphony.xwork2.ActionSupport;

public class NewsImageAction extends ActionSupport {

	private static final long serialVersionUID = 3656096300384164818L;
	private ImageService imageService;

	String msg = null ;//提示信息
	List<Image>images = new ArrayList<Image>();
    String filename;//下载文件名
    private File file;    
    private String fileFileName;   
    private String fileContentType;   
    private String newsInfoId;
    private String imageDescript;
    
	
	public ImageService getImageService() {
		return imageService;
	}

	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public String getFilename() {
		String downFileName = "";
		try {
			downFileName = java.net.URLEncoder.encode(filename, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    return downFileName;
	}

	public void setFilename(String filename) {
		try {
			this.filename = new String(filename.getBytes("ISO8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getNewsInfoId() {
		return newsInfoId;
	}

	public void setNewsInfoId(String newsInfoId) {
		this.newsInfoId = newsInfoId;
	}

	public String getImageDescript() {
		return imageDescript;
	}

	public void setImageDescript(String imageDescript) {
		this.imageDescript = imageDescript;
	}

	
	/**
	 * 根据新闻ID返回对应图片
	 * 
	 * @param newsInfoId
	 * @return
	 */
	public String getImage(int newsInfoId) {
		return imageService.getImage(newsInfoId);
	}

	/**
	 * 图片上传：用于新闻列表的图片
	 * @return
	 * @throws IOException
	 */
	public String uploadImage() throws IOException {

		InputStream is;
		String pageErrorInfo = null;
		msg = "successed";
		try {
			ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
			is = new FileInputStream(getFile());
			String root = ServletActionContext.getServletContext().getRealPath(
					"/upload");// 保存图片的目录
			
			File file =new File(root);    
			//如果文件夹不存在则创建    
			if(!file.exists()&&!file.isDirectory()){
				file.mkdir();    
			} 
			// 将后缀名改成小写
			String name = this.getFileFileName();
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

			Image image = new Image();
			List<Image> images = imageService.getAllImages();
			int imageId = (images.size() == 0) ? 1 : (images.get(
					images.size() - 1).getImageId() + 1);// 新的ID等于最大的ID加1
			image = new Image(imageId, Integer.valueOf(newsInfoId).intValue(),
					this.getFileFileName(), imageDescript);// 创建时间为当前时间

			try {// 更新数据库
				if (imageService.addImage(image)) {
					return SUCCESS;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			pageErrorInfo = e.getMessage();
			msg = "failed" + pageErrorInfo;
		} catch (IOException e) {
			e.printStackTrace();
			msg = "failed" + pageErrorInfo;
		} finally {
			// writer.print(msg);
			// writer.flush();
			// writer.close();
		}
		return SUCCESS;
	}

	
	/**
	 * 图片列表
	 * @return
	 */
	public String imagelist(){
		try {
			images = imageService.getAllImages();
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		
	}
	
	/**
	 * 删除文件
	 * @return
	 */
	public String delete(){		
		String filepath = ServletActionContext.getServletContext().getRealPath("/upload") + java.io.File.separator; //文件保存路径
		try{
			File file = new File(filepath+filename);
			if(file.exists()){
				FileUtils.forceDelete(new File(filepath+filename));
			}
			imageService.deleteImage(filename);
			msg = "删除成功";
		}catch (IOException e) {
			msg = "删除失败";
		}
		return SUCCESS;
	}
	
	/**
	 * 下载文件
	 * @return
	 */
	public InputStream getTargetFile() throws Exception{
		return ServletActionContext.getServletContext().getResourceAsStream("/upload/"+filename);
	}

}
