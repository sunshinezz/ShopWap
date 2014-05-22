package com.top10.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.item.dao.Item;
import com.item.dao.ItemDao;
import com.login.dao.userDao;
import com.shopcar.dao.ShopCarDao;
import com.top10.dao.Top;
import com.top10.dao.TopDao;

public class topServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
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
		
		if(action.equals("top10"))
		{
			ArrayList<Top> toplist=new ArrayList<Top>();
			TopDao topdao = new TopDao();
			toplist = topdao.queryTop10(4);
			ItemDao itemdao = new ItemDao();
			 for(Top n: toplist){
				 Item item = new Item();
				 item = itemdao.queryById(n.getId()+"");
				 n.setItem(item);
			 }
		     request.setAttribute("toplist", toplist);
			 request.getRequestDispatcher("top10.jsp").forward(request,
						response);	 
		}
		else if(action.equals("like10"))
		{
			ArrayList<Top> toplist=new ArrayList<Top>();
			TopDao topdao = new TopDao();
			toplist = topdao.queryLike10();
			ItemDao itemdao = new ItemDao();
			 for(Top n: toplist){
				 Item item = new Item();
				 item = itemdao.queryById(n.getId()+"");
				 n.setItem(item);
			 }
		     request.setAttribute("toplist", toplist);
			 request.getRequestDispatcher("like10.jsp").forward(request,
						response);
		}
	}

}
