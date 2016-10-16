/**
 * 
 */
package com.mindtree.entity;

/**
 * @author Gaurav
 *
 */
public class Employee {

	private String name;
	private String mid;
	private String competency;
	private String subpractice;
	private String vertical;

	/**
	 * 
	 */
	public Employee() {
		// TODO Auto-generated constructor stub
	}

	public Employee(String name, String mid, String competency,
			String subpractice, String vertical) {
		this.name = name;
		this.mid = mid;
		this.competency = competency;
		this.subpractice = subpractice;
		this.vertical = vertical;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getCompetency() {
		return competency;
	}

	public void setCompetency(String competency) {
		this.competency = competency;
	}

	public String getSubpractice() {
		return subpractice;
	}

	public void setSubpractice(String subpractice) {
		this.subpractice = subpractice;
	}

	public String getVertical() {
		return vertical;
	}

	public void setVertical(String vertical) {
		this.vertical = vertical;
	}

}
