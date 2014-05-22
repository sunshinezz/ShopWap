package com.item.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jdbc.DBconnect;
import com.notice.dao.Notice;


public class ItemDao {
	public Item queryById(String id){
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
	public ArrayList<Judge> QueryJudgeById(int id){

		ArrayList<Judge> judge = new ArrayList<Judge>();
		
		
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select judge.id,judge.title,judge.date,judge.xinde,judge.grade,\"member\".account," +
					"\"order\".\"date\" as bdate " +
					"from (judge join \"order\" on judge.\"orderId\"=\"order\".id ) " +
					"join member on \"order\".\"memId\"=\"member\".\"id\"" +
							"where \"order\".\"itemId\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Judge j = new Judge();
				j.setId(rs.getInt("id"));
				j.setTitle(rs.getString("title"));
				j.setDate(rs.getDate("date"));
				j.setXinde(rs.getString("xinde"));
				j.setGrade(rs.getInt("grade"));
				j.setAccount(rs.getString("account"));
				j.setBdate(rs.getTimestamp("bdate"));
				judge.add(j);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return judge;
	}
}
