package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.OrderDetailsDao;
import com.java1234.entity.OrderDetails;
import com.java1234.service.OrderDetailsService;

/**
 * 订单详情Service实现类
 * @author Administrator
 *
 */
@Service("orderDetailsService")
public class OrderDetailsServiceImpl implements OrderDetailsService{

	@Resource
	private OrderDetailsDao orderDetailsDao;
	
	@Override
	public List<OrderDetails> findOrderDetails(Map<String, Object> map) {
		return orderDetailsDao.findOrderDetails(map);
	}

	@Override
	public Long getTotalOrderDetails(Map<String, Object> map) {
		return orderDetailsDao.getTotalOrderDetails(map);
	}

	@Override
	public float getTotalPriceByOrderId(int orderId) {
		return orderDetailsDao.getTotalPriceByOrderId(orderId);
	}

}
