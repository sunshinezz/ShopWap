package com.sell.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.item.dao.Item;
import com.jdbc.DBconnect;
import com.shop.dao.Shop;
import com.waybill.dao.Waybill;


public class SellDao {
	public ArrayList<Sell> queryByState(int state,int userid)
	{
		
		ArrayList<Sell> orderlist=new ArrayList<Sell>();
		try {
			Connection conn = DBconnect.getConn();
			/*String sql = "SELECT \"order\".\"id\",\"order\".\"itemId\",\"order\".\"memId\",\"order\".\"waybillId\",\"order\".\"state\",\"order\".\"judgeId\"," +
					"\"order\".\"name\",\"order\".price,\"order\".date,item.image " +
					"FROM \"order\",shop,item" +
					"WHERE \"order\".\"itemId\"=item.\"id\" AND item.\"shopId\"=shop.\"id\"" +
					"AND shop.\"ownerId\"=?" +
							"AND \"order\".\"state\"=?";*/
			String sql = "SELECT \"order\".\"id\" AS orderid,\"order\".\"num\" AS num,\"order\".\"itemId\",\"order\".\"memId\",\"order\".\"waybillId\",\"order\".\"state\",\"order\".\"name\",\"order\".price,\"order\".date,item.image,item.name AS itemname" +
					" FROM \"order\",shop,item" +
					" WHERE \"order\".\"itemId\"=item.\"id\" AND item.\"shopId\"=shop.\"id\"" +
					" AND shop.\"ownerId\"=?" +
					" AND \"order\".\"state\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setInt(2, state);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Sell n = new Sell();
				n.setId(rs.getInt("orderid"));
				n.setNum(rs.getInt("num"));
				n.setItemId(rs.getInt("itemId"));
				n.setMemId(rs.getInt("memId"));
				n.setWaybillId(rs.getInt("waybillId"));
				n.setState(rs.getInt("state"));
				
				n.setName(rs.getString("name"));
				n.setPrice(rs.getDouble("price"));
				n.setDate(rs.getTimestamp("date"));
				n.setImage(rs.getString("image"));
				n.setItemname(rs.getString("itemname"));
				
				orderlist.add(n);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return orderlist;
		
	}
	
	public ArrayList<Sell> queryBymemid(int userid)
	{

		ArrayList<Sell> orderlist=new ArrayList<Sell>();
		try {
			Connection conn = DBconnect.getConn();
			/*String sql = "SELECT \"order\".\"id\",\"order\".\"itemId\",\"order\".\"memId\",\"order\".\"waybillId\",\"order\".\"state\",\"order\".\"judgeId\"," +
					"\"order\".\"name\",\"order\".price,\"order\".date,item.image " +
					"FROM \"order\",shop,item" +
					"WHERE \"order\".\"itemId\"=item.\"id\" AND item.\"shopId\"=shop.\"id\"" +
					"AND shop.\"ownerId\"=?" +
							"AND \"order\".\"state\"=?";*/
			String sql = "SELECT \"order\".\"id\" AS orderid,\"order\".\"num\" AS num,\"order\".\"itemId\",\"order\".\"memId\",\"order\".\"waybillId\",\"order\".\"state\",\"order\".\"name\",\"order\".price,\"order\".date,item.image,item.name AS itemname" +
					" FROM \"order\",shop,item" +
					" WHERE \"order\".\"itemId\"=item.\"id\" AND item.\"shopId\"=shop.\"id\"" +
					" AND shop.\"ownerId\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Sell n = new Sell();
				n.setId(rs.getInt("orderid"));
				n.setNum(rs.getInt("num"));
				n.setItemId(rs.getInt("itemId"));
				n.setMemId(rs.getInt("memId"));
				n.setWaybillId(rs.getInt("waybillId"));
				n.setState(rs.getInt("state"));
				
				n.setName(rs.getString("name"));
				n.setPrice(rs.getDouble("price"));
				n.setDate(rs.getTimestamp("date"));
				n.setImage(rs.getString("image"));
				n.setItemname(rs.getString("itemname"));
			
				orderlist.add(n);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return orderlist;
		
	}
	
	
	public Sell queryById(int id)
	{

		Sell n = new Sell();
		try {
			Connection conn = DBconnect.getConn();
			/*String sql = "SELECT \"order\".\"id\",\"order\".\"itemId\",\"order\".\"memId\",\"order\".\"waybillId\",\"order\".\"state\",\"order\".\"judgeId\"," +
					"\"order\".\"name\",\"order\".price,\"order\".date,item.image " +
					"FROM \"order\",shop,item" +
					"WHERE \"order\".\"itemId\"=item.\"id\" AND item.\"shopId\"=shop.\"id\"" +
					"AND shop.\"ownerId\"=?" +
							"AND \"order\".\"state\"=?";*/
			String sql = "SELECT \"order\".\"id\" AS orderid,\"order\".\"num\" AS num,\"order\".\"itemId\",\"order\".\"memId\",\"order\".\"waybillId\",\"order\".\"state\",\"order\".\"name\",\"order\".price,\"order\".date,item.image,item.name AS itemname" +
					" FROM \"order\",shop,item" +
					" WHERE \"order\".\"itemId\"=item.\"id\" AND item.\"shopId\"=shop.\"id\"" +
					" AND \"order\".\"id\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				
				n.setId(rs.getInt("orderid"));
				n.setNum(rs.getInt("num"));
				n.setItemId(rs.getInt("itemId"));
				n.setMemId(rs.getInt("memId"));
				n.setWaybillId(rs.getInt("waybillId"));
				n.setState(rs.getInt("state"));
				
				n.setName(rs.getString("name"));
				n.setPrice(rs.getDouble("price"));
				n.setDate(rs.getTimestamp("date"));
				n.setImage(rs.getString("image"));
				n.setItemname(rs.getString("itemname"));
			
				
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
	
	
	
	public ArrayList<Integer> queryNum(int userid)
	{

		ArrayList<Integer> numlist=new ArrayList<Integer>();
		for(int i=0; i<20; i++)
		{
			numlist.add(0);
		}
		try {
			Connection conn = DBconnect.getConn();
			/*String sql = "SELECT \"order\".\"id\",\"order\".\"itemId\",\"order\".\"memId\",\"order\".\"waybillId\",\"order\".\"state\",\"order\".\"judgeId\"," +
					"\"order\".\"name\",\"order\".price,\"order\".date,item.image " +
					"FROM \"order\",shop,item" +
					"WHERE \"order\".\"itemId\"=item.\"id\" AND item.\"shopId\"=shop.\"id\"" +
					"AND shop.\"ownerId\"=?" +
							"AND \"order\".\"state\"=?";*/
			String sql = "SELECT \"order\".\"state\" AS state,COUNT(*) AS num" +
					" FROM \"order\",shop,item" +
					" WHERE \"order\".\"itemId\"=item.\"id\" AND item.\"shopId\"=shop.\"id\"" +
					" AND shop.\"ownerId\"=?"+" GROUP BY  \"order\".\"state\"" + " ORDER BY \"order\".\"state\" ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int n;
				n=rs.getInt("num");
			
				numlist.add(rs.getInt("state")+7,n);
				
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return numlist;
		
	}
	
	public boolean setState(int state,int id)
	{
		try {
			Connection conn = DBconnect.getConn();
			/*String sql = "SELECT \"order\".\"id\",\"order\".\"itemId\",\"order\".\"memId\",\"order\".\"waybillId\",\"order\".\"state\",\"order\".\"judgeId\"," +
					"\"order\".\"name\",\"order\".price,\"order\".date,item.image " +
					"FROM \"order\",shop,item" +
					"WHERE \"order\".\"itemId\"=item.\"id\" AND item.\"shopId\"=shop.\"id\"" +
					"AND shop.\"ownerId\"=?" +
							"AND \"order\".\"state\"=?";*/
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
	
	public boolean setItemState(int state,int id)
	{
		try {
			Connection conn = DBconnect.getConn();
			String sql = "UPDATE item SET \"state\"=? WHERE \"id\"=?";
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
	
	
	public boolean setWaybillId(int waybillid,int id)
	{
		try {
			Connection conn = DBconnect.getConn();
			/*String sql = "SELECT \"order\".\"id\",\"order\".\"itemId\",\"order\".\"memId\",\"order\".\"waybillId\",\"order\".\"state\",\"order\".\"judgeId\"," +
					"\"order\".\"name\",\"order\".price,\"order\".date,item.image " +
					"FROM \"order\",shop,item" +
					"WHERE \"order\".\"itemId\"=item.\"id\" AND item.\"shopId\"=shop.\"id\"" +
					"AND shop.\"ownerId\"=?" +
							"AND \"order\".\"state\"=?";*/
			String sql = "UPDATE \"order\" SET \"waybillId\"=? WHERE \"id\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, waybillid);
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
	
	
	
	public int getNewId(){
		int id=10000001;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select max(id) from item";
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
	
	
	public int getShopId(int id)
	{
		try {
			Connection conn = DBconnect.getConn();
			String sql = "SELECT shop.\"id\" FROM shop WHERE shop.\"ownerId\" = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1);
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
	
	public boolean additem(Item w){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into item values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,Integer.parseInt(w.getId()));
			ps.setString(2, w.getName());
			ps.setInt(3, w.getTypeId());
			ps.setInt(4, w.getShopId());
			ps.setString(5, w.getInfo());
			ps.setString(6, w.getImg());
			ps.setDate(7, w.getSaledate());
			ps.setString(8, w.getInfoimg());
			ps.setString(9, w.getBrand());
			ps.setString(10, w.getModel());
			ps.setString(11, w.getColor());
			ps.setInt(12, w.getState());
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
	
	public boolean setPrice(Item w){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into price values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,Integer.parseInt(w.getId()));
			ps.setDouble(2, w.getPrice());
			Timestamp d = new Timestamp(System.currentTimeMillis());
			ps.setTimestamp(3, d);
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
	public boolean modifyitem(Item w){
		try {
			Connection conn = DBconnect.getConn();
			String sql = "UPDATE item SET  \"name\" = ?,\"typeId\"=?,\"shopId\"=?,info=?,saledate=?,brand=?,model=?,color=?,\"state\"=?  WHERE \"id\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, w.getName());
			ps.setInt(2, w.getTypeId());
			ps.setInt(3, w.getShopId());
			ps.setString(4, w.getInfo());

			ps.setDate(5, w.getSaledate());

			ps.setString(6, w.getBrand());
			ps.setString(7, w.getModel());
			ps.setString(8, w.getColor());
			ps.setInt(9, w.getState());
			
			ps.setInt(10,Integer.parseInt(w.getId()));
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
	

	
	
	public List<Item> queryShopItem(int shopId,int page)
	{
		ResultSet rs=null;
		PreparedStatement ps=null;
		Connection conn=null;
		List<Item> items=new ArrayList<Item>();
		System.out.println("shopId:"+shopId);
		try {
			conn = DBconnect.getConn();
			String sql="select b.* from(SELECT * from item natural join price p where \"shopId\" = ? and date>=(select max(date) from price p1 group by p1.id having p1.id=p.id))b LIMIT "+6+" OFFSET "+(page-1)*6 ;
			ps = conn.prepareStatement(sql);
			ps.setInt(1, shopId);
			System.out.println(sql.toString());
			rs = ps.executeQuery();
			while(rs.next())
			{
				Item u=new Item();
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
				items.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return items;
	}
    
	public int shopItemcount(int shopId)
	{
		int num=0;
		ResultSet rs=null;
		PreparedStatement ps=null;
		Connection conn=null;
		try {
			conn = DBconnect.getConn();
			String sql="select count(*) from item where \"shopId\" = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, shopId);
			rs = ps.executeQuery();
			if(rs.next())
				num=rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}

	
	
	
	public boolean updateshop(Shop shop)
	{
		
		try {
			Connection conn = DBconnect.getConn();
			String sql = "UPDATE shop SET \"name\"=?,info=?,\"logo\"=? WHERE \"id\"=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,shop.getName());
			ps.setString(2, shop.getInfo());
			ps.setString(3, shop.getLogo());
			ps.setInt(4, shop.getId());
			
			int x  = ps.executeUpdate();
			ps.close();
			conn.close();
			if(x > 0)
				return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;

	} 
	
	public boolean addshop(Shop shop)
	{
		
		try {
			Connection conn = DBconnect.getConn();
			String sql = "insert into shop values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, shop.getId());
			ps.setString(2,shop.getName());
			ps.setInt(3, shop.getTypeId());
			ps.setInt(4, shop.getOwnerId());
			ps.setString(5,shop.getInfo());
			ps.setString(6,shop.getLogo());
			Date d = new Date(System.currentTimeMillis());
			ps.setDate(7,d);
			
			int x  = ps.executeUpdate();
			ps.close();
			conn.close();
			if(x > 0)
				return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;

	} 
	
	public int getNewShopId(){
		int id=10000001;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select max(id) from shop";
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
	public int getuseridbyorderid(int orderid){
		int id = -1;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "SELECT \"memId\"" +
					" FROM \"order\"" +
					" WHERE \"id\" = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, orderid);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				id = rs.getInt("memId");
				return id;
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
