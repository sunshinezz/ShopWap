package com.admin.web;


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

public class adminManageServlet extends HttpServlet {
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
		AdminDao adao=new AdminDao();
		if(action.equals("welcome")){
			int unverifynum=0;
			int unmaintainnum=0;
			unverifynum=adao.getUnverifyNum();
			unmaintainnum=adao.getUnMaintainNum();
			request.setAttribute("unverify", unverifynum);
			request.setAttribute("unmaintain", unmaintainnum);
			request.getRequestDispatcher(
					"admin.jsp")
					.forward(request, response);
		}
		else if(action.equals("unverify"))
		{
			ArrayList<Item> ilist=new ArrayList<Item>();
			ilist=adao.getUnverifyList();
			request.setAttribute("ilist", ilist);
			request.getRequestDispatcher(
					"verifylist.jsp")
					.forward(request, response);
		}
		else if(action.equals("verify"))
		{
			String id;
			Item item=new Item();
			id=request.getParameter("id");
			item=adao.queryItemById(id);
			request.setAttribute("item", item);
			request.setAttribute("type", adao.getTypeName(Integer.parseInt(id)));
			request.getRequestDispatcher(
					"verify.jsp")
					.forward(request, response);
		}
		else if(action.equals("yes"))
		{
			int id;
			id=Integer.parseInt(request.getParameter("id"));
			adao.setState(1, id);
			response.sendRedirect("adminManage.do?action=unverify");
		}
		else if(action.equals("no"))
		{
			int id;
			id=Integer.parseInt(request.getParameter("id"));
			adao.setState(-1, id);
			response.sendRedirect("adminManage.do?action=unverify");
		}
		else if(action.equals("item"))
		{
			ArrayList<Item> ilist=new ArrayList<Item>();
			ilist=adao.getNormalList();
			request.setAttribute("ilist", ilist);
			request.getRequestDispatcher(
					"itemlist.jsp")
					.forward(request, response);
		}
		else if(action.equals("lock"))
		{
			int id;
			id=Integer.parseInt(request.getParameter("id"));
			adao.setState(-1, id);
			response.sendRedirect("adminManage.do?action=item");
		}
		else if(action.equals("unmain"))
		{
			ArrayList<OrderInfo> mlist=new ArrayList<OrderInfo>();
			mlist=adao.QueryMaintain();
			request.setAttribute("mlist", mlist);
			request.getRequestDispatcher(
					"mainlist.jsp")
					.forward(request, response);
		}
		else if(action.equals("myes"))
		{
			int id;
			int memid;
			id=Integer.parseInt(request.getParameter("id"));
			memid=Integer.parseInt(request.getParameter("mid"));
			
			BuyDao bdao=new BuyDao();
			OrderInfo orinfo=bdao.QueryById(memid, id);
			adao.setOrderState(-3, id);
			
			Timestamp currtime=null;
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				currtime=new Timestamp(sdf.parse(sdf.format(new Date())).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			PayDao pdao=new PayDao();
			Pay pay=new Pay();
			pay.setMemId(memid);
			pay.setCount(orinfo.getPrice());
			pay.setRemark("维权成功，退款"+orinfo.getPrice()+"元");
			pay.setDate(currtime);
			pdao.insert(pay);
			
			response.sendRedirect("adminManage.do?action=unmain");
		}
		else if(action.equals("mno"))
		{
			int id;
			int memid;
			id=Integer.parseInt(request.getParameter("id"));
			memid=Integer.parseInt(request.getParameter("mid"));
			adao.setOrderState(-6, id);
			
			response.sendRedirect("adminManage.do?action=unmain");
		}
		else if(action.equals("notice"))
		{
			NoticeDao ndao=new NoticeDao();
			ArrayList<Notice> nlist=new ArrayList<Notice>();
			nlist=ndao.QueryAll();
			request.setAttribute("nlist", nlist);
			request.setAttribute("noticesize", nlist.size());
			request.getRequestDispatcher(
					"noticelist.jsp")
					.forward(request, response);
		}
		else if(action.equals("shownotice"))
		{
			String id;
			id=request.getParameter("id");
			NoticeDao ndao=new NoticeDao();
			Notice notice=new Notice();
			notice=ndao.QueryById(id);
			request.setAttribute("notice", notice);		
			request.getRequestDispatcher(
					"shownotice.jsp")
					.forward(request, response);
		}
		else if(action.equals("toupdatenotice"))
		{
			String id;
			id=request.getParameter("id");
			NoticeDao ndao=new NoticeDao();
			Notice notice=new Notice();
			notice=ndao.QueryById(id);
			request.setAttribute("notice", notice);		
			request.getRequestDispatcher(
					"updatenotice.jsp")
					.forward(request, response);
		}
		else if(action.equals("updatenotice"))
		{
			String id;
			String title;
			String content;
			String time;
			id=request.getParameter("id");
			title=request.getParameter("title");
			content=request.getParameter("content");
			time=request.getParameter("time");
			
			
			NoticeDao ndao=new NoticeDao();
			Notice notice=new Notice();
			notice.setId(id);
			notice.setTitle(title);
			notice.setContent(content);
			ndao.update(notice);
			notice=ndao.QueryById(id);
			request.setAttribute("msg", "更新成功！");
			request.setAttribute("notice", notice);
			request.getRequestDispatcher(
					"updatenotice.jsp")
					.forward(request, response);
		}
		else if(action.equals("addnotice"))
		{
			String title;
			String content;
			Date date=new Date();
			title=request.getParameter("title");
			content=request.getParameter("content");
			
			
			NoticeDao ndao=new NoticeDao();
			Notice notice=new Notice();
			notice.setTitle(title);
			notice.setContent(content);
			notice.setCreatedate(new java.sql.Date(date.getTime()));
			
			ndao.insert(notice);

			response.sendRedirect("adminManage.do?action=notice");
		}
		else if(action.equals("deletenotice"))
		{
			int id;
			id=Integer.parseInt(request.getParameter("id"));
			NoticeDao ndao=new NoticeDao();
			ndao.delete(id);
			response.sendRedirect("adminManage.do?action=notice");
		}
		else if(action.equals("msg"))
		{
			MsgDao mdao=new MsgDao();
			ArrayList<Msg> mlist=new ArrayList<Msg>();
			mlist=mdao.QueryAll();
			request.setAttribute("mlist", mlist);
			request.setAttribute("msgsize", mlist.size());
			request.getRequestDispatcher(
					"msglist.jsp")
					.forward(request, response);
		}
		else if(action.equals("addmsg"))
		{
			String content;
			
			Timestamp currtime=null;
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				currtime=new Timestamp(sdf.parse(sdf.format(new Date())).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			content=request.getParameter("content");
			
			
			MsgDao mdao=new MsgDao();
			Msg msg=new Msg();
	
			msg.setContent(content);
			msg.setDate(currtime);
			
			mdao.insert(msg);

			response.sendRedirect("adminManage.do?action=msg");
		}
		else if(action.equals("toupdatemsg"))
		{
			int id;
			id=Integer.parseInt(request.getParameter("id"));
			MsgDao mdao=new MsgDao();
			Msg msg=new Msg();
			msg=mdao.QueryById(id);
			request.setAttribute("msg", msg);		
			request.getRequestDispatcher(
					"updatemsg.jsp")
					.forward(request, response);
		}
		else if(action.equals("updatemsg"))
		{
			int id;
			String content;
			Timestamp time;
			id=Integer.parseInt(request.getParameter("id"));
			content=request.getParameter("content");
			
			
			MsgDao mdao=new MsgDao();
			Msg msg=new Msg();
			
			msg.setId(id);
			msg.setContent(content);
			mdao.update(msg);
			
			msg=mdao.QueryById(id);
			request.setAttribute("msg", msg);
			request.setAttribute("msg1", "更新成功！");
			request.getRequestDispatcher(
					"updatemsg.jsp")
					.forward(request, response);
		}
		else if(action.equals("deletemsg"))
		{
			int id;
			id=Integer.parseInt(request.getParameter("id"));
			MsgDao mdao=new MsgDao();
			mdao.delete(id);
			response.sendRedirect("adminManage.do?action=msg");
		}
		out.flush();
		out.close();
	}
}
