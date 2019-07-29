package web.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.dto.TempTable;

public interface TimeTableDao {

	public List selectAll();

	public void insertMyList(TempTable temp);

	public void deleteMyList(TempTable temp);

	public List selectMyList(String id);

	public List recommend(String lec);
	
	public List recommendTmp(Map<String, String> map);
}
