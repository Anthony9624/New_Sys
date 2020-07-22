package com.entity;

import java.util.List;

public class PageNews {
	private int pagesize = 10;
	private int pagenum = 1;
	private int totals;
	private int totalpages;
	private List<News> list;

	public PageNews() {
	}

	public PageNews(int pagesize, int pagenum, int totals, int totalpages,
			List<News> list) {
		super();
		this.pagesize = pagesize;
		this.pagenum = pagenum;
		this.totals = totals;
		this.totalpages = totalpages;
		this.list = list;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
		setTotalpages();
	}

	public int getPagenum() {
		return pagenum;
	}

	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}

	public int getTotals() {
		return totals;
	}

	public void setTotals(int totals) {
		this.totals = totals;
		setTotalpages();
	}

	public int getTotalpages() {
		return totalpages;
	}

	// ��Ӧͨ�����ֵ�����Ǽ������
	public void setTotalpages() {
		int pages = totals / pagesize;
		if (totals % pagesize != 0) {
			pages++;
		}
		this.totalpages = pages;
	}

	public List<News> getList() {
		return list;
	}

	public void setList(List<News> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "PageNews [pagesize=" + pagesize + ", pagenum=" + pagenum
				+ ", totals=" + totals + ", totalpages=" + totalpages
				+ ", list=" + list + "]";
	}

}
