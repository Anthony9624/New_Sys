package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.entity.News;
import com.entity.PageNews;

public class NewsDao extends BaseDao {
	// 鏍规嵁鏍囬鏌ユ壘鏂伴椈鍐呭
	public News getNewsByTitle(String title) {
		News news = new News();
		try {
			Connection con = getConnection();
			String sql = "SELECT * FROM news WHERE title=?";// 瀹氫箟sql璇彞
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, title);// 缁檚ql璇彞鐨勯棶鍙疯祴锟�
			ResultSet rs = ps.executeQuery();// 鎵ц鏌ヨ
			// 澶勭悊鏌ヨ缁撴灉
			while (rs.next()) {
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setTime(rs.getString("time"));

			}
			closeAll(con, ps, rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return news;
	}

	// 鏍规嵁id鏌ユ壘鏂伴椈鍐呭
	public News getNewsById(int id) {
		News news = new News();
		try {
			Connection con = getConnection();
			String sql = "SELECT * FROM news WHERE id=?";// 瀹氫箟sql璇彞
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);// 缁檚ql璇彞鐨勯棶鍙疯祴锟�
			ResultSet rs = ps.executeQuery();// 鎵ц鏌ヨ
			// 澶勭悊鏌ヨ缁撴灉
			while (rs.next()) {
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setTime(rs.getString("time"));
			}
			closeAll(con, ps, rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return news;
	}

	public List<News> getAll() {
		List<News> list = new ArrayList<News>();
		try {
			Connection con = getConnection();
			String sql = "SELECT * FROM news order by id desc";// 瀹氫箟sql璇彞
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();// 鎵ц鏌ヨ
			// 澶勭悊鏌ヨ缁撴灉
			while (rs.next()) {
				News news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setTime(rs.getString("time"));
				list.add(news);

			}
			closeAll(con, ps, rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	// 淇敼閭欢鐨勫凡璇荤姸锟�
	public void updateNews(String title, String content) {
		NewsDao nd = new NewsDao();
		News news = nd.getNewsByTitle(title);
		news.setContent(content);
		try {
			Connection con = getConnection();
			String sql = "update news set content=? where title=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, news.getContent());
			ps.setString(2, news.getTitle());
			ps.executeUpdate();
			closeAll(con, ps, null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 娣诲姞鏂伴椈
	public void addNews(News news) {

		try {
			Connection con = getConnection();
			String sql = "insert into news(title,content,time) values(?,?,?);";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, news.getTitle());// 缁檚ql璇彞鐨勯棶鍙疯祴锟�
			ps.setString(2, news.getContent());
			ps.setString(3, news.getTime());
			ps.executeUpdate();
			closeAll(con, ps, null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 鏍规嵁鏍囬鍒犻櫎閭欢
	public void delNews(int id) {

		try {
			Connection con = getConnection();
			String sql = "delete from news where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);// 缁檚ql璇彞鐨勯棶鍙疯祴锟�
			ps.executeUpdate();
			closeAll(con, ps, null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public PageNews getNewsByPage(int size, int no) {
		NewsDao nd = new NewsDao();
		List<News> list = new ArrayList<News>();
		try {
			Connection con = getConnection();
			String sql = "SELECT * FROM news order by id desc limit ?,?";// 瀹氫箟sql璇彞
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, size * no - size);
			ps.setInt(2, size);
			ResultSet rs = ps.executeQuery();// 鎵ц鏌ヨ
			// 澶勭悊鏌ヨ缁撴灉
			while (rs.next()) {
				News news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setTime(rs.getString("time"));
				list.add(news);

			}
			closeAll(con, ps, rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		PageNews pn = new PageNews();
		pn.setPagesize(size);
		pn.setPagenum(no);
		pn.setList(list);
		pn.setTotals(nd.getAll().size());

		return pn;
	}

	public static void main(String[] args) {
		NewsDao nd = new NewsDao();
		// System.out.println(nd.getNewsById(12).toString());
		PageNews pn = new PageNews();
		pn = nd.getNewsByPage(4, 1);

		System.out.println(pn);
	}

}
