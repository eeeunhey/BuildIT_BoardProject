

<p align="center">
  <a href="#"><img src="https://img.shields.io/badge/입문자-환영💡-blue?style=flat-square"></a>
  <a href="#"><img src="https://img.shields.io/badge/같이-배워요🌱-green?style=flat-square"></a>
  <a href="#"><img src="https://img.shields.io/badge/실수해도-괜찮아요💬-orange?style=flat-square"></a>
</p>

---

# 🚀 Buildit

**처음 시작하는 사람도 함께할 수 있는, 따뜻한 개발 프로젝트 커뮤니티**

Buildit은 국비교육, 부트캠프, 독학 등으로 개발을 배운 사람들이  
**기획부터 개발, 협업, 배포까지 함께 해보며 실력을 키워가는 공간**입니다.  
아직 실무 경험이 없더라도 괜찮습니다.  
**함께 만들고, 함께 배우며, 성장하는 실전 프로젝트 커뮤니티**를 지향합니다.

---

## 📚 핵심 키워드

### 📘 배운 기술 → 직접 적용
Buildit은 강의, 책, 온라인 강좌 등으로 배운 기술을  
**진짜 프로젝트에 직접 적용해보는 기회**를 제공합니다.  
‘내가 만든 결과물’로 실력을 확인하고 자신감을 얻을 수 있어요.

### 👥 함께 만드는 협업 → 부담 없이 시작  
**실무 경험이 없어도 괜찮아요.**  
아이디어를 기획하고, 코드를 나누고, 배포까지 함께하며  
**코드 협업과 역할 분담을 하나씩 배워가는 과정**입니다.

### 🌱 누구나 참여 가능 → 실수도 성장의 일부  
**질문이 자유롭고 실수가 자연스러운 분위기** 속에서  
함께 프로젝트를 만들어가며, 실무에 필요한 감각을 천천히 키워갑니다.

---

## 📌 목차

- [프로젝트 소개](#-buildit)
- [핵심 키워드](#-핵심-키워드)
- [🛠 업데이트 내역](#-업데이트-내역-update-log)

---


## 🛠 업데이트 내역 (Update Log)

### 2025-07-03
- `board_mapper.xml`에 `selectById` 쿼리 추가
- `board_mapper.xml`에 `delete` 쿼리 추가


### 2025-07-04
- `mybatis-config.xml`에 `typeAliases` 설정 추가
- `BoardDAO`에 `searchAll` 메소드 등록 및 `searchAllBoard` 메소드 구현

### 2025-07-05
- `board_mapper.xml`에 `insert` 쿼리 추가
- `board_mapper.xml`에 `selectAll` 쿼리 추가


### 2025-07-06
<sub>
- `writerForm.jsp`에서 입력한 값이 DB에 저장됨  
- `multipart/form-data` 처리를 위해 `web.xml`에 `multipart-config` 추가  
</sub>
<sub>📚 MyBatis 적용 준비</sub>  
<sub>
1. `board_mapper.xml`  
   - `insert`: 게시글 등록 쿼리  
   - `select`: 전체 게시글 조회 쿼리  
   - `selectWhere`: 조건에 따라 게시글 조회 (동적 WHERE 사용)  
   - `delete`: 게시글 삭제 쿼리  

2. `BoardDAO.java`  
   - `insert()`: 게시글 등록 DAO 메소드  
   - `selectAll()`: 전체 게시글 조회 DAO 메소드  
   - `selectByNo()`: 게시글 번호로 조회하는 DAO 메소드  
   - `deleteById()`: 게시글 번호로 삭제하는 DAO 메소드  
   - `selectByWhere()`: 조건 검색 DAO 메소드 (VO 기반)  

3. `MenuUI.java`  
   - `addBoard()`: 게시글 등록 테스트  
   - `selectAllBoard()`: 전체 게시글 출력  
   - `selectByNo()`: 특정 게시글 출력  
   - `deleteById()`: 게시글 삭제 테스트  
   - `selectBoardWhere()`: 조건 검색 결과 출력  
   - `execute()`: 메소드 실행 흐름 제어  
</sub>

---

### 2025-07-07
- `loginForm.jsp` 클라이언트 / 파트너 선택 할 수 있도록 수정
- `MemverVO.java` 수정 추가 
- `loginController.java' 클라이언트 / 파트너 선택 처리 추가
- `login.css` 수정
<sub>📚 MyBatis 적용 준비</sub>  
<sub>
1. `board_mapper.xml`  
   - `selectByNo`: 게시글 번호로 게시글 1건 조회  
   - `selectBoardWhere`: VO를 이용한 제목/작성자 조건 검색  
   - `selectBoardWhereMap`: Map을 이용한 조건 검색  
   - `selectBoard` (공통 쿼리): 게시글 SELECT 절 공통 정의  

2. `BoardDAO.java`  
   - `selectByNo`: 게시글 번호로 조회하는 DAO 메소드  
   - `selectByWhere`: VO 기반 조건 검색 DAO 메소드  
   - `selectByWhereMap`: Map 기반 조건 검색 DAO 메소드  

3. `MenuUI.java`  
   - `selectByNo()`: 게시글 번호로 특정 게시글 출력  
   - `selectBoardWhere()`: 제목/작성자 조건으로 게시글 검색 (VO 사용)  
   - `selectBoardWhereMap()`: 키-값 조건으로 게시글 검색 (Map 사용)  

</sub>

> 함께 만들어가는 프로젝트에서 **실력과 자신감**을 길러보세요.  
> **Build it, with Buildit.**
