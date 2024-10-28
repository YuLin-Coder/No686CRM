package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.OrderDetails;

/**
 * 订单明细Service接口
 * @author Administrator
 *
 */
public interface OrderDetailsService {

	/**
	 * 查询订单明细
	 * @param map
	 * @return
	 */
	public List<OrderDetails> findOrderDetails(Map<String,Object> map);
	
	/**
	 * 查询订单明细记录数
	 * @param map
	 * @return
	 */
	public Long getTotalOrderDetails(Map<String,Object> map);
	
	/**
	 * 获取指定订单的
	 * @param orderId
	 * @return
	 */
	public float getTotalPriceByOrderId(int orderId);
}
