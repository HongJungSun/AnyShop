package com.syu.anyshop.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class ControllerLoggingAspect {

	// controller 패키지에 있는 모든 메소드 실행 전 수행
	@Before("execution(* com.syu.anyshop..*.*(..))")
	public void logging() {
		
		System.out.println("로깅시작");
	}
}
