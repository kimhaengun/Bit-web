package com.bit.boot02.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeptVo {
	private int deptno;
	private String dname;
	private String loc;
	
}
