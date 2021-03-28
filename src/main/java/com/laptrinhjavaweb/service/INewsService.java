package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.model.NewsModel;

public interface INewsService {
	List<NewsModel> findByCategoryId(Long categoryId);
	NewsModel save(NewsModel newsModel);				// Them bai viet va luu vao db
	NewsModel update(NewsModel updateNews);
	void delete(long ids[]);
}
