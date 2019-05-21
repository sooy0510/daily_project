package service;

import java.util.List;

import dao.BookDAO;
import vo.BookVO;

//서비스 레이어 구축완료
public class BookServiceImpl implements BookService{

	private BookDAO dao = null;  //어떤 dao를 쓸지는 런타임에 결정
	
	public BookServiceImpl() {
		super();
	}

	public BookServiceImpl(BookDAO dao) {
		super();
		this.dao = dao;
	}

	public BookDAO getDao() {
		return dao;
	}

	public void setDao(BookDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<BookVO> bookList() {
		// TODO Auto-generated method stub
		return dao.bookList();
	}

	@Override
	public int addBook(BookVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.addBook(vo);
	}
	
}
