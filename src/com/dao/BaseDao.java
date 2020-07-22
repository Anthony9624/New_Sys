package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BaseDao {
    
	// 获取连接
	protected Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			// 2.建立连接
			conn = DriverManager
					.getConnection(
							"jdbc:mysql://localhost:3306/newfile?characterEncoding=utf8",
							"root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 关闭连接
	protected void closeAll(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
