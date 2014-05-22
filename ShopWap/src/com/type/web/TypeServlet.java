package com.type.web;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.item.dao.Item;

import com.type.dao.TypeDao;

public class TypeServlet extends HttpServlet {


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
		String id = request.getParameter("id");
		
		TypeDao dao=new TypeDao();
		ArrayList<Item> itemlist=new ArrayList<Item>();
		itemlist=dao.queryById(id);
		request.setAttribute("typename", dao.getTypeName(Integer.parseInt(id)));
		request.setAttribute("itemlist", itemlist);
		request.setAttribute("size", itemlist.size());
		request.getRequestDispatcher("products.jsp").forward(request,
				response);
	}

}
