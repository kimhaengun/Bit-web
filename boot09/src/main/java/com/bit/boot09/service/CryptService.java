package com.bit.boot09.service;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CryptService {
	final PasswordEncoder passwordEncoder;
	
	//AES에서 사용되는 키 값의 길이는 16 24 32 byte 길이를 사용해야 한다.
//	@Value("${secure.key}")
	String key="oingisprettyintheworld1234567890";
    private String iv = "0123456789abcdef"; // 16byte
    
    
	//암호화
	// 1. 단방향 - 복구 불가능(해쉬 값으로 변경) / 비밀번호
	// 2. 양방향 - 암호화, 복호화 가능 --> Secret Key(공개 키 or 개인 키)를 가지고 암호화, 복호화
	public String createMd5Encrypt(String msg) {
		String result = DigestUtils.md5Hex(msg.getBytes());
		
		return result;
	}
	public String createSha256Encrypt(String msg) {
		String result = DigestUtils.sha256Hex(msg.getBytes());
		
		return result;
	}
	
	public String createSha512Encrypt(String msg) {
		return DigestUtils.sha3_512Hex(msg);
	}
	
	SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
	public String createAESEncrypt(String msg) throws Exception {
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
	     c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
	     byte[] encrypted = c.doFinal(msg.getBytes("UTF-8"));
	     String enStr = new String(Base64.encodeBase64(encrypted));
	     return enStr;
	}
	
	public String createAESDecrypt(String msg) throws Exception {
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
	      c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
	      byte[] byteStr = Base64.decodeBase64(msg.getBytes());
	      return new String(c.doFinal(byteStr), "UTF-8");
	}
	
	// Spring에서 제공해주는 암호화 방식은 단방향 -> 복호화 불가능
	public String springEncrypt(String msg) {
		return passwordEncoder.encode(msg);
	}
	
	// 비밀번호 동일 여부
	public boolean isMatches(String msg, String enctext) {
		return passwordEncoder.matches(msg, enctext);
	}
}
