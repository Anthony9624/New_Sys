package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Users;

public class UsersDao extends BaseDao {
	// 添加用户
	public void addUser(Users u) {
		// 使用JAVA连接数据库并且实现添加，先导JAR�?

		Connection conn = null;
		try {
			conn = getConnection();
			// 3.编写sql语句
			String sql = "insert into users values(?,?,?)";

			// 4.执行SQL语句
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.executeUpdate();// 增删�?
			// 6.关闭连接
			closeAll(conn, ps, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 5.如果是查询，处理查询结果

	}

	// 删除用户

	// 修改用户信息

	// 登录验证
	public boolean login(String uname, String upwd) {
		boolean f = false;
		Connection conn = null;
		try {
			conn = getConnection();// 调用了baseDAO中的获取连接的方�?

			// 3.编写sql语句
			String sql = "select * from users where username=? and password=?";

			// 4.执行SQL语句
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, upwd);

			ResultSet rs = ps.executeQuery();// 执行查询
			// 处理查询结果
			if (rs.next())
				f = true;
			// 6.关闭连接
			closeAll(conn, ps, rs);// 关闭全部连接
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;
	}

	public static void main(String[] args) {
		UsersDao ud = new UsersDao();
		System.out.println(ud.login("zs", "123"));
	}

	// 查询全部用户

}
