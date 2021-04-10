package com.laptrinhjavaweb.dao;

import com.laptrinhjavaweb.model.UserModel;

public interface IUserDAO extends GenericDAO<UserModel> {
	UserModel findOne(Long id);
	UserModel findByUsernameAndPasswordAndStatus(String username, String password, Integer status);
	Long save(UserModel userModel);
}
