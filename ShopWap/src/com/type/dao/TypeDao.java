package com.type.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.item.dao.Item;
import com.jdbc.DBconnect;



public class TypeDao {
	public ArrayList<Item> queryById(String id){
		ArrayList<Item> result=new ArrayList<Item>();
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select id,name,\"typeId\",\"shopId\",price,image,saledate from item natural join price p " +
					"where item.\"typeId\" = ? and date>=(select max(date) from price p1 group by p1.id having p1.id=p.id) "; //选择最新价格
			PreparedStatement ps = conn.prepareStatement(sql);
			int id1=Integer.parseInt(id);
			ps.setInt(1, id1);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Item u = new Item();
				u.setId(rs.getString("id"));
				u.setName(rs.getString("name"));	
				u.setTypeId(rs.getInt("typeId"));
				u.setShopId(rs.getInt("shopId"));
				u.setPrice(rs.getDouble("price"));
				u.setImg(rs.getString("image"));
				u.setSaledate(rs.getDate("saledate"));
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
	public String getTypeName(int typeId){
		String u = null;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select type.name from type where type.id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, typeId);
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
	
}
