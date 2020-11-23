# Linux 설치

가상머신에 설치한다.

https://ubuntu.com/

## Desktop Ver

Desktop Ver. 설치 파일 : https://releases.ubuntu.com/18.04.5/?_ga=2.154705915.2131607309.1605143237-1776142886.1605143237

가상머신에 이 CD를 넣고 실행시킨다고 생각하면 된다.


### 랜카드 설치

어댑터1 NAT  
MAC 주소 (MAC Address) : 080027311D0C  
Linux 안에서 보면 enp0s3, IPv4 : 10.0.2.15    


어댑터2 호스트 전용어댑터  
MAC 주소 (MAC Address) : 080027D29A93  
Linux 안에서 보면 enp0s8, IPv4 : 192.168.56.01  
목표는 이 친구를 고정IP로 바꾸는 것.

Settings > Network > 톱니바퀴 > IPv4
Address : 192.168.56.2  
Netmask : 255.255.255.0  
Gateway : 192.168.56.1  

2 = Web Server, 3 = WAS, 4 = DB Server  

## Ubuntu 설치 후에 해야하는 일들

https://github.com/swacademy/Ubuntu/blob/master/2.Installation%20Ubuntu%2018.04%20LTS%20%26%206%20Things%20to%20do%20After%20Installation%20Ubuntu.pdf


### 크롬 설치 
https://coding-factory.tistory.com/498


### 아파치 설치 
https://github.com/swacademy/Ubuntu/blob/master/Installation%20Apache2.4%20on%20Ubuntu%20Server%2018.04%20LTS.pdf


## vsFTPd 설치
vsFTPD : Linux로 파일을 올리기 위해 설치. 

클라이언트(파일질라) -> 리눅스서버로 FTP 형태를 이용해 파일을 올리는 것

파일 업로드 및 보기 시 다양한 접근 권한 설정해줘야한다. pdf에 상세내용!

## Windows <-> Linux
파일 전송
Client(Filezila) -> #20 -> vsFTPd -> /WebHome

원격 접속
Client(PuTTy) -> #21 -> openssh-server

사이트 접속
Client(chrome) -> #80 -> Web Server -> /WebHome