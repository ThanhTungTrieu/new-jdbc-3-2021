package com.laptrinhjavaweb.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.model.NewsModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.INewsService;
import com.laptrinhjavaweb.utils.HttpUtil;
import com.laptrinhjavaweb.utils.SessionUtil;

@WebServlet (urlPatterns = {"/api-admin-news"})
public class NewsAPI extends HttpServlet {
	
	@Inject
	private INewsService newsService;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json"); // set return type for client
		NewsModel newsModel = HttpUtil.of(request.getReader()).toModel(NewsModel.class); // mapping json value to NewsModel.
		newsModel.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUsername());
		newsModel = newsService.save(newsModel);
		mapper.writeValue(response.getOutputStream(), newsModel);	//  response
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json"); // set return type for client
		NewsModel updateNews = HttpUtil.of(request.getReader()).toModel(NewsModel.class); // mapping json value to NewsModel.
		updateNews.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUsername());
		updateNews = newsService.update(updateNews); 
		mapper.writeValue(response.getOutputStream(), updateNews);	//  response
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json"); // set return type for client
		NewsModel newsModel = HttpUtil.of(request.getReader()).toModel(NewsModel.class); // mapping json value to NewsModel.
		newsService.delete(newsModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");	//  response
	}
}
