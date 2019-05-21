package service;

import java.util.List;

import vo.BookVO;

//인터페이스. 개발자는 자신이 쓰려고 하는 메소드 선언부만 알면된다
public interface BookService {
	List<BookVO> bookList();
	int addBook(BookVO vo) throws Exception;
}
