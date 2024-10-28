package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.ContactDao;
import com.java1234.entity.Contact;
import com.java1234.service.ContactService;

/**
 * 联系人Service实现类
 * @author Administrator
 *
 */
@Service("contactService")
public class ContactServiceImpl implements ContactService{

	@Resource
	private ContactDao contactDao;
	
	@Override
	public List<Contact> findContact(Map<String, Object> map) {
		return contactDao.findContact(map);
	}

	@Override
	public Long getTotalContact(Map<String, Object> map) {
		return contactDao.getTotalContact(map);
	}

	@Override
	public int addContact(Contact contact) {
		return contactDao.addContact(contact);
	}

	@Override
	public int updateContact(Contact contact) {
		return contactDao.updateContact(contact);
	}

	@Override
	public int deleteContact(Integer id) {
		return contactDao.deleteContact(id);
	}

	@Override
	public Contact findById(Integer id) {
		return contactDao.findById(id);
	}

}
