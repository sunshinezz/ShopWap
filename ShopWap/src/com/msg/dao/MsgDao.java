package com.msg.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.jdbc.DBconnect;
import com.shopcar.dao.ShopCar;

public class MsgDao {
	public ArrayList<Msg> QueryAll(){

		ArrayList<Msg> msg = new ArrayList<Msg>();	
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select * from msg order by date DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Msg m = new Msg();
				m.setId(rs.getInt("id"));
				m.setContent(rs.getString("content"));	
				m.setDate(rs.getTimestamp("date"));
				msg.add(m);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return msg;
	}
	
	
	
	public Msg QueryById(int id){

		Msg m = new Msg();
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select * from msg where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				m.setId(rs.getInt("id"));
				m.setContent(rs.getString("content"));	
				m.setDate(rs.getTimestamp("date"));
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return m;
	}
	public boolean update(Msg msg)
	{
		try {
			Connection conn = DBconnect.getConn();
			String sql = "UPDATE \"msg\" SET \"content\"=? WHERE \"id\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, msg.getContent());
			ps.setInt(2, msg.getId());
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
			String sql = "delete from msg where \"id\"=?";
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
	public boolean insert(Msg msg){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into msg values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1,getNewId());
			ps.setString(2,msg.getContent());
			ps.setTimestamp(3, msg.getDate());
				
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
			String sql = "select max(\"id\") from msg";
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
