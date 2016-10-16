/**
 * 
 */
package com.mindtree.service;

import com.mindtree.dao.JDBCDao;
import com.mindtree.dao.JDBCDaoImpl;
import com.mindtree.entity.Employee;
import com.mindtree.exceptions.DaoException;

/**
 * @author Gaurav
 *
 */
public class ServiceImpl implements Service {
	JDBCDao dao;

	/**
	 * 
	 */
	public ServiceImpl() {
		dao = new JDBCDaoImpl();
	}

	@Override
	public boolean addEmployee(Employee emp) throws DaoException {
		try {
		return	dao.addEmployee(emp);
		} catch (DaoException e) {
			throw new DaoException(e.getMessage());
		}
	}

	@Override
	public Employee getEmployeeDetail(String mid) throws DaoException  {
		try {
			return dao.getEmployeeDetail(mid);
		} catch (DaoException e) {
			throw new DaoException(e.getMessage());
		}
	}

}
