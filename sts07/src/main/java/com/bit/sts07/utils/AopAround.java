package com.bit.sts07.utils;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AopAround {

	@Around(value = "execution(* com.bit.sts07.model.DeptDao.*(..))")
	public Object around(ProceedingJoinPoint join) {
		Object obj = null;
		System.out.println("AOP탐????????????????????????");
		try {
			System.out.println("params:"+Arrays.toString(join.getArgs()));
			obj = join.proceed();
			System.out.println("result : "+obj);
		} catch (Throwable e) {
			System.out.println("error : "+e);
		}
		
		return obj;
	}
}
