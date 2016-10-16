package com.mindtree.service;

import com.mindtree.entity.Employee;
import com.mindtree.exceptions.DaoException;

public interface Service {
 
	boolean addEmployee(Employee emp) throws DaoException;
	
	Employee getEmployeeDetail(String mid) throws DaoException;
}
