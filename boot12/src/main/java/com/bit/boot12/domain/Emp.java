package com.bit.boot12.domain;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.Id;

import com.bit.boot12.model.EmpVo;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class Emp{
	@Id
	private int empno;
	private int mgr;
	private String ename, job;
	private LocalDate hiredate;
	
	public EmpVo getEntity() {
		return EmpVo.builder()
				.empno(empno)
				.mgr(mgr)
				.ename(ename)
				.job(job)
				.hiredate(hiredate)
				.build();
	}
}
