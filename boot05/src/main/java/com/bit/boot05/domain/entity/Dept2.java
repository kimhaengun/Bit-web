package com.bit.boot05.domain.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Getter;
import lombok.ToString;

@Entity
@ToString
@Getter
public class Dept2 { //DB와 연결된 객체 - Entity
	@Id //pk 설정
	private int deptno;
	private String dname;
	private String loc;
}
