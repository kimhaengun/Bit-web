package com.bit.sts06.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Getter
//@Setter
//@ToString
//@EqualsAndHashCode
//@NoArgsConstructor
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeptVo {
	private int deptno;
	private String dname;
	private String loc;
}
