package org.news.action;

import java.util.Random;

import org.news.model.Users;
import org.news.service.OrderService;
import org.news.utils.VeDate;
import org.news.utils.XXTEA;

import com.opensymphony.xwork2.ActionSupport;

public class AuthenticationAction extends ActionSupport {

	private static final long serialVersionUID = 6382359902093181364L;

	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	String mid;//会员账号
	String password;//密码
	String type;//软件类型 
	String permissionLevel;//权限级别，0为登录失败
	String token;//令牌
	
	public String getMid() {
		return mid;
	}



	public void setMid(String mid) {
		this.mid = mid;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getPermissionLevel() {
		return permissionLevel;
	}



	public void setPermissionLevel(String permissionLevel) {
		this.permissionLevel = permissionLevel;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getToken() {
		return token;
	}



	public void setToken(String token) {
		this.token = token;
	}



	/**
	 * 登录授权
	 * @return
	 */
	public String authentication(){
		//new SchemaExport(new AnnotationConfiguration().configure()).create(true, true);
		if (mid==null||password==null||type==null){
			permissionLevel = "0";
			token = null;
			return SUCCESS;
		}

		Users user = new Users(0,mid,password,"","","","","","") ;
		permissionLevel = "0";

		try {
			permissionLevel = orderService.findLogin(user, type)+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (permissionLevel.equals("0")){
			token = null;
		}else{//生成令牌
			
			String tokenId = System.currentTimeMillis()+new Random().nextInt()+""; //令牌ID
			String loginTime = VeDate.getStringDate();//首次登录时间
			String lastRequest = VeDate.getStringDate();//上次请求时间
			String available = "2";//有效时间两天
			
			String info = "tokenId:"+tokenId+",userId:"+mid+",loginTime:"+loginTime+",lastRequest:"+lastRequest+",available:"+available;
			
			token = XXTEA.Encrypt(info);//加密
		}
		
		return SUCCESS;
	}
	
	/**
	 * 认证
	 * @return
	 */
	public String identification(){
		if (token == null){
			permissionLevel = "0";
			mid = null;
			return SUCCESS;
		}
		
		String info = XXTEA.Decrypt(token);
		
		//解密失败，不合法
		if (info == null){
			permissionLevel = "0";
			mid = null;
			return SUCCESS;
		}
		
		String[] infos = info.split(",");
		mid = infos[1].substring(7);
		
		//生成新令牌
		String tokenId = System.currentTimeMillis()+new Random().nextInt()+""; //令牌ID
		String lastRequest = VeDate.getStringDate();//上次请求时间
		String available = "2";//有效时间两天
		
		String newInfo = "tokenId:"+tokenId+",userId:"+mid+","+infos[2]+",lastRequest:"+lastRequest+",available:"+available;
		
		token = XXTEA.Encrypt(newInfo);//加密
		permissionLevel = "1";
		
		return SUCCESS;
	}
}
