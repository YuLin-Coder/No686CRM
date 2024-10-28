package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.SaleChanceDao;
import com.java1234.entity.SaleChance;
import com.java1234.service.SaleChanceService;

/**
 * 销售机会Service实现类
 * @author Administrator
 *
 */
@Service("saleChanceService")
public class SaleChanceServiceImpl implements SaleChanceService{

	@Resource
	private SaleChanceDao saleChanceDao;
	
	@Override
	public List<SaleChance> findSaleChance(Map<String, Object> map) {
		return saleChanceDao.findSaleChance(map);
	}

	@Override
	public Long getTotalSaleChance(Map<String, Object> map) {
		return saleChanceDao.getTotalSaleChance(map);
	}

	@Override
	public int addSaleChance(SaleChance saleChance) {
		return saleChanceDao.addSaleChance(saleChance);
	}

	@Override
	public int updateSaleChance(SaleChance saleChance) {
		return saleChanceDao.updateSaleChance(saleChance);
	}

	@Override
	public int deleteSaleChance(Integer id) {
		return saleChanceDao.deleteSaleChance(id);
	}

	@Override
	public int updateSaleChanceDevResult(Map<String, Object> map) {
		return saleChanceDao.updateSaleChanceDevResult(map);
	}

	@Override
	public SaleChance findById(Integer id) {
		return saleChanceDao.findById(id);
	}

}
