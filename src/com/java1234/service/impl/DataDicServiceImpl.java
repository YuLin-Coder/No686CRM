package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.DataDicDao;
import com.java1234.entity.DataDic;
import com.java1234.service.DataDicService;

/**
 * 数据字典Service实现类
 * @author Administrator
 *
 */
@Service("dataDicService")
public class DataDicServiceImpl implements DataDicService{

	@Resource
	private DataDicDao dataDicDao;
	
	@Override
	public List<DataDic> findDataDic(Map<String, Object> map) {
		return dataDicDao.findDataDic(map);
	}

	@Override
	public Long getTotalDataDic(Map<String, Object> map) {
		return dataDicDao.getTotalDataDic(map);
	}

	@Override
	public int addDataDic(DataDic dataDic) {
		return dataDicDao.addDataDic(dataDic);
	}

	@Override
	public int updateDataDic(DataDic dataDic) {
		return dataDicDao.updateDataDic(dataDic);
	}

	@Override
	public int deleteDataDic(Integer id) {
		return dataDicDao.deleteDataDic(id);
	}

	@Override
	public List<DataDic> findAllDataDicName() {
		return dataDicDao.findAllDataDicName();
	}

}
