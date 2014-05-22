package com.buy.web;

import java.io.IOException;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;


import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buy.dao.BuyDao;
import com.buy.dao.OrderInfo;
import com.buy.dao.judgeInfo;
import com.item.dao.Item;
import com.item.dao.ItemDao;
import com.like.dao.Like;
import com.like.dao.LikeDao;
import com.login.dao.User;
import com.login.dao.userDao;
import com.pay.dao.Pay;
import com.pay.dao.PayDao;
import com.shop.dao.ShopDao;
import com.shopcar.dao.ShopCarDao;
import com.top10.dao.Top;
import com.top10.dao.TopDao;
import com.type.dao.TypeDao;
public class MyOrderServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
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
		String action=request.getParameter("action");
		if(account!=null)//当前有用户登录
		{
			userDao uDao=new userDao();
			com.login.dao.User user=new com.login.dao.User();
			user=uDao.queryByAccount(account);//根据账户查出的user
			ShopCarDao shopdao=new ShopCarDao();
			int userId=user.getId();
			int size=shopdao.getSize(userId);
			ArrayList<Integer> numlist=new ArrayList<Integer>();
			BuyDao buyDao=new BuyDao();
			numlist=buyDao.queryNum(userId);
			request.setAttribute("size", size);
			request.setAttribute("numlist",numlist);
			if(action.equals("showOrder"))
			{
				int state=5;
				String state1 = request.getParameter("state");
				if(state1!=null)
				{
					state=Integer.parseInt(state1);
				}
				
				ArrayList<OrderInfo> orders=new ArrayList<OrderInfo>();
				if(state==5){//所有状态的订单
				orders=buyDao.QueryByUserId(userId);//根据user查出的账单信息
				
				}
				else {
					orders=buyDao.QueryBystate(userId, state);//根据user查出的账单信息
				}
				request.setAttribute("user", user);
				request.setAttribute("orders", orders);
				request.getRequestDispatcher("myorderlist.jsp").forward(request,
						response);
			}
			if(action.equals("showOrderById"))
			{
				OrderInfo orderInfo=new OrderInfo();
				int orderId=Integer.parseInt(request.getParameter("orderId"));
				orderInfo=buyDao.QueryById(userId,orderId);
				request.setAttribute("order",orderInfo);
				request.getRequestDispatcher("showOrder.jsp").forward(request,
						response);
			}
			if(action.equals("myw"))
			{
				PayDao payDao=new PayDao();
				double balance=payDao.getBalance(userId);
				LikeDao likeDao=new LikeDao();
				ArrayList<OrderInfo> orders=buyDao.QueryBystate(userId, 3);
				ArrayList<Like> likes=likeDao.queryById(userId);
				Iterator<Like> iterator=likes.iterator();
				ArrayList<Item> recommend=new ArrayList<Item>();
				ArrayList<Item> recommends=new ArrayList<Item>();
				int likenum=0, resize=0;
				//如果有关注的话，按照关注推荐
				while(iterator.hasNext())
				{
					Like like=iterator.next();
					recommend=likeDao.queryByLike((like.getTypeId()+""), likes);//查出所有同类型的产品
					System.out.println("recommend:"+like.getTypeId());
					recommends.addAll(recommend);		
					likenum++;
				}
				//如果没有关注就按top10推荐
				TopDao topDao=new TopDao();
				ArrayList<Top> tops=new ArrayList<Top>();
				System.out.println("recommendnum:"+recommends.size());
				if(recommends.size()==0)
				{
					tops=topDao.queryTop10(3);
				}
				Iterator<Top> iterator1=tops.iterator();
				while(iterator1.hasNext())
				{
					ItemDao itemDao=new ItemDao();
					Top top=iterator1.next();
					Item item=new Item();
					item=itemDao.queryById(top.getId()+"");
					recommends.add(item);
					System.out.println("itemInfo::"+item.getId());
				}
				resize=recommends.size();
				System.out.println("recommendnum:"+resize);
				request.setAttribute("resize", resize);
				request.setAttribute("recommend", recommends);
				request.setAttribute("orders", orders);
				request.setAttribute("balance", balance);
				request.setAttribute("likenum", likenum);
				request.setAttribute("user", user);
				request.getRequestDispatcher("myw.jsp").forward(request,
						response);
			}
			if(action.equals("mymoney"))
			{
				ArrayList<Pay> pays=new ArrayList<Pay>();
				PayDao payDao=new PayDao();
				double balance=payDao.getBalance(userId);
				pays=buyDao.mymoney(userId);
				request.setAttribute("balance", balance);
				request.setAttribute("pays", pays);
				request.getRequestDispatcher("/ShopWap/buy/mymoney.jsp").forward(request,
						response);
			}
			if(action.equals("showAddress"))
			{
				int size1=0;
				userDao userDao=new userDao();
				User u=userDao.queryById(userId);
				request.setAttribute("user",u);
				System.out.println("name2:"+u.getName2()+"end");
				System.out.println("name3:"+u.getName3()+"end");
				if(u.getName1()!=null)
				{
					size1=1;
				}
				if(u.getName2()!=null)
				{
					size1=2;
				}
				if(u.getName3()!=null)
				{
					size1=3;
				}
				System.out.println("size1:"+size1);	
				request.setAttribute("addrsize",size1);
				request.getRequestDispatcher("myaddress.jsp").forward(request,
						response);
			}
			if(action.equals("tomodify"))
			{
				int num=-1;
				String num1=request.getParameter("number");
				if(num1!=null)
				{
					num=Integer.parseInt(num1);
					userDao userDao=new userDao();
					User u=userDao.queryById(userId);
					request.setAttribute("num",num);
					request.setAttribute("user",u);
				}
				request.getRequestDispatcher("modifyaddress.jsp").forward(request,
						response);
			}
			if(action.equals("toadd"))
			{
				int num=-1;
				String num1=request.getParameter("number");
				if(num1!=null)
				{
					num=Integer.parseInt(num1);
					userDao userDao=new userDao();
					User u=userDao.queryById(userId);
					request.setAttribute("num",num);
				}
				request.getRequestDispatcher("modifyaddress.jsp").forward(request,
						response);
			}
			if(action.equals("modifyAddr"))
			{
				int num=Integer.parseInt(request.getParameter("num"));
				String name=request.getParameter("name");
				String address=request.getParameter("address");
				String phone=request.getParameter("phone");
				User u=new User();
				u.setId(userId);
				u.setName1(name);
				u.setAddress1(address);
				u.setPhone1(phone);
				System.out.println("address:"+address);
				if(buyDao.modifyAddr(u, num))
				{
					userDao userDao=new userDao();
					User u1=userDao.queryById(userId);
					request.setAttribute("user",u1);
				}
				request.getRequestDispatcher("myOrderServlet.do?action=showAddress").forward(request,
						response);
			}
			if(action.equals("delete"))
			{
				String success="删除失败";
				int num=Integer.parseInt(request.getParameter("num"));
				User u=new User();
				u.setId(userId);
				u.setName1(null);
				u.setAddress1(null);
				u.setPhone1(null);
				if(buyDao.modifyAddr(u, num))
				{
					success="删除成功";
					userDao userDao=new userDao();
					User u1=userDao.queryById(userId);
					request.setAttribute("user",u1);
				}
				request.getRequestDispatcher("myOrderServlet.do?action=showAddress").forward(request,
						response);
			}
			if(action.equals("confirmBuy"))
			{
				String success="确认失败";
				int  orderId = Integer.parseInt(request.getParameter("orderId"));
				ArrayList<OrderInfo> orders=new ArrayList<OrderInfo>();
				if(buyDao.setState(3, orderId))
				{
					success="确认成功";
				}
				
				Timestamp currtime=null;
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				try {
					currtime=new Timestamp(sdf.parse(sdf.format(new Date())).getTime());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
	            
				PayDao pdao=new PayDao();
				int sellid=pdao.getSellId(orderId);
				double price=pdao.getOrderPrice(orderId);
				Pay pay=new Pay();
				pay.setMemId(sellid);
				pay.setCount(price);
				pay.setRemark("商品售出，获得"+price+"元");
				pay.setDate(currtime);
				pdao.insert(pay);
				
				numlist=buyDao.queryNum(userId);
				request.setAttribute("numlist",numlist);
				orders=buyDao.QueryByUserId(userId);//根据user查出的账单信息
				request.setAttribute("orders",orders);
				request.setAttribute("success",success);
				request.getRequestDispatcher("myorderlist.jsp").forward(request,
						response);
			}
			if(action.equals("refund"))
			{
				String success="申请未发出";
				int  orderId = Integer.parseInt(request.getParameter("orderId"));
				ArrayList<OrderInfo> orders=new ArrayList<OrderInfo>();
				if(buyDao.setState(-2, orderId))
				{
					success="申请已发出，等待卖家处理";
				}
				numlist=buyDao.queryNum(userId);
				request.setAttribute("numlist",numlist);
				orders=buyDao.QueryByUserId(userId);//根据user查出的账单信息
				request.setAttribute("orders",orders);
				request.setAttribute("success",success);
				request.getRequestDispatcher("myorderlist.jsp").forward(request,
						response);
			}
			if(action.equals("right"))
			{
				String success="申请未发出";
				int  orderId = Integer.parseInt(request.getParameter("orderId"));
				ArrayList<OrderInfo> orders=new ArrayList<OrderInfo>();
				if(buyDao.setState(-5, orderId))
				{
					success="申请已发出，等待管理员处理";
				}
				numlist=buyDao.queryNum(userId);
				request.setAttribute("numlist",numlist);
				orders=buyDao.QueryByUserId(userId);//根据user查出的账单信息
				request.setAttribute("orders",orders);
				request.setAttribute("success",success);
				request.getRequestDispatcher("myorderlist.jsp").forward(request,
						response);
			}
			if(action.equals("tojudge"))
			{
				OrderInfo orderInfo=new OrderInfo();
				int orderId=Integer.parseInt(request.getParameter("orderId"));
				orderInfo=buyDao.QueryById(userId,orderId);
				request.setAttribute("order",orderInfo);
				request.getRequestDispatcher("judge.jsp").forward(request,
						response);
			}
			if(action.equals("judge"))
			{
				judgeInfo judgeInfo=new judgeInfo();
				BuyDao bu=new BuyDao();
				int orderId=Integer.parseInt(request.getParameter("orderId"));
				String title=request.getParameter("title");
				int grade=Integer.parseInt(request.getParameter("point"));
				String xinde=null;
				if(request.getParameter("xinde")!=null)
				{
						xinde=request.getParameter("xinde");
				}
				java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
				judgeInfo.setTitle(title);//1
				judgeInfo.setDate(currentDate);//2
				judgeInfo.setXinde(xinde);//3
				judgeInfo.setGrade(grade);//4
				judgeInfo.setOrderId(orderId);//5
				if(bu.judge(judgeInfo))
				{
					//response.sendRedirect("/shop/login/login.jsp");
					request.getRequestDispatcher("myOrderServlet.do?action=showOrder&state=4").forward(request,
							response);
				}
				else {
					response.sendRedirect("/shop/buy/myOrderServlet.do?action=tojudge&orderId=judgeInfo.getOrderId");
				}
				
				System.out.println("title:"+grade);
			}
			if(action.equals("deleteOrder"))
			{
				String success="删初失败";
				int  orderId = Integer.parseInt(request.getParameter("orderId"));
				ArrayList<OrderInfo> orders=new ArrayList<OrderInfo>();
				if(buyDao.setState(-7, orderId))
				{
					success="删除成功";
				}
				numlist=buyDao.queryNum(userId);
				request.setAttribute("numlist",numlist);
				orders=buyDao.QueryByUserId(userId);//根据user查出的账单信息
				request.setAttribute("orders",orders);
				request.setAttribute("success",success);
				request.getRequestDispatcher("myorderlist.jsp").forward(request,
						response);
			}
			if(action.equals("gobackOrder"))
			{
				String success="还原失败";
				int  orderId = Integer.parseInt(request.getParameter("orderId"));
				ArrayList<OrderInfo> orders=new ArrayList<OrderInfo>();
				if(buyDao.setState(-1, orderId))
				{
					success="还原成功";
				}
				numlist=buyDao.queryNum(userId);
				request.setAttribute("numlist",numlist);
				orders=buyDao.QueryByUserId(userId);//根据user查出的账单信息
				request.setAttribute("orders",orders);
				request.setAttribute("success",success);
				request.getRequestDispatcher("myorderlist.jsp").forward(request,
						response);
			}
			if(action.equals("mylike"))
			{
				ArrayList<Like> likes=new ArrayList<Like>();
				LikeDao likeDao=new LikeDao();
				ArrayList<Item> recommend=new ArrayList<Item>();
				likes=likeDao.queryById(userId);
				Iterator<Like> iterator=likes.iterator();
				if(iterator.hasNext())
				{
					Like like=iterator.next();
					recommend=likeDao.queryByLike((like.getTypeId()+""), likes);//查出所有同类型的产品
					System.out.println("recommend:"+like.getTypeId());
				}
				request.setAttribute("likes", likes);
				request.setAttribute("recommend", recommend);
				request.getRequestDispatcher("myfollow.jsp").forward(request,
						response);
			}
			if(action.equals("recommend"))
			{
				ArrayList<Like> likes=new ArrayList<Like>();
				LikeDao likeDao=new LikeDao();
				ArrayList<Item> recommend=new ArrayList<Item>();
				ArrayList<Item> recommends=new ArrayList<Item>();
				likes=likeDao.queryById(userId);
				Iterator<Like> iterator=likes.iterator();
				while(iterator.hasNext())
				{
					Like like=iterator.next();
					recommend=likeDao.queryByLike((like.getTypeId()+""), likes);//查出所有同类型的产品
					recommends.addAll(recommend);
					System.out.println("recommend:"+like.getTypeId());
				}
				request.setAttribute("recommend", recommends);
				request.getRequestDispatcher("myguess.jsp").forward(request,
						response);
			}
			if(action.equals("cancelFollow"))
			{
				int id=Integer.parseInt(request.getParameter("likeId"));
				ArrayList<Like> likes=new ArrayList<Like>();
				LikeDao likeDao=new LikeDao();
				if(likeDao.cancelFollow(id))
				{
					likes=likeDao.queryById(userId);
				}
				request.setAttribute("likes", likes);
				request.getRequestDispatcher("myfollow.jsp").forward(request,
						response);
				
			}
			if(action.equals("updateInfo"))
			{
				String success="修改失败";
				String name=request.getParameter("name");
				int gender=Integer.parseInt(request.getParameter("sex"));
				String phone=request.getParameter("phone");
				String email=request.getParameter("email");
				User u=new User();
				u.setId(user.getId());
				u.setName(name);
				u.setGerder(gender);
				u.setPhone(phone);
				u.setEmail(email);
				System.out.println("petName: "+name);
				if(uDao.updateInfo(u))
				{
					success="修改成功";
					System.out.println("sd:"+success);
					request.setAttribute("user", u);
					request.setAttribute("success", success);
					
					request.getRequestDispatcher("myinfo.jsp").forward(request,
							response);
					return;
				}
				/*else {
					request.setAttribute("success", success);
					request.getRequestDispatcher("myinfo.jsp").forward(request,
							response);
					return;
				}*/
				
			}
			if(action.equals("addLike"))
			{
				String success="关注失败";
				int itemid=Integer.parseInt(request.getParameter("itemId"));
				Like like=new Like();
				LikeDao likeDao=new LikeDao();
				int id=likeDao.getNewId();
				like.setMemId(userId);//1
				like.setItemId(itemid);//2
				java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
				like.setDate(currentDate);//3
				like.setId(id);//4
				if (likeDao.addLike(like)) {
					Item item=new Item();
					ItemDao itemDao=new ItemDao();
					item=itemDao.queryById(itemid+"");
					request.setAttribute("item", item);
					success="关注成功";
				}
				request.setAttribute("size", size);
				request.setAttribute("success", success);
				request.getRequestDispatcher("../items/item.jsp").forward(request,
						response);
			}
			
		}
		else {
			request.setAttribute("loginFirst", "请先登录");
			request.getRequestDispatcher("/login/login.jsp").forward(request,
					response);
			//response.sendRedirect("/shop/login/login.jsp");
		}
		
		

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		this.doGet(request, response);
	}

}
