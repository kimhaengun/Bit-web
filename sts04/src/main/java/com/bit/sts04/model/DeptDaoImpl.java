package com.bit.sts04.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.support.DefaultTransactionStatus;
import org.springframework.transaction.support.TransactionOperations;

public class DeptDaoImpl extends JdbcDaoSupport implements DeptDao {
	//병렬처리
	PlatformTransactionManager transactionManager;
	public void setTransactionManager(PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
	}
	
	
	@Override
	public List<DeptVo> findAll(){
		String sql ="select * from dept";
		
		return getJdbcTemplate().query(sql, new RowMapper<DeptVo>() {

			@Override
			public DeptVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				return new DeptVo(rs.getInt("deptno"), rs.getString("dname"), rs.getString("loc"));
			}
			
		});
	}
	@Override
	   public DeptVo findOne(int key) {
	      String sql="select * from dept where deptno =?";
	      return getJdbcTemplate().queryForObject(sql, new RowMapper<DeptVo>() {
	         @Override
	         public DeptVo mapRow(ResultSet rs, int rowNum) throws SQLException {
	            return new DeptVo(
	                     rs.getInt("deptno")
	                     ,rs.getString("dname")
	                     ,rs.getString("loc")
	                  );
	         }
	      },key);
	   }
	@Override
	public void insertOne(final DeptVo bean) {
		final String sql = "UPDATE dept_seq SET num=num+1";
		final String sql2 = "INSERT INTO dept VALUE ((SELECT num FROM dept_seq), CONCAT(?,(SELECT num FROM dept_seq)), ?)";
		// 병렬처리 - transaction 처리
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		//status로 묶이면 병렬 처리 한다라는 정의 = 동기화 = key처럼 사용
		// status로 묶으면 commit과 rollback 정의는 필수
		try {
			PreparedStatementCreator psc = new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					// TODO Auto-generated method stub
					System.out.println("1 : "+con.hashCode());
					//transactionManager를 사용하면 두 Connection의 해쉬값이 같아짐
					return con.prepareStatement(sql);
				}
			};
			getJdbcTemplate().update(psc);
			
			psc = new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					// TODO Auto-generated method stub
					PreparedStatement pstmt = con.prepareStatement(sql2);
					pstmt.setString(1, bean.getDname());
					pstmt.setString(2, bean.getLoc());
					System.out.println("2 : "+con.hashCode());
					//transactionManager를 사용하면 두 Connection의 해쉬값이 같아짐
					return pstmt;
				}
			};
			getJdbcTemplate().update(psc);	
			transactionManager.commit(status );
		}catch (Exception e) {
			// TODO: handle exception
			transactionManager.rollback(status);
		}
	}
	@Override
	public int updateOne(DeptVo bean) {
		String sql = "update dept set dname=?, loc=? where deptno=?";
		
		return getJdbcTemplate().update(sql,bean.getDname(),bean.getLoc(),bean.getDeptno());
	}
	@Override
	public int deleteOne(int key) {
		String sql = "delete from dept where deptno=?";
		
		return getJdbcTemplate().update(sql, key);
	}
}
