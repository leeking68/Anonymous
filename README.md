# JSP Ajax 실시간 익명 채팅 사이트 개발하기 강좌

ref. https://www.youtube.com/playlist?list=PLRx0vPvlEmdAVcSdYgqjJ64A7ggHhorU_

## 1강 - JSP Ajax 실시간 익명 채팅 사이트 개발하기 - 프로젝트 소개 및 화면 디자인

- dynamic web 프로젝트 생성
- index.jsp 파일 생성
- 부트스트랩 추가 , css파일생성
- 라이브러리 파일들 연결 , 커스텀 css 생성
- 기본적인 화면 생성 ( 레이아웃 배치 )
- - -

## 2강 - JSP Ajax 실시간 익명 채팅 사이트 개발하기 - 데이터베이스 설계 및 구축

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
			reloadable="true"->"false"   
			source=""~/>
- Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+,~
	- "jdbc:mysql://localhost:3306/ANONYMOUSCHAT"; 
	-  위의 dbURL 뒤에 ?autoReconnect=true&useSSL=false 추가 
	- "jdbc:mysql://localhost:3306/ANONYMOUSCHAT?autoReconnect=true&useSSL=false";
	
- - -

# 4강 - JSP Ajax 실시간 익명 채팅 사이트 개발하기 - 등록된 메시지 목록 출력하기

- sql 파일에는 테스트 구문이 들어있다. 화면에 추가버튼을 누르면 database의 자료들이 출력된다.
- ajax를 이용해 통신을 구현한다. 
- ajax로 실시간 메시지를 확인할 수 있는 기능을 만든다. 
- 메시지를 실시간으로 조회할 수 있는 기능을 만들면서 서블릿을 추가하고 web.xml에 매핑한다. 
	-주의 : 하나의 서블릿에 하나의 url - pattern이 매핑된다.
- 출력 형태는 JSON형태
	- json형식으로 파싱
	- 문법주의 할것 
- ajax로 만들어진 chatListFunction() , addChat 볼것
	- 1차적으로 chatListFunctio()이 이벤트로 발생하게 되면 서블릿을 통해 데이터를 받아온다.
	- JSON형태로 파싱한다. 받아온 타입(여기서는 리스트타입)의 사이즈 만큼 출력해준다.
	- 출력하는 것은 리스트의 인덱스마다 addChat()에 추가하여 출력한다. 
	- addChat(result[i][0].value, result[i][1].value, result[i][2].value);
	- 위의 구문의 객체의 수가 3개인것은 현재 데이터의 종류가 3개 ( 이름 , 내용 , 시간)이기 때문이다.
	- addChat()은 뷰에 내용이 출력되는 부분을 json형식으로 바꿔준다 (ref : addChat()의 실제코드 참조)
- 이전 버전의 문제인 데이터베이스에 데이터가 한번에 두개씩 들어온것 해결
	- 원인 : 오류체크를 위해 System.out.print(dao.~) 을 남겨두었던것이 원인 -> 삭제 후 원상복구
	
- - -

# 5강 JSP Ajax 실시간 익명 채팅 사이트 개발하기 - 개발한 내용 중간 점검하기

- 보완 작업 진행 
	- chatContent에 enter를 입력해도 값이 출력될 수 있게
	- 시간의 형태를 일반적인 방법 ( 더 형식적으로 바꿈 ) 
	- 이름의 길이를 8자로 제
	
# 6강 JSP Ajax 실시간 익명 채팅 사이트 개발하기 - 최신 메시지 불러오기

- 매개변수 조정을 통해 효과적인 접근 
- 데이터베이스 새로만듬
- 추가된 애트리뷰트를 chat 클래스에도 추가 
- dao 쿼리문 수정
- 서블릿 메소드 추가하여 수정 

- - -
# 7강 JSP Ajax 실시간 익명 채팅 사이트 개발하기 - 프로젝트 완성

- 가장 마지막 채팅한 아이디 체크
- 특정한 아이디보다 큰 아이디 옵션으로 출력
- 버튼지우고 자동으로 메시지 갱신하는 펑션 만듬
- 0.5간격으로 실시간 업데이트 -> 1초로 다시 셋팅값 수
- 오류제어문 추가 
- 편하게 보기 위해서 스크롤바,대화 출력창 크 변경
- 스크립트 오류문처리제어 ( index.jsp 페이지에 URLEncoder.decode 추가 , 서블릿에 URLDecode 추가)

끝!

- - -