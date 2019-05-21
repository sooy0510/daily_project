package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.JDBCUtil;
import vo.BookVO;

public class Test08_select_map {
	public static void main(String[] args) {
		String sql = "select * from book";
		
		Connection con = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int row = 0; 
		
		Map<Integer, BookVO> books = new HashMap<Integer, BookVO>();
		
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql); 
			//실행
			rs = ps.executeQuery();
			///System.out.println("select row : "+row);
			while(rs.next()) {
//				System.out.print(rs.getString("bookno")+"   ");
//				System.out.print(rs.getString("title")+"   ");
//				System.out.print(rs.getString("author")+"   ");
//				System.out.print(rs.getString("price")+"   ");
//				System.out.print(rs.getDate("pubdate")+"   ");
//				System.out.println();
				BookVO book = new BookVO();
				book.setPrice(rs.getInt("price"));
				book.setAuthor(rs.getString("author"));
				book.setBookno(rs.getInt("bookno"));
				book.setTitle(rs.getString("title"));
				book.setPubdate(rs.getString("pubdate").toString());
				//System.out.println(book);
				books.put(book.getBookno(), book);
			}
			//결과값핸들링
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			JDBCUtil.close(con, st, rs);
		}
		

		/*
		 * for(Book item:books) { System.out.println(item); }
		 */
		
		System.out.println("-----------------------------------");
		
		for(int b : books.keySet()) {    
			System.out.println(b+"   "+books.get(b));
		}
		
		
		books.forEach((k,v) -> System.out.println(k+"   "+v));
	}
}
