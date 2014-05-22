package com.order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jdbc.DBconnect;

public class OrderDao {
	public boolean insert(Order or){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into \"order\" values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, getNewId());
			ps.setInt(2, or.getItemId());
			ps.setInt(3, or.getMemId());
			ps.setInt(4, or.getWaybill());
			ps.setInt(5, or.getState());
			ps.setTimestamp(6, or.getDate());
			ps.setInt(7, or.getNum());
			ps.setString(8, or.getName());
			ps.setString(9, or.getAddress());
			ps.setString(10, or.getPhone());
			ps.setDouble(11, or.getPrice());
			
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
	public int getNewId(){
		int id=10000001;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select max(id) from \"order\"";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				if(rs.getInt(1)==0)
					id=10000001;
				else id=rs.getInt(1)+1;
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	public boolean setState(int state,int id)
	{
		try {
			Connection conn = DBconnect.getConn();
			String sql = "UPDATE \"order\" SET \"state\"=? WHERE \"id\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, state);
			ps.setInt(2, id);
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
}
