package com.pay.web;

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


import com.login.dao.User;
import com.login.dao.userDao;
import com.order.dao.Order;
import com.order.dao.OrderDao;
import com.pay.dao.Pay;
import com.pay.dao.PayDao;
import com.shopcar.dao.Address;
import com.shopcar.dao.ShopCar;
import com.shopcar.dao.ShopCarDao;

public class payServlet extends HttpServlet {


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
		PayDao pdao=new PayDao();
		userDao udao=new userDao();
		OrderDao rdao=new OrderDao();
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
		
		if(action.equals("subpay"))
		{
			int orderId= Integer.parseInt(request.getParameter("orderid"));
			double totalprice= Double.parseDouble(request.getParameter("totalprice"));	
			request.setAttribute("size", size);
			request.setAttribute("orderid", orderId);
			request.setAttribute("count", totalprice);
			request.getRequestDispatcher("subpay.jsp").forward(request,
					response);
			return;
		}
		if(action.equals("pay"))
		{
			int orderId= Integer.parseInt(request.getParameter("orderid"));
			double count= Double.parseDouble(request.getParameter("count"));
			double balance=pdao.getBalance(userId);
			if(count>balance)
			{
				request.setAttribute("state", 0);
				request.setAttribute("size", size);
				request.setAttribute("orderid", orderId);
				request.setAttribute("count", count);
				request.setAttribute("balance", balance);
				request.getRequestDispatcher("payresult.jsp").forward(request,
						response);
				return;
				
			}
			Pay pay=new Pay();
			pay.setMemId(userId);
			pay.setCount(-count);
			pay.setDate(currtime);
			pay.setRemark("∂©µ•±‡∫≈£∫"+orderId);
			pdao.insert(pay);
			rdao.setState(1, orderId);
			request.setAttribute("state", 1);
			request.setAttribute("size", size);
			request.setAttribute("orderid", orderId);
			request.setAttribute("count", count);
			balance=pdao.getBalance(userId);
			request.setAttribute("balance", balance);
			request.setAttribute("pId", pdao.getNewId()-1);
			request.setAttribute("userId", userId);
			request.setAttribute("currtime", currtime);
			request.setAttribute("remark", pay.getRemark());
			request.getRequestDispatcher("payresult.jsp").forward(request,
					response);
			return;
		}
		if(action.equals("torecharge"))
		{
			double balance=pdao.getBalance(userId);
			User u1=new User();
			u1=udao.queryById(userId);
			request.setAttribute("balance", balance);
			request.setAttribute("user", u1);
			request.setAttribute("size", size);
			request.getRequestDispatcher("recharge.jsp").forward(request,
					response);
			return;
		}
		if(action.equals("recharge"))
		{
			
			double count= Double.parseDouble(request.getParameter("count"));
			User u1=new User();
			u1=udao.queryById(userId);
			
			
			Pay pay=new Pay();
			pay.setMemId(userId);
			pay.setCount(count);
			pay.setDate(currtime);
			pay.setRemark("≥‰÷µ");
			pdao.insert(pay);
			double balance=pdao.getBalance(userId);
			request.setAttribute("balance", balance);
			request.setAttribute("user", u1);
			request.setAttribute("size", size);
			request.setAttribute("pId", pdao.getNewId()-1);
			request.setAttribute("userId", userId);
			request.setAttribute("count", count);
			request.setAttribute("currtime", currtime);
			request.setAttribute("remark", pay.getRemark());
			request.getRequestDispatcher("rechargeresult.jsp").forward(request,
					response);
			return;
		}
		
		
	}

}
