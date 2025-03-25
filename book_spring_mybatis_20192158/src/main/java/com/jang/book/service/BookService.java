package com.jang.book.service;

import java.util.List;

import com.jang.book.model.Book;

public interface BookService {
	Book getBook(String title);
	
	List<Book> getBookList();

	Book getBook(int bno);
	int addBook(Book book);
	int updateBook(Book book);
	int deleteBook(int bno);
}
