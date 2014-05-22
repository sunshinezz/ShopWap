package com.item.web;

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
import com.item.dao.Judge;
import com.login.dao.userDao;
import com.shopcar.dao.ShopCarDao;

public class ItemsServlet extends HttpServlet {

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
		// 1.取ID
		String id = request.getParameter("id");
		String action=request.getParameter("action");
		// 2.查询
		ItemDao itemdao = new ItemDao();
		Item item=new Item();
		item=itemdao.queryById(id);
		if(item==null || (item.getState()!=1 && item.getState()!=2) )
		{
			request.getRequestDispatcher("error.jsp").forward(request,
					response);
			return;
		}
		
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
		
		
		// 3.将数据放入request中
		request.setAttribute("item",item);
		request.setAttribute("size", size);
		
		ArrayList<Judge> judgelist=new ArrayList<Judge>();
		judgelist=itemdao.QueryJudgeById(Integer.parseInt(id));
		int jsize=judgelist.size();
		request.setAttribute("jsize", jsize);
		// 4.跳到修改页面
		if(action== null)
			request.getRequestDispatcher("/items/item.jsp").forward(request,
					response);
		else if(action.equals("parameter"))	
			request.getRequestDispatcher("/items/parameter.jsp").forward(request,
					response);
		else if(action.equals("judge"))
		{
			
			int g5=0;
			int g4=0;
			int g3=0;
			int other=0;
		
			for(Judge ju: judgelist){
				if(ju.getGrade()==5)
					g5++;
				else if(ju.getGrade()==4)
					g4++;
				else if(ju.getGrade()==3)
					g3++;
				else other++;
			}
			int goodr=0;
			int midr=0;
			int badr=0;
			if(jsize!=0)
			{
				double good=(double)(g5+g4)/jsize;
				System.out.println(good);
				goodr=(int)(good*100);
				midr=(int)((double)g3/jsize*100);
				double bad=(double)other/jsize;
				badr=(int)(bad*100);	
			}
			request.setAttribute("goodn", g5+g4);
			request.setAttribute("goodr", goodr);
			request.setAttribute("midn", g3);
			request.setAttribute("midr", midr);
			request.setAttribute("badn", other);
			request.setAttribute("badr", badr);
			
			request.setAttribute("jlist", judgelist);
			request.getRequestDispatcher("/items/judge.jsp").forward(request,
					response);
		}

	}

}
