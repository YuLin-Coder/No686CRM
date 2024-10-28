package com.java1234.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.java1234.entity.Order;

/**
 * 订单Dao接口
 * @author Administrator
 *
 */
public interface OrderDao {

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
	
	/**
	 * 查找指定客户的最近的订单
	 * @param cusId
	 * @return
	 */
	public Order findLastByCusId(int cusId);
}
