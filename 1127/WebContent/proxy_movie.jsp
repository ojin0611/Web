<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URL, java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader"%>
<%
	request.setCharacterEncoding("utf-8");
	String query = request.getParameter("query");
	//int yearFrom = 1900;
	//String from = request.getParameter("from");
	//if (from != null) yearFrom = Integer.parseInt(from);
	//int yearTo = 2018;
	//String to = request.getParameter("to");
	//if (to != null) yearTo = Integer.parseInt(to);
	String clientId = "iGeYj6b8sVaClTRlRLxo";
	String clientSecret = "ooTeWKkvn4";
	String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + query;

	URL url = new URL(apiURL);
	HttpURLConnection con = (HttpURLConnection) url.openConnection();
	con.setRequestMethod("GET");
	con.setRequestProperty("X-Naver-Client-Id", clientId);
	con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	
	int responseCode = con.getResponseCode();
	BufferedReader br;
	if (responseCode == 200) { // 정상 호출
		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	} else { // 에러 발생
		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	}
	String inputLine;
	StringBuffer sb = new StringBuffer();
	while ((inputLine = br.readLine()) != null) {
		sb.append(inputLine);
	}
	br.close();
	out.print(sb.toString());
%>