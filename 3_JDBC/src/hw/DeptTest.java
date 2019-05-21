package hw;

import java.util.List;

import dao.BookDAO;
import service.BookService;
import service.BookServiceImpl;
import vo.BookVO;

public class DeptTest {

	public static void main(String[] args) {
		DeptManager mdept = new DeptManager();	
		List<DeptVO> list = mdept.getDepts();
		list.forEach(i->System.out.println(i));
	}
}
