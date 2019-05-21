package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.JDBCUtil;

public class Test02 {

	public static void main(String[] args) {
		System.out.println("탐색");
		String sql = "select dname, count(*) 인원수, round(avg(sal),2) 평균"
				+ " from emp,dept where emp.deptno=dept.deptno"
				+ " group by dname"
				+ " order by 평균";
		//emp 부서별 평균 급여(소수점 두자리 표시)와 인원수를 구해서 출력
		
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		
		try {
			con = JDBCUtil.getConnection();
			st = con.createStatement();
			rs =  st.executeQuery(sql);
			
			while(rs.next()) {
				System.out.print(rs.getString("dname")+"   ");
				System.out.print(rs.getString("인원수")+"   ");
				System.out.print(rs.getString("평균")+"   ");
				System.out.println();
			}
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			JDBCUtil.close(con, st, rs);
		}
		System.out.println(" ** END ** ");
		
		
	}

}
