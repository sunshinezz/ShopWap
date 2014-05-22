package com.like.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.crypto.spec.PSource;

import com.buy.dao.OrderInfo;
import com.item.dao.Item;
import com.item.dao.ItemDao;
import com.jdbc.DBconnect;
import com.sun.org.apache.xml.internal.dtm.ref.DTMDefaultBaseIterators.ParentIterator;

public class LikeDao {
	public ArrayList<Like> queryById(int userId)//根据用户id返回其所关注的商品信息
	{
		ArrayList<Like> likeItems=new ArrayList<Like>();
	try {
		Connection conn = DBconnect.getConn();
		String sql="select \"like\".\"id\", \"itemId\",price,\"typeId\",\"memId\",item.image,item.info,\"like\".\"date\",item.\"name\",item.\"shopId\"from \"like\",price p,item "
		+"WHERE \"like\".\"itemId\"=p.\"id\" AND \"like\".\"itemId\"=item.\"id\"AND \"like\".\"memId\" =? " +
		"and p.date>=(select max(p1.date) from price p1 group by p1.id having p1.id=p.id)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, userId);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Like likeItem=new Like();
			likeItem.setId(rs.getInt("id"));
			likeItem.setDate(rs.getDate("date"));
			likeItem.setItemId(rs.getInt("itemId"));
			likeItem.setItemImage(rs.getString("image"));
			likeItem.setItemInfo(rs.getString("info"));
			likeItem.setItemname(rs.getString("name"));
			likeItem.setItemprice(rs.getDouble("price"));
			likeItem.setMemId(rs.getInt("memId"));
			likeItem.setShopId(rs.getInt("shopId"));
			likeItem.setTypeId(rs.getInt("typeId"));
			likeItems.add(likeItem);
		}
		rs.close();
		ps.close();
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return likeItems;
	}
	public ArrayList<Item> queryByLike(String id,ArrayList<Like> like){
		ArrayList<Item> result=new ArrayList<Item>();
		try {
			
			Connection conn = DBconnect.getConn();
			String sql = "select id,name,\"typeId\",\"shopId\",price,info,image,saledate from item natural join price p " +
					"where item.\"typeId\" = ? and date>=(select max(date) from price p1 group by p1.id having p1.id=p.id) "; //选择最新价格
			PreparedStatement ps = conn.prepareStatement(sql);
			int id1=Integer.parseInt(id);
			ps.setInt(1, id1);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int count=0,icount=0;
				Item u = new Item();
				u.setId(rs.getString("id"));
				u.setName(rs.getString("name"));	
				u.setTypeId(rs.getInt("typeId"));
				u.setShopId(rs.getInt("shopId"));
				u.setPrice(rs.getDouble("price"));
				u.setInfo(rs.getString("info"));
				u.setImg(rs.getString("image"));
				u.setSaledate(rs.getDate("saledate"));
				Iterator<Like> iterator=like.iterator();
				for(;iterator.hasNext();)
				{
					icount++;
					Like like2=iterator.next();
					if(!((like2.getItemId()+"").equals(u.getId())))
					{
						count++;
					}
				}
				if(count==icount)
				{
					result.add(u);
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
	public boolean cancelFollow(int id)
	{
		boolean can=false;
		try
		{
			Connection conn=DBconnect.getConn();
			String sql="DELETE from \"like\" where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			can=true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return can;
	}
	public int getNewId(){
		int id=10000001;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select max(id) from \"like\"";
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
	public boolean addLike(Like like){
		boolean add=false;
		try {
			Connection connection=DBconnect.getConn();
			String sql = "insert into \"like\" values(?,?,?,?)";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, like.getMemId());
			ps.setInt(2, like.getItemId());
			ps.setDate(3,like.getDate());
			ps.setInt(4,like.getId());
			if(ps.executeUpdate()>0)
			{
				add=true;
				ps.close();
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return add;
		
	}

}
