package com.example.libs;

import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/servlets/servlet/ServletLifeCycle")
public class ServletLifeCycle extends GenericServlet {
	private int initCount;
	private int serviceCount;
	private int destroyCount;
	private BufferedOutputStream bos;
	
	@Override
	public void init() throws ServletException{
		try {
			this.bos = new BufferedOutputStream(
				new FileOutputStream("C:/temp/lifecycle.txt",true));
			String str = "called init() : "+ ++initCount +"\n";
			this.bos.write(str.getBytes());
			this.bos.flush();
		} catch (IOException ex) {
			System.out.println(ex);
		}
		
	}
	
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str = "called service() : "+ ++serviceCount +"\n";
		this.bos.write(str.getBytes());
		this.bos.flush();
		
	}
	
	@Override
	public void destroy() {
		try {
		String str = "called destroy() : "+ ++destroyCount +"\n";
		this.bos.write(str.getBytes());
		this.bos.flush();
		this.bos.close();
		}catch(IOException ex) {
			System.out.println(ex);
		}
	}

}
