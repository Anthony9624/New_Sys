package com.service;

import com.dao.UsersDao;
import com.entity.Users;

public class UserService {
	UsersDao ud = new UsersDao();

	public boolean login(String uname, String upwd) {
		return ud.login(uname, upwd);
	}  
  
}
