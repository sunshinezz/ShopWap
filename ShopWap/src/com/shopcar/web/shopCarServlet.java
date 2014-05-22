package com.shopcar.web;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.login.dao.userDao;
import com.order.dao.Order;
import com.order.dao.OrderDao;
import com.shopcar.dao.Address;
import com.shopcar.dao.ShopCar;
import com.shopcar.dao.ShopCarDao;

public class shopCarServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		this.doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		ShopCarDao shopdao=new ShopCarDao();
		userDao udao=new userDao();
		String account = null;
		int userId;
		int size;
		
		if(request.getCookies() != null){				
			for(Cookie cookie : request.getCookies()){		
				if(cookie.getName().equals("account"))	
					account = cookie.getValue();		
			}
		}
		if(account==null)
		{
			response.sendRedirect("../login/login.jsp");
			return;
		}
		
		userId=udao.queryByAccount(account).getId();
		size=shopdao.getSize(userId);
		
		Timestamp currtime=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			currtime=new Timestamp(sdf.parse(sdf.format(new Date())).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		if(action.equals("add"))
		{
			int itemId= Integer.parseInt(request.getParameter("itemid"));
			int buynum= Integer.parseInt(request.getParameter("buy-num"));	
			ShopCar sc=new ShopCar();
			sc.setItemId(itemId);
			sc.setNum(buynum);
			sc.setDate(currtime);
			sc.setUserId(userId);
			shopdao.insert(sc);
			response.sendRedirect("../items/items.do?id="+itemId);
			return;
		}
		if(action.equals("show"))
		{
			ArrayList <ShopCar> shopcarlist=new ArrayList<ShopCar>();
			shopcarlist=shopdao.queryByMemId(userId);
			double totalPrice = 0;
			for(int i = 0;i < shopcarlist.size();i++){
				totalPrice += shopcarlist.get(i).getPrice();
			}
			int productNum = shopcarlist.size();
			request.setAttribute("productNum", productNum);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("shopcarlist", shopcarlist);
			request.setAttribute("size", size);
			request.getRequestDispatcher("shopcar.jsp").forward(request,
					response);
			return;
		}
		if(action.equals("delete"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			shopdao.delete(id);
			ArrayList <ShopCar> shopcarlist=new ArrayList<ShopCar>();
			shopcarlist=shopdao.queryByMemId(userId);
			double totalPrice = 0;
			for(int i = 0;i < shopcarlist.size();i++){
				totalPrice += shopcarlist.get(i).getPrice();
			}
			int productNum = shopcarlist.size();
			request.setAttribute("productNum", productNum);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("shopcarlist", shopcarlist);
			size=shopdao.getSize(userId);
			request.setAttribute("size", size);
			request.getRequestDispatcher("shopcar.jsp").forward(request,
					response);
			return;
		}
		if(action.equals("submit"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			ShopCar sc=new ShopCar();
			sc=shopdao.queryById(id);
			ArrayList<Address> address=new ArrayList<Address>();
			address=shopdao.getAddress(userId);
			request.setAttribute("item", sc);
			request.setAttribute("addresslist",address);
			request.setAttribute("size", size);
			request.getRequestDispatcher("suborder.jsp").forward(request,
					response);
			return;
		}
		if(action.equals("confirm"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			ShopCar sc=new ShopCar();
			sc=shopdao.queryById(id);
			Address ad=new Address();

			int addressId=Integer.parseInt(request.getParameter("addid"));
			if(addressId==3)
			{
				String name=request.getParameter("name");
				String address=request.getParameter("address");
				String phone=request.getParameter("phone");
				ad.setName(name);
				ad.setAddress(address);
				ad.setPhone(phone);
			}
			else
			{
				ArrayList<Address> addlist=new ArrayList<Address>();
				addlist=shopdao.getAddress(userId);
				ad=addlist.get(addressId);
			}
			
			Order or=new Order();
			OrderDao ordao=new OrderDao();
			or.setItemId(sc.getItemId());
			or.setMemId(sc.getUserId());
			or.setState(0);
			or.setDate(currtime);
			or.setNum(sc.getNum());
			or.setName(ad.getName());
			or.setAddress(ad.getAddress());
			or.setPhone(ad.getPhone());
			or.setPrice(sc.getTotalprice());
			ordao.insert(or);
			
			request.setAttribute("size", size);
			request.setAttribute("item", sc);
			request.setAttribute("order", or);
			request.setAttribute("orderid", ordao.getNewId()-1);
			request.getRequestDispatcher("subsuccess.jsp").forward(request,
					response);
			return;
		}
		
	}

}
