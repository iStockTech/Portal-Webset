/*
 * 系统名称：新闻发布系统
 * 
 * 类名：SoftwareAction
 * 
 * 创建日期：2014-08-22
 */
package org.news.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.news.model.Software;
import org.news.model.SoftwareVO;
import org.news.service.SoftwareService;
import org.news.utils.Common;
import org.news.utils.MessageUtil;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.json.annotations.JSON;

/**
 * 用于软件操作的Action
 * 
 * @author tt
 * @version 14.8.18
 */
public class SoftwareAction extends ActionSupport{

	private static final long serialVersionUID = 4362240508650937317L;
	private SoftwareService service;
	
	/**
	 * @param service the service to set
	 */
	public void setService(SoftwareService service) {
		this.service = service;
	}

	String msg = null ;//提示信息
	String kw; //查询关键字
	String cp; //当前页
	String ls; //页的大小
	String pg = "Software_list.action"; //URL
	List<SoftwareVO> softwares;//软件列表
	long recorders; //软件数
	String softwareid;//软件ID
	String sid; //下载软件ID
    String filename;//下载文件名
    private File file;    
    private String fileFileName;   
    private String fileContentType;   
    
    Software software;
    String state;
    String contentLength;//下载文件长度
    
    
    	
	/**
	 * @return the contentLength
	 */
	public String getContentLength() {
		return contentLength;
	}



	/**
	 * @param contentLength the contentLength to set
	 */
	public void setContentLength(String contentLength) {
		this.contentLength = contentLength;
	}



	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}



	/**
	 * @param state the state to set
	 */
	public void setState(String state) {

		try {
			this.state = new String(state.getBytes("iso8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}



	/**
	 * @return the software
	 */
	public Software getSoftware() {
		return software;
	}



	/**
	 * @param software the software to set
	 */
	public void setSoftware(Software software) {
		this.software = software;
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
    
    /**
	 * @return the filename
	 */
	public String getFilename() {
		String downFileName = "";
		try {
			downFileName = java.net.URLEncoder.encode(filename, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

	    return downFileName;
		//return filename;
	}
	/**
	 * @param filename the filename to set
	 */
	public void setFilename(String filename) {
		this.filename = filename;
	}

	/**
	 * @return the sid
	 */
	public String getSid() {
		return sid;
	}

	/**
	 * @param sid the sid to set
	 */
	public void setSid(String sid) {
		this.sid = sid;
	}

	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}

	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}

	/**
	 * @return the kw
	 */
	public String getKw() {
		return kw;
	}

	/**
	 * @param kw the kw to set
	 */
	public void setKw(String kw) {
		this.kw = kw;
	}

	/**
	 * @return the cp
	 */
	public String getCp() {
		return cp;
	}

	/**
	 * @param cp the cp to set
	 */
	public void setCp(String cp) {
		this.cp = cp;
	}

	/**
	 * @return the ls
	 */
	public String getLs() {
		return ls;
	}

	/**
	 * @param ls the ls to set
	 */
	public void setLs(String ls) {
		this.ls = ls;
	}

	/**
	 * @return the pg
	 */
	public String getPg() {
		return pg;
	}

	/**
	 * @param pg the pg to set
	 */
	public void setPg(String pg) {
		this.pg = pg;
	}

	/**
	 * @return the softwares
	 */
	public List<SoftwareVO> getSoftwares() {
		return softwares;
	}

	/**
	 * @param softwares the softwares to set
	 */
	@JSON(name="softwares")
	public void setSoftwares(List<SoftwareVO> softwares) {
		this.softwares = softwares;
	}

	/**
	 * @return the recorders
	 */
	public long getRecorders() {
		return recorders;
	}

	/**
	 * @param recorders the recorders to set
	 */
	public void setRecorders(long recorders) {
		this.recorders = recorders;
	}

	/**
	 * @return the softwareid
	 */
	public String getSoftwareid() {
		return softwareid;
	}

	/**
	 * @param softwareid the softwareid to set
	 */
	public void setSoftwareid(String softwareid) {
		this.softwareid = softwareid;
	}
	
	/**
	 * 默认上传
	 * @return
	 * @throws IOException 
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public void upload() throws IOException {

		String suffix[]={"asp","aspx","php","jsp","jspx"};
		String fileType=filename.substring(filename.lastIndexOf(".")+1);
		
		InputStream is;

		HttpServletResponse response = ServletActionContext.getResponse(); 
		PrintWriter writer = response.getWriter(); 
		String pageErrorInfo = null;
		msg = "successed";
		
		//筛选文件
		for(int i = 0; i < suffix.length ; i++){
		 if (fileType.equalsIgnoreCase(suffix[i])){
			 msg = "failed wrong format";
			 writer.print(msg);
			 writer.flush();  
			 writer.close();
			 return ;
		 }
		}
		
		try {
			ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
			is = new FileInputStream(file);
			String root = ServletActionContext.getServletContext().getRealPath("/WEB-INF/softwares");//保存软件的目录
			
			File file =new File(root);    
			//如果文件夹不存在则创建    
			if(!file.exists()&&!file.isDirectory()){
				file.mkdir();    
			} 
			File deskFile = new File(root,this.getFileFileName());

			//输出到外存中
			OutputStream os = new FileOutputStream(deskFile);
			byte [] bytefer = new byte[400];
			int length = 0 ; 
			while((length = is.read(bytefer) )>0)
			{
				os.write(bytefer,0,length);
			}
			os.close();
			is.close();
			
			Software soft = new Software(0,this.fileFileName,"",1000,1,"stockiiPanel");
			if (!service.addSoftware(soft)){
				Common.deleteFile(root+File.separator+filename);//插入失败，删除文件
				msg = "failed"+pageErrorInfo;
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			pageErrorInfo = e.getMessage();
			msg = "failed"+pageErrorInfo;
		} catch (IOException e) {
			e.printStackTrace();
			msg = "failed"+pageErrorInfo;
		}finally{
			writer.print(msg);
			writer.flush();  
			writer.close();
		}


	}

	/**
	 * 软件列表
	 * @return
	 */
	@Transactional(readOnly=true)
	public String list(){
		int currentPage = 1 ;	// 为当前所在的页，默认在第1页
		int lineSize = 20;		// 每次显示的记录数
		long allRecorders = 0 ;	// 表示全部的记录数
		String keyWord = kw ;	// 接收查询关键字
		
		try{
			currentPage = Integer.parseInt(cp) ;
		} catch(Exception e) {}
		try{
			lineSize = Integer.parseInt(ls) ;
		} catch(Exception e) {}
		if(keyWord == null){
			keyWord = "" ;	// 如果模糊查询没有关键字，则表示查询全部
		}
		
		List<Software> softs = service.getAllSoftwares(keyWord, currentPage, lineSize);
		allRecorders = service.getCount(keyWord);
		
		if (this.softwares == null){
			this.softwares = new ArrayList<SoftwareVO>();
		}else{
			this.softwares.clear();
		}
		
		for (Software item:softs){
			softwares.add(service.toSoftwareVO(item));
		}
		setRecorders(allRecorders);
		
		setCp(""+currentPage);
		setLs(""+lineSize);
		setSoftwares(softwares);
		
		return SUCCESS;
	}
	
	/**
	 * 删除软件
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public String delete(){	
		int id = 0;
		try{
			id = Integer.parseInt(softwareid) ;
		} catch(Exception e) {
			return ERROR;
		}
		String filepath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/softwares") + java.io.File.separator; //文件保存路径
		try {
			String name = service.findSoftwareById(id).getSoftwareName();
			if (service.deleteSoftware(id)&&Common.deleteFile(filepath+name)){//同时删除数据库和文件夹里的数据					
				msg = "删除成功";
			}else{
				msg = "删除失败";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

		return SUCCESS;
	}
	
	/**
	 * 下载软件
	 * @return
	 */
	public InputStream getTargetFile(){
		int id = 0;
		String root = null;
		try{
			id = Integer.parseInt(sid) ;

			root = ServletActionContext.getServletContext().getRealPath("/WEB-INF/softwares");//文件保存路径
		    filename = service.findSoftwareById(id).getSoftwareName();
		    
		} catch(Exception e) {
			return null;
		}
		
	    if (null == filename || null == root){
	    	return null;
	    }
	    
	    File deskFile = new File(root,filename);
	    if (null == deskFile){
	    	return null;
	    }   
	    
	    contentLength = deskFile.length()+"";

		return ServletActionContext.getServletContext().getResourceAsStream("WEB-INF/softwares/"+filename);
	}
	
	/**
	 * 用户已买软件列表
	 * @return
	 */
	@Transactional(readOnly=true)
	public String listForUser(){
		int currentPage = 1 ;	// 为当前所在的页，默认在第1页
		int lineSize = 20;		// 每次显示的记录数
		long allRecorders = 0 ;	// 表示全部的记录数
		String keyWord = kw ;	// 接收查询关键字
		
		try{
			currentPage = Integer.parseInt(cp) ;
		} catch(Exception e) {}
		try{
			lineSize = Integer.parseInt(ls) ;
		} catch(Exception e) {}
		if(keyWord == null){
			keyWord = "" ;	// 如果模糊查询没有关键字，则表示查询全部
		}
		
		ActionContext ctx = ActionContext.getContext();
		String userName = (String) ctx.getSession().get("id") ;	// 从session中取出用户名
		
		if (userName==null){
			return LOGIN;
		}
		
		softwares = service.getAllSoftwaresForUser(keyWord, currentPage, lineSize,userName);
		
		Iterator<SoftwareVO> itr = softwares.iterator();
		
		while (itr.hasNext()) {
			SoftwareVO item = itr.next();
            if (item.getState().equals("未购买")) {
                itr.remove();
            }
        }
		
		allRecorders = service.getCount(keyWord);

		setRecorders(allRecorders);
		
		setCp(""+currentPage);
		setLs(""+lineSize);

		return SUCCESS;
	}

	/**
	 * 更新软件
	 * @return
	 */
	public String update(){
		if (null == software){
			return ERROR;
		}

		try {//更新数据库
			if (service.updateSoftware(software)) {
				setMsg(MessageUtil
						.get("software.update.true"));
			} else {
				setMsg(MessageUtil
						.get("software.update.false"));
			}

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ERROR;
	}
	
	/**
	 * 更新前的操作
	 * @return
	 */
	public String updatepre(){
		int id = 0;
		try {
			id = Integer.parseInt(softwareid) ;
			software = service.findSoftwareById(id);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ERROR;
	}
	
	/**
	 * 查看软件信息
	 * @return
	 */
	public String show(){
		int id = 0;
		try {
			id = Integer.parseInt(softwareid) ;
			software = service.findSoftwareById(id);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ERROR;
	}
	
	/**
	 * 用户未买软件列表
	 * @return
	 */
	@Transactional(readOnly=true)
	public String listNoBuy(){
		int currentPage = 1 ;	// 为当前所在的页，默认在第1页
		int lineSize = 20;		// 每次显示的记录数
		long allRecorders = 0 ;	// 表示全部的记录数
		String keyWord = kw ;	// 接收查询关键字
		
		try{
			currentPage = Integer.parseInt(cp) ;
		} catch(Exception e) {}
		try{
			lineSize = Integer.parseInt(ls) ;
		} catch(Exception e) {}
		if(keyWord == null){
			keyWord = "" ;	// 如果模糊查询没有关键字，则表示查询全部
		}
		
		ActionContext ctx = ActionContext.getContext();
		String userName = (String) ctx.getSession().get("id") ;	// 从session中取出用户名
		if (userName==null){
			return LOGIN;
		}
		
		softwares = service.getAllSoftwaresForUser(keyWord, currentPage, lineSize,userName);
		
		Iterator<SoftwareVO> itr = softwares.iterator();
		
		while (itr.hasNext()) {
			SoftwareVO item = itr.next();
            if (item.getState().equals("已购买")) {
                itr.remove();
            }
        }
		
		allRecorders = service.getCount(keyWord);

		setRecorders(allRecorders);
		
		setCp(""+currentPage);
		setLs(""+lineSize);

		return SUCCESS;
	}
}