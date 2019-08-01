package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import web.dbutil.DBConn;

public class AdminVisitDaoImpl implements HttpSessionListener{
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
		PreparedStatement ps = null;
		Connection conn = DBConn.getConnection();
		HttpSession session = se.getSession();
		
		String sql = ""; 
		sql += "INSERT INTO visit";
		sql += " VALUES (?,sysdate)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, session.getId());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)	ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}
	

}
