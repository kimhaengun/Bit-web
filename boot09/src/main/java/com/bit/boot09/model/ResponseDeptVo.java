package com.bit.boot09.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResponseDeptVo {

	private int deptno;
	private String dname;
	private String loc;
	
}
