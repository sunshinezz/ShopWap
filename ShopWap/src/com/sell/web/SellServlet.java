package com.sell.web;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.item.dao.Item;
import com.login.dao.userDao;
import com.pay.dao.PayDao;
import com.search.dao.SearchDao;
import com.sell.dao.Sell;
import com.sell.dao.SellDao;

public class SellServlet extends HttpServlet {


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
		
		
		String account = null;
		if(request.getCookies() != null){					// 如果Cookie不为空
			for(Cookie cookie : request.getCookies()){		// 遍历Cookie
				if(cookie.getName().equals("account"))	// 如果Cookie名为name
					account = cookie.getValue();		// 保存account内容
				//System.out.println("coming:"+account);
			}
		}
		if(account!=null)
		{
			userDao uDao=new userDao();
			com.login.dao.User user=new com.login.dao.User();
			user=uDao.queryByAccount(account);
			
			String action = request.getParameter("action");
			SellDao dao=new SellDao();
			
			ArrayList<Sell> orderlist=new ArrayList<Sell>();
			ArrayList<Integer> numlist=new ArrayList<Integer>();
			//itemlist=dao.queryByKey(key);
			if(action.equals("paying"))
			{
				orderlist=dao.queryByState(0,user.getId());
				numlist = dao.queryNum(user.getId());
				request.setAttribute("numlist", numlist);
				
				request.setAttribute("orderlist", orderlist);				
				request.setAttribute("size", orderlist.size());
				request.setAttribute("state","待付款");
				request.getRequestDispatcher("paying.jsp").forward(request,
						response);
			}

			else if(action.equals("deliver"))
			{
				orderlist=dao.queryByState(1,user.getId());
				numlist = dao.queryNum(user.getId());
				request.setAttribute("numlist", numlist);
				
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("size", orderlist.size());
				request.setAttribute("state","待发货");
				request.getRequestDispatcher("deliver.jsp").forward(request,
						response);
			}
			else if(action.equals("myw"))
			{
				PayDao paydao = new PayDao();
				double balance = paydao.getBalance(user.getId());
				orderlist=dao.queryBymemid(user.getId());
				numlist = dao.queryNum(user.getId());
				request.setAttribute("numlist", numlist);
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("size", orderlist.size());
				request.setAttribute("balance", balance);
				request.setAttribute("state","全部订单");
				request.getRequestDispatcher("myw.jsp").forward(request,
						response);
			}
			else if(action.equals("recieve"))
			{
				orderlist=dao.queryByState(2,user.getId());
				numlist = dao.queryNum(user.getId());
				request.setAttribute("numlist", numlist);
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("size", orderlist.size());
				request.setAttribute("state","待确认收货");
				request.getRequestDispatcher("recieve.jsp").forward(request,
						response);
			}
			else if(action.equals("judge"))
			{
				orderlist=dao.queryByState(3,user.getId());
				numlist = dao.queryNum(user.getId());
				request.setAttribute("numlist", numlist);
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("size", orderlist.size());
				request.setAttribute("state","待评价");
				request.getRequestDispatcher("judge.jsp").forward(request,
						response);
			}
			else if(action.equals("finish"))
			{
				orderlist=dao.queryByState(4,user.getId());
				numlist = dao.queryNum(user.getId());
				request.setAttribute("numlist", numlist);
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("size", orderlist.size());
				request.setAttribute("state","已完成");
				request.getRequestDispatcher("finish.jsp").forward(request,
						response);
			}
			else if(action.equals("myrepair"))
			{
				orderlist=dao.queryByState(-2,user.getId());
				numlist = dao.queryNum(user.getId());
				request.setAttribute("numlist", numlist);
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("size", orderlist.size());
				request.setAttribute("state","退款");
				request.getRequestDispatcher("myrepair.jsp").forward(request,
						response);
			}
			else if(action.equals("myrefund"))
			{
				orderlist=dao.queryByState(-1,user.getId());
				numlist = dao.queryNum(user.getId());
				request.setAttribute("numlist", numlist);
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("size", orderlist.size());
				request.setAttribute("state","已关闭");
				request.getRequestDispatcher("myrefund.jsp").forward(request,
						response);
			}
			else
			{
				request.getRequestDispatcher("error.jsp").forward(request,
						response);
			}
			
		}
		else {
			request.setAttribute("loginFirst", "请先登录");
			request.getRequestDispatcher("../login/login.jsp").forward(request,
					response);
			//response.sendRedirect("/shop/login/login.jsp");
		}
		
		

	}

}
