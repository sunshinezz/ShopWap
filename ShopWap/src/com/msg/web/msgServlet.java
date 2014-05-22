package com.msg.web;


import java.io.IOException;


import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.dao.AdminDao;
import com.buy.dao.BuyDao;
import com.buy.dao.OrderInfo;
import com.item.dao.Item;
import com.login.dao.userDao;
import com.logistic.dao.LogList;
import com.logistic.dao.Logistic;
import com.logistic.dao.LogisticDao;
import com.logistic.dao.WayBill;
import com.msg.dao.Msg;
import com.msg.dao.MsgDao;
import com.notice.dao.Notice;
import com.notice.dao.NoticeDao;
import com.pay.dao.Pay;
import com.pay.dao.PayDao;
import com.shopcar.dao.ShopCarDao;

public class msgServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html");
		this.doPost(request, response);
		PrintWriter out = response.getWriter();
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
		
		String action=request.getParameter("action");
		
		
	    if(action.equals("buy"))
		{
			MsgDao mdao=new MsgDao();
			ArrayList<Msg> mlist=new ArrayList<Msg>();
			mlist=mdao.QueryAll();
			request.setAttribute("size", mlist.size());
			request.setAttribute("mlist", mlist);
			request.getRequestDispatcher(
					"/buy/mymsg.jsp")
					.forward(request, response);
		}
	    else if(action.equals("sell"))
	    {
	    	MsgDao mdao=new MsgDao();
			ArrayList<Msg> mlist=new ArrayList<Msg>();
			mlist=mdao.QueryAll();
			request.setAttribute("mlist", mlist);
			request.getRequestDispatcher(
					"/sell/mymsg.jsp")
					.forward(request, response);
	    }
		out.flush();
		out.close();
	}
}
