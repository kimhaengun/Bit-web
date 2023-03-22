package com.bit.boot09.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CryptServiceTest {

	String msg;
	@Autowired
	CryptService cryptService;
	
	@BeforeEach
	void setUp() throws Exception {
		msg = "abcd1234a";
	}

	@Test
	void test() {
		System.out.println("md5 : "+cryptService.createMd5Encrypt(msg));
		System.out.println("256 : "+cryptService.createSha256Encrypt(msg));
		System.out.println("512 : "+cryptService.createSha512Encrypt(msg));
	}
	@Test
	void test2() {
		
	}
	@Test
	void test3() {
		String result =  cryptService.springEncrypt(msg);
		System.out.println("spring : "+result);
		
		System.out.println("동일 여부 : "+cryptService.isMatches(msg, result));
		System.out.println("동일 여부 : "+cryptService.isMatches(msg, "$2a$10$LjTjgSrh7YyqRboG3mT.ieAB1Nh6mBOGOe7zqWJWRV3T1dpG7Jpnu"));
		System.out.println("동일 여부(틀림) : "+cryptService.isMatches(msg, "$2a$10$9q9ORW2vI.su2W0z4Bw5GOE1s.HfK0T5cI3n6njiNN123456RpP1."));
	}
}
