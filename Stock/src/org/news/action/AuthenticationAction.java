package org.news.action;

import org.news.model.Users;
import org.news.service.OrderService;
import org.news.service.UserService;
import org.news.utils.MD5Code;
import org.news.utils.VeDate;
import org.news.utils.XXTEA;

import com.opensymphony.xwork2.ActionSupport;

public class AuthenticationAction extends ActionSupport {

	private static final long serialVersionUID = 6382359902093181364L;

	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	private UserService userService;	

	public void setUserService(UserService userService) {
		this.userService = userService;
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

		Users user = new Users(0,mid,new MD5Code().getMD5ofStr(password),"","","","","","") ;
		permissionLevel = "0";

		try {
			permissionLevel = orderService.findLogin(user, type)+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (permissionLevel.equals("0")){
			token = null;
		}else{//生成令牌			
			String tokenId = VeDate.getNo(18); //令牌ID,32位
			String loginTime = VeDate.getStringDate();//首次登录时间
			String lastRequest = VeDate.getStringDate();//上次请求时间
			String available = "2";//有效时间两天
			
			String info = "tokenId:"+tokenId+",userId:"+mid+",loginTime:"+loginTime+",lastRequest:"+lastRequest+",available:"+available;
			
			token = XXTEA.Encrypt(info);//加密
			
			//保存令牌到数据库中
			Users member = userService.findUsersById(mid);
			member.setTokenId(tokenId);
			userService.updateUsers(member);
		}
		
		return SUCCESS;
	}
	
	/**
	 * 认证
	 * @return
	 */
	public String identification(){
		if (token == null || token.length() < XXTEA.MIN_LENGTH){
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
		
		if (infos.length != 5){
			permissionLevel = "0";
			mid = null;
			return SUCCESS;
		}
		
		String oldToken = infos[0].substring(8);
	
		mid = infos[1].substring(7);
		Users member = userService.findUsersById(mid);
		
		//令牌ID不一致
		if (!member.getTokenId().equals(oldToken)){
			permissionLevel = "0";
			mid = null;
			return SUCCESS;
		}
		
		
		//生成新令牌
		String tokenId = VeDate.getNo(18); //令牌ID
		String lastRequest = VeDate.getStringDate();//上次请求时间
		String available = "2";//有效时间两天
		
		String newInfo = "tokenId:"+tokenId+",userId:"+mid+","+infos[2]+",lastRequest:"+lastRequest+",available:"+available;
		
		token = XXTEA.Encrypt(newInfo);//加密
		permissionLevel = "1";
		
		return SUCCESS;
	}
}
