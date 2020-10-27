# 프로그램 설치

## Apache Tomcat

[Tomcat](file:///C:/Users/SIST4-06/Downloads/How%20to%20Install%20Apache%20Tomcat%209%20on%20Windows%2010.pdf)

### Install
https://tomcat.apache.org/download-90.cgi

32-bit/64-bit Windows Service Installer 설치하기

exe 파일 실행 
1. Choose Components : check all
2. Configuration : Port 그대로 쓰기 (8080은 Oracle이랑 충돌나니까 Oracle 끄기), username = admin / pw = javatomcat

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

General > Workspace > Encoding  UTF-8

Web > CSS, HTML, JSP Encoding UTF-8

Tomcat > Ver 9.0+, Server.xml

Tomcat > Tomcat Home : C:\Program Files\Apache Software Foundation\Tomcat 9.0

Tomcat > Advanced > Tomcat base : C:\Program Files\Apache Software Foundation\Tomcat 9.0

Tomcat > Tomcat Manager App : admin/javatomcat


server.xml 파일 21번째 line 수정 (<Server port="8005" shutdown="SHUTDOWN">)
서비스에 있는 Tomcat 중지, 이후에는 Eclipse 내에 있는 고양이 눌러서 시작/종료 가능
