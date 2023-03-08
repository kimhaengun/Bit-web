package com.bit.sts04.model;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class DeptDaoIbatisImpl extends SqlMapClientDaoSupport implements DeptDao {

	@Override
	public List<DeptVo> findAll() {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().queryForList("selectAll");
	}

	@Override
	public DeptVo findOne(int key) {
		// TODO Auto-generated method stub
		return (DeptVo) getSqlMapClientTemplate().queryForObject("selectOne",key);
	}

	@Override
	public void insertOne(DeptVo bean) {
		// TODO Auto-generated method stub

	}

	@Override
	public int updateOne(DeptVo bean) {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().update("updateOne",bean);
	}

	@Override
	public int deleteOne(int key) {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().delete("deleteOne",key);
	}

}
