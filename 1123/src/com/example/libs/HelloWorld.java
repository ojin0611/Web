package com.example.libs;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloWorld extends TagSupport {
	@Override
	public int doStartTag() throws JspTagException {
		JspWriter out = pageContext.getOut();
		try {
			out.print("<font size='7' color='red'>");
			out.println("Hello, World</font>");
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
