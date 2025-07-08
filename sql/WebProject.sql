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