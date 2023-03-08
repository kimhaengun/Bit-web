package com.bit.sts05.utils;

import java.util.ArrayList;

import org.aspectj.lang.ProceedingJoinPoint;

public class AroundAdvice {

	public Object aroundTargetMethod(ProceedingJoinPoint thisJoinPoint)
            throws Throwable {
		System.out.println("before~");
		Object obj=null;
		try {
			obj = thisJoinPoint.proceed();
			System.out.println("after~ returning.... return value:"+obj);
		}catch (Exception e) {
		
			System.out.println("after~ Throws");
		}
		System.out.println("after~");
		
		return obj;
		
	}
}
