package com.sell.web;

import java.io.IOException;

import java.sql.Timestamp;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.buy.dao.BuyDao;
import com.buy.dao.OrderInfo;
import com.item.dao.Item;
import com.item.dao.ItemDao;
import com.login.dao.userDao;

import com.pay.dao.Pay;
import com.pay.dao.PayDao;
import com.sell.dao.Sell;
import com.sell.dao.SellDao;
import com.shop.dao.Shop;
import com.shop.dao.ShopDao;
import com.waybill.dao.*;

import java.io.File;
import java.io.IOException;
import java.util.*;



import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class SellActionServlet extends HttpServlet {


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
			String id = request.getParameter("id");
			SellDao dao=new SellDao();
			WaybillDao waybilldao = new WaybillDao();
			
			ArrayList<Sell> orderlist=new ArrayList<Sell>();
			Sell order=new Sell();
			ArrayList<Integer> numlist=new ArrayList<Integer>();
			//itemlist=dao.queryByKey(key);
			if(action.equals("close"))
			{
				dao.setState(-1,Integer.parseInt(id));
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
				order = dao.queryById(Integer.parseInt(id));
				request.setAttribute("order", order);
				request.getRequestDispatcher("deliveraction.jsp").forward(request,
						response);
			}
			else if(action.equals("deliveraction"))
			{
				
				String waybillId = request.getParameter("waybillid");
				id = request.getParameter("orderid");
				Waybill w = new Waybill();
				w.setId(Integer.parseInt(waybillId));
				Timestamp d = new Timestamp(System.currentTimeMillis());
				w.setDate(d);
				w.setContent("商家已经发货");
				w.setState(0);
				
				if(waybilldao.queryById(w.getId()))
				{
					order = dao.queryById(Integer.parseInt(id));
					request.setAttribute("order", order);
					request.setAttribute("msg","运单已存在！");
					request.getRequestDispatcher("deliveraction.jsp").forward(request,
							response);
				}
				else
				{
				if(waybilldao.insert(w)){
					dao.setState(2,Integer.parseInt(id));
					dao.setWaybillId(Integer.parseInt(waybillId),Integer.parseInt(id));
				}
				orderlist=dao.queryByState(1,user.getId());
				numlist = dao.queryNum(user.getId());
				request.setAttribute("numlist", numlist);
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("size", orderlist.size());
				request.setAttribute("state","待发货");
				request.getRequestDispatcher("deliver.jsp").forward(request,
						response);
				}
			}
			
			
			else if(action.equals("hide"))
			{
				dao.setState(-7,Integer.parseInt(id));
				orderlist=dao.queryByState(0,user.getId());
				numlist = dao.queryNum(user.getId());
				request.setAttribute("numlist", numlist);
				
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("size", orderlist.size());
				request.setAttribute("state","已关闭");
				request.getRequestDispatcher("myrefund.jsp").forward(request,
						response);
			}
			
			else if(action.equals("additem"))
			{
				//System.out.println("nfrhuhrue:"+request.getParameter("brand"));
				
				 
				 request.setCharacterEncoding("UTF-8");
				  DiskFileItemFactory factory = new DiskFileItemFactory();
				  ServletFileUpload upload = new ServletFileUpload(factory);
				  String path = "F:\\apache-tomcat-6.0.14\\webapps\\shop\\img\\items\\";
				 
				  String  name = dao.getNewId()+"";
				  
				   Item newitem = new Item();
				   newitem.setId(name);
				   /*
				   newitem.setBrand(request.getParameter("brand"));
				   newitem.setModel(request.getParameter("model"));
				   newitem.setColor(request.getParameter("color"));
				   System.out.println(request.getParameter("color"));
				  // item.setPrice(Double.parseDouble(request.getParameter("price")));
				   newitem.setTypeId(Integer.parseInt(request.getParameter("typeid")));
				   newitem.setShopId(dao.getShopId(user.getId()));
				   newitem.setImg("/shop/img/items"+name+"/"+"1.jsp");
				   newitem.setInfo(request.getParameter("info"));
				   newitem.setInfoimg("/shop/img/items"+name+"/"+"describe1.jsp");
				   Date d = new Date(System.currentTimeMillis());
				   newitem.setSaledate(d);
				   newitem.setState(0);
				   
				  // dao.additem(item);
				  // dao.setPrice(item);
				  */
				   String typename = "";
				  try {
			      
				   List items = upload.parseRequest(request);
				   Iterator itr = items.iterator();
				   while (itr.hasNext()) {
				    FileItem item = (FileItem) itr.next();
				    if (item.isFormField()) {
				     //System.out.println("表单参数名:" + item.getFieldName() + "，表单参数值:" + item.getString("UTF-8"));
				    	newitem.setName(item.getString("UTF-8"));
				    	item = (FileItem) itr.next();
						newitem.setBrand(item.getString("UTF-8"));
						item = (FileItem) itr.next();
						newitem.setModel(item.getString("UTF-8"));
						item = (FileItem) itr.next();
						newitem.setColor(item.getString("UTF-8"));
						item = (FileItem) itr.next();
						newitem.setPrice(Double.parseDouble(item.getString("UTF-8")));
						item = (FileItem) itr.next();
						typename = item.getString("UTF-8");
						newitem.setTypeId(Integer.parseInt(typename));
						item = (FileItem) itr.next();
						
						newitem.setShopId(dao.getShopId(user.getId()));
						newitem.setImg("/shop/img/items/"+name+"/"+"1.jpg");
						newitem.setInfo(item.getString("UTF-8"));
						newitem.setInfoimg("/shop/img/items/"+name+"/"+"describe1.jpg");
					    Date d = new Date(System.currentTimeMillis());
						newitem.setSaledate(d);
						newitem.setState(0);
				    	
				    } else {
				     if (item.getName() != null && !item.getName().equals("")) {

				      //File tempFile = new File(item.getName());
				      
				      //上传文件的路径
				      //File file = new File(sc.getRealPath("/") + savePath, tempFile.getName());
				      File myfile = new File(path+name);
				      System.out.println(path+name);
				      if(!myfile.exists())
				      {
				    	  myfile.mkdir();
				      }
				      File file = new File(path+name, "1.jpg");
				      item.write(file);
				      
				      FileItem item1 = (FileItem) itr.next();
				      //tempFile = new File(item.getName());
				      file = new File(path+name, "describe1.jpg");
				      item1.write(file);
				      
				      
					  dao.additem(newitem);
					  dao.setPrice(newitem);
				      request.setAttribute("upload.message", "上传文件成功！");
				     }
				     
				     
				     else{
				      request.setAttribute("upload.message", "没有选择上传文件！");
				     }
				    }
				   }
				   
				   
				   
				  }catch(FileUploadException e){
				   e.printStackTrace();
				  } catch (Exception e) {
				   e.printStackTrace();
				   request.setAttribute("upload.message", "上传文件失败！");
				  }
 
				  request.setAttribute("item", newitem);
				  request.setAttribute("type", typename);
				  request.getRequestDispatcher("showitem.jsp").forward(request, response);
				 }
			
			
			
			else if(action.equals("showallitems"))
			{
				String page1 = request.getParameter("page");//获得页面传递过来的page值赋值给page1
				int page =1;
				if(page1 != null){
					page = Integer.parseInt(page1);//如果页面传递过来的page值存在，则把该page1赋值给page变量
				}
				List<Item> items = new ArrayList<Item>();
				items = dao.queryShopItem(dao.getShopId(user.getId()),page);
				int itemcount=dao.shopItemcount(dao.getShopId(user.getId()));
				int maxpage = itemcount/6;//调用最大页数方法
				if(itemcount %6 !=0)
					maxpage+=1;
				
				request.setAttribute("page", page);
				request.setAttribute("maxpage", maxpage);
				request.setAttribute("size", items.size());
				request.setAttribute("items", items);
				request.getRequestDispatcher("showallitems.jsp").forward(request,
						response);
			}
			
			
			
			else if(action.equals("modifystate"))
			{
				id = request.getParameter("id");
				String state = request.getParameter("set");
				System.out.println(id+"  haha  "+state);
				dao.setItemState(Integer.parseInt(state), Integer.parseInt(id));
				
				List<Item> items = new ArrayList<Item>();
				items = dao.queryShopItem(dao.getShopId(user.getId()),1);
				request.setAttribute("size", items.size());
				request.setAttribute("items", items);
				request.getRequestDispatcher("showallitems.jsp").forward(request,
						response);
			}
			
			
			else if(action.equals("modify"))
			{
				id = request.getParameter("id");
				ItemDao itemdao = new ItemDao();
				Item item = itemdao.queryById(id);
				request.setAttribute("item", item);
				request.getRequestDispatcher("modifyitem.jsp").forward(request,
						response);
			}
			
			else if(action.equals("modifyaction"))
			{
				 request.setCharacterEncoding("UTF-8");
				  DiskFileItemFactory factory = new DiskFileItemFactory();
				  ServletFileUpload upload = new ServletFileUpload(factory);
				  String path = "F:\\apache-tomcat-6.0.14\\webapps\\shop\\img\\items\\";
				 
				  String  name = id = request.getParameter("id");
				
				   Item newitem = new Item();
				   newitem.setId(name);
				   String typename = "";
				  try {
			      
				   List items = upload.parseRequest(request);
				   Iterator itr = items.iterator();
				   while (itr.hasNext()) {
				    FileItem item = (FileItem) itr.next();
				    if (item.isFormField()) {
				     //System.out.println("表单参数名:" + item.getFieldName() + "，表单参数值:" + item.getString("UTF-8"));
				    	newitem.setName(item.getString("UTF-8"));
				    	item = (FileItem) itr.next();
						newitem.setBrand(item.getString("UTF-8"));
						item = (FileItem) itr.next();
						newitem.setModel(item.getString("UTF-8"));
						item = (FileItem) itr.next();
						newitem.setColor(item.getString("UTF-8"));
						item = (FileItem) itr.next();
						newitem.setPrice(Double.parseDouble(item.getString("UTF-8")));
						item = (FileItem) itr.next();
						typename = item.getString("UTF-8");
						newitem.setTypeId(Integer.parseInt(typename));
						item = (FileItem) itr.next();
						
						newitem.setShopId(dao.getShopId(user.getId()));
						newitem.setImg("/shop/img/items/"+name+"/"+"1.jpg");
						newitem.setInfo(item.getString("UTF-8"));
						newitem.setInfoimg("/shop/img/items/"+name+"/"+"describe1.jpg");
					    Date d = new Date(System.currentTimeMillis());
						newitem.setSaledate(d);
						newitem.setState(0);
						
						
						  dao.modifyitem(newitem);
						  dao.setPrice(newitem);
				    	
				    } else {
				     if (item.getName() != null && !item.getName().equals("")) {

				      //File tempFile = new File(item.getName());
				      
				      //上传文件的路径
				      //File file = new File(sc.getRealPath("/") + savePath, tempFile.getName());
				      File myfile = new File(path+name);
				      System.out.println(path+name);
				      if(!myfile.exists())
				      {
				    	  myfile.mkdir();
				      }
				      File file = new File(path+name, "1.jpg");
				      item.write(file);
				      
				      FileItem item1 = (FileItem) itr.next();
				      //tempFile = new File(item.getName());
				      file = new File(path+name, "describe1.jpg");
				      item1.write(file);
				      
				      

				      request.setAttribute("upload.message", "上传文件成功！");
				     }
				     
				     
				     else{

				     }
				    }
				   }
				   
				   
				   
				  }catch(FileUploadException e){
				   e.printStackTrace();
				  } catch (Exception e) {
				   e.printStackTrace();
				   request.setAttribute("upload.message", "上传文件失败！");
				  }
				  
				 // System.out.println(newitem.getBrand());
				  request.setAttribute("item", newitem);
				  request.setAttribute("type", typename);
				  request.getRequestDispatcher("showitem.jsp").forward(request, response);
			}
			

			
			else if(action.equals("showshop"))
			{
				
				int shopid = dao.getShopId(user.getId());
				if(shopid>0)
				{
					Shop shop = new Shop();
					ShopDao shopdao = new ShopDao();
					shop = shopdao.queryById(shopid);
					request.setAttribute("shop", shop);
				}
				List<Item> items = new ArrayList<Item>();
				items = dao.queryShopItem(dao.getShopId(user.getId()),1);
				
			    //numlist = dao.queryNum(user.getId());
				//request.setAttribute("numlist", numlist);
				
				
				request.setAttribute("shopid", shopid);
				request.setAttribute("user", user);
				request.getRequestDispatcher("shop.jsp").forward(request,
						response);
			}
			
			
			else if(action.equals("modifyshop"))
			{
				id = request.getParameter("id");
				Shop shop = new Shop();
				ShopDao shopdao = new ShopDao();
				shop = shopdao.queryById(Integer.parseInt(id));
				request.setAttribute("shop", shop);
				request.setAttribute("user", user);
				request.getRequestDispatcher("modifyshop.jsp").forward(request,
						response);
			}
			else if(action.equals("modifyshopaction"))
			{
				
				
				 request.setCharacterEncoding("UTF-8");
				  DiskFileItemFactory factory = new DiskFileItemFactory();
				  ServletFileUpload upload = new ServletFileUpload(factory);
				  String path = "F:\\apache-tomcat-6.0.14\\webapps\\shop\\img\\shops\\";
				 
				  String name = request.getParameter("id");;
				  
				  Shop shop = new Shop();
				  shop.setId(Integer.parseInt(name));
				  try {
			      
				   List items = upload.parseRequest(request);
				   Iterator itr = items.iterator();
				  
				   while (itr.hasNext()) {
				    FileItem item = (FileItem) itr.next();
				    if (item.isFormField()) {
				    	
				    	shop.setName(item.getString("UTF-8"));
				    	item = (FileItem) itr.next();
				    	
				    	shop.setInfo(item.getString("UTF-8"));
						//item = (FileItem) itr.next();
						
						shop.setTypeId(101);
						shop.setOwnerId(user.getId());
						shop.setLogo("/shop/img/shops/"+name+"/"+"logo.jpg");
						dao.updateshop(shop);
				    	
				    } else {
				     if (item.getName() != null && !item.getName().equals("")) {

				      //File tempFile = new File(item.getName());
				      
				      //上传文件的路径
				      //File file = new File(sc.getRealPath("/") + savePath, tempFile.getName());
				      File myfile = new File(path+name);
				      System.out.println(path+name);
				      if(!myfile.exists())
				      {
				    	  myfile.mkdir();
				      }
				      File file = new File(path+name, "logo.jpg");
				      item.write(file);
				      
				      

				      request.setAttribute("upload.message", "上传文件成功！");
				     }
				     
				     
				     else{
				      request.setAttribute("upload.message", "没有选择上传文件！");
				     }
				    }
				   }
				   
				   
				   
				  }catch(FileUploadException e){
				   e.printStackTrace();
				  } catch (Exception e) {
				   e.printStackTrace();
				   request.setAttribute("upload.message", "上传文件失败！");
				  }

					int shopid = dao.getShopId(user.getId());
					ShopDao shopdao = new ShopDao();
					shop = shopdao.queryById(shopid);
					request.setAttribute("shopid", shopid);
					request.setAttribute("shop", shop);
					request.setAttribute("user", user);
					request.getRequestDispatcher("shop.jsp").forward(request,
							response);
			}
			
			else if(action.equals("addshop"))
			{
				
				
				
				 request.setCharacterEncoding("UTF-8");
				  DiskFileItemFactory factory = new DiskFileItemFactory();
				  ServletFileUpload upload = new ServletFileUpload(factory);
				  String path = "F:\\apache-tomcat-6.0.14\\webapps\\shop\\img\\shops\\";
				 
				  String name = dao.getNewShopId()+"";
				  
				  Shop shop = new Shop();
				  shop.setId(Integer.parseInt(name));
				  try {
			      
				   List items = upload.parseRequest(request);
				   Iterator itr = items.iterator();
				  
				   while (itr.hasNext()) {
				    FileItem item = (FileItem) itr.next();
				    if (item.isFormField()) {
				    	
				    	shop.setName(item.getString("UTF-8"));
				    	item = (FileItem) itr.next();
				    	
				    	shop.setInfo(item.getString("UTF-8"));
						//item = (FileItem) itr.next();
						
						shop.setTypeId(101);
						shop.setOwnerId(user.getId());
						shop.setLogo("/shop/img/shops/"+name+"/"+"logo.jpg");
						
				    	
				    } else {
				     if (item.getName() != null && !item.getName().equals("")) {

				      //File tempFile = new File(item.getName());
				      
				      //上传文件的路径
				      //File file = new File(sc.getRealPath("/") + savePath, tempFile.getName());
				      File myfile = new File(path+name);
				      System.out.println(path+name);
				      if(!myfile.exists())
				      {
				    	  myfile.mkdir();
				      }
				      File file = new File(path+name, "logo.jpg");
				      item.write(file);
				      
				      dao.addshop(shop);

				      request.setAttribute("upload.message", "上传文件成功！");
				     }
				     
				     
				     else{
				      request.setAttribute("upload.message", "没有选择上传文件！");
				     }
				    }
				   }
				   
				   
				   
				  }catch(FileUploadException e){
				   e.printStackTrace();
				  } catch (Exception e) {
				   e.printStackTrace();
				   request.setAttribute("upload.message", "上传文件失败！");
				  }

					int shopid = dao.getShopId(user.getId());
					ShopDao shopdao = new ShopDao();
					shop = shopdao.queryById(shopid);
					request.setAttribute("shopid", shopid);
					request.setAttribute("shop", shop);
					request.setAttribute("user", user);
					request.getRequestDispatcher("shop.jsp").forward(request,
							response);

			}
			
			
			else if(action.equals("showOrderById"))
			{
				BuyDao buyDao = new BuyDao();
				OrderInfo orderInfo=new OrderInfo();
				int orderId=Integer.parseInt(request.getParameter("id"));
				int userId = dao.getuseridbyorderid(orderId);
				orderInfo=buyDao.QueryById(userId,orderId);
				request.setAttribute("order",orderInfo);
				request.getRequestDispatcher("showOrder.jsp").forward(request,
						response);
			}
			
			else if(action.equals("yrefund"))
			{
				dao.setState(-3, Integer.parseInt(id));
				
				BuyDao buyDao = new BuyDao();
				OrderInfo orderInfo=new OrderInfo();
				int orderId=Integer.parseInt(request.getParameter("id"));
				int userId = dao.getuseridbyorderid(orderId);
				orderInfo=buyDao.QueryById(userId,orderId);
				
				Timestamp currtime=null;
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				try {
					currtime=new Timestamp(sdf.parse(sdf.format(new java.util.Date())).getTime());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				PayDao pdao=new PayDao();
				Pay pay=new Pay();
				pay.setMemId(userId);
				pay.setCount(orderInfo.getPrice());
				pay.setRemark("卖家同意退款，退款"+orderInfo.getPrice()+"元");
				pay.setDate(currtime);
				pdao.insert(pay);
				response.sendRedirect("sell.do?action=myrepair");
			}
			else if(action.equals("nrefund"))
			{
				dao.setState(-4, Integer.parseInt(id));
				response.sendRedirect("sell.do?action=myrepair");
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
