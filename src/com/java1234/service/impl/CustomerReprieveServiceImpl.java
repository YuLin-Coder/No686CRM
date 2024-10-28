package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.CustomerReprieveDao;
import com.java1234.entity.CustomerReprieve;
import com.java1234.service.CustomerReprieveService;

/**
 * 客户流失暂缓措施Service接口实现类
 * @author Administrator
 *
 */
@Service("customerReprieveService")
public class CustomerReprieveServiceImpl implements CustomerReprieveService{

	@Resource
	private CustomerReprieveDao customerReprieveDao;
	
	@Override
	public List<CustomerReprieve> findCustomerReprieve(Map<String, Object> map) {
		return customerReprieveDao.findCustomerReprieve(map);
	}

	@Override
	public Long getTotalCustomerReprieve(Map<String, Object> map) {
		return customerReprieveDao.getTotalCustomerReprieve(map);
	}

	@Override
	public int addCustomerReprieve(CustomerReprieve customerReprieve) {
		return customerReprieveDao.addCustomerReprieve(customerReprieve);
	}

	@Override
	public int updateCustomerReprieve(CustomerReprieve customerReprieve) {
		return customerReprieveDao.updateCustomerReprieve(customerReprieve);
	}

	@Override
	public int deleteCustomerReprieve(Integer id) {
		return customerReprieveDao.deleteCustomerReprieve(id);
	}

}
