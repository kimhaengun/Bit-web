package com.bit.boot06.domain.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Emp03 {

	@Id
	private int empno;
	private String ename;
	private String job;
	private LocalDateTime hiredate;
	
	@OneToOne
	@JoinColumn(name =  "deptno")
	private Dept03 dept;
}
