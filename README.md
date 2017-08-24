# JSP Ajax 실시간 익명 채팅 사이트 개발하기 강좌

ref. https://www.youtube.com/playlist?list=PLRx0vPvlEmdAVcSdYgqjJ64A7ggHhorU_

## 1강 - JSP Ajax 실시간 익명 채팅 사이트 개발하기 1강 - 프로젝트 소개 및 화면 디자인

- dynamic web 프로젝트 생성
- index.jsp 파일 생성
- 부트스트랩 추가 , css파일생성
- 라이브러리 파일들 연결 , 커스텀 css 생성
- 기본적인 화면 생성 ( 레이아웃 배치 )
- - -

## 2강 - JSP Ajax 실시간 익명 채팅 사이트 개발하기 2강 - 데이터베이스 설계 및 구축

- 데이터 베이스 구축 및 연결과정 진행 
- DAO , DTO 생성 
- DAO에 메소드 두개 생성 
	- getChatList : 특정시간대에 메시지 조회
	- submit : 입력할때 사용하는 메소드 
- 불필요한 파일 제거 ( 다른 팀원의 프로젝트가 Import되어있었음 )  
- jdbc연결을 위한 커넥트셋팅
- db_files 폴더 생성 
- my.ini schema.sql 생성
- - -

# 3강 - JSP Ajax 실시간 익명 채팅 사이트 개발하기 3강 - 메시지 전송 기능 구현하기

- 전송메시지를 보내고 , 알림창 꾸미는 것 까지 진행 
- 서블릿 생성
	- 서블릿 클래스 파일 내부 정리 
	- web.xml에서 서블릿 맵핑
	- post방식으로 기본적인 컨트롤러 생성 
- 서블릿 이슈 
	- noClassDefFoundError
		- DAO클래스 자체의 문제로 인해 'noClassDefFoundError' 에러발생 
		- classnotfound와 다르게 dao의 모든 의존 검사를 진행해야되는 과정 생김
		- 다른 방법이 없을까 여러 방법 시도중 다른 dao를 새로 만들어 import를 했더니 문제해결 
		- 기존의 DAO (ChatDAO)는 일단 남겨놨음 
- Illegal access: this web application instance has been stopped already.해결방법 
	- tomcat의 server.xml 환경설정 파일 오픈
	- reloadable = "true"를 "fasle"로 변경 
		<Context docBase="프로젝트명"
			path="/프로젝트명"
			reloadable="true"   
			source=""~/>
- Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+,~
	- "jdbc:mysql://localhost:3306/ANONYMOUSCHAT"; 
	-  위의 dbURL 뒤에 ?autoReconnect=true&useSSL=false 추가 
	- "jdbc:mysql://localhost:3306/ANONYMOUSCHAT?autoReconnect=true&useSSL=false";
	

	
- - -