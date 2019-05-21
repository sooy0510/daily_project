package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.JDBCUtil;

public class Test07_select {
	public static void main(String[] args) {
		String sql = "select * from book";
		String upsql = "update book set author=?"; 
		
		Connection con = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int row = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(upsql);
			//?셋팅작업
			ps.setString(1, "LeeSooyeon");
			//실행
			row = ps.executeUpdate();
			System.out.println("update row : "+row);			
			
			ps = con.prepareStatement(sql); 
			//실행
			rs = ps.executeQuery();
			///System.out.println("select row : "+row);
			while(rs.next()) {
				System.out.print(rs.getString("bookno")+"   ");
				System.out.print(rs.getString("title")+"   ");
				System.out.print(rs.getString("author")+"   ");
				System.out.print(rs.getString("price")+"   ");
				System.out.print(rs.getDate("pubdate")+"   ");
				System.out.println();
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
	}
}
