package com.search.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.item.dao.Item;
import com.jdbc.DBconnect;



public class SearchDao {
	public ArrayList<Item> queryByKey(String key,int page){
		ArrayList<Item> result=new ArrayList<Item>();
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select id,name,\"typeId\",\"shopId\",price,image,saledate from item natural join price p " +
					"where name like ? and date>=(select max(date) from price p1 group by p1.id having p1.id=p.id) LIMIT "+8+" OFFSET "+(page-1)*8; //选择最新价格"
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+key+"%");
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
public int searchCount(String key)
{
	int num=0;
	try {
		Connection conn = DBconnect.getConn();
		String sql = "select count(*) from item where name like ?"; 
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,"%"+key+"%");
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			num=rs.getInt(1);
		}
		rs.close();
		ps.close();
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return num;
}
}
