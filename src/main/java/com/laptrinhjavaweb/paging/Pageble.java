package com.laptrinhjavaweb.paging;

import com.laptrinhjavaweb.sort.Sorter;

public interface Pageble {
	Integer getPage();
	Integer getOffset();
	Integer getLimt();
	Sorter getSorter();
}
