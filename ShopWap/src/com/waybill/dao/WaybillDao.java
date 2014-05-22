package com.waybill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jdbc.DBconnect;
import com.sell.dao.Sell;

public class WaybillDao {
	public boolean insert(Waybill w){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into waybill values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,w.getId());
			ps.setTimestamp(2, w.getDate());
			ps.setString(3, w.getContent());
			ps.setInt(4, w.getState());
			int x  = ps.executeUpdate();
			ps.close();
			conn.close();
			if(x > 0)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean queryById(int id)
	{

		try {
			Connection conn = DBconnect.getConn();
			String sql = "SELECT * from waybill where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				
				return true;
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
		
	}
}
