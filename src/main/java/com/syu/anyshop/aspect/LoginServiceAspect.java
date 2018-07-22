package com.syu.anyshop.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LoginServiceAspect {

	@Pointcut("execution(* com.syu.anyshop.login.LoginService.*(..))")
	private void loginService() {}

	// (메소드 이름 체크)login 패키지에 있는 Service메소드 실행 될때
	@Around("loginService()")
	public Object around(ProceedingJoinPoint pjp) throws Throwable {

		System.out.println("   1.호출 메소드 : " + pjp.getSignature().toLongString());
		Object obj = pjp.proceed();
		
		System.out.println("   2.실행결과: " + obj.toString());
		System.out.println("   3.실행 완료 ");

		return obj;

	}

}
