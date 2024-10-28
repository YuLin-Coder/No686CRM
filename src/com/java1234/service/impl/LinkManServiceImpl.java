package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.LinkManDao;
import com.java1234.entity.LinkMan;
import com.java1234.service.LinkManService;

/**
 * 联系人Service实现类
 * @author Administrator
 *
 */
@Service("linkManService")
public class LinkManServiceImpl implements LinkManService{

	@Resource
	private LinkManDao linkManDao;
	
	@Override
	public List<LinkMan> findLinkMan(Map<String, Object> map) {
		return linkManDao.findLinkMan(map);
	}

	@Override
	public Long getTotalLinkMan(Map<String, Object> map) {
		return linkManDao.getTotalLinkMan(map);
	}

	@Override
	public int addLinkMan(LinkMan cusDevPlan) {
		return linkManDao.addLinkMan(cusDevPlan);
	}

	@Override
	public int updateLinkMan(LinkMan cusDevPlan) {
		return linkManDao.updateLinkMan(cusDevPlan);
	}

	@Override
	public int deleteLinkMan(Integer id) {
		return linkManDao.deleteLinkMan(id);
	}

	@Override
	public LinkMan findById(Integer id) {
		return linkManDao.findById(id);
	}

}
