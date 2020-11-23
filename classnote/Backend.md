# Apache Tomcat

[Tomcat](https://github.com/swacademy/Servlet/blob/master/How%20to%20Install%20Apache%20Tomcat%209%20on%20Windows%2010.pdf)

## Install
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


## 환경설정
conf > xml, properties

[Apache, Tomcat 연동](https://github.com/swacademy/Servlet/blob/master/Apache%202.4%EC%99%80%20Tomcat%209%20%EC%97%B0%EB%8F%99%ED%95%98%EA%B8%B0%20in%20Windows%2010.pdf)



# Eclipse

[설치 링크](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-09/R/eclipse-jee-2020-09-R-win32-x86_64.zip)

Eclipse MarketPlace에서 Tomcatplugin 설치

## 환경설정 (Preferences)

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

위 그림에서는 web.xml 파일에서 <servlet-mapping> / <servlet>로 매핑하고있는데

@WebServlet annotation을 이용하면 굳이 매핑할 필요없음

> @WebServlet("urlPattern")


### 톰캣-서블릿-자바 연동 확인하기!

url = localhost:8080/1028/servlets/servlet/Register 

기본지식
1. 포트번호 8080이니까 Client에서 Tomcat으로 바로 전송  
2. /1028을 입력하면 Root/1028로 전송 (Root랑 1028이 있는지 톰캣 conf 확인)  
3. /servlets/servlet/Register  을 보내면 이를 받아주는 자바 **클래스** 파일 필요.
(이 때, WebAnnotation 형태로 받는지, servlet-mapping 형태로 받는지 확인)  


체크리스트
1. Tomcat이 Root 잡고있는지 (homecontext.xml의 docBase)
2. Tomcat이 1028을 잡고있는지 (server.xml의 Context)
3. 1028디렉토리 metadata-complete (1028/WEB-INF/web.xml > false) 
	<!--false는 WebServlet Annotation 쓰겠다는 뜻-->
4. form에서 POST로 보내는 링크주소 확인 (register.html )
5. @WebServlet() 내의 URL 확인 (register.java )
6. 컴파일된 클래스파일 있는지 확인 (WEB-INF/classes/~.class )
   - 이 때, 이클립스로 web 프로젝트를 만들면 build/classes에 저장되기때문에 톰캣이 위치를 잡지 못한다. 


## Servlet으로 한글 쓰기

1. res.setContentType("text/html;charset=utf-8"); 써야하고
2. pw.println("<meta charset='utf-8'>"); 써야한다

## redirect vs forward

★ redirect  
- 절대경로를 이용(다른사이트로 이동 가능)  
- 페이지가 넘어가지만 이름은 넘어가지지 않는다

★ forward  
- 같은 도메인 내의 상대경로를 이용 (다른 도메인으로 이동 불가능),   
- buffer에서 조작  
- forward : 다른 사이트로 넘어갈 수 없지만, 다른 정보를 넘길수는 있다  



# MySQL Download

[Community](https://dev.mysql.com/downloads/file/?id=499590)

[Workbench](https://dev.mysql.com/downloads/workbench/)

# MariaDB Download

https://mariadb.org/download/

# Oracle 

Oracle XE 184

https://www.oracle.com/kr/database/technologies/appdev/xe.html


## War
출처: https://dololak.tistory.com/31

WAR(WebApplication Archive)
WAR란 WebApplication Archive의 약자로 말그대로 웹 어플리케이션 저장소이며 웹 어플리케이션을 압축해 저장해 놓은 파일이라고 생각하시면 됩니다.

개발한 웹어플리케이션 프로젝트가 WAS에서 돌아갈 수 있는 구조를 담고 있으며 JSP 및 서블릿 빈클래스 등의 소스가 컴파일 되어 저장되며 기타 이미지 및 자원들이 포함되어 있습니다.
 

### War 배포

WAS에 웹 어플리케이션을 배포하기 위해서는 톰캣을 기준으로 다음의 세가지 방법이 있습니다.

1. 웹 어플리케이션 프로젝트 그대로 복사하여 WAS webapps 폴더 하위에 복사하여 배포
2. 프로젝트.war 로 압축하여 webapps 폴더 하위에 복사한 후 톰캣을 기동하여 자동 배포
3. 톰캣 관리자 페이지에서 프로젝트.war 파일을 등록하여 자동으로 배포

1번의 경우 로컬에서 개발하여 테스트를 위해 로컬로 복사하는 경우 편하겠지만 웹 어플리케이션 규모가 크고, 서버가 외부에 있는 경우 수많은 폴더들과 파일을 통째로 옮겨야 하기 때문에 번거롭습니다.

2, 3번의 경우에는 로컬에서 개발하여 FTP 등을 통해 원격 운영서버로 war파일만 옮겨 배포하는 경우등에 유용합니다.

# JSP

## JSP 컨테이너의 역할
웹 브라우저가 JSP 페이지 요청이 오면 JSP 컨테이너는 해당 jsp 파일을 '서블릿'이라고 부르는 자바 파일로 변환시킨다. 그 다음 자바 파일을 컴파일하고, 클래스 파일의 실행결과가 사용자의 브라우저로 전송된다.

(3~6은 JSP 컨테이너에서 실행됨)
1. 웹브라우저가 웹서버에게 JSP 페이지 요청
2. 웹 서버가 JSP 컨테이너로 전송
3. JSP 파일 파싱
4. 서블릿으로 변환
5. 클래스 파일 생성
6. 메모리에 적재되어 실행됨
7. 웹 서버로 HTML 전송
8. 웹 브라우저에 HTML 표시



## JSP 문법 요소
### 스크립트 요소
1. 선언문 (Declaration)
2. 스크립트릿 (Scriptlet)
3. 표현식 (Expression)

### 주석 (Comment)
4. 주석

### 지시자
5. 지시자 (Directive)

### 액션 태그 (Action Tag)
6. Action Tag

---

1. declartion

변수나 메소드 선언

멤버변수!

객체 생성시, 멤버변수가 먼저 만들어지고 다음에 메소드가 만들어진다.
```jsp
<%! %>
```

2. scriptlet 

지역변수 선언. 메소드 선언은 불가능

technically, _jspService 메소드 안에 선언되는 요소다.

```jsp
<% Java Code %>
```


3. expression

표현식은 결과로만 출력할 수 있다. if/else 등은 불가능

변수를 출력하거나 메소드의 결과값을 브라우저에 출력한다.

```jsp
<%= %>
```

4. comment
> 자바,JSP 모두 주석처리

JSP내에 아래처럼 입력하면 소스 보기를 해도 주석이 나타나지 않는다.
```jsp
<%-- --%>
```
JSP내에 HTML의 주석 (`<!-- -->`)을 넣으면 소스보기 할 때 주석 코드가 보인다.

스크립트릿이나 선언문에서는 아래와 같은 주석처리방법이 사용된다.
```
<% /* 여러 줄 주석 */ %>
<% // 한줄 주석 %>
```


5. directive(지시자, 지시부)

클라이언트의 요청에 jsp 페이지가 실행이 될 때 필요한 정보를 JSP 컨테이너에게 알리는 역할

```jsp
<%@ page ~ %>
<%@ include ~ %>
<%@ taglib ~ %>

<%-- 
page
- info
- language
- contentType
- extends
- import
- session
- buffer
- autoFlush
- isThreadSafe
- trimDirectiveWhitespaces
- errorPage
- isErrorPage
- pageEncoding

include
- file
--%>
```

6. action tag
어떤 동작 또는 액션이 일어나는 시점에 페이지와 페이지 사이에 제어를 이동시킬수도 있고 또 브라우저에서 자바 애플릿을 실행시킬수도 있다.

```jsp
<jsp:~ />
<%--
- include
- forward
- plug-in
- useBean
- setProperty
- getProperty
--%>
```

include 액션태그는 소스 내용만 포함시키는 include 지시자와 다르게 포함시킬 페이지의 **처리 결과**를 포함시킨다.

## 내부 객체 (implicit object)
내부 객체란 jsp 페이지를 작성할 때 특별한 기능을 제공하는 JSP 컨테이너가 제공하는 특별한 객체를 말한다. 즉, 위의 JSP 문법요소들과 함께 동작해 사용자의 요청을 적절히 처리하여 동적으로 HTML을 생성한다.

### 입출력 관련
1. request
2. response
3. out

### 외부 환경 정보 제공
4. session 
5. application 
6. pageContext

### 서블릿 관련
jsp가 변환된 서블릿과 관련된 내용에 접근할 수 있도록 하는 객체

7. page
8. config

### 예외 관련
9. exception

## 내부 객체 (9가지)
1. request 객체  
사용자가 입력한 폼으로부터 특정한 값을 입력하거나 선택한 값을 jsp 페이지 내에서 값을 받아와 처리하기 위해서 사용할 수 있다.  
스크립트릿 내에 별도의 선언 없이 사용할 수 있다. 왜냐하면 _jspService 메소드에서 이미 선언한 변수들이기 때문이다.  
HttpServletRequest 객체 타입의 request 객체명을 사용한다.  
아래 요청 메소드를 이용해 폼 태그로부터 넘어오는 요청정보를 분석할 수 있게 된다.  


요청 메소드
- getParameter(name)
- getParameterValues(name)
- getParameterNames()
- setCharacterEncoding(env)

2. response 객체  
요청을 시도한 클라이언트로 전송할 응답을 나타내는 데이터 묶음이다.  
HttpServletResponse 객체 타입의 response 객체명을 사용한다.

- setHeader(name, value)
- setContentType(type)
- setRedirect(url)
- getCharacterEncoding()

3. out 객체

jsp 페이지의 결과를 클라이언트에 전송해주는 출력 스트림. jsp 페이지가 클라이언트에게 보내는 모든 정보는 out 객체를 통해 전달된다.  
java.io.Writer 클래스를 상속받은 javax.servlet.jsp.JspWriter 클래스 타입의 객체, out 객체명을 사용한다.

- isAutoFlush()
- getBufferSize()
- getRemaining()
- clearBuffer()
- println(string)
- flush()
- close()

4. session 객체

클라이언트 요청에 관한 Context 정보의 **세션**과 관련된 정보를 저장하고 관리하는 내부 객체.  
다른 내부객체들은 jsp 페이지 내의 스크립트릿에서 묵시적으로 사용할 수 있지만 session 객체는 page 지시자의 session 속성이 true로 설정돼있어야 사용할 수 있다.

- getId()
- getCreationTime()
- getLastAccessedTime()
- setMaxInactiveInterval(time)
- getMaxInactiveInterval()
- isNew()
- invalidate()

5. application

**서블릿 또는 어플리케이션**의 Context를 나타내는 내부 객체.  
어플리케이션이 실행되는 서버의 정보, 서버 측 자원에 대한 정보를 얻어내거나 이벤트 로그와 관련된 기능들을 알 수 있다.  
javax.servlet.ServletContext 객체타입으로 제공한다.

- getServerInfo()
- getMimeType(fileName)
- getRealPath(url)
- log(message)


6. pageContext

현재 jsp 페이지 자체의 Context를 나타낸다. pageContext 내부 객체를 통해 다른 내부객체에 접근할 수 있다.  
`JspWriter pageOut = pageContext.getOut();`

pageContext 객체는 javax.servlet.jsp.PageContext 클래스 타입으로 제공되는 JSP 내부 객체다.
- getRequest()
- getResponse()
- getOut()
- getSession()
- getServletContext()
- getPage()
- getServletConfig()
- getException()

7. page
변환된 서블릿 객체 자체  
page 객넻는 this 키워드로 자기 자신을 참조할 수 있다. javax.servlet.jsp.HttpJspPage 클래스 타입으로 제공된다. 현재 대부분의 JSP컨테이너가 Java만을 스크립트 언어로 지원하기때문에 page 객체는 거의 사용되지 않는 내부객체다.  



8. config
서블릿 초기정보 설정을 맡음.  
javax.servlet.ServletConfig 클래스 타입의 내부 객체다.
서블릿이 초기화될 때 참조해야할 다른 여러 정보를 가지고있다가 전해준다.  

- getInitParameterNames()
- getInitParameter(name)
- getServletName()
- getServletContext()


9. exception
프로그래머가 jsp페이지에서 발생한 예외를 처리하는 페이지를 지정한 경우 에러 페이지에 전달되는 예외 객체다. page 지시자의 isErrorPage 속성을 true 로 지정한 jsp 페이지에서만 사용가능한 내부객체다.  
java.lang.Throwable 클래스 타입으로 제공된다.

web.xml에 적은 <error-page></error-page> 태그보다 <%page errorPage = 'error.jsp'>의 우선순위가 더 높다.

- getMessage()
- toString()

### RandomAccessFile
(3가지 꼭 기억하기)
1. getFilePointer()
2. length()
3. seek()

## 오류
코드로 수정 가능한 오류 : Exception  
코드로 수정 불가능한 오류 : Error

### include 4가지 방법
```
1. RequestDispatcher's include()
2. pageContext's include()
3. <jsp:include page="copyright.html" flush="false" />
4. <%@ include file="copyright.html" %> 
```

include 지시자는 한 페이지에 모아서 컴파일 (정적페이지가 유리)
 -단일페이지로 한번 컴파일 (두개의 파일이 1개의 파일로 구성됨)
  -유저가 1개의 페이지를 받아봄
  -name, value 를 사용할 수 있음
  -file
  -false

include action은 각자 컴파일해서 따로따로 붙인다(동적페이지가 유리)
 -각자 따로 컴파일
 -유저는 2개이상의 페이지를 받아봄
 -page
 -true



#### Apache, Tomcat이 다른곳을 바라보고있다?
Apache는 D:/WebHome을 바라보고있고 (conf/httpd.conf 내의 root)  
Tomcat은 Tomcat/webapps를 바라보고있다. (conf/server.xml 내의 appBase)

그리고, 이클립스로 웹 프로젝트 만들면 WEB-INF/WebContent에 파일들이 들어가는데 
얘를 war로 배포하면 WebContent가 다 풀린다! 정상적인 구조가 된다. (마찬가지로 build/classes도 WEB-INF/classes로 들어간다.)

Apache가 webapps를 바라보게하던지, Tomcat과 Apache가 제3의 저장공간을 동시에 보는 형태로 경로를 바꿔줘야한다.  
 

### 컴포넌트

1. 컴포넌트란?
 - 특별한 기능을 수행하기 위해 독립적으로 개발된 코드
 - 잘 정의된 interface를 가지고
 - 다른 컴포넌트들과 조립관계에 있고
 - 웹 응용 프로그램에서 활용가능한
 - S/W 단위이다

2. 특징
 - 식별가능 : 패키지
 - 교체가능
 - 인터페이스를 통한 접근가능
 - 독립적으로 테스트/개발가능
 - 캡슐화

3. 장점
 - 개발기간 단축
 - 개발비용 감소
 - 생산성 증대
 - 리스크 감소
 - 일관성 확대
 - 재사용 / 재활용

4. 단점
 - 설계기간 연장
 - 개발자 교육 필요

5. Java Beans
 - 상속 제한 없음
 - 반드시 클래스는 패키지화 되어야 한다
 - 필요에 따라 직렬화 될 수 있다
 - 필요에 따라 기본생성자를 재정의 할 수 있다
 - 멤버변수를 property라고 한다
 - 모든 property는 반드시 private 이어야 한다
 - private property를 접근하기 위한 메소드는 반드시 public이어야 한다
 - getter 메소드는 getXxx()형식을 가져야 하며, setter 메소드도 setXxx()의 형식이어야 한다
    (getName(), setName(), getAge(), setAge())
 - 만약 property의 데이터타입이 boolean일 경우에는 setXxx()대신 isXxx()를 사용한다

6. 저장위치
 - WEB-INF/classes

## 자바빈즈 JavaBeans

지금까지 jsp 페이지는 디자이너가 이해하기 어렵다는 점, 코드를 재사용하기 힘들다는 점이 있었다. 이 단점들을 개선하기 위해 자바빈즈를 사용하여 복잡한 자바코드로 jsp 페이지가 구성되는것을 피하고 html같은 쉽고 간단한 코드만으로 구성되도록 할 것이다.  
자바빈즈는 JSP 안의 수많은 자바 코드들이 담당했던 일들을 독립적으로 처리하기 위한 부품과도 같다. jsp 페이지 내에 복잡한 로직을 넣지 않고 자바빈즈와 같은 컴포넌트 기술을 이용하여 효율성, 재사용성 등의 장점을 살릴 수 있다.

<jsp:useBean id="" class="packagename.class" scope="page(default)|request|session|application" />
 1) id : Java의 식별자 규칙 (영문자, 숫자, '_' 가능)
 2) 참조변수
 3) 한 jsp 안에서 유일할 값


### 빈 작성
1. 변수는 모두 private으로 선언 ( 이 변수를 property라고 부름)
2. getter, setter 네이밍 룰 지키기
3. getter, setter 모두 public으로 선언
4. 자바 빈은 반드시 package 안에 작성해야한다.

### 빈 컴파일

이클립스는 java 파일 작성 후 저장 시 오류나 에러가 없다면 자동으로 컴파일되어 class파일을 생성한다.

- <jsp:useBean id="..." class="..." scope="..."/>
- <jsp:setProperty name="..." property="..." value="..."/>
- <jsp:getProperty name="..." property="..."/>

JSP에서 빈을 사용하기 위해서는 <jsp:useBean...> 태그를 사용하게 됩니다. 이 태그 속에는 생성하고자 하는 빈의 이름(id)과 생성을 위해 필요한 클래스(class)의 이름을 지정하게 됩니다. 또한 필요에 따라서 생성한 빈이 살아있는 영역(scope)을 지정하기도 합니다. (언제까지 빈이 살아있도록 설정한건지?)  

#### JSP 변수의 종류(scope, lifecycle)
4개의 객체 범위
- page 영역
- request 영역
- session 영역
- application 영역  
scope 범위는 page < request < session < application 순이라는 것을 알 수 있습니다. 

1) page (pageContext : javax.servlet.jsp.PageContext)
   - 상태를 저장하지 않는 http protocol(stateless protocol) 때문에 모든 페이지는 정보를 저장하지 않는다.
   - 현재 페이지에서 만든 정보는 다른 페이지로 넘어갈 때 모두 소멸된다.
   - 다른 페이지, 다른 사용자, 다른 브라우저 전혀 공유되지 않는다.
2) request (javax.servlet.http.HttpServletRequest)
   - forward/include 되는 범위와 lifecycle이 일치한다.
   - 하지만, 다른 사용자, 다른 브라우저, forward나 include되지 않는 다른 페이지에서는 전혀 공유되지 않는다.
3) session (java.servlet.http.HttpSession)
   - 브라우저의 lifecycle과 일치한다.
   - 방문한 바로 그 사용자만 사용하는 공통변수이다.
   - 반드시 한 개의 브라우저에서만 공유된다.
4) application (javax.servlet.ServletContext)
   - Servlet Context의 lifecycle과 일치
   - 방문하는 모든 사용자에게 공통(공유, 전역) 변수이다.
   - 어떤 브라우저도 공유된다.


application -> 경로를 다른 주소창에서 열어도 정보가 살아있다 (공통변수)
session -> 브라우저만 안닫으면 같은 사람이 여러 페이지를 접속해도 정보가 살아있다

param과 value는 상호배타적


## 세션과 쿠키

세션은 **서버**가 **클라이언트**의 정보를 저장하고 있다가 새로운 클라이언트 요청이 오면 서버에 저장되어있는 정보를 비교한다.  
쿠키는 **클라이언트 자신들**에게 클라이언트의 정보를 저장하게 한다. 서버로 전송되는 요청에는 쿠키가 담아둔 정보가 포함된다. 서버는 이 쿠키를 읽고 이전에 요청했던 클라이언트인지 판단할 수 있다.

### 1. URL 새로 쓰기

다음의 실행될 페이지에 파라미터를 붙여서 로그인한 사용자의 아이디를 붙여주면 request 객체를 통해 로그인된 사용자의 아이디를 확인할 수 있다.  
request.getParameter("sessionid")

보안상 문제가 발생할 수 있다.


### 2. 숨겨진 필드
URL에 직접적인 정보가 노출되지는 않지만 브라우저에서 소스 보기를 통해 정보가 노출될 수 있다.


### 3. 쿠키를 구현할 수 있는 쿠키 클래스
javax.servlet.http 패키지의 Cookie 클래스를 이용한다.

- 쿠키 생성 (꼬리표 만들기)  
`Cookie myCookie = new Cookie("CookieName", "What a delicious Cookie it is!");`

쿠키 이름과 쿠키 값을 입력인자로 받는다.

- 쿠키 세팅  
`myCookie.setValue("Wow!");`

쿠키 생성할 때의 값 새롭게 지정

- 쿠키 전달  
`response.addCookie(myCookie);`

response 객체에 쿠키를 전달한다.

- 쿠키 읽기
`request.getCookies();`

- 쿠키 수명주기
`cookie.setMaxAge(int expiry);`



### 4. 세션 인터페이스
javax.servlet.http 패키지의 HttpSession 인터페이스를 통해 세션을 사용할 수 있다.  
서버와 관련된 정보를 노출시키지 않기 위해 쿠키사용을 지양한다.

클라이언트로부터 발생한 요청에 대해 특정한 ID를 부여하고 이후 발생한 요청들과 비교해 같은 ID인지 구별한다. 이렇게 ID를 다루는 것을 세션이라고 한다. 클라이언트에 식별자(ID)가 저장되고 나머지는 서버에 저장된다.  

- session.setAttribute("mySession", "session value");
- session.setMaxInactiveInterval(60*5);
- session.removeAttribute("mySession");
- session.invalidate();









# JDBC로 데이터베이스 연동

## JDBC
```java
/*
1. Class.forName() 을 이용해서 드라이버 로드
2. DriverManager.getConnection() 으로 연결 얻기
3. Connection 인스턴스를 이용해서 Statement 객체 생성
4. Statement 객체의 결과를 ResultSet 이나 int에 받기
*/
	private static String DBURL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
	private static String DBUSER = "scott";
	private static String DBPWD = "tiger";

	Class.forName(DBDRIVER);   //1
	Connection conn = DriverManager.getConnection(DBURL, DBUSER, DBPWD); //2
	Statement stmt = conn.createStatement();   //3
	String sql = "SELECT TO_CHAR(sysdate, 'yyyy-mm-dd') FROM dual";
	ResultSet rs = stmt.executeQuery(sql);    //4

```

### Class.forName("myString")
> A call to forName("X") causes the class named X to be initialized.  
> Returns:  
> the Class object for the class with the specified name.

## Connection Pooling
[수업자료](https://github.com/swacademy/JSP/blob/master/8.%20Using%20Connection%20Pooling%20with%20DBCP.pdf)

[필요파일 다운로드는 아파치에서](http://commons.apache.org/)

dbcp, pool, logging 

최신버전 받고, 맨 처음 나오는 jar 파일들을 WebContents/WEB-INF/lib 에 넣어주자.

이클립스에서 DBCPInit 파일을 설정하자

DBCPInit.java 에서 oracle의 주소를 적어준다. DBURL, DBPASSWORD 등..  




## JNDI
[수업자료](https://github.com/swacademy/JSP/blob/master/9.%20Using%20Connection%20Pooling%20with%20JNDI.pdf)

`2. Lab` 내용은 이클립스 내에 있는 server.xml 내의 Context 수정해주는 것.

<Resource> Tag 안에 넣기만 하면 된다~

1. 프로젝트/lib에 jar 넣고
2. 프로젝트/web.xml에 해당db 뭐시기 적기
3. 가짜서버/server.xml에 해당db 리소스 적기





# EL & JSTL
## EL

## JSTL
WEB-INF/lib에 taglibs 관련 jar 2개 넣고 시작한다.

표준 태그 라이브러리(JSP Standard Tag Library)에서 제공되는 태그의 종류는 5가지다.

- core
- formatting
- sql
- xml
- functions

### core 태그
사용하기 위해선 taglib 지시자 선언해야한다.
```jsp
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
```

core에서 사용되는 태그들은 다음과 같다.

```
<c:out> jsp페이지에 출력하는 태그 (<%= ... %>와 동일)
<c:set> 4개 영역의 JSP 저장소에 변수를 선언하는 태그
<c:remove> 4개 영역의 JSP 저장소에 선언된 변수 제거

<c:if> if문과 같은 기능의 조건 선언하는 태그
<c:choose>
<c:when>
<c:otherwise>

<c:forEach>
<c:forTokens>


```



## Custom Tag
Custom Tag
