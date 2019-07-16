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

}
