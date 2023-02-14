package com.bit.util;

import java.sql.SQLException;
import java.util.List;

import com.bit.model.EmpDao;
import com.bit.model.EmpDto;

public class DaoTest {

	static EmpDto target = new EmpDto();
 	static EmpDao dao = new EmpDao();
	public static void main(String[] args) throws SQLException {
		target.setEmpno(8888);
		target.setEname("user8");
		target.setSal(1000);
		//데이터 불러오기
		getListTest();
		//데이터 삽입
		pushListTest();
		//확인
		getOneTest();
		//수정
		editOne();
		//한명 찾기(수정 확인)
		getOneTest();
		//삭제
		deleteOne();
		try {
			getOneTest();
		} catch (Exception e) {
			System.out.println("삭제 성공");
		}
	}
	public static void deleteOne() throws SQLException {
		System.out.println(dao.deleteOne(target.getEmpno())>0);
	}
	public static void editOne() throws SQLException {
		target.setEname("user87_1");
		dao = new EmpDao();
		System.out.println(dao.editOne(target.getEname(), target.getSal(), target.getComm(), target.getMgr(),target.getEmpno())>0);
		
	}
	public static void getOneTest() throws SQLException {
		dao = new EmpDao();
		EmpDto bean = dao.getOne(target.getEmpno());
		System.out.println(bean!=null);
		System.out.println(bean.getEname().equals(target.getEname()));
		
	}
	public static void pushListTest() throws SQLException{
		dao = new EmpDao();
		System.out.println(dao.pushList(target.getEmpno(), target.getEname(), target.getSal())>0);
		
	}
	public static void getListTest() throws SQLException{
		dao = new EmpDao();
		List<EmpDto> list = dao.getList();
//		for (EmpDto bean : list) {
//			System.out.println(bean.toString());
//		}
		//null 체크
		System.out.println(list!=null);
		// 대용량 데이터일 경우 toString()으로 확인하기엔 데이터가 너무 많기 때문에 용량만 확인해보기
		System.out.println(list.size()>0);
		
		
	}
}
