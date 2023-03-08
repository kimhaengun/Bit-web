package com.bit.sts06.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeptDaoMybatisImpl implements DeptDao {

	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<DeptVo> findAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("dept.selectAll");
	}

	@Override
	public DeptVo findObject(int key) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dept.selectOne",key);
	}

	@Override
	public void insertOne(DeptVo bean) {
		// TODO Auto-generated method stub
		sqlSession.insert("dept.insertOne",bean);
	}

	@Override
	public int updateOne(DeptVo bean) {
		// TODO Auto-generated method stub
		return sqlSession.update("dept.updateOne",bean);
	}

	@Override
	public int deleteOne(int key) {
		// TODO Auto-generated method stub
		return sqlSession.delete("dept.deleteOne",key);
	}

}
