package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.model.NewsModel;
import com.laptrinhjavaweb.paging.Pageble;

public interface INewsService {
	List<NewsModel> findByCategoryId(Long categoryId);
	NewsModel save(NewsModel newsModel);				// Them bai viet va luu vao db
	NewsModel update(NewsModel updateNews);
	void delete(long ids[]);
	List<NewsModel> findAll(Pageble pageble);
	int getTotalItem();
	NewsModel findOne(Long id);
	List<NewsModel> findByCategoryId(Pageble pageble, Long categoryId);
}
