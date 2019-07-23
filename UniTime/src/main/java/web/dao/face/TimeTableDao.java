package web.dao.face;

import java.util.List;

import web.dto.TempTable;

public interface TimeTableDao {

	public List selectAll();

	public void insertMyList(TempTable temp);

	public void deleteMyList(TempTable temp);

	public List selectMyList(String id);

	public List recommend(String lec);

}
