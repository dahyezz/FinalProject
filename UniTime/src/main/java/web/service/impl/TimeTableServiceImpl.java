package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.TimeTableDao;
import web.service.face.TimeTableService;

@Service
public class TimeTableServiceImpl implements TimeTableService {

	@Autowired TimeTableDao timeTableDao;
	
	@Override
	public List list() {
		return timeTableDao.selectAll();
	}

	@Override
	public void myListInsert(String names) {
		timeTableDao.insertMyList(names);
	}

	@Override
	public void myListDelete(String names) {
		timeTableDao.deleteMyList(names);
	}

	@Override
	public List myList(String id) {
		return timeTableDao.selectMyList(id);
	}

}
