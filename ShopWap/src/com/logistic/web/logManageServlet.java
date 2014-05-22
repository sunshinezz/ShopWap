package com.logistic.web;


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

import com.logistic.dao.LogList;
import com.logistic.dao.Logistic;
import com.logistic.dao.LogisticDao;
import com.logistic.dao.WayBill;

public class logManageServlet extends HttpServlet {
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
		String action=request.getParameter("action");
		int fnum=0;
		int unum=0;
		LogisticDao ldao=new LogisticDao();
		if(action.equals("welcome")){
			fnum=ldao.getFinishedNum();
			unum=ldao.getUnfinishedNum();
			request.setAttribute("fnum", fnum);
			request.setAttribute("unum", unum);
			request.getRequestDispatcher(
					"mylogistic.jsp")
					.forward(request, response);
		}
		else if(action.equals("finished"))
		{
			ArrayList<LogList> loglist=new ArrayList<LogList>();
			loglist=ldao.getFinishedList();
			request.setAttribute("loglist", loglist);
			request.getRequestDispatcher(
					"finishedlist.jsp")
					.forward(request, response);
		}
		else if(action.equals("unfinished"))
		{
			ArrayList<LogList> loglist=new ArrayList<LogList>();
			loglist=ldao.getUnfinishedList();
			request.setAttribute("loglist", loglist);
			request.getRequestDispatcher(
					"unfinishedlist.jsp")
					.forward(request, response);
		}
		else if(action.equals("finishedshow"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			ArrayList<WayBill> wlist=new ArrayList<WayBill>();
			wlist=ldao.getWayBillById(id);
			request.setAttribute("wlist", wlist);
			request.setAttribute("wid", id);
			request.getRequestDispatcher(
					"finishedshow.jsp")
					.forward(request, response);
		}
		else if(action.equals("unfinishedshow"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			ArrayList<WayBill> wlist=new ArrayList<WayBill>();
			wlist=ldao.getWayBillById(id);
			request.setAttribute("wlist", wlist);
			request.setAttribute("wid", id);
			request.getRequestDispatcher(
					"unfinishedshow.jsp")
					.forward(request, response);
		}
		else if(action.equals("update"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			int state=Integer.parseInt(request.getParameter("state"));
			String content=request.getParameter("content");
			
			Timestamp currtime=null;
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				currtime=new Timestamp(sdf.parse(sdf.format(new Date())).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			WayBill w=new WayBill();
			w.setId(id);
			w.setState(state);
			w.setContent(content);
			w.setDate(currtime);
			ldao.insert(w);
			if(state==1)
			{
				response.sendRedirect("logManage.do?action=finishedshow&id="+id);
				return;
			}
			else
			{
				response.sendRedirect("logManage.do?action=unfinishedshow&id="+id);
				return;
			}
		}
		out.flush();
		out.close();
	}
}
