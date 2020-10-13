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


