package com.mindtree.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mindtree.entity.Employee;
import com.mindtree.exceptions.DBUtilityException;
import com.mindtree.exceptions.DaoException;

public class JDBCDaoImpl implements JDBCDao {

	public JDBCDaoImpl() {
	}

	@Override
	public boolean addEmployee(Employee emp) throws DaoException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DBUtil.getConnection();
		} catch (DBUtilityException e1) {
			throw new DaoException(e1.getMessage(), e1);
		}
		String sql = "insert into employees values(?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, emp.getMid());
			ps.setString(2, emp.getName());
			ps.setString(3, emp.getCompetency());
			ps.setString(4, emp.getSubpractice());
			ps.setString(5, emp.getVertical());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new DaoException(e.getMessage(), e);
		} finally {

			try {
				DBUtil.releaseResource(ps);
				DBUtil.releaseResource(con);
			} catch (DBUtilityException e) {

				throw new DaoException(e.getMessage());
			}
		}
	}

	@Override
	public Employee getEmployeeDetail(String mid) throws DaoException {

		String sql = "select * from employees where mid=?";
		Employee emp = null;
		Connection con = null;
		try {
			con = DBUtil.getConnection();
		} catch (DBUtilityException e1) {
			throw new DaoException(e1.getMessage(), e1);
		}
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setString(1, mid);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				String competency = rs.getString("competency");
				String subpractice = rs.getString("sub_practice");
				String vertical = rs.getString("vertical");
				emp = new Employee(name, mid, competency, subpractice, vertical);
			}
			return emp;
		} catch (SQLException e) {
			throw new DaoException("Unable to retrieve data");
		} finally {

			try {
				DBUtil.releaseResource(st);
				DBUtil.releaseResource(con);
			} catch (DBUtilityException e) {

				throw new DaoException(e.getMessage());
			}
		}

	}

}
