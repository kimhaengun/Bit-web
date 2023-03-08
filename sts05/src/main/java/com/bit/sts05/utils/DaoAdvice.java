package com.bit.sts05.utils;

import org.aspectj.lang.JoinPoint;

public class DaoAdvice{

	public void afterReturning(JoinPoint thisJoinPoint,Object rv){
		System.out.println("afterReturn....");
		System.out.println(rv); //junit 결과 값
	}
	
	public void afterThrowingTargetMethod(JoinPoint thisJoinPoint, Exception ex) throws Exception{
		System.out.println(ex.toString());
	}
	public void afterTargetMethod(JoinPoint join) {
		System.out.println(join.getThis());
	}
}