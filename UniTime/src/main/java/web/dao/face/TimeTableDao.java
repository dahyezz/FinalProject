package web.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.dto.TempTable;
import web.dto.TimeTable;

public interface TimeTableDao {

	public List selectAll();

	public void insertMyList(TempTable temp);

	public void deleteMyList(TempTable temp);

	public List selectMyList(String id);

	public List recommend(String lec);
	
	public List recommendTmp(Map<String, String> map);

	public int lectureCheck(TempTable temp);
	
	public TimeTable getTableByTemp(TempTable temp);

	public String[] recCode(Map<String, String> map);

	public void insertRec(TempTable temp);

	public void deleteRec(TempTable temp);

	public List selectRec(String id);

	public void insertMytable();
	
}
