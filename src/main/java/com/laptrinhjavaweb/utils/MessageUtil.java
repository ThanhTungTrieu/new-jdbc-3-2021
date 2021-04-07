package com.laptrinhjavaweb.utils;

import javax.servlet.http.HttpServletRequest;

import com.laptrinhjavaweb.constant.SystemConstant;

public class MessageUtil {
	
	public static void showMessage(HttpServletRequest request) {
		if (request.getParameter("message") != null) {
			String messageResponse = "";
			String alert = "";
			String message = request.getParameter("message");
			if (message.equals("insert_success")) {
				messageResponse = SystemConstant.INSERT_SUCCESS;
				alert = "success";
			} else if (message.equals("update_success")) {
				messageResponse = SystemConstant.UPDATE_SUCCESS;
				alert = "success";
			} else if (message.equals("delete_success")) {
				messageResponse = SystemConstant.DELETE_SUCCESS;
				alert = "success";
			} else if (message.equals("system_error")) {
				messageResponse = SystemConstant.SYSTEM_ERROR;
				alert = "danger";
			}
			request.setAttribute("messageResponse", messageResponse);
			request.setAttribute("alert", alert);
		}
		
	}
}
