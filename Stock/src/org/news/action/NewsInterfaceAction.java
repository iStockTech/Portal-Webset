/*
 * 系统名称：斯多克科技门户网站
 * 
 * 类名：NewsInfoAction
 * 
 * 创建日期：2014-09-18
 */
package org.news.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.news.model.NewsIndex;
import org.news.model.NewsInfo;
import org.news.model.StockInfoTable;
import org.news.model.Stock_day_info;
import org.news.service.ImageService;
import org.news.service.NewsInfoService;
import org.news.service.StockDayInfoTableService;
import org.news.utils.NewsUtil;
import org.owasp.esapi.ESAPI;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 为前端访问提供接口的的Action
 * 
 * @author tt
 * @version 14.8.18
 */
public class NewsInterfaceAction extends ActionSupport {

	private static final long serialVersionUID = 8726165028217895272L;
	private NewsInfoService service;
	private ImageService imageService;
	private NewsUtil newsUtil = new NewsUtil();
	private StockDayInfoTableService stockDayInfoTableService;
	
	/*private JSONObject allInfo;
	private JSONObject numPerPage;
	private JSONObject pagination; 
	private JSONObject newsInfo; */
	private String allInfo;
	private String numPerPage;  //每页新闻数量
	private String pagination;   //分页信息
	private String id;  //每条新闻的id
	private String currentPage;   //分页
	private String newsInfo;   //某个页面所显示的全部新闻信息
	private String page;    //用于判断当前页面，index:首页  more：其他二级页面
	private String search;   //从前端获取用于判断新闻类型有哪些

	
	private String table;
	
 	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public void setStockDayInfoTableService(
			StockDayInfoTableService stockDayInfoTableService) {
		this.stockDayInfoTableService = stockDayInfoTableService;
	}

	public String getAllInfo() {
		return allInfo;
	}

	public void setAllInfo(String allInfo) {
		this.allInfo = allInfo;
	}
	
	public String getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(String numPerPage) {
		this.numPerPage = numPerPage;
	}

	public String getPagination() {
		return pagination;
	}

	public void setPagination(String pagination) {
		this.pagination = pagination;
	}

	public String getNewsInfo() {
		return newsInfo;
	}

	public void setNewsInfo(String newsInfo) {
		this.newsInfo = newsInfo;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}


	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public void setService(NewsInfoService service) {
		this.service = service;
	}

	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	/**
     * 新闻列表
     * @author zxy
     * @throws Exception 
     */
    
	@Transactional(readOnly=true)
	@SuppressWarnings({ "unchecked"})
	public String acquireHomepageAction() throws Exception {
		if (null==search||null==page){
			return ERROR;
		}
		
		//ArrayList<NewsIndex> news = new ArrayList<NewsIndex>();  
		ArrayList<NewsInfo> newsinfoList = null;
		Map<String, String[]> mapForJsonAllNewsInfo = new HashMap<String, String[]>();
		Map<String, String> mapForJsonAllNewsSize = new HashMap<String, String>();
		Map<String, String> mapForJsonAllNewsPageSize = new HashMap<String, String>();
		Map<String, String> mapForAll = new HashMap<String, String>();
		long allSize = 0;  
		//int lineSize = 20;
		int lineSize = 5;
		String[] types = this.search.split(",");		
		int num = 5;       //每个类型的新闻在首页显示几条
		
		if ("index".equals(this.page)) { // 首页
			for (int i = 0; i < types.length; i++) {
				ArrayList<NewsIndex> news = new ArrayList<NewsIndex>();  
				//news = (ArrayList) service.getFewNewsByType(types[i],num); // 获取某一类型的前5条新闻（按时间）
				try {
					newsinfoList = (ArrayList)service.getAllNewsInfoByType(types[i], 1, num);
					for(int j=0;j<newsinfoList.size();j++){
						NewsIndex newsIndex = new NewsIndex();
						newsIndex = service.toNewsIndex(newsinfoList.get(j));
						news.add(newsIndex);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}// 获取某一类型的前5条新闻（按时间）
				
				
				String[] allnewsInfo = new String[news.size()];      //每类新闻的全部内容
				//处理一条
				for (int j = 0; j < news.size(); j++) {		
					
					String str = new String(ESAPI.encoder().encodeForHTML(news.get(j).getNewsInfoTitle())+"+"+ESAPI.encoder().encodeForHTML(news.get(j).getNewsInfoTime())+"+"+news.get(j).getNewsInfoId()+"+"+imageService.getImage(news.get(j).getNewsInfoId()));
					allnewsInfo[j] = str;
				}	
				mapForJsonAllNewsInfo.put("type"+String.valueOf(i+1), allnewsInfo);
			}
			this.newsInfo = newsUtil.getJson(mapForJsonAllNewsInfo);
		} else if ("more".equals(this.page)) {
			for (int i = 0; i < types.length+1; i++) {
				ArrayList<NewsIndex> news = new ArrayList<NewsIndex>();  
				if(i<types.length){
					//news = (ArrayList) service.getNewsInfoByType(types[i], Integer.valueOf(currentPage).intValue(), lineSize); 
					//news = (ArrayList) service.toNewsIndex(service.getAllNewsInfoByType(types[i], 1, lineSize));
					newsinfoList = (ArrayList)service.getAllNewsInfoByType(types[i], 1, lineSize);// 获取某一类型的前5条新闻（按时间）
					for(int j=0;j<newsinfoList.size();j++){
						NewsIndex newsIndex = new NewsIndex();
						newsIndex = service.toNewsIndex(newsinfoList.get(j));
						news.add(newsIndex);
						//System.out.println(i+  "   "+ newsIndex.getNewsInfoId());
					}
				}else{
					//news = (ArrayList) service.getNewsByTypes(types, Integer.valueOf(currentPage).intValue(), lineSize);
					news = (ArrayList) service.getNewsByTypes(types, 1, lineSize);
				}
				String[] allnewsInfo = new String[news.size()];    //每类新闻的全部内容
				//处理一条
				for (int j = 0; j < news.size(); j++) {
					//"title":"aaaa","time":"2014-11-16","author":"新华社","summary":"xxxxxxx","img":"xxxxxxx"
					String title = ESAPI.encoder().encodeForHTML(news.get(j).getNewsInfoTitle());
					String time = ESAPI.encoder().encodeForHTML(news.get(j).getNewsInfoTime());
					String author = ESAPI.encoder().encodeForHTML(news.get(j).getNewsAuthor());
					String summary = ESAPI.encoder().encodeForHTML(news.get(j).getNewsInfoDescribe());
					String id = news.get(j).getNewsInfoId()+"";
					String img = "";
					if(imageService.getImage(news.get(j).getNewsInfoId()).equals("") ||imageService.getImage(news.get(j).getNewsInfoId()) == null){
						img = "";
					}else{
						img = imageService.getImage(news.get(j).getNewsInfoId());
					}
					
							//System.out.println(img);
					Map<String,String> mapnewsInfo = new HashMap<String,String>();
					mapnewsInfo.put("title", title);
					mapnewsInfo.put("time", time);
					mapnewsInfo.put("author",author);
					mapnewsInfo.put("summary", summary);
					mapnewsInfo.put("id", id);
					mapnewsInfo.put("img", img);
					
					//allnewsInfo[j] = newsUtil.getJson(mapnewsInfo);
					allnewsInfo[j] = newsUtil.getJson(mapnewsInfo);
				}
				
				if(i<types.length){
					mapForJsonAllNewsInfo.put(types[i], allnewsInfo);		
					//mapForJAllNewsInfo.put(types[i], allnewsInfo);		
					
				}else{	
					//System.out.println(allnewsInfo[0]);
					mapForJsonAllNewsInfo.put("all", allnewsInfo);
					//mapForJAllNewsInfo.put("all", allnewsInfo);		
				}
				
				long newsSize = 0;
				if(i<types.length){
					newsSize = service.getCountByType(types[i]);
					allSize += newsSize;
					mapForJsonAllNewsSize.put(types[i], Long.valueOf(newsSize).toString());
				}else{
					mapForJsonAllNewsSize.put("all",Long.valueOf(allSize).toString());
				}
			
				if(i<types.length){
					int eachPage = (lineSize>newsSize)?(int)newsSize:lineSize;
					mapForJsonAllNewsPageSize.put(types[i], Integer.valueOf(eachPage).toString());
				}else{
					int allTypePage = (lineSize>allSize)?(int)allSize:lineSize;
					mapForJsonAllNewsPageSize.put("all", Integer.valueOf(allTypePage).toString());
				}
			}
						
			this.newsInfo = newsUtil.getJson(mapForJsonAllNewsInfo);
			//每个type的分页信息
			this.pagination = newsUtil.getJson(mapForJsonAllNewsSize);
			//每一页的数目
			this.numPerPage = newsUtil.getJson(mapForJsonAllNewsPageSize);
			
			mapForAll.put("newsInfo",newsInfo);
			mapForAll.put("pagination",pagination);
			mapForAll.put("numPerPage", numPerPage);
			this.allInfo="{\"newsInfo\":"+this.newsInfo+",\"pagination\":"+this.pagination+",\"numPerPage\":"+this.numPerPage+"}";
		} else {
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	
    /**
     * 新闻列表
     * @author zxy
     * @throws Exception 
     */
    
	@SuppressWarnings({ "unchecked"})
	public String acquireNewsByTypeAction() throws Exception {
		if (null==search||null==currentPage){
			return ERROR;
		}
		
		try {
			 
			List<NewsIndex> news = new ArrayList<NewsIndex>();
			List<NewsInfo> newsinfoList = new ArrayList<NewsInfo>();
			Map<String, String[]> mapForJsonAllNewsInfo = new HashMap<String, String[]>();
			int lineSize = 5;

			String[] types = this.search.split(",");		
			
			if(1==types.length){
				//news = (ArrayList) service.getAllNewsInfoByType(types[0], Integer.valueOf(currentPage).intValue(), lineSize); 
				newsinfoList = (ArrayList)service.getAllNewsInfoByType(types[0], Integer.valueOf(currentPage).intValue(), lineSize);// 获取某一类型的前5条新闻（按时间）
				for(int i=0;i<newsinfoList.size();i++){
					NewsIndex newsIndex = new NewsIndex();
					newsIndex = service.toNewsIndex(newsinfoList.get(i));
					news.add(newsIndex);
				}
				//System.out.println(news.get(0).getNewsInfoTime());
			}else{
				news = (ArrayList) service.getNewsByTypes(types, Integer.valueOf(currentPage).intValue(), lineSize);
			}
			
			String[] allnewsInfo = new String[news.size()];    //每类新闻的全部内容
			//处理一条
			for (int j = 0; j < news.size(); j++) {
				//"title":"aaaa","time":"2014-11-16","author":"新华社","summary":"xxxxxxx","img":"xxxxxxx"
				String title = ESAPI.encoder().encodeForHTML(news.get(j).getNewsInfoTitle());
				String time = ESAPI.encoder().encodeForHTML(news.get(j).getNewsInfoTime());
				String author = ESAPI.encoder().encodeForHTML(news.get(j).getNewsAuthor());
				String summary = ESAPI.encoder().encodeForHTML(news.get(j).getNewsInfoDescribe());
				String id = news.get(j).getNewsInfoId()+"";
				String img = "";
				if(imageService.getImage(news.get(j).getNewsInfoId()).equals("") ||imageService.getImage(news.get(j).getNewsInfoId()) == null){
					img = "";
				}else{
					img = imageService.getImage(news.get(j).getNewsInfoId());
				}
				
				Map<String,String> mapnewsInfo = new HashMap<String,String>();
									
				mapnewsInfo.put("title", title);
				mapnewsInfo.put("time", time);
				mapnewsInfo.put("author",author);
				mapnewsInfo.put("summary", summary);
				mapnewsInfo.put("id", id);
				mapnewsInfo.put("img", img);
				allnewsInfo[j] = newsUtil.getJson(mapnewsInfo);	
				//System.out.println(allnewsInfo[j]);
			}
		
			if(1==types.length){
				mapForJsonAllNewsInfo.put(types[0], allnewsInfo);
			}else{
				mapForJsonAllNewsInfo.put("all", allnewsInfo);
			}		
		this.newsInfo = newsUtil.getJson(mapForJsonAllNewsInfo);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}
	
	
	
	/**
	 * 获取某一篇文章的详细内容
	 * @return 属性articleInfo，表示文章详情
	 */
	public String acquirenewAction(){
		if (null == id){
			return ERROR;
		}
		try {
			NewsInfo news = service.searchNewsInfo(Integer.valueOf(id).intValue());
			if(news != null) {
				String title = ESAPI.encoder().encodeForHTML(news.getNewsInfoTitle());
				String time = ESAPI.encoder().encodeForHTML(news.getNewsInfoTime().toString());
				String author = ESAPI.encoder().encodeForHTML(news.getNewsAuthor());
				String content = ESAPI.encoder().encodeForHTML(news.getNewsInfoContent());
				String id = news.getNewsInfoId()+"";								
				
				Map<String,String> maptemp = new HashMap<String,String>();
				maptemp.put("title", title);
				maptemp.put("time", time);
				maptemp.put("author",author);
				maptemp.put("content", content);
				maptemp.put("id", id);
				newsInfo = newsUtil.getJson(maptemp);
			}
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ERROR;
	}
	

	/**
	 * 获取股票表格信息
	 * @return
	 */
	public String stockDayInfoTable(){
		List<Stock_day_info>lists = new ArrayList<Stock_day_info>();
		List<StockInfoTable>listTable = new ArrayList<StockInfoTable>();
		try {
			lists = stockDayInfoTableService.getStockByDay();
			listTable = stockDayInfoTableService.toStockInfoTable(lists);
		} catch (Exception e1) {
			e1.printStackTrace();
			return ERROR;
		}
		String str[] = new String[listTable.size()];
		Map<String, String[]> mapAll = new HashMap<String, String[]>();
			/*
			 private int id;
			private String stock_id;
			private String stock_name;
			private Double growth_speed;  //涨幅
			private Double daily_up_down;  //涨跌
			private Double bought_price;  //买入价
			private Double sold_price;   //卖出价
			private Long total_money;   //金额
			private Double amplitude_ratio;  //市盈动率
			private Double max;  //最高
			private Double min;  //最低
			private Double today_begin_price;   //今日开盘价
			private Double ytd_end_price;  //昨日收盘价
			
			private Long zongshou; //总手
			private int huanshou;  //先手
			private Double zuixin; //换手       
			 */
		
		
		Map<String,String> map = new HashMap<String,String>();
		int i=0;
	
		for(StockInfoTable s:listTable){
			map.put("id", String.valueOf(s.getId()));
			map.put("stock_id", s.getStock_id());
			map.put("growth_speed", s.getGrowth_speed().toString());
			map.put("daily_up_down", s.getDaily_up_down().toString());
			map.put("bought_price", s.getBought_price().toString());
			map.put("sold_price", s.getSold_price().toString());
			map.put("total_money", s.getTotal_money().toString());
			map.put("amplitude_ratio", s.getAmplitude_ratio().toString());
			map.put("max", s.getMax().toString());
			map.put("min", s.getMin().toString());
			map.put("today_begin_price", s.getToday_begin_price().toString());
			map.put("ytd_end_price", s.getYtd_end_price().toString());
			map.put("stock_name", s.getStock_name().toString());
			map.put("zongshou", s.getZongshou().toString());
			map.put("huanshou", String.valueOf(s.getHuanshou()));
			map.put("zuixin", s.getZuixin().toString());
			try {
				str[i++] = newsUtil.getJson(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mapAll.put("info", str);
		try {
			table = newsUtil.getJson(mapAll);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	
	/**
	 * 分页获取股票表格信息
	 * @return
	 */
	public String stockDayInfoTablePage(){
		if (null==currentPage){
			return ERROR;
		}
		
		List<Stock_day_info>lists = new ArrayList<Stock_day_info>();
		List<StockInfoTable>listTable = new ArrayList<StockInfoTable>();
		try {
			lists = stockDayInfoTableService.getStockByDay(Integer.valueOf(currentPage).intValue(), 20);
			listTable = stockDayInfoTableService.toStockInfoTable(lists);
		} catch (NumberFormatException e1) {
			e1.printStackTrace();
			return ERROR;
		}
		String str[] = new String[listTable.size()];
		Map<String, String[]> mapAll = new HashMap<String, String[]>();
		Map<String,String> map = new HashMap<String,String>();
		int i=0;
	
		for(StockInfoTable s:listTable){
			map.put("id", String.valueOf(s.getId()));
			map.put("stock_id", s.getStock_id());
			map.put("growth_speed", s.getGrowth_speed().toString());
			map.put("daily_up_down", s.getDaily_up_down().toString());
			map.put("bought_price", s.getBought_price().toString());
			map.put("sold_price", s.getSold_price().toString());
			map.put("total_money", s.getTotal_money().toString());
			map.put("amplitude_ratio", s.getAmplitude_ratio().toString());
			map.put("max", s.getMax().toString());
			map.put("min", s.getMin().toString());
			map.put("today_begin_price", s.getToday_begin_price().toString());
			map.put("ytd_end_price", s.getYtd_end_price().toString());
			map.put("stock_name", s.getStock_name().toString());
			map.put("zongshou", s.getZongshou().toString());
			map.put("huanshou", String.valueOf(s.getHuanshou()));
			map.put("zuixin", s.getZuixin().toString());
			try {
				str[i++] = newsUtil.getJson(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mapAll.put("info", str);
		try {
			table = newsUtil.getJson(mapAll);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	

}