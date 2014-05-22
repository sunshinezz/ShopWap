package com.top10.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jdbc.DBconnect;

public class TopDao {
	public ArrayList<Top> queryTop10(int state)
	{
		
		ArrayList<Top> toplist=new ArrayList<Top>();
		int i=1;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "SELECT \"itemId\",COUNT(*) AS num " +
					" FROM \"order\" WHERE \"state\" = ? " +
					" GROUP BY \"itemId\"" +
					" ORDER BY COUNT(*) DESC" +
					" LIMIT 10 OFFSET 0";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, state);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Top n = new Top();
				n.setId(rs.getInt("itemId"));
				n.setNum(rs.getInt("num"));
				n.setTop(i);
				i++;
				toplist.add(n);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return toplist;
		
	}
	
	public ArrayList<Top> queryLike10()
	{
		
		ArrayList<Top> toplist=new ArrayList<Top>();
		int i=1;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "SELECT \"itemId\",COUNT(*) AS num " +
					" FROM \"like\" " +
					" GROUP BY \"itemId\"" +
					" ORDER BY COUNT(*) DESC" +
					" LIMIT 10 OFFSET 0";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Top n = new Top();
				n.setId(rs.getInt("itemId"));
				n.setNum(rs.getInt("num"));
				n.setTop(i);
				i++;
				toplist.add(n);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return toplist;
		
	}
}
