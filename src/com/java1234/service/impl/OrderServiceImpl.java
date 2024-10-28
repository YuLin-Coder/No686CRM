package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.OrderDao;
import com.java1234.entity.Order;
import com.java1234.service.OrderService;

/**
 * 订单Service实现类
 * @author Administrator
 *
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Resource
	private OrderDao orderDao;
	
	@Override
	public List<Order> findOrder(Map<String, Object> map) {
		return orderDao.findOrder(map);
	}

	@Override
	public Long getTotalOrder(Map<String, Object> map) {
		return orderDao.getTotalOrder(map);
	}

	@Override
	public Order findById(Integer id) {
		return orderDao.findById(id);
	}

}
