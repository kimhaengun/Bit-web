package com.bit.boot12.model;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmpVo {
	private int empno;
	private int mgr;
	private String ename, job;
	private LocalDate hiredate;
}
