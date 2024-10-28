package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Order;

/**
 * 订单service接口
 * @author Administrator
 *
 */
public interface OrderService {

	/**
	 * 查询订单
	 * @param map
	 * @return
	 */
	public List<Order> findOrder(Map<String,Object> map);
	
	/**
	 * 查询订单记录数
	 * @param map
	 * @return
	 */
	public Long getTotalOrder(Map<String,Object> map);
	
	/**
	 * 通过Id查找实体
	 * @param id
	 * @return
	 */
	public Order findById(Integer id);
}
