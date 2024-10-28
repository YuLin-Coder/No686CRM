package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.ProductDao;
import com.java1234.entity.Product;
import com.java1234.service.ProductService;

/**
 * 产品Service实现类
 * @author Administrator
 *
 */
@Service("productService")
public class ProductServiceImpl implements ProductService{

	@Resource
	private ProductDao productDao;
	
	@Override
	public List<Product> findProduct(Map<String, Object> map) {
		return productDao.findProduct(map);
	}

	@Override
	public Long getTotalProduct(Map<String, Object> map) {
		return productDao.getTotalProduct(map);
	}

	

}
