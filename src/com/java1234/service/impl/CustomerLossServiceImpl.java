package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.CustomerLossDao;
import com.java1234.entity.CustomerLoss;
import com.java1234.service.CustomerLossService;

/**
 * 客户流失Service实现类
 * @author Administrator
 *
 */
@Service("customerLossService")
public class CustomerLossServiceImpl implements CustomerLossService{
	
	@Resource
	private CustomerLossDao customerLossDao;

	@Override
	public List<CustomerLoss> findCustomerLoss(Map<String, Object> map) {
		return customerLossDao.findCustomerLoss(map);
	}

	@Override
	public Long getTotalCutomerLoss(Map<String, Object> map) {
		return customerLossDao.getTotalCutomerLoss(map);
	}

	@Override
	public CustomerLoss findById(Integer id) {
		return customerLossDao.findById(id);
	}

	@Override
	public int updateCustomerLoss(CustomerLoss customerLoss) {
		return customerLossDao.updateCustomerLoss(customerLoss);
	}
	

}
