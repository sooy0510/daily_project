package App;

import java.util.List;

import dao.BookDAO;
import service.BookService;
import service.BookServiceImpl;
import vo.BookVO;

//서비스만 보며 코딩한다
public class BookApp {

	
	public static void main(String[] args) {
		BookDAO dao = new BookDAO();
		BookService service = new BookServiceImpl(dao);
		
		BookVO user = new BookVO("dddoso","wow",80000000);
		try {
			service.addBook(user);
		} catch (Exception e) {
			System.out.println("등록 데이터 확인 필요"); 
			//e.printStackTrace();
		}
		
		if(service != null) {
			List<BookVO> list = service.bookList();
			list.forEach(i->System.out.println(i));
			
			
		}
	}

}
