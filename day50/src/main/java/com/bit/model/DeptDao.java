package com.bit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class DeptDao {
	Logger log = Logger.getLogger(this.getClass().getCanonicalName());
	Connection conn;
	public List<DeptDto> selectAll() throws SQLException{
		String sql="select * from dept";
		List<DeptDto> list = new ArrayList<DeptDto>();
		try(
				Connection conn = this.conn;
				PreparedStatement pstmt=conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				){
			while(rs.next()) {
				DeptDto bean = new DeptDto();
				bean.setDeptno(rs.getInt("deptno"));
				bean.setDname(rs.getString("dname"));
				bean.setLoc(rs.getString("loc"));
				log.info(bean.toString());
				list.add(bean);
			}
		}
		return list;
	}
}
