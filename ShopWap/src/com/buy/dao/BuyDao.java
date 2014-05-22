package com.buy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.item.dao.Item;
import com.item.dao.ItemDao;
import com.jdbc.DBconnect;
import com.login.dao.User;
import com.order.dao.Order;
import com.pay.dao.Pay;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

public class BuyDao {
	public ArrayList<OrderInfo> QueryByUserId(int userId) {
		ArrayList<OrderInfo> orders=new ArrayList<OrderInfo>();
		try {
			Connection conn = DBconnect.getConn();
			String sql = " SELECT \"order\".\"id\",\"itemId\",\"memId\",\"waybillId\",\"order\".\"state\"," +
					"\"order\".\"date\",\"num\",\"order\".\"name\"," +
					"address,phone,price,item.name as iname,image" +
					" FROM \"order\",\"item\" WHERE \"order\".\"itemId\"=\"item\".\"id\" AND \"order\".\"memId\"=?" +
					"order by \"order\".\"date\" desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
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
				if(o.getState()!=-7)
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
	public ArrayList<OrderInfo> QueryBystate(int userId,int state) {
		ArrayList<OrderInfo> orders=new ArrayList<OrderInfo>();
		try {
			Connection conn = DBconnect.getConn();
			String sql= " SELECT \"order\".\"id\",\"itemId\",\"memId\",\"waybillId\",\"order\".\"state\"," +
				"\"order\".\"date\",\"num\",\"order\".\"name\"," +
				"address,phone,price,item.name as iname,image" +
				" FROM \"order\",\"item\" WHERE \"order\".\"itemId\"=\"item\".\"id\" AND \"order\".\"memId\"=?and \"order\".\"state\"=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, state);
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
	public ArrayList<Integer> queryNum(int userid)
	{

		ArrayList<Integer> numlist=new ArrayList<Integer>();
		for(int i=0; i<20; i++)
		{
			numlist.add(0);
		}
		try {
			Connection conn = DBconnect.getConn();
			String sql = "SELECT \"order\".\"state\" AS state,COUNT(*) AS num FROM \"order\",\"item\" " +
					"WHERE \"order\".\"itemId\"=\"item\".\"id\"" +
					"AND \"order\".\"memId\"=? GROUP BY  \"order\".\"state\" " +
					"ORDER BY \"order\".\"state\" ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int n;
				n=rs.getInt("num");
				numlist.add(rs.getInt("state")+7,n);
				System.out.println(rs.getInt("state")+":"+n);
			}
			
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return numlist;
	}
	public boolean setState(int state,int orderId) {
		try {
			Connection conn = DBconnect.getConn();
			String sql = "UPDATE \"order\" SET \"state\"=? WHERE \"id\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, state);
			ps.setInt(2, orderId);
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
	public OrderInfo QueryById(int userId,int orderId) {
		OrderInfo o = new OrderInfo();
		try {
			Connection conn = DBconnect.getConn();
			String sql = " SELECT \"order\".\"id\",\"itemId\",\"memId\",\"waybillId\",\"order\".\"state\"," +
					"\"order\".\"date\",\"num\",\"order\".\"name\"," +
					"address,phone,price,item.name as iname,image" +
					" FROM \"order\",\"item\" WHERE \"order\".\"itemId\"=\"item\".\"id\" AND \"order\".\"memId\"=? and\"order\".\"id\"=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, orderId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
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
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return o;
		
	}
	public int getNewId(){
		int id=10000001;
		try {
			Connection conn = DBconnect.getConn();
			String sql = "select max(id) from \"judge\"";
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
	public boolean judge(judgeInfo ju)
	{
		try {
			int id=getNewId();
			ju.setId(id);
			Connection connection=DBconnect.getConn();
			String sql = "insert into \"judge\" values(?,?,?,?,?,?)";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, ju.getTitle());
			ps.setDate(3, ju.getDate());
			ps.setString(4, ju.getXinde());
			ps.setInt(5, ju.getGrade());
			ps.setInt(6, ju.getOrderId());
			if(ps.executeUpdate()>0)
			{
				BuyDao buyDao=new BuyDao();
				if(buyDao.setState(4, ju.getOrderId()))
					return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean modifyAddr(User u,int num)
	{
		try {
			Connection connection=DBconnect.getConn();
			PreparedStatement ps = null;
			String sql = null;
			System.out.println("address1::"+u.getAddress1()+"  num:"+num);
			if(num==1||num==-1)
			{
				sql="update \"member\" set \"Name1\"=?,\"Address1\"=?,\"Phone1\"=? where \"id\"=?";
				ps=connection.prepareStatement(sql);
				ps.setString(1, u.getName1());
				ps.setString(2, u.getAddress1());
				ps.setString(3, u.getPhone1());
				ps.setInt(4, u.getId());
			}
			if(num==2||num==-2)
			{
				sql="update \"member\" set \"Name2\"=?,\"Address2\"=?,\"Phone2\"=? where \"id\"=?";
				ps=connection.prepareStatement(sql);
				ps.setString(1, u.getName1());
				ps.setString(2, u.getAddress1());
				ps.setString(3, u.getPhone1());
				ps.setInt(4, u.getId());
			}
			if(num==3||num==-3)
			{
				sql="update \"member\" set \"Name3\"=?,\"Address3\"=?,\"Phone3\"=? where \"id\"=?";
				ps=connection.prepareStatement(sql);
				ps.setString(1, u.getName1());
				ps.setString(2, u.getAddress1());
				ps.setString(3, u.getPhone1());
				ps.setInt(4, u.getId());
			}
			if(ps.executeUpdate()>0)
			{
					return true;
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public ArrayList<Pay> mymoney(int userId)
	{
		ArrayList<Pay> pays=new ArrayList<Pay>();
		try {
			Connection connection=DBconnect.getConn();
			String sql = "SELECT * from pay WHERE \"memId\"=? order by date desc";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rSet=ps.executeQuery();
			while(rSet.next())
			{
				Pay pay=new Pay();
				pay.setId(rSet.getInt("id"));
				pay.setMemId(userId);
				pay.setCount(rSet.getDouble("count"));
				pay.setDate(rSet.getTimestamp("date"));
				pay.setRemark(rSet.getString("remark"));
				pays.add(pay);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pays;
	}
}
