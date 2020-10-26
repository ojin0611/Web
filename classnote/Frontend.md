## Download Visual Studio Code 

for Windows, System Ver, 64bit  
https://code.visualstudio.com/Download



# Apache
https://github.com/swacademy/Apache/blob/master/Installation%20Apache2.4%20on%20Windows%2010.pdf

## Download Apache Web Server

for Windows   
https://www.apachelounge.com/download/

## 환경변수 추가
Apache24\bin\httpd.exe 얘가 실행파일이니까, 환경변수 path에 bin까지 경로 추가

## conf 파일 수정
conf\httpd.conf 편집해서 
Define SRVROOT 를 Apache24가 저장돼있는 경로(C:\Program Files\Apache)로 수정

포트번호는 80 (웹에선 80으로 통일)

ServerName www.example.com:80 (227번째줄) 주석해제

DocumentRoot 251번째 Line, "C:/Users/Yang/Web" 으로 수정

## Apache 실행
cmd 관리자권한실행 : windows+r > cmd > ctrl shift enter

cmd에서 httpd.exe 실행하면 웹서버 실행중!



# DNS 설정
도메인을 ip로 바꿔주는 서비스 = DNS
ip=공항, port=게이트번호

C:\windows\system32\drivers\etc\hosts 에서 도메인과 ip 연결가능 (내PC에서만 돌아간다)

여기에 내 ip (cmd > ipconfig)등록해두면, 웹브라우저에 해당도메인 입력시 연결된다~ (내 pc에서만 먹히는 무료dns)





## 서비스 메뉴에 등록
cmd > httpd.exe -k install

## Apache2.4 종료하기
1. 서비스에서 직접 종료 
2. cmd > net stop apache2.4 (시작은 start)



# IIS

appwiz.cpl > Windows 기능 켜기/끄기 > World Wide Web 서비스 - 웹관리도구, IIS 관리콘솔 체크

서비스 > World Wide Web 실행

inetmgr > 왼쪽 클릭클릭 default~ > 고급설정 > 경로 설정 C:/Web


# Nginx

https://github.com/swacademy/HTML5/blob/master/Installation%20nginx%20for%20Windows.pdf

## Download Nginx

for Windows, Stable Ver
http://nginx.org/en/download.html


## 실행과 종료
cmd > cd C:/nginx
cmd > nginx

작업관리자 -> nginx 종료

## Windows 서비스에 nginx 등록
1. Install the .Net Framework 3.5 feature on Windows 10

2. Install winsw
http://repo.jenkins-ci.org/public/com/sun/winsw/winsw/1.9/

download 'winsw-1.9-bin.exe' and move to C:\nginx

rename to mynginx.exe

3. Create a xml file mynginx.xml



## Useful Sites & Programs

DotHome (무료도메인 사이트) : ojin0611.dothome.co.kr

Filezila : 위의 사이트 입력, id/pw 입력하고 html 폴더 내에 드래그하면 완성


Validator (html 검증 사이트) : http://validator.w3.org/

표준 맞는지, 에러 없는지 등 확인 가능

HTML Official Standard (w3c 공식문서) : https://html.spec.whatwg.org/

HTML 특수문자 : https://dev.w3.org/html5/html-author/charref  
https://sensechef.com/957


# JavaScript

[지역변수 vs 전역변수](https://www.codingfactory.net/10401)

함수 내부에서 var를 사용하지 않고 변수의 값을 정하면 전역변수의 값을 변경합니다.


[변수 Hoisting](https://www.daleseo.com/js-var-issues/)

Hoisting이란 `var` 키워드를 사용하여 변수를 선언 시, 해당 변수가 속한 범위(scope) 최상단으로 올려버리는 현상이다. 여기서 범위는 block 레벨이 아닌 function 레벨이다.

아래의 코드는 변수 n이 선언된 적이 없어서 에러.

```javascript
console.log(n); // ReferenceError
```

위 코드는 변수 n의 선언이 Hoisting됨.

```javascript
console.log(n); // undefined
var n = 100;
console.log(n); // 100

/* 위 코드는 아래처럼 Hoisting된다.
var n;
console.log(n);
n = 100;
console.log(n);
*/
```

#### toLocaleString()

toLocaleString() 메서드는 배열의 요소를 나타내는 문자열을 반환합니다. 요소는 toLocaleString 메서드를 사용하여 문자열로 변환되고 이 문자열은 locale 고유 문자열(가령 쉼표 “,”)에 의해 분리됩니다.

#### EventTarget.addEventListener()

EventTarget의 addEventListener() 메서드는 지정한 이벤트가 대상에 전달될 때마다 호출할 함수를 설정합니다. 일반적인 대상은 Element, Document, Window지만, XMLHttpRequest와 같이 이벤트를 지원하는 모든 객체를 대상으로 지정할 수 있습니다.

addEventListener()는 EventTarget의 주어진 이벤트 유형에, EventListener를 구현한 함수 또는 객체를 이벤트 처리기 목록에 추가해 작동합니다.