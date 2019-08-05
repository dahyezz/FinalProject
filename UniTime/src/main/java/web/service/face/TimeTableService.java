package web.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import web.dto.TempTable;
import web.dto.TimeTable;

public interface TimeTableService {

	public List list();

	public void myListInsert(TempTable temp);
	
	public void myListDelete(TempTable temp);

	public List myList(String id);
	
	public List recommendList(HttpServletRequest req);

	public boolean checkLecture(TempTable temp);

	public TimeTable getTableByTemp(TempTable temp); 
	

}
