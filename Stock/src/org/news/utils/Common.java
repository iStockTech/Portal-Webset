/*
 * 系统名称：新闻发布系统
 * 
 * 类名：Common
 * 
 * 创建日期：2014-09-13
 */
package org.news.utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 公用函数类
 * @author tt
 * @version 14.8.18
 */
public class Common {
	public static final String PREFIX = "DD";
	private static long code = 0;
  	/**
	 * 将字符串转换成一个日期
	 * @param startDate
	 * @return
	 */
	public static Date getSwitchDate(String startDate){
		Date dt=null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		if (startDate.equals("")){
			return new Date();
		}
		try{
			dt = sdf.parse(startDate);;
		}catch(Exception e){
			e.printStackTrace();
			return new Date();
		}
		return dt;
	}
	
	/**
     * 删除单个文件
     * @param   sPath    被删除文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public static boolean deleteFile(String sPath) {
        boolean flag = false;
        File file = new File(sPath);
        // 路径为文件且不为空则进行删除
        if (file.isFile() && file.exists()) {
            file.delete();
            flag = true;
        }
        return flag;
    }
    
    public static synchronized String nextCode() {
        code++;
        String str = new SimpleDateFormat("yyyyMM").format(new Date());
        long m = Long.parseLong((str)) * 10000;
        m += code;
        return PREFIX + m;
    }
}
