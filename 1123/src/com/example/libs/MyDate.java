package com.example.libs;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyDate extends TagSupport {
	@Override
	public int doStartTag() throws JspTagException {
		JspWriter out = pageContext.getOut();
		String pattern = "GG yyyy년 MM월 dd일 EE aa hh시 mm분 ss초입니다.";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date now = new Date();
		try {
			out.print("<span style='color:blue;font-size:2em;background-color:yellow'>");
			out.println(sdf.format(now) + "</span>");
		} catch (Exception e) {
			throw new JspTagException(e.getMessage());
		}
		return this.SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspTagException {
		return this.EVAL_PAGE;
	}
}
