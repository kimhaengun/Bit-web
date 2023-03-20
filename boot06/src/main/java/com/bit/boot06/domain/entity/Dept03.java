package com.bit.boot06.domain.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GeneratorType;

import com.bit.boot06.domain.ResponseDeptVo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
//@Table(name="dept33") //테이블 명 변경
@Table(name="dept03") //테이블 명 변경

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class Dept03 {
	@Id //pk 설정
//	@GeneratedValue(strategy = GenerationType.AUTO) //auto_increment
	private long deptno;
	
//	@Column(name="domainname", columnDefinition = "varchar(8) default '제목없음' ", nullable = false)  //nullable = false --> not null
	@Column(columnDefinition = "varchar(8)")
	private String dname;
	
//	@Column(name="location", columnDefinition = "text not null")
	private String loc;
	
	public ResponseDeptVo getEntity() {
		return ResponseDeptVo.builder().deptno(deptno).dname(dname).loc(loc).build();
	}
}
