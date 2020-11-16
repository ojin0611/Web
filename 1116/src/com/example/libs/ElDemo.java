package com.example.libs;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ElDemo {
	public static String getFormat() {
		String pattern = "GG yyyy년 MM월 dd일 EE aa hh시 mm분 ss초";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return "<span style='color:red'>" + sdf.format(new Date()) + "</span>";
	}
}
