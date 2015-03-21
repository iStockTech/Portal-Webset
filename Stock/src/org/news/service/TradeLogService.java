package org.news.service;

import org.news.model.TradeLog;

public interface TradeLogService {

	/**
	 * 新增交易日志
	 * @param tradelog
	 * @return
	 */
	public boolean addLog(TradeLog tradelog);
}
