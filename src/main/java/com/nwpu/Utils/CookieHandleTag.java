package com.nwpu.Utils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.Base64;

public class CookieHandleTag extends SimpleTagSupport {
    private String cookie = null;

    public void setCookie(String cookie){
        this.cookie = cookie;
    }

    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        out.print(Decrypt(cookie, 5));
    }

    public static String Decrypt(String str, int n) {
        //解密
        // System.out.println(str);
        str = new String(Base64.getDecoder().decode(str));
        int k=Integer.parseInt("-" + n);
        String string = "";
        for(int i=0;i<str.length();i++) {
            char c=str.charAt(i);
            if(c>='a'&&c<='z')
            {
                c+=k%26;//移动key%26位
                if(c<'a')
                    c+=26;//向左超界
                if(c>'z')
                    c-=26;//向右超界
            }else if(c>='A'&&c<='Z')
            {
                c+=k%26;//移动key%26位
                if(c<'A')
                    c+=26;//向左超界
                if(c>'Z')
                    c-=26;//向右超界
            }
            string +=c;
        }
        // System.out.println(string);
        return string;
    }
}
