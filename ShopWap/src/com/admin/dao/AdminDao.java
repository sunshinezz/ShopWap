package com.admin.dao;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.buy.dao.OrderInfo;
import com.item.dao.Item;
import com.jdbc.DBconnect;
import com.pay.dao.Pay;




public class AdminDao {
	public Admin queryById(int id)
	{
		Admin u=null;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select * from admin where id=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u=new Admin();
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
	public Admin queryByAccount(String account)//∏˘æ›’À∫≈≤È’“user
	{
		Admin u=null;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select * from admin where account=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, account);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u=new Admin();
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
	
	public ArrayList<Item> getUnverifyList(){
		ArrayList<Item> result=new ArrayList<Item>();
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select id,name,\"typeId\",\"shopId\",info,infoimg,price,image,saledate,brand,model,color,state from item natural join price p " +
					"where item.state=0 and date>=(select max(date) from price p1 group by p1.id having p1.id=p.id)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Item u = new Item();
				u.setId(rs.getString("id"));
				u.setName(rs.getString("name"));	
				u.setTypeId(rs.getInt("typeId"));
				u.setShopId(rs.getInt("shopId"));
				u.setInfo(rs.getString("info"));
				u.setInfoimg(rs.getString("infoimg"));
				u.setPrice(rs.getDouble("price"));
				u.setImg(rs.getString("image"));
				u.setSaledate(rs.getDate("saledate"));	
				u.setBrand(rs.getString("brand"));
				u.setModel(rs.getString("model"));
				u.setColor(rs.getString("color"));
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
	public int getUnverifyNum(){
		int num=0;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select count(id) from item where state=0 ";
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
	public ArrayList<Item> getNormalList(){
		ArrayList<Item> result=new ArrayList<Item>();
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select id,name,\"typeId\",\"shopId\",info,infoimg,price,image,saledate,brand,model,color,state from item natural join price p " +
					"where item.state=1 and date>=(select max(date) from price p1 group by p1.id having p1.id=p.id)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Item u = new Item();
				u.setId(rs.getString("id"));
				u.setName(rs.getString("name"));	
				u.setTypeId(rs.getInt("typeId"));
				u.setShopId(rs.getInt("shopId"));
				u.setInfo(rs.getString("info"));
				u.setInfoimg(rs.getString("infoimg"));
				u.setPrice(rs.getDouble("price"));
				u.setImg(rs.getString("image"));
				u.setSaledate(rs.getDate("saledate"));	
				u.setBrand(rs.getString("brand"));
				u.setModel(rs.getString("model"));
				u.setColor(rs.getString("color"));
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
	public int getUnMaintainNum(){
		int num=0;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select count(id) from \"order\" where state=-5 ";
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
	public boolean insert(Admin w){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into waybill values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, w.getId());

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
	public Item queryItemById(String id){
		Item u = new Item();
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select id,name,\"typeId\",\"shopId\",info,infoimg,price,image,saledate,brand,model,color,state from item natural join price p " +
					"where item.id = ? and date>=(select max(date) from price p1 group by p1.id having p1.id=p.id)";
			PreparedStatement ps = conn.prepareStatement(sql);
			int id1=0;
			try{
				id1=Integer.parseInt(id);
			}
			catch(Exception e)
			{
				return null;
			}
			ps.setInt(1, id1);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				u.setId(rs.getString("id"));
				u.setName(rs.getString("name"));	
				u.setTypeId(rs.getInt("typeId"));
				u.setShopId(rs.getInt("shopId"));
				u.setInfo(rs.getString("info"));
				u.setInfoimg(rs.getString("infoimg"));
				u.setPrice(rs.getDouble("price"));
				u.setImg(rs.getString("image"));
				u.setSaledate(rs.getDate("saledate"));	
				u.setBrand(rs.getString("brand"));
				u.setModel(rs.getString("model"));
				u.setColor(rs.getString("color"));
				u.setState(rs.getInt("state"));
			}
			else u=null;
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return u;
	}
	public String getTypeName(int id){
		String u = null;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select type.name from item join type on item.\"typeId\"=type.id where item.id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				u=rs.getString(1);
			}
			else u=null;
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return u;
	}
	public boolean setState(int state,int id)
	{
		try {
			Connection conn = DBconnect.getConn();
			String sql = "UPDATE \"item\" SET \"state\"=? WHERE \"id\"=?";
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
	public boolean setOrderState(int state,int id)
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
	public ArrayList<OrderInfo> QueryMaintain() {
		ArrayList<OrderInfo> orders=new ArrayList<OrderInfo>();
		try {
			Connection conn = DBconnect.getConn();
			String sql= " SELECT \"order\".\"id\",\"itemId\",\"memId\",\"waybillId\",\"order\".\"state\"," +
				"\"order\".\"date\",\"num\",\"order\".\"name\"," +
				"address,phone,price,item.name as iname,image" +
				" FROM \"order\",\"item\" WHERE \"order\".\"itemId\"=\"item\".\"id\" and \"order\".\"state\"=-5 ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				OrderInfo o = new OrderInfo();
				o.setId(rs.getInt("id"));
				o.setItemId(rs.getInt("itemId"));
				o.setMemId(rs.getInt("memId"));
				o.setWaybill(rs.getInt("waybillId"));
				o.setState(rs.getInt("state"));
				o.setDate(rs.getTimestamp("date"));
				o.setNum(rs.getInt("num"));
				o.setName(rs.getString("name"));
				o.setAddress(rs.getString("address"));
				o.setPhone(rs.getString("phone"));
				o.setPrice(rs.getDouble("price"));
				o.setItemLogo(rs.getString("image"));
				o.setItemName(rs.getString("iname"));
				orders.add(o);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;	
	}
}

