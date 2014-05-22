package com.shop.web;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.userDao;
import com.shop.dao.Shop;
import com.shop.dao.ShopDao;
import com.shopcar.dao.ShopCarDao;

public class showShopServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		this.doPost(request, response);//调用doPost方法
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		ShopCarDao shopdao=new ShopCarDao();
		userDao udao=new userDao();
		
		int userId;
		int csize=0;
		String account=null;
		
		if(request.getCookies() != null){				
			for(Cookie cookie : request.getCookies()){		
				if(cookie.getName().equals("account"))	
					account = cookie.getValue();		
			}
		}
		if(account!=null)
		{
			userId=udao.queryByAccount(account).getId();
			csize=shopdao.getSize(userId);
		}
		request.setAttribute("csize", csize);
		
		ShopDao showshops = new ShopDao();
		List<Shop> list = new ArrayList<Shop>();
		String page1 = request.getParameter("page");//获得页面传递过来的page值赋值给page1
		int page =1;
		if(page1 != null){
			page = Integer.parseInt(page1);//如果页面传递过来的page值存在，则把该page1赋值给page变量
		}
		list = showshops.showByPage(page);//调用查询方法
		int shopcount=showshops.countShop();
		int maxpage = shopcount/5;//调用最大页数方法
		if(shopcount%5!=0)
			maxpage+=1;
		request.setAttribute("list", list);
		request.setAttribute("count", shopcount);
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		System.out.println("maxpage:"+maxpage);
		System.out.println("count:"+shopcount);
		System.out.println("page:"+page);
		request.getRequestDispatcher("showShop.jsp").forward(request, response);//转发到页面
		out.flush();
		out.close();
	}

	

}
