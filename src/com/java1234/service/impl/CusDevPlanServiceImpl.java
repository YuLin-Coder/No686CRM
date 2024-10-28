package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.CusDevPlanDao;
import com.java1234.entity.CusDevPlan;
import com.java1234.service.CusDevPlanService;

/**
 * 客户开发计划Service实现类
 * @author Administrator
 *
 */
@Service("cusDevPlanService")
public class CusDevPlanServiceImpl implements CusDevPlanService{

	@Resource
	private CusDevPlanDao cusDevPlanDao;
	
	@Override
	public List<CusDevPlan> findCusDevPlan(Map<String, Object> map) {
		return cusDevPlanDao.findCusDevPlan(map);
	}

	@Override
	public Long getTotalCusDevPlan(Map<String, Object> map) {
		return cusDevPlanDao.getTotalCusDevPlan(map);
	}

	@Override
	public int addCusDevPlan(CusDevPlan cusDevPlan) {
		return cusDevPlanDao.addCusDevPlan(cusDevPlan);
	}

	@Override
	public int updateCusDevPlan(CusDevPlan cusDevPlan) {
		return cusDevPlanDao.updateCusDevPlan(cusDevPlan);
	}

	@Override
	public int deleteCusDevPlan(Integer id) {
		return cusDevPlanDao.deleteCusDevPlan(id);
	}

	@Override
	public CusDevPlan findById(Integer id) {
		return cusDevPlanDao.findById(id);
	}

}
