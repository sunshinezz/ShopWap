package com.logistic.dao;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.item.dao.Item;
import com.jdbc.DBconnect;
import com.pay.dao.Pay;




public class LogisticDao {
	public Logistic queryById(int id)
	{
		Logistic u=null;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select * from logistic where id=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u=new Logistic();
				u.setId(id);
				u.setAccount(rs.getString("account"));
				u.setPassword(rs.getString("password"));		
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception ee) {
			System.out.print(ee.getMessage());
		}
		return u ;
	}
	public Logistic queryByAccount(String account)//根据账号查找user
	{
		Logistic u=null;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select * from logistic where account=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, account);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u=new Logistic();
				u.setId(rs.getInt("id"));
				u.setAccount(rs.getString("account"));
				u.setPassword(rs.getString("password"));		
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception ee) {
			System.out.print(ee.getMessage());
		}
		return u ;
	}
	public int getFinishedNum()
	{
		int num=0;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select count(id) from waybill where state=1 ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				num=rs.getInt(1);		
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception ee) {
			System.out.print(ee.getMessage());
		}
		return num;
	}
	public int getUnfinishedNum()
	{
		int all=0;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select count(DISTINCT id) from waybill";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				all=rs.getInt(1);		
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception ee) {
			System.out.print(ee.getMessage());
		}
		return all-getFinishedNum();
	}
	public ArrayList<LogList> getFinishedList(){
		ArrayList<LogList> result=new ArrayList<LogList>();
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select id,min(date) as cDate,max(date) as eDate from waybill b where EXISTS " +
					"(select * from waybill b1 where b1.state=1 and b1.id=b.id) GROUP BY id ORDER BY id;"; //选择最新价格
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				LogList u = new LogList();
				u.setId(rs.getInt("id"));
				u.setcDate(rs.getTimestamp("cDate"));	
				u.seteDate(rs.getTimestamp("eDate"));
				result.add(u);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public ArrayList<LogList> getUnfinishedList(){
		ArrayList<LogList> result=new ArrayList<LogList>();
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select id,min(date) as cDate,max(date) as eDate from waybill b where not EXISTS " +
					"(select * from waybill b1 where b1.state=1 and b1.id=b.id) GROUP BY id;"; //选择最新价格
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				LogList u = new LogList();
				u.setId(rs.getInt("id"));
				u.setcDate(rs.getTimestamp("cDate"));	
				u.seteDate(rs.getTimestamp("eDate"));
				result.add(u);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public ArrayList<WayBill> getWayBillById(int id){
		ArrayList<WayBill> result=new ArrayList<WayBill>();
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select id,date,content,state from waybill where id=? order by date ASC"; //选择最新价格
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				WayBill u = new WayBill();
				u.setId(rs.getInt("id"));
				u.setDate(rs.getTimestamp("date"));
				u.setContent(rs.getString("content"));
				u.setState(rs.getInt("state"));
				result.add(u);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public boolean insert(WayBill w){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into waybill values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, w.getId());
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
	public int getWayBillId(int orderId)
	{
		int id=0;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select \"order\".\"waybillId\" from \"order\" where \"order\".\"id\"=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,orderId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				id=rs.getInt(1);		
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception ee) {
			System.out.print(ee.getMessage());
		}
		return id;
	}
}

