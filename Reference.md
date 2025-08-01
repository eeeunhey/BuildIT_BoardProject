# 📚 Reference Notes

개인 공부 기록, 명령어/팁, 책에서 얻은 영감, 앞으로 할 공부 계획을 모아둔 문서입니다.  
필요할 때마다 추가 & 수정하면서 관리합니다.

---

## 1. 공부 기록 (Study Log)

> 날짜별로 배운 내용, 키워드, 간단한 요약을 적습니다.

- **2025-07-30**
  - MVC 패턴 정리
  - `map`, `filter`, `collect` 기본 예제 작성

- **2025-07-31**
  - Git branch 전략 (feature / develop / main)
  - `git rebase` 사용법 실습

---

## 2. 명령어 & 팁 (Commands & Tips)

### Git
```bash
# 브랜치 보기 (그래프 형태)
git log --oneline --graph --all

# 마지막 커밋 메시지 수정
git commit --amend
3. Books & Inspiration (책에서 얻은 영감)
책을 읽으면서 떠오른 생각, 인사이트, 배운 점을 자유롭게 기록



2025-07-31 《모임의 기술》
키워드: 커뮤니티 브랜딩, 비전, 소속감, 동기부여

영감:
“모인 사람들을 보고 나도 함께하고 싶다”라는 감정을 만드는 것이 커뮤니티 브랜딩의 핵심

커뮤니티 비전의 두 가지 역할
방향성과 가치를 명시해 차별성을 강화
공동 목표를 공유해 장기적인 동질감과 소속감을 형성
추상적인 표현보다 구체적인 지향점을 담은 단어로 모임의 캐릭터를 정의하는 것이 중요
‘어떤 사람들을 모으고 싶은가?’에 고민할 것

적용:
나는 아직 유니어(유치원 + 주니어)개발자이지만 같이 성장하는 사람들과 함께하는 커뮤니티에서 활동하고 싶다
내 성장 과정을 보며 다른 사람들도 성장하도록 영감을 주는 모임을 만들고 싶다
기획 시, 이용자의 상황과 이야기하고 싶은 주제를 먼저 구체적으로 정의해 보기


4. To-Do (앞으로 할 공부 계획)
 Spring Boot 기초 학습
 Git rebase / cherry-pick 연습


### 2025-08-01 회고

지원 기능을 적용해 보기 위해 로그인 후 게시물을 들어갔다.  
분명 로그인을 했는데 지원 버튼이 나오지 않았다.  

먼저 DB를 확인했는데 타입은 잘 저장되어 있었다.  
타입을 정상적으로 가져오는지 확인해 보기 위해

```jsp
<%
    Object userType = session.getAttribute("userType");
    System.out.println("[DEBUG] userType = " + userType);
%>

넣어 확인했는데 타입을 가져오지 못하였다.

그래서 LoginProcessController를 확인했다.

```jsp
session.setAttribute("userVO", userVO);
적혀 있었다. userVO 정보만 세션에 담고, type 정보는 따로 세션에 넣지 않았다.
개념에 대한 이해가 부족한 것 같아 검색하여 공부해보았다.


정리한 개념
서블릿/JSP의 세션(HttpSession)
브라우저 단위로 서버가 기억하는 개인 저장소

request.setAttribute
요청 1번만 유효 (페이지 이동하면 사라짐)

session.setAttribute
브라우저가 계속 같은 세션이면 유지 (다른 페이지에서도 사용 가능)

application.setAttribute
서버 전체 공용 (모든 사용자 공유)

문제 원인 추정
회원 유형에 관한 세션 추가 내용이 없어서 그런 것 같았다.
userVO: 로그인 성공 후 DB에서 가져온 회원 정보 객체
getType(): userVO 안에 있는 type 값 (예: "PARTNER" 또는 "CLIENT")을 
꺼내오는 메서드 꺼낸 값을 userType 변수에 저장한 뒤, 세션에 다시 넣어준다.

```jsp
String userType = userVO.getType();
session.setAttribute("userType", userType);

세션: 서버가 사용자별로 따로 관리하는 저장 공간
setAttribute("userType", userType): 세션에 "userType" 이름으로 값을 저장
(브라우저가 꺼질 때까지, 혹은 로그아웃 전까지 계속 사용할 수 있음)
이제 JSP나 다른 서블릿에서도 이 값을 sessionScope.userType 으로 꺼낼 수 있다.
로그인 후 화면에서 버튼을 다르게 보여주려면
"지금 로그인한 사람이 클라이언트인지, 파트너인지" 확인하기 위해 사용한다.

아직 정확히 이해되지 않는 부분
`memberVO.type` 으로 접근했을 땐 디버그에서 값을 가져오지만
상세 페이지에서는 지원 버튼이 뜨지 않았다. 내일 알아봐야겠다.