package web.service.face;

import java.util.List;

public interface TimeTableService {

	public List list();

	public void myListInsert(String names);

	public void myListDelete(String names);

	public List myList(String id);

}
