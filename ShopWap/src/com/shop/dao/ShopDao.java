package com.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.item.dao.Item;
import com.jdbc.DBconnect;
import com.sun.swing.internal.plaf.basic.resources.basic;

public class ShopDao {
	public Shop queryById(int id) {
		Shop shop=null;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select * from shop where id=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				shop=new Shop();
				shop.setId(id);
				shop.setName(rs.getString("name"));
				shop.setTypeId(rs.getInt("typeId"));
				shop.setOwnerId(rs.getInt("ownerId"));
				shop.setInfo(rs.getString("info"));
				shop.setLogo(rs.getString("logo"));
				shop.setCreateDate(rs.getDate("createDate"));
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception ee) {
			System.out.print(ee.getMessage());
		}
		return shop;
	}
	//返回店铺个数
	public List<Shop> showByPage(int page)
	{
		ResultSet rs = null;
		PreparedStatement pstmt =null;
		Connection conn = null;
		List<Shop> list = new ArrayList<Shop>();
		try {
			conn = DBconnect.getConn();
			String sql = "select * from shop order by id desc limit "+5+" offset "+(page-1)*5;//分页查询的SQL语句，每页显示5条记录
			pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1, page);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Shop shop = new Shop();
				shop.setId(rs.getInt("id"));
				shop.setName(rs.getString("name"));
				shop.setTypeId(rs.getInt("typeId"));
				shop.setOwnerId(rs.getInt("ownerId"));
				shop.setInfo(rs.getString("info"));
				shop.setLogo(rs.getString("logo"));
				shop.setCreateDate(rs.getDate("createDate"));
				list.add(shop);//把CarsVo对象放入集合中
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public int countShop()
	{
		int count=0;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select * from shop  ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				count++;
				}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;

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
			String sql="select b.* from(SELECT * from item natural join price p where \"shopId\" = ? and date>=(select max(date) from price p1 group by p1.id having p1.id=p.id))b LIMIT "+8+" OFFSET "+(page-1)*8 ;
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
				System.out.println("item:"+u.getName());
				//System.out.println("huihuihuihui");
				items.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return items;
	}
	public int countShopItem(int shopId)
	{
		int count=0;
		try {
			Connection conn = DBconnect.getConn();
			String sql = " select * from item where \"shopId\"=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, shopId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				count++;
				}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;

	} 
	
}
