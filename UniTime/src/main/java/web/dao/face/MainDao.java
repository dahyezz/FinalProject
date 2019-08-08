package web.dao.face;

import java.util.List;

public interface MainDao {
	
	public List freeboardNotice();
	
	public List freeboard();
	
	public List tastyBoard();
	
	public List usedBoard();
	
	public List timeTable(String email);

}
