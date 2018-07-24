package com.syu.anyshop.aspect;

import java.util.Date;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class ControllerLoggingAspect {

	 protected Logger logger = LoggerFactory.getLogger(this.getClass());

	@Pointcut("execution(* com.syu.anyshop.controller.*.*(..))")
		private void logging() {}

	// (로깅 체크)모든 컨트롤러 패키지에있는  (매핑)메소드 실행 될때 
	@Around("logging()")
	public Object around(ProceedingJoinPoint pjp) throws Throwable {
		
		// 규칙 : public object 선언, 인자값 첫번째는 ProceedingJoinPoint
		logger.info("[" + pjp.getTarget().getClass().getSimpleName() + "->" + pjp.getSignature().getName() + "() ============================================= START =====================================================  ] " + new Date());
		Object obj = pjp.proceed();

		logger.info("[" + pjp.getTarget().getClass().getSimpleName() + "->" + pjp.getSignature().getName() + "() ============================================== END ===========================================================  ] " + new Date() + "\r\r\r\r\r");

		return obj;

	}

}
