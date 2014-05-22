package com.shop.web;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.item.dao.Item;
import com.login.dao.userDao;
import com.shop.dao.Shop;
import com.shop.dao.ShopDao;
import com.shopcar.dao.ShopCarDao;

public class QueryShopItemsServlet extends HttpServlet {

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
		ShopDao showshops = new ShopDao();
		List<Item> itemlist = new ArrayList<Item>();
		String page1 = request.getParameter("page");//获得页面传递过来的page值赋值给page1
		int shopId=Integer.parseInt(request.getParameter("shopId"));
		int page =1;
		if(page1 != null){
			page = Integer.parseInt(page1);//如果页面传递过来的page值存在，则把该page1赋值给page变量
		}
		itemlist=showshops.queryShopItem(shopId, page);
		Shop shop=new Shop();
		shop=showshops.queryById(shopId);
		int itemcount=showshops.countShopItem(shopId);
		int maxpage = itemcount/5;//调用最大页数方法
		if(itemcount%5!=0)
			maxpage+=1;
		/*for(Iterator<Item> iterator=itemlist.iterator();iterator.hasNext();)
		{
			Item n=iterator.next();
			System.out.println("hahahha:"+n.getName());
		}*/
		ShopCarDao shopdao=new ShopCarDao();
		userDao udao=new userDao();		
		int userId;
		int size=0;
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
			size=shopdao.getSize(userId);
		}
		request.setAttribute("size", size);

		request.setAttribute("list", itemlist);
		request.setAttribute("count", itemcount);
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("shop", shop);
		System.out.println("shopId:"+shopId);
		System.out.println("itemcount:"+itemcount);
		System.out.println("page:"+page);
		request.getRequestDispatcher("shop.jsp").forward(request, response);//转发到页面
		out.flush();
		out.close();
	}

	

}
