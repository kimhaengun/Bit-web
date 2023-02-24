package com.bit.model;

public class DeptDto {
	private int deptno;
	private String dname;
	private String ename;
	
	public DeptDto() {
		// TODO Auto-generated constructor stub
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getename() {
		return ename;
	}
	public void setename(String ename) {
		this.ename = ename;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + deptno;
		result = prime * result + ((dname == null) ? 0 : dname.hashCode());
		result = prime * result + ((ename == null) ? 0 : ename.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DeptDto other = (DeptDto) obj;
		if (deptno != other.deptno)
			return false;
		if (dname == null) {
			if (other.dname != null)
				return false;
		} else if (!dname.equals(other.dname))
			return false;
		if (ename == null) {
			if (other.ename != null)
				return false;
		} else if (!ename.equals(other.ename))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "DeptDto [deptno=" + deptno + ", dname=" + dname + ", ename=" + ename + "]";
	}
	public DeptDto(int deptno, String dname, String ename) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.ename = ename;
	}
	
	
}
