package web.service.face;

import java.util.List;

import web.dto.TimeTable;
import web.dto.Unilist;

public interface MainService {
	
	public List freeboardNotice();
	
	public List freeboard();
	
	public List tastyBoard();
	
	public List usedBoard();
	
	public List<TimeTable> timeTable(String email);

	public List<Unilist> getUniList(String keyword);
	

}
