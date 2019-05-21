package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.stream.Stream;

import javax.swing.JOptionPane;

import util.JDBCUtil;

public class EmpManager {
	public void printEmployee(String jobs[]) {
		//String job1 = JOptionPane.showInputDialog("1.업무명을 입력하세요.");
		//String job2 = JOptionPane.showInputDialog("2.업무명을 입력하세요.");
		
		String sql = "select e.employee_id 사번, e.first_name 이름, e.salary 연봉"
				+ " from employees e, jobs j"
				+ " where e.job_id = j.job_id"
				+ " and j.job_title in (?,?)";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, jobs[0]);
			ps.setString(2, jobs[1]);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				System.out.print(rs.getString(1)+"   ");
				System.out.print(rs.getString(2)+"   ");
				System.out.print(rs.getString(3)+"   ");
				System.out.println();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, null, rs);
		}
	
	}
}
