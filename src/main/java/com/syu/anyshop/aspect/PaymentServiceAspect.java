package com.syu.anyshop.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PaymentServiceAspect {

	@Pointcut("execution(* com.syu.anyshop.payment.PaymentService.*(..))")
	private void paymentService() {}

	@Around("paymentService()")
	public Object around(ProceedingJoinPoint pjp) throws Throwable {
	
		System.out.println("   1.호출 메소드 : " + pjp.getSignature().toLongString());
		Object obj = pjp.proceed();
		
		if(obj != null) {
			System.out.println("   2.실행결과: " + obj.toString());
		} else {
			System.out.println("   2.실행결과: NULL ");
		}
		System.out.println("   3.실행 완료 " +"\r");

		return obj;

	}
}
