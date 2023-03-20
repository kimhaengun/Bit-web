package com.bit.boot05.domain;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bit.boot05.domain.entity.Dept2;

public interface DeptRepo extends JpaRepository<Dept2, Integer> {

}
