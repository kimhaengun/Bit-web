package com.bit.boot09.service;

import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

import org.springframework.stereotype.Service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;

@Service
public class JWTService {
	private RSAPublicKey rsaPublicKey;
	private RSAPrivateKey rsaPrivateKey;
	
	String secretKey = "abcdefg";
	
	public String verify(String token) {
			try {
				System.out.println("verify 탐~~~~~~~~");
			    Algorithm algorithm = Algorithm.HMAC256(secretKey);
			    JWTVerifier verifier = JWT.require(algorithm).build(); //Reusable verifier instance
			    DecodedJWT jwt = verifier.verify(token);
			    System.out.println("~~~~"+jwt);
			    return jwt.getClaim("user").asString();
			} catch (JWTVerificationException exception){
			    //Invalid signature/claims
				return "";
			}		
	}
	//JWT 생성
	public String createHS256() {
		try {
		    Algorithm algorithm = Algorithm.HMAC256(secretKey);
		    String token = JWT.create()
		        .withIssuer("auth0")
		        // 데이터?? 추가
		        // deptno : 1234
		        .withClaim("user", "user02")
		        .sign(algorithm);
		    return token;
		} catch (JWTCreationException exception){
		    //Invalid Signing configuration / Couldn't convert Claims.
		}
		return null;
	}
}
