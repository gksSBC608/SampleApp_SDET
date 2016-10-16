package com.mindtree.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.mindtree.service.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mindtree.entity.Employee;
import com.mindtree.exceptions.DaoException;

/**
 * Servlet implementation class HomeController
 */
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Service service;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeController() {
		service = new ServiceImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);

	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession(false);
		String uri = request.getRequestURI();
		if(uri.endsWith("addEmployeeDetail.do"))
		{
			String name = request.getParameter("name");
			String mid = request.getParameter("mid");
			String competency = request.getParameter("comp");
			String subpractice = request.getParameter("s_prac");
			String vertical = request.getParameter("vert");

			Employee emp = new Employee(name, mid, competency, subpractice, vertical);
			boolean b;
			try {
				b = service.addEmployee(emp);
				if (b == true) {
					session.setAttribute("addStatus", "Employee details added successfully.");
				}
			} catch (DaoException e) {
				session.setAttribute("addStatus", e.getMessage());

			}
			response.sendRedirect("addEmployeeDetails.jsp");

		}

		else if(uri.endsWith("getEmployeeDetails.do"))
		{
			String mid = request.getParameter("mid");
			List<Employee> empList = new ArrayList<Employee>();
			try {
				Employee emp = service.getEmployeeDetail(mid);
				if(emp!=null)
				{
					empList.add(emp);
					
				}
				session.setAttribute("employeeData", empList);
				
			} catch (DaoException e) {
				session.setAttribute("fetchStatus", e.getMessage());
			}
			response.sendRedirect("viewEmployeeDetails.jsp");

		}
	}

}
