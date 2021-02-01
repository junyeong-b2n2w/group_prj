package com.gr.cg.utils;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cryptography.EgovCryptoService;
import egovframework.rte.fdl.cryptography.EgovPasswordEncoder;

@Service("cryptoService")
public class CryptoAria {

	@Resource(name="egovARIACryptoService")
	private EgovCryptoService cryptoService;
	
	@Resource(name = "egovPasswordEncoder")
	private EgovPasswordEncoder passwordEncoder;
	
	public static String plainPassword = "egovframe";  
	
	public String encryptData(String plainText) {
        String encodeText = null;
        try {
               byte[] encrypted = cryptoService.encrypt(plainText.getBytes("UTF-8"), plainPassword);
               encodeText = Base64.encodeBase64String(encrypted);
        } catch (UnsupportedEncodingException uee) {
            uee.printStackTrace();
        }
        return encodeText;
}
	
	public String decryptData(String encodeText) {
        String plainText = null;
        try {
               byte[] base64dec = Base64.decodeBase64(encodeText);
               byte[] decrypted = cryptoService.decrypt(base64dec, plainPassword);
               plainText = new String(decrypted, "UTF-8");
        } catch (UnsupportedEncodingException uee) {
            uee.printStackTrace();
        }
        return plainText;
	}
	 
	 
}
