package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.FreeBoard;
import web.dto.FreeBoardNotice;
import web.dto.TastyBoard;
import web.dto.TimeTable;
import web.dto.Unilist;
import web.dto.UsedBoard;

public interface MainDao {
	
	public List<FreeBoardNotice> freeboardNotice(Map<String, Object> map);
	
	public List<FreeBoard> freeboard(Map<String, Object> map);
	
	public List<TastyBoard> tastyBoard(Map<String, Object> map);
	
	public List<UsedBoard> usedBoard(Map<String, Object> map);
	
	public List<TimeTable> timeTable(String email);

	public List<Unilist> selectAllUnilist(String keyword);

}
