package com.nwpu.Utils;

import org.springframework.util.DigestUtils;

import java.util.Arrays;
import java.util.Base64;

public class EncodeHandler {

    public static String md5Encode(String password){
        return DigestUtils.md5DigestAsHex(password.getBytes());
    }

    public static boolean md5Verify(String password, String pass){
        return md5Encode(password).equals(pass);
    }

    public static String Encryption(String str, int k) {
        //加密
        String string = "";
        for(int i=0;i<str.length();i++) {
            char c=str.charAt(i);
            if(c>='a'&&c<='z')//如果字符串中的某个字符是小写字母
            {
                c+=k%26;//移动key%26位
                if(c<'a')
                    c+=26;//向左超界
                if(c>'z')
                    c-=26;//向右超界
            }else if(c>='A'&&c<='Z')//如果字符串中的某个字符是大写字母
            {
                c+=k%26;//移动key%26位
                if(c<'A')
                    c+=26;//向左超界
                if(c>'Z')
                    c-=26;//向右超界
            }
            string +=c;//将解密后的字符连成字符串
        }
        return Base64.getEncoder().encodeToString(string.getBytes());
    }

}
