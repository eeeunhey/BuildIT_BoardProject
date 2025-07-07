
-- 멤버 DB
CREATE TABLE tbl_member (
    id   VARCHAR2(50) PRIMARY KEY,
    password    VARCHAR2(100) NOT NULL,
    name        VARCHAR2(50) NOT NULL,
    type  VARCHAR2(20) CHECK (type IN ('CLIENT', 'PARTNER')) NOT NULL
);

-- project DB 생성
CREATE TABLE tbl_project_post (
    postid NUMBER PRIMARY KEY,
    title VARCHAR2(100),
    writerid VARCHAR2(50),
    content CLOB,
    location VARCHAR2(100),
    pay NUMBER,
    worktime VARCHAR2(100),
    regdate DATE,
    deadline DATE,
    image BLOB
);

-- project-postid INCREMENT 시퀀스 생성
CREATE SEQUENCE seq_project_post
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 태그 테이블 생성
CREATE TABLE tbl_tag (
    tagid NUMBER PRIMARY KEY,
    tagname VARCHAR2(100) NOT NULL
);

-- 태그 테이블 등록 시퀀스
CREATE SEQUENCE seq_tag_id
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 태그데이터와 프로젝트 리스트 연결 데이터 
 CREATE TABLE tbl_post_tag (
    postid NUMBER, 
    tagid NUMBER,
    CONSTRAINT fkpost FOREIGN KEY (postid) REFERENCES tbl_project_post(postid) ON DELETE CASCADE,
    CONSTRAINT fktag FOREIGN KEY (tagid) REFERENCES tbl_tag(tagid) ON DELETE CASCADE 
);

commit;
