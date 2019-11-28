package com.nwpu.Utils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatTag extends SimpleTagSupport {

    private Date date = null;

    public void setDate(Date date){
        this.date = date;
    }

    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        out.print(df.format(date));
    }
}
