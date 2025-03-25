package com.jang.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.book.mapper.BookMapper;
import com.jang.book.model.Book;

@Service(value = "bookService")
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bookMapper;
	
	@Autowired
	public void setBookDao(BookMapper bookDaoImpl) {
		this.bookMapper= bookDaoImpl;
	}
	
	@Override
	public Book getBook(String title) {
		// TODO Auto-generated method stub
		return bookMapper.getBook(title);
	}

	@Override
	public List<Book> getBookList() {
		
		return this.bookMapper.getBookList();
	}

	public BookMapper getBookMapper() {
		return bookMapper;
	}

	public void setBookMapper(BookMapper bookMapper) {
		this.bookMapper = bookMapper;
	}

	@Override
	public Book getBook(int bno) {

		
		return this.bookMapper.getBookby(bno);
	}

	@Override
	public int addBook(Book book) {
		System.out.println("service="+book.getTitle());
		book.setBno(this.bookMapper.nn());
		
		return this.bookMapper.addBook(book);
	}
	
	@Override
	public int updateBook(Book book) {
		
		return this.bookMapper.updateBook(book);
	}

	@Override
	public int deleteBook(int bno) {
		
		return this.bookMapper.deleteBook(bno);
	}
}

