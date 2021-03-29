package com.laptrinhjavaweb.paging;

import com.laptrinhjavaweb.sort.Sorter;

public class PageRequest implements Pageble {
	
	private Integer page; 
	private Integer maxPageItem;
	private Sorter sorter;
	
	public PageRequest(Sorter sorter, Integer page, Integer maxPageItem) {
		this.page = page;
		this.maxPageItem = maxPageItem;
		this.sorter = sorter;
	}

	public Integer getMaxPageItem() {
		return maxPageItem;
	}

	public void setMaxPageItem(Integer maxPageItem) {
		this.maxPageItem = maxPageItem;
	}

	public Sorter getSorter() {
		if (this.sorter != null) {
			return this.sorter;
		}
		return null;
	}

	public void setSorter(Sorter sorter) {
		this.sorter = sorter;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	@Override
	public Integer getPage() {
		return this.page;
	}

	@Override
	public Integer getOffset() {
		if (this.page != null && this.maxPageItem != null) {
			return (this.page - 1) * this.maxPageItem;
		} else {
			return null;
		}
	}

	@Override
	public Integer getLimt() {
		return maxPageItem;
	}
	

}
