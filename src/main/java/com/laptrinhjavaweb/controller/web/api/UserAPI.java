package com.laptrinhjavaweb.controller.web.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.HttpUtil;

@WebServlet (urlPatterns = {"/api-web-user"})
public class UserAPI extends HttpServlet {
	
	@Inject
	private IUserService userService;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json"); // set return type for client
		UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class); // mapping json value to NewsModel.
		userModel = userService.save(userModel);
		mapper.writeValue(response.getOutputStream(), userModel);	//  response
	}
}
