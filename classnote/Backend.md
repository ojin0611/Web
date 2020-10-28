# 프로그램 설치

## Apache Tomcat

[Tomcat](https://github.com/swacademy/Servlet/blob/master/How%20to%20Install%20Apache%20Tomcat%209%20on%20Windows%2010.pdf)

### Install
https://tomcat.apache.org/download-90.cgi

32-bit/64-bit Windows Service Installer 설치하기

exe 파일 실행 
1. Choose Components : check all
2. Configuration : Port 그대로 쓰기 (8080은 Oracle이랑 충돌나니까 Oracle 끄기), username = admin / pw = javatomcat
3. jre : 14


환경변수 > 새로 만들기

이름 : CATALINA_HOME  
경로 : C:\Program Files\Apache Software Foundation\Tomcat 9.0  

서비스에서 실행하면 localhost:8080 으로 접속


### 환경설정
conf > xml, properties

[Apache, Tomcat 연동](https://github.com/swacademy/Servlet/blob/master/Apache%202.4%EC%99%80%20Tomcat%209%20%EC%97%B0%EB%8F%99%ED%95%98%EA%B8%B0%20in%20Windows%2010.pdf)



## Eclipse

[설치 링크](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-09/R/eclipse-jee-2020-09-R-win32-x86_64.zip)

Eclipse MarketPlace에서 Tomcatplugin 설치

### 환경설정 (Preferences)

General/Workspace > Encoding  UTF-8

Web/CSS, HTML, JSP Encoding UTF-8

Tomcat > Ver 9.0+, Server.xml

Tomcat > Tomcat Home : C:\Program Files\Apache Software Foundation\Tomcat 9.0

Tomcat/Advanced > Tomcat base : C:\Program Files\Apache Software Foundation\Tomcat 9.0

Tomcat/Tomcat Manager App : admin/javatomcat


server.xml 파일 21번째 line 수정 (<Server port="8005" shutdown="SHUTDOWN">)
서비스에 있는 Tomcat 중지, 이후에는 Eclipse 내에 있는 고양이 눌러서 시작/종료 가능


# Servlet


★최초 유저가 요청할 때부터 유저가 웹페이지를 보게 되는 과정★ 

1. User는 www.example.com/1027/servlets/servlet/Hello.nhn으로 요청한다.

2. 유저의 요청을 Apache(웹서버)가 수신할 때, 확장자 또는 URL경로상에 
   미리 약속한 JkMount가 발견되면 본인이 처리하지 않고 AJP13에게 forward한다.

3. AJP13은 자기가 연결된 Tomcat에게 요청한다.

4. 요청을 받은 Tomcat의 server.xml은 요청경로의 
   1027의 docBase를 참조하여 D:/WebHome/1027/Web-INF/web.xml로 넘겨준다.

5. 해당 web.xml은 user가 요청한 url을 보고 <servlet-mapping>밑의 <url-pattern>과 일치되는
   server-name을 찾는다.

6. 일치되는 servlet-name인 HelloWorld를 찾아서 <servlet> 밑의 해당 이름과 같은
   servlet-class를 찾는다.

7. 그래서 일치되는 servlet-class를 찾으면 해당 클래스를 메모리에 로딩하고 실행하여
   그 결과를 Apache(웹 서버)에게 출력한다.

8. Tomcat으로 전달받은 출력문자열을 그대로 유저에게 response한다.

9. 유저의 브라우저는 웹서버로부터 받은 문자열을 DOM(Tree 구조)로 Parsing하고, 그다음 유저의
   메모리에 로딩하고 웹페이지에 Rendering한다.

> IP는 공항. 3계층, Port는 게이트. 4계층,  
7계층은 Application (Apache, Tomcat, Oracle)

> 8080 터널을 통해 오니까 바로 톰캣, 8080 안쓰면 Apache로 간다.

> AJP에서 Tomcat으로 가는 통로는 8009

![User-Apache-Tomcat-Servlet](./apache-tomcat-servlet.PNG)