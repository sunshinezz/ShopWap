package com.search.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.item.dao.Item;
import com.login.dao.userDao;
import com.search.dao.SearchDao;
import com.shopcar.dao.ShopCarDao;

public class SearchServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
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
		
		String okey1=request.getParameter("key");
		String key = URLDecoder.decode(request.getParameter("key"),"utf-8");
		
		String page1 = request.getParameter("page");//获得页面传递过来的page值赋值给page1
		int page =1;
		if(page1 != null){
			page = Integer.parseInt(page1);//如果页面传递过来的page值存在，则把该page1赋值给page变量
		}
		
		SearchDao dao=new SearchDao();
		ArrayList<Item> itemlist=new ArrayList<Item>();
		itemlist=dao.queryByKey(key,page);
		int searchCount=dao.searchCount(key);
		int maxpage = searchCount/8;//调用最大页数方法
		if(searchCount %8 !=0)
			maxpage+=1;
		
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		
		request.setAttribute("itemlist", itemlist);
		request.setAttribute("size", searchCount);
		request.setAttribute("okey", key);
		request.setAttribute("okey1",okey1);
		request.getRequestDispatcher("search.jsp").forward(request,
				response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		this.doGet(request, response);
	}

}
