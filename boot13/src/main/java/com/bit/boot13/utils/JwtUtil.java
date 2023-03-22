package com.bit.boot13.utils;

import java.security.Key;
import java.util.Date;

import javax.crypto.SecretKey;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

@Component
public class JwtUtil {
	//eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0IiwiZW5hbWUiOiJ0ZXN0ZXIiLCJleHAiOjE2Nzk0NjM0OTF9.pB7IQdHB3IYeqM6YYQpr16LB2xT_K0inPMqkpktc1L4
//	@Value("${sec.key}")
	String key = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
	public boolean isJwt(String compactJws) {
		SecretKey secretkey = Keys.hmacShaKeyFor(key.getBytes());
		try {
		    Jws<Claims> jws = Jwts.parserBuilder().setSigningKey(secretkey).build().parseClaimsJws(compactJws);
		    //OK, we can trust this JWT
		    return true;
		} catch (JwtException e) {
		    //don't trust the JWT!
			return false;
		}
	}
	public Jws<Claims> getJwt(String compactJws) {
		SecretKey secretkey = Keys.hmacShaKeyFor(key.getBytes());
		try {
			//OK, we can trust this JWT
			return Jwts.parserBuilder().setSigningKey(secretkey).build().parseClaimsJws(compactJws);
		} catch (JwtException e) {
			//don't trust the JWT!
			return null;
		}
	}
	public String getJwtName(String compactJws) {
		return getJwt(compactJws)==null?null : (String) getJwt(compactJws).getBody().get("ename");
	}
	
	
	public String createJwt(String name, long limit) {
		SecretKey secretkey = Keys.hmacShaKeyFor(key.getBytes());
		return Jwts.builder().setSubject("test").claim("ename",name)
				.setExpiration(new Date(System.currentTimeMillis()+limit))
				.signWith(secretkey,SignatureAlgorithm.HS256).compact();
	}

	//테스트용
	public String createJwt() {
		return createJwt("tester",1000*60);
	}
}
