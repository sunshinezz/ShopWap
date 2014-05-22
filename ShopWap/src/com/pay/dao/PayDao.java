package com.pay.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jdbc.DBconnect;

public class PayDao {
	public boolean insert(Pay pay){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into \"pay\" values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, getNewId());
			ps.setInt(2, pay.getMemId());
			ps.setDouble(3, pay.getCount());
			ps.setTimestamp(4,pay.getDate());
			ps.setString(5, pay.getRemark());
			
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
			String sql = "select max(id) from \"pay\"";
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
	public double getBalance(int memId){
		double balance=0;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select sum(count) from \"pay\" where \"memId\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDouble(1, memId);

			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				balance=rs.getDouble(1);
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return balance;
	}
	public int getSellId(int orderid){
		int sellid=0;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select \"member\".\"id\" from  ((\"order\" join item on \"order\".\"itemId\"=item.\"id\") " +
					"join shop on item.\"shopId\"=shop.\"id\") join \"member\" on shop.\"ownerId\"=\"member\".\"id\" " +
					"where \"order\".\"id\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDouble(1, orderid);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				sellid=rs.getInt(1);
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sellid;
	}
	public double getOrderPrice(int orderid){
		double count=0;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select price from \"order\" where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDouble(1, orderid);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				count=rs.getDouble(1);
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
}
