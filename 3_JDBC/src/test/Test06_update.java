package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.JDBCUtil;

public class Test06_update {
	public static void main(String[] args) {
		String sql = "update book set title=?, price=? where bookno=?";
		
		Connection con = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int row = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql); 
			//?셋팅작업
			ps.setString(1, "JAVA");
			ps.setInt(2, 2200);
			ps.setInt(3, 12);
			//실행
			row = ps.executeUpdate();
			System.out.println("update row : "+row);
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
