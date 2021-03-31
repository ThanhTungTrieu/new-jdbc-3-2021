package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.RoleModel;
import com.laptrinhjavaweb.model.UserModel;

public class UserMapper implements RowMapper<UserModel> {

	@Override
	public UserModel mapRow(ResultSet resultSet) {
		try {
			UserModel users = new UserModel();
			users.setUsername(resultSet.getString("username"));
			users.setFullname(resultSet.getString("fullname"));
			users.setPassword(resultSet.getString("password"));
			users.setStatus(resultSet.getInt("status"));
			users.setRoleId(resultSet.getLong("roleId"));
			users.setCreatedDate(resultSet.getTimestamp("createdDate"));
			users.setCreatedBy(resultSet.getString("createdBy"));
			if (resultSet.getTimestamp("modifiedDate") != null) {
				users.setModifiedDate(resultSet.getTimestamp("modifiedDate"));
			}
			if (resultSet.getString("modifiedBy") != null) {
				users.setModifiedBy(resultSet.getString("modifiedBy"));
			}
			try {
				RoleModel role = new RoleModel();
				role.setCode(resultSet.getString("code"));
				role.setName(resultSet.getString("name"));
				users.setRole(role);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return users;
		} catch (SQLException e) {
			return null;
		}
	}
	
}
