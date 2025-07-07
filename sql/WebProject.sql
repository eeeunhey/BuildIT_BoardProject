CREATE TABLE tbl_project_post (
    post_id NUMBER PRIMARY KEY,
    title VARCHAR2(100),
    writer_id VARCHAR2(50),
    content CLOB,
    location VARCHAR2(100),
    pay NUMBER,
    work_time VARCHAR2(100),
    reg_date DATE,
    deadline DATE,
    image BLOB
);

CREATE SEQUENCE seq_project_post
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 1. 프론트엔드 개발
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, '프론트엔드 개발자 모집 (Vue.js)', 'frontend01',
  'Vue.js로 내부 서비스 UI를 리뉴얼할 프론트엔드 개발자를 찾습니다.', '서울 종로구',
  15000, '09:30 ~ 18:30', SYSDATE, TO_DATE('2025-07-31', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 2. 백엔드 개발
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'Spring 백엔드 개발자 채용', 'backend02',
  'Java/Spring 기반 웹 서비스 백엔드 유지보수 및 고도화 업무입니다.', '서울 마포구',
  17000, '10:00 ~ 19:00', SYSDATE, TO_DATE('2025-08-10', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 3. 데이터 분석
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, '데이터 분석 서포터 (Python/Pandas)', 'data_analyst',
  '마케팅 데이터 정리 및 시각화, 보고서 제작을 도와줄 분석 서포터 구합니다.', '경기 성남시',
  16000, '09:00 ~ 17:00', SYSDATE, TO_DATE('2025-08-15', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 4. 인공지능(AI) 개발
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'AI 모델링 보조 인턴', 'ai_team',
  '머신러닝 모델 테스트 및 성능 검증 업무를 담당할 인턴을 구합니다.', '서울 관악구',
  18000, '자율 근무제', SYSDATE, TO_DATE('2025-08-20', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 5. 보안 엔지니어
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, '정보보안 모의해킹 프로젝트 참여자 모집', 'sec_dev',
  '웹 취약점 분석 및 보안 시스템 진단 업무 보조 인력 모집.', '서울 서초구',
  20000, '09:00 ~ 18:00', SYSDATE, TO_DATE('2025-07-30', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 6. 앱 개발 (Android)
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'Android 앱 개발자 단기 채용', 'android_hire',
  'Java/Kotlin 기반 앱 리팩토링 및 UI 개선 업무.', '부산 해운대구',
  14000, '10:00 ~ 17:00', SYSDATE, TO_DATE('2025-08-01', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 7. DevOps 인턴
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'DevOps 엔지니어 인턴 채용', 'devops_intern',
  'CI/CD 파이프라인 운영 및 모니터링 자동화 업무 지원.', '대전 유성구',
  16000, '09:00 ~ 18:00', SYSDATE, TO_DATE('2025-08-05', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 8. UI/UX 디자이너
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'UI/UX 디자인 서포터 모집', 'ui_designer',
  'Figma를 활용한 와이어프레임 설계 및 사용자 피드백 반영 작업 보조.', '인천 연수구',
  13000, '자율 근무제', SYSDATE, TO_DATE('2025-08-10', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 9. 기술문서 작성 지원
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, '기술문서 정리 서포터', 'doc_writer',
  '개발자 문서 및 API 명세 정리 업무를 보조할 파트타이머 구합니다.', '서울 성동구',
  12000, '09:00 ~ 16:00', SYSDATE, TO_DATE('2025-07-29', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 10. 테스트 엔지니어
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'QA 테스트 엔지니어 단기 모집', 'qa_test',
  '웹/모바일 QA 테스트 및 이슈 리포트 작성을 담당할 인턴을 찾습니다.', '경기 안양시',
  14000, '10:00 ~ 18:00', SYSDATE, TO_DATE('2025-08-08', 'YYYY-MM-DD'), EMPTY_BLOB()
);

CREATE TABLE tbl_member (
    member_id   VARCHAR2(50) PRIMARY KEY,
    password    VARCHAR2(100) NOT NULL,
    name        VARCHAR2(50) NOT NULL,
    member_type VARCHAR2(20) CHECK (member_type IN ('CLIENT', 'PARTNER')) NOT NULL
);

INSERT INTO tbl_member (member_id, password, name, member_type)
VALUES ('client01', 'clientpass', '김길동', 'CLIENT');

INSERT INTO tbl_member (member_id, password, name, member_type)
VALUES ('partner01', 'partnerpass', '이몽룡', 'PARTNER');

SELECT *
  FROM tbl_member;
  
CREATE TABLE tbl_client_info (
    member_id       VARCHAR2(50) PRIMARY KEY,
    email           VARCHAR2(100),
    phone           VARCHAR2(20),
    client_category VARCHAR2(20) CHECK (client_category IN ('PERSONAL', 'COMPANY', 'ORGANIZATION')) NOT NULL,
    team_name       VARCHAR2(100),   -- 개인이면 팀명
    company_name    VARCHAR2(100),   -- 회사이면 회사명
    org_name        VARCHAR2(100),   -- 단체이면 단체명
    FOREIGN KEY (member_id) REFERENCES tbl_member(member_id) ON DELETE CASCADE
);

-- 개인 클라이언트
INSERT INTO tbl_client_info 
(member_id, email, phone, client_category, team_name) 
VALUES 
('client01', 'client01@email.com', '010-1234-5678', 'PERSONAL', '코딩팀');

-- 회사 클라이언트
INSERT INTO tbl_client_info 
(member_id, email, phone, client_category, company_name) 
VALUES 
('client02', 'client02@email.com', '010-5678-1234', 'COMPANY', '주식회사 빌드잇');

-- 단체 클라이언트
INSERT INTO tbl_client_info 
(member_id, email, phone, client_category, org_name) 
VALUES 
('client03', 'client03@email.com', '010-1111-2222', 'ORGANIZATION', '서울 메이커스');


CREATE TABLE tbl_partner_info (
    member_id     VARCHAR2(50) PRIMARY KEY,
    company_name  VARCHAR2(100),
    business_no   VARCHAR2(30),
    region        VARCHAR2(50),
    FOREIGN KEY (member_id) REFERENCES tbl_member(member_id) ON DELETE CASCADE
);

CREATE TABLE tbl_partner_edu (
    edu_id        NUMBER PRIMARY KEY,
    member_id     VARCHAR2(50),
    institution   VARCHAR2(100),   -- 교육 기관명
    course_name   VARCHAR2(100),   -- 과정명
    start_date    DATE,
    end_date      DATE,
    FOREIGN KEY (member_id) REFERENCES tbl_partner_info(member_id) ON DELETE CASCADE
);

commit;