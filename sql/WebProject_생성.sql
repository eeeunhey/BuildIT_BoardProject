
-- ��� DB
CREATE TABLE tbl_member (
    id   VARCHAR2(50) PRIMARY KEY,
    password    VARCHAR2(100) NOT NULL,
    name        VARCHAR2(50) NOT NULL,
    type  VARCHAR2(20) CHECK (type IN ('CLIENT', 'PARTNER')) NOT NULL
);

-- project DB ����
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

-- project-postid INCREMENT ������ ����
CREATE SEQUENCE seq_project_post
START WITH 1
INCREMENT BY 1
NOCACHE;

-- �±� ���̺� ����
CREATE TABLE tbl_tag (
    tagid NUMBER PRIMARY KEY,
    tagname VARCHAR2(100) NOT NULL
);

-- �±� ���̺� ��� ������
CREATE SEQUENCE seq_tag_id
START WITH 1
INCREMENT BY 1
NOCACHE;

-- �±׵����Ϳ� ������Ʈ ����Ʈ ���� ������ 
 CREATE TABLE tbl_post_tag (
    postid NUMBER, 
    tagid NUMBER,
    CONSTRAINT fkpost FOREIGN KEY (postid) REFERENCES tbl_project_post(postid) ON DELETE CASCADE,
    CONSTRAINT fktag FOREIGN KEY (tagid) REFERENCES tbl_tag(tagid) ON DELETE CASCADE 
);

commit;
