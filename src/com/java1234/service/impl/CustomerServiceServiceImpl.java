package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.CustomerServiceDao;
import com.java1234.entity.CustomerService;
import com.java1234.service.CustomerServiceService;

/**
 * 客户服务Service实现类
 * @author Administrator
 *
 */
@Service("customerServiceService")
public class CustomerServiceServiceImpl implements CustomerServiceService{

	@Resource
	private CustomerServiceDao customerServiceDao;
	
	@Override
	public List<CustomerService> findCustomerService(Map<String, Object> map) {
		return customerServiceDao.findCustomerService(map);
	}

	@Override
	public Long getTotalCustomerService(Map<String, Object> map) {
		return customerServiceDao.getTotalCustomerService(map);
	}

	@Override
	public int addCustomerService(CustomerService customerService) {
		return customerServiceDao.addCustomerService(customerService);
	}

	@Override
	public int updateCustomerService(CustomerService customerService) {
		return customerServiceDao.updateCustomerService(customerService);
	}

	@Override
	public int deleteCustomerService(Integer id) {
		return customerServiceDao.deleteCustomerService(id);
	}

	@Override
	public CustomerService findById(Integer id) {
		return customerServiceDao.findById(id);
	}

}
