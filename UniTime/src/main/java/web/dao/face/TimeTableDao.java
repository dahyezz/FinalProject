package web.dao.face;

import java.util.List;

public interface TimeTableDao {

	public List selectAll();

	public void insertMyList(String names);

	public void deleteMyList(String names);

	public List selectMyList(String id);

}
