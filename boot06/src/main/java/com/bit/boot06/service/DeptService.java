package com.bit.boot06.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.bit.boot06.domain.DeptRepo;
import com.bit.boot06.domain.RequestDeptVo;
import com.bit.boot06.domain.ResponseDeptVo;
import com.bit.boot06.domain.entity.Dept03;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class DeptService {
	private final DeptRepo deptRepo;
	
	ResponseDeptVo insertOne(RequestDeptVo bean) {
		Dept03 entity = Dept03.builder().deptno(bean.getDeptno())
															 .dname(bean.getDname()) 
															 .loc(bean.getLoc())
															 .build();
															 
		return deptRepo.save(entity).getEntity();
	}
	
	//목록
	List<ResponseDeptVo> selectAll(){
		List<ResponseDeptVo> list=new ArrayList<>();
//		deptRepo.myall().forEach(bean->list.add(bean.getEntity()));
//		deptRepo.findAll(PageRequest.of(0, 2)).forEach(bean->list.add(bean.getEntity()));
//		deptRepo.findAll(Pageable.ofSize(2).withPage(0)).forEach(bean->list.add(bean.getEntity()));
//		deptRepo.findAll(Sort.by("deptno").descending()).forEach(bean->list.add(bean.getEntity()));
//		deptRepo.findAllByOrderByDeptnoDesc().forEach(bean->list.add(bean.getEntity()));
//		for(Dept03 bean : deptRepo.findAll())
		Sort sort=Sort.by("deptno").descending();
		for(Dept03 bean : deptRepo.myall(5555))
			list.add(ResponseDeptVo.builder()
					.deptno(bean.getDeptno())
					.dname(bean.getDname())
					.loc(bean.getLoc())
					.build());
		return list;
	}

	ResponseDeptVo selectOne(Long deptno) {
		return deptRepo.findById(deptno).get().getEntity();
//		return deptRepo.findByDnameContaining("2").get().getEntity();
	}
	
	//수정
	ResponseDeptVo updateOne(RequestDeptVo bean) {
		// 1.deptno를 통해 해당 유저 정보 가져오기
		Optional<Dept03> op =  deptRepo.findById(bean.getDeptno());
		//해당 정보가 없을 경우 RuntimeException
		if(op.isEmpty())throw new RuntimeException("존재하지 않음");
		//2.정보가 있을 경우 save()함수를 통해 다시 save
		return deptRepo.save(Dept03.builder()
											.deptno(op.get().getDeptno()) //안바꿀 필드 (where 조건)
											.dname(bean.getDname()) //변경 값
											.loc(bean.getLoc()) //변경 값
											.build()).getEntity();
	}
	
	//삭제
	void deleteOne(Long deptno) {
		Optional<Dept03> op =  deptRepo.findById(deptno);
		if(op.isEmpty())throw new RuntimeException("존재하지 않음");
		// 방법 1.ById
//		deptRepo.deleteById(deptno);
		// 방법 2.findById한 값으로 삭제하기
		// 방법 2가 안전
		deptRepo.delete(op.get());
	}
	
	//페이징
	List<ResponseDeptVo> selectAll(int pageNum, int limit){
		List<ResponseDeptVo> list = new ArrayList<>();
//		Pageable page = PageRequest.of(pageNum, limit);
//		Pageable page = PageRequest.of(pageNum, limit,Sort.by("deptno").descending()); //내림차순
		Pageable page = PageRequest.ofSize(limit).withPage(pageNum); //오름차순
		deptRepo.findAll(page).forEach(ele->list.add(ele.getEntity()));
		return list;
	}

}


