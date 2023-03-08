package com.bit.sts05.model;

import java.util.Objects;

public class DeptVo {
	private int deptno;
	private String dname;
	private String loc;
	
	@Override
	public String toString() {
		return "DeptVo [deptno=" + deptno + ", dname=" + dname + ", loc=" + loc + "]";
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
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public DeptVo() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		return Objects.hash(deptno, dname, loc);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DeptVo other = (DeptVo) obj;
		return deptno == other.deptno && Objects.equals(dname, other.dname) && Objects.equals(loc, other.loc);
	}
	public DeptVo(int deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}

	
}
