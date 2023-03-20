package com.bit.boot06.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class RequestDeptVo {

	private long deptno;
	private String dname;
	private String loc;
	
}
