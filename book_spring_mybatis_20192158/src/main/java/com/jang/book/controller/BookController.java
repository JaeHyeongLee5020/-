package com.jang.book.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jang.book.model.Book;
import com.jang.book.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String toBookFindView(Model model) {
		model.addAttribute("book", new Book());
		return "findBook";
	}

	@RequestMapping(value = "/find", method = RequestMethod.POST)
	public String onSubmit(@Valid Book book, BindingResult result, Model model) {
	
		if (result.hasFieldErrors("title")) {
			model.addAllAttributes(result.getModel());
			return "findBook";
		}
		try {
			Book findBook = this.bookService.getBook(book.getTitle());
			if (findBook != null) {
				model.addAttribute("findBook", findBook);
				System.out.println(findBook);
					return "bookInfo";
				} else {
					return "findBook";
			}
		} catch (Exception e) {
			result.rejectValue("title", "error.title.book", "책을 찾을 수 없습니다.");
			model.addAllAttributes(result.getModel());
			return "findBook";
		}
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		
		List<Book> list = this.bookService.getBookList();
		model.addAttribute("list", list);
		
		return "bookList";
	}
	

	@RequestMapping(value="/newUpdate")
	public String form(@RequestParam(value = "bno", required = false, defaultValue="0") int bno, Model model) throws Exception {
		if (bno > 0) {
			Book book = this.bookService.getBook(bno);
			
			System.out.println(book.getTitle());
			
			model.addAttribute("commandUrl", "editSave");
			model.addAttribute("book", book);
	
		} else {
			model.addAttribute("commandUrl", "addSave");
			model.addAttribute("book", new Book() );
		} 
		return "bookUp";
	}
	

	@RequestMapping(value="/addSave", method = RequestMethod.POST)
	public String add( @Valid Book book, BindingResult result, RedirectAttributes rea) throws Exception {
		
		if (result.hasErrors()) {
			rea.addAllAttributes(result.getModel());
			return "redirect:list";
			}	
			
			if (this.bookService.addBook(book) == 1) {
				rea.addFlashAttribute("message", "책이 추가 되었습니다.");
				return "redirect:list";
			} else {
				rea.addFlashAttribute("message", "책 추가에 실패 하였습니다.");
				return "redirect:list"; 
			
			}
		
	}	
	
	@RequestMapping(value="/editSave", method = RequestMethod.POST)
	public String update( @ModelAttribute("book") @Valid Book book, BindingResult result, RedirectAttributes rea) throws Exception {

		if (result.hasErrors()) {
			rea.addAllAttributes(result.getModel());
			return "redirect:list";
			}	

		if (this.bookService.updateBook(book) == 1) {
				rea.addFlashAttribute("message", "수정 완료 되었습니다.");
				return "redirect:list";
			} else {
				rea.addFlashAttribute("message", "수정 실패 하였습니다.");
				return "redirect:list"; 
			
			}
		
	}

	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String delete(@RequestParam(value = "bno", required = false) int bno, RedirectAttributes rea) throws Exception {

		if (this.bookService.deleteBook(bno) == 1) {
				rea.addFlashAttribute("message", "삭제되었습니다.");
				return "redirect:list";
			} else {
				rea.addFlashAttribute("message", "삭제 실패하였습니다.");
				return "redirect:list"; 
			
			}
		
	}
	
	@RequestMapping(value="/view")
	public String view(@RequestParam(value = "bno", required = false, defaultValue="0") int bno, Model model) throws Exception {
		if (bno > 0) {
			Book book = this.bookService.getBook(bno);
			
			System.out.println(book.getTitle());
			
			model.addAttribute("commandUrl", "editSave");
			model.addAttribute("book", book);
	
		} else {
			
		} 
		return "bookView";
	}
}
