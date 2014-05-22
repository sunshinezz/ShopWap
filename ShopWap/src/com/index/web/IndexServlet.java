package com.index.web;
import com.index.dao.IndexDao;
import com.login.dao.userDao;
import com.notice.dao.*;
import com.shopcar.dao.ShopCarDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

           this.doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
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
		
		ArrayList<Notice> notice = new ArrayList<Notice>();
		IndexDao dao = new IndexDao();
		notice = dao.getNoticeDao().QueryAll();
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("index.jsp").forward(request,
				response);
	}


}
