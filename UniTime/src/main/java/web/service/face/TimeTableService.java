package web.service.face;

import java.util.List;

import web.dto.TempTable;

public interface TimeTableService {

	public List list();

	public void myListInsert(TempTable temp);

	public void myListDelete(TempTable temp);

	public List myList(String id);

}
