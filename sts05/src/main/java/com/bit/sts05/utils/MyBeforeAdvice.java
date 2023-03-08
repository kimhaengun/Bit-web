package com.bit.sts05.utils;

import org.aspectj.lang.JoinPoint;

public class MyBeforeAdvice {

	public void before(JoinPoint point) {
		System.out.println("before 실행 : "+point.getSignature().getName());
		System.out.println("before 실행 : "+point.getArgs());
		System.out.println("before 실행 : "+point.getTarget());
	}
}
