package com.laptrinhjavaweb.controller.web;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.model.NewsModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.paging.PageRequest;
import com.laptrinhjavaweb.paging.Pageble;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewsService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.sort.Sorter;
import com.laptrinhjavaweb.utils.FormUtil;
import com.laptrinhjavaweb.utils.SessionUtil;

@WebServlet(urlPatterns = { "/trang-chu", "/dang-nhap", "/thoat", "/dang-ky" })
public class HomeController extends HttpServlet {
	
	@Inject
	private ICategoryService categoryService;

	@Inject
	private IUserService userService;
	
	@Inject
	private INewsService newsService;
	
	ResourceBundle messageBundle = ResourceBundle.getBundle("message");
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if (action != null && action.equals("login")) {
			String message = request.getParameter("message");
			String alert = request.getParameter("alert");
			if (message != null && alert != null) {
				request.setAttribute("message", messageBundle.getString(message));
				request.setAttribute("alert", alert);
			}
			RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
			rd.forward(request, response);
		} else if (action != null && action.equals("logout")) {
			SessionUtil.getInstance().removeValue(request, "USERMODEL");
			response.sendRedirect(request.getContextPath() + "/trang-chu?page=1&maxPageItem=6");
		} else if (action != null && action.equals("register")) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/register.jsp");
			rd.forward(request, response);
		} else if(action != null && action.equals("read")) {
			NewsModel model = FormUtil.toModel(NewsModel.class, request);
			if (model.getId() != null) {
				model = newsService.findOne(model.getId());
			}
			request.setAttribute(SystemConstant.MODEL, model);
			request.setAttribute("categories", categoryService.findAll());
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/news/read.jsp");
			rd.forward(request, response);
		} else {
			NewsModel model = FormUtil.toModel(NewsModel.class, request);
			Pageble pageble = new PageRequest(new Sorter(model.getSortName(), model.getSortBy()), model.getPage(), 6);
			if (action != null && action.equals("findByCategoryId")) {
				String categoryId = request.getParameter("categoryId");
				model.setListResult(newsService.findByCategoryId(pageble, Long.parseLong(categoryId)));
			} else {
				model.setListResult(newsService.findAll(pageble));
			}
			model.setTotalItem(newsService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / 6));
			request.setAttribute(SystemConstant.MODEL, model);
			request.setAttribute("categories", categoryService.findAll());
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equals("login")) {
			UserModel userModel = FormUtil.toModel(UserModel.class, request);
			userModel = userService.findByUsernameAndPasswordAndStatus(userModel.getUsername(), userModel.getPassword(), 1);
			if (userModel != null) {
				SessionUtil.getInstance().putValue(request, "USERMODEL", userModel);
				if (userModel.getRole().getCode().equals("USER")) {
					response.sendRedirect(request.getContextPath() + "/trang-chu?page=1&maxPageItem=6");
				} else if (userModel.getRole().getCode().equals("ADMIN")) {
					response.sendRedirect(request.getContextPath() + "/admin-home");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=invalid_username_password&alert=danger");
			}
		}
	}

}
