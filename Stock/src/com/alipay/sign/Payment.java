package com.alipay.sign;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alipay.config.AlipayConfig;
/**
 * 名称：支付主类
 * 功能：支付宝外部服务接口控制
 * 接口名称：单笔查询接口
 * 版本：2.0
 * 日期：2008-12-25
 * 作者：支付宝公司销售部技术支持团队
 * 联系：0571-26888888
 * 版权：支付宝公司
 * */
public class Payment {
	/**
	 * 生成url方法
	 * 网关
	 * @param paygateway
	 * 服务参数
	 * @param service
	 * 签名类型
	 * @param sign_type
	 * 外部订单号
	 * @param out_trade_no
	 * 编码机制
	 * @param input_charset
	 * 合作者ID
	 * @param partner
	 * 安全校验码
	 * @param key
	 * @return
	 */
    public static String CreateUrl(String paygateway, String service, String partner, String sign_type,
        	String out_trade_no, String key, String input_charset) {
    	
        Map params = new HashMap();
        params.put("service", service);
        params.put("partner", partner);
        params.put("out_trade_no", out_trade_no);
        params.put("_input_charset", input_charset);
     

        String prestr = "";

        prestr = prestr + key;
        //System.out.println("prestr=" + prestr);

        String sign = Md5Encrypt.md5(getContent(params, key));

        String parameter = "";
        parameter = parameter + paygateway;
        //System.out.println("prestr="  + parameter);
        List keys = new ArrayList(params.keySet());
        for (int i = 0; i < keys.size(); i++) {
          	String value =(String) params.get(keys.get(i));
            if(value == null || value.trim().length() ==0){
            	continue;
            }
            try {
                parameter = parameter + keys.get(i) + "="
                    + URLEncoder.encode(value, input_charset) + "&";
            } catch (UnsupportedEncodingException e) {

                e.printStackTrace();
            }
        }

        parameter = parameter + "sign=" + sign + "&sign_type=" + sign_type;
        
        return parameter;

    }
    /**
     * 功能：将安全校验码和参数排序
     * 参数集合
     * @param params
     * 安全校验码
     * @param privateKey
     * */
    private static String getContent(Map params, String privateKey) {
        List keys = new ArrayList(params.keySet());
        Collections.sort(keys);

        String prestr = "";

		boolean first = true;
		for (int i = 0; i < keys.size(); i++) {
			String key = (String) keys.get(i);
			String value = (String) params.get(key);
			if (value == null || value.trim().length() == 0) {
				continue;
			}
			if (first) {
				prestr = prestr + key + "=" + value;
				first = false;
			} else {
				prestr = prestr + "&" + key + "=" + value;
			}
		}

        return prestr + privateKey;
    }
    
    /**
     * 单笔交易查询
     * @param out_trade_no 订单号
     * @return 订单信息
     * @throws Exception
     */
    public static Map<String,String> singleTradeQuery(String out_trade_no) throws Exception {
    	String paygateway = "https://www.alipay.com/cooperate/gateway.do?"; //支付接口(不可修改)
		String service = "single_trade_query";//支付宝查询服务--单笔查询服务(不可修改)
		String sign_type = "MD5";//加密机制(不可修改)
		String input_charset = AlipayConfig.input_charset;   //页面编码(不可修改)
		//partner和key提取方法：登陆签约支付宝账户--->点击“商家服务”就可以看到
		String partner = AlipayConfig.partner; //支付宝合作伙伴id (账户内提取)
		String key = AlipayConfig.key; //支付宝安全校验码(账户内提取)

		String ItemUrl = Payment.CreateUrl(paygateway, service, partner, sign_type,
				out_trade_no, key, input_charset);
		
		dom4j dom4 = new dom4j();
		try {
			Map<String,String> result = dom4.DomXml(ItemUrl);
			return result;
		} catch (Exception e) {
			throw e;
		}
    }
}
