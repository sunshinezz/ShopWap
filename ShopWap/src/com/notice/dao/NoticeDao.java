package com.notice.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.jdbc.DBconnect;
import com.shopcar.dao.ShopCar;

public class NoticeDao {
	public ArrayList<Notice> QueryAll(){

		ArrayList<Notice> notice = new ArrayList<Notice>();
		
		
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select * from notice order by createdate DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Notice n = new Notice();
				n.setId(rs.getString("id"));
				n.setContent(rs.getString("content"));	
				n.setCreatedate(rs.getDate("createdate"));
				n.setTitle(rs.getString("title"));
				notice.add(n);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return notice;
	}
	
	
	
	public Notice QueryById(String id){

		Notice n = new Notice();
		
		
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select * from notice where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			int id1=Integer.parseInt(id);
			ps.setInt(1, id1);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				n.setId(rs.getString("id"));
				n.setContent(rs.getString("content"));	
				n.setCreatedate(rs.getDate("createdate"));
				n.setTitle(rs.getString("title"));
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return n;
	}
	public boolean update(Notice notice)
	{
		try {
			Connection conn = DBconnect.getConn();
			String sql = "UPDATE \"notice\" SET \"title\"=?,\"content\"=? WHERE \"id\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, notice.getTitle());
			ps.setString(2, notice.getContent());
			ps.setInt(3, Integer.parseInt(notice.getId()));
			int x  = ps.executeUpdate();
			ps.close();
			conn.close();
			if(x > 0)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	public boolean delete(int id){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "delete from notice where \"id\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int x = ps.executeUpdate();
			ps.close();
			conn.close();
			if(x > 0 )
				return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean insert(Notice notice){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into notice values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1,getNewId());
			ps.setString(2,notice.getContent());
			ps.setDate(3, notice.getCreatedate());
			ps.setString(4, notice.getTitle());
				
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
			String sql = "select max(\"id\") from notice";
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
}
