package com.shopcar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jdbc.DBconnect;
import com.shop.dao.Shop;

public class ShopCarDao {
	public boolean insert(ShopCar sc){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into shopcar values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1,sc.getItemId());
			ps.setInt(2, sc.getNum());
			ps.setTimestamp(3, sc.getDate());
			ps.setInt(4, sc.getUserId());
			ps.setInt(5, getNewId());
			
			
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
	public int getSize(int userId){
		int size=0;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select count(*) from shopcar where \"memId\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,userId);

			ResultSet rs = ps.executeQuery();
			if(rs.next())
				size=rs.getInt(1);
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return size;
	}
	public int getNewId(){
		int id=10000001;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select max(\"Id\") from shopcar";
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
	public ArrayList<ShopCar> queryByMemId(int MemId){
		ArrayList<ShopCar> result=new ArrayList<ShopCar>();
		try {
			Connection conn = DBconnect.getConn();
			String sql ="select shopcar.\"Id\",item.id as itemId,item.name,price,image,num,shopcar.date "
			    +"from (item natural join price p) join shopcar on item.id=shopcar.\"itemId\" "
				+ "where shopcar.\"memId\"= ? and p.date>=(select max(date) from price p1 group by p1.id having p1.id=p.id)"
			    +" order by shopcar.date DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, MemId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ShopCar u = new ShopCar();
				u.setId(rs.getInt("Id"));
				u.setItemId(rs.getInt("itemId"));
				u.setName(rs.getString("name"));	
				u.setPrice(rs.getDouble("price"));
				u.setImg(rs.getString("image"));
				u.setNum(rs.getInt("num"));
				u.setDate(rs.getTimestamp("date"));
				u.setTotalprice(rs.getDouble("price")*rs.getInt("num"));
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
	public boolean delete(int id){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "delete from shopcar where \"Id\"=?";
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
	public ShopCar queryById(int id) {
		ShopCar sc=null;
		try {
			Connection conn = DBconnect.getConn();
			String sql ="select shopcar.\"Id\",item.id as itemId,item.name,price,image,num,shopcar.date,\"memId\" "
				    +"from (item natural join price p) join shopcar on item.id=shopcar.\"itemId\" "
					+ "where shopcar.\"Id\"= ? and p.date>=(select max(date) from price p1 group by p1.id having p1.id=p.id)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sc=new ShopCar();
				sc.setId(rs.getInt("id"));
				sc.setItemId(rs.getInt("itemId"));
				sc.setName(rs.getString("name"));
				sc.setPrice(rs.getDouble("price"));
				sc.setTotalprice(rs.getDouble("price")*rs.getInt("num"));
				sc.setImg(rs.getString("image"));
				sc.setUserId(rs.getInt("memId"));
				sc.setNum(rs.getInt("num"));
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception ee) {
			System.out.print(ee.getMessage());
		}
		return sc;
	}
	public ArrayList<Address> getAddress(int MemId){
		ArrayList<Address> result=new ArrayList<Address>();
		try {
			Connection conn = DBconnect.getConn();
			String sql ="select \"Name1\",\"Address1\",\"Phone1\",\"Name2\",\"Address2\",\"Phone2\"," +
					"\"Name3\",\"Address3\",\"Phone3\" from member where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, MemId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				if(rs.getString("Name1")!=null)
				{
					Address a1 = new Address();		
					a1.setName(rs.getString("Name1"));
					a1.setAddress(rs.getString("Address1"));
					a1.setPhone(rs.getString("Phone1"));			
					result.add(a1);
				}
				else return null;
				if(rs.getString("Name2")!=null)
				{
					Address a2 = new Address();		
					a2.setName(rs.getString("Name2"));
					a2.setAddress(rs.getString("Address2"));
					a2.setPhone(rs.getString("Phone2"));			
					result.add(a2);
				}
				if(rs.getString("Name3")!=null)
				{
					Address a3 = new Address();		
					a3.setName(rs.getString("Name3"));
					a3.setAddress(rs.getString("Address3"));
					a3.setPhone(rs.getString("Phone3"));			
					result.add(a3);
				}
				
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
}
