/**
 * 
 */
package com.mindtree.dao;

import com.mindtree.entity.Employee;
import com.mindtree.exceptions.DaoException;


public interface JDBCDao {

	boolean addEmployee(Employee emp) throws DaoException;

	Employee getEmployeeDetail(String mid) throws DaoException;

}
