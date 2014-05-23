package com.login.dao;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.jdbc.DBconnect;




public class userDao {
	public User queryById(int id)
	{
		User u=null;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select * from member where id=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u=new User();
				u.setId(id);
				u.setAccount(rs.getString("account"));
				u.setPassword(rs.getString("password"));
				u.setGerder(rs.getInt("gender"));
				u.setName(rs.getString("name"));
				u.setPhone(rs.getString("phone"));
				u.setEmail(rs.getString("Email"));
				u.setAddress1(rs.getString("Address1"));
				u.setPhone1(rs.getString("Phone1"));
				u.setAddress2(rs.getString("Address2"));
				u.setPhone2(rs.getString("Phone2"));
				u.setAddress3(rs.getString("Address3"));
				u.setPhone3(rs.getString("Phone3"));
				u.setRegisterDate(rs.getDate("RegisterDate"));	
				u.setName1(rs.getString("name1"));
				u.setName2(rs.getString("name2"));
				u.setName3(rs.getString("name3"));
				
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception ee) {
			System.out.print(ee.getMessage());
		}
		return u ;
	}
	public User queryByAccount(String account)//¸ù¾ÝÕËºÅ²éÕÒuser
	{
		User u=null;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select * from member where account=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, account);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u=new User();
				u.setId(rs.getInt("id"));
				u.setAccount(rs.getString("account"));
				u.setPassword(rs.getString("password"));
				u.setGerder(rs.getInt("gender"));
				u.setName(rs.getString("name"));
				u.setPhone(rs.getString("phone"));
				u.setEmail(rs.getString("Email"));
				u.setAddress1(rs.getString("Address1"));
				u.setPhone1(rs.getString("Phone1"));
				u.setAddress2(rs.getString("Address2"));
				u.setPhone2(rs.getString("Phone2"));
				u.setAddress3(rs.getString("Address3"));
				u.setPhone3(rs.getString("Phone3"));
				u.setRegisterDate(rs.getDate("RegisterDate"));	
				u.setName1(rs.getString("name1"));
				u.setName2(rs.getString("name2"));
				u.setName3(rs.getString("name3"));
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception ee) {
			System.out.print(ee.getMessage());
		}
		return u ;
	}
	public boolean updateInfo(User u) {
			try {
				Connection conn = DBconnect.getConn();
				String sql = "UPDATE \"member\" SET \"name\"=?,\"gender\"=?,\"Email\"=?,\"phone\"=? WHERE \"id\"=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, u.getName());
				ps.setInt(2, u.getGerder());
				ps.setString(3, u.getEmail());
				ps.setString(4, u.getPhone());
				ps.setInt(5, u.getId());
				int x  = ps.executeUpdate();
				ps.close();
				conn.close();
				if(x > 0)
					return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			return false;
	}
	public int getNewId(){
		int id=10000001;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select max(id) from \"member\"";
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
	public boolean register(User u)
	{
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into \"member\" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, u.getId());
			ps.setString(2, u.getAccount());
			ps.setString(3, u.getPassword());
			ps.setInt(4, u.getGerder());
			ps.setString(5, u.getName());
			ps.setString(6, u.getPhone());
			ps.setString(7,u.getEmail());
			ps.setString(8,null);
			ps.setString(9,null);
			ps.setString(10,null);
			ps.setString(11,null);
			ps.setString(12,null);
			ps.setString(13,null);
			ps.setDate(14,u.getRegisterDate());
			ps.setString(15,null);
			ps.setString(16,null);
			ps.setString(17,null);
			if(ps.executeUpdate()>0)
			{
				ps.close();
				conn.close();
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean changePasswd(String account,String passwd){
		try{
			Connection conn = DBconnect.getConn();
			String sql = "UPDATE \"member\" SET \"password\"=? WHERE \"account\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, passwd);
			ps.setString(2, account);
			if(ps.executeUpdate()>0){
				ps.close();
				conn.close();
				return true;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

}

