package com.bit.boot04.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface DeptMapper {
	@Select("select * from dept")
	List<DeptVo> findAll();
	
	@Select("select * from dept where deptno=#{pk}")
	DeptVo findOne(int pk);
	
	@Insert("insert into dept values (#{deptno}, #{dname}, #{loc})")
	void insertOne(DeptVo bean);
	
	@Update("update dept set dname=#{dname}, loc=#{loc} where deptno=#{deptno}")
	int updateOne(DeptVo bean);
	
	@Delete("delete from dept where deptno=#{pk}")
	int deleteOne(int pk);
}
